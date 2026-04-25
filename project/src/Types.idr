||| | Module with type definitions for the project.
|||
||| Demonstrates records, data types, and dependent types.
module Types

import Data.Vect
import Data.List

||| | A person record with name and age fields.
|||
||| @ name the person's full name
||| @ age the person's age in years
public export
record Person where
  constructor MkPerson
  firstName : String
  age : Nat

||| | Update a person's age by applying a function.
public export
updateAge : (Nat -> Nat) -> Person -> Person
updateAge f p = { age $= f } p

||| | A binary tree data type.
public export
data Tree : Type -> Type where
  Leaf : Tree a
  Node : Tree a -> a -> Tree a -> Tree a

||| | Insert a value into a binary search tree.
public export
insert : Ord a => a -> Tree a -> Tree a
insert x Leaf         = Node Leaf x Leaf
insert x (Node l v r) =
  if x < v then Node (insert x l) v r
            else Node l v (insert x r)

||| | Convert a tree to a sorted list via in-order traversal.
public export
toSortedList : Tree a -> List a
toSortedList Leaf         = []
toSortedList (Node l v r) = toSortedList l ++ [v] ++ toSortedList r

||| | A non-empty vector with a head and a tail vector.
|||
||| @ n the length of the tail vector
||| @ a the element type
public export
data Vec1 : (n : Nat) -> Type -> Type where
  MkVec1 : a -> Vect n a -> Vec1 (S n) a

||| | Get the head of a non-empty vector.
public export
vec1Head : Vec1 (S n) a -> a
vec1Head (MkVec1 h _)  = h

||| | Get the tail of a non-empty vector.
public export
vec1Tail : Vec1 (S n) a -> Vect n a
vec1Tail (MkVec1 _ t) = t

||| | A colour type as a plain enumeration.
public export
data Colour = Red | Green | Blue

||| | Convert a colour to its string representation.
public export
colourName : Colour -> String
colourName Red   = "Red"
colourName Green = "Green"
colourName Blue  = "Blue"
