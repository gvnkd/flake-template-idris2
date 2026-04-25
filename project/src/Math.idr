||| | Module with mathematical utility functions.
|||
||| Demonstrates pattern matching, totality, and recursion.
module Math

import Data.Vect

||| | Add two natural numbers.
public export
add : Nat -> Nat -> Nat
add Z     y = y
add (S k) y = S (add k y)

||| | Multiply two natural numbers.
public export
mult : Nat -> Nat -> Nat
mult Z     _ = Z
mult (S k) y = add y (Prelude.mult k y)

||| | Compute the factorial of a natural number.
public export
factorial : Nat -> Nat
factorial Z     = S Z
factorial (S k) = Prelude.mult (S (S k)) (factorial k)

||| | Compute the n-th Fibonacci number (0-indexed).
public export
fibonacci : Nat -> Nat
fibonacci Z     = Z
fibonacci (S Z) = S Z
fibonacci (S (S k)) = add (fibonacci (S k)) (fibonacci k)

||| | Check if a number is even.
public export
isEven : Nat -> Bool

||| | Check if a number is odd.
public export
isOdd : Nat -> Bool

isEven Z     = True
isEven (S k) = isOdd k

isOdd Z     = False
isOdd (S k) = isEven k

||| | Reverse a list using an accumulator.
public export
reverse : List a -> List a
reverse xs = revAcc [] xs

  where
    revAcc : List a -> List a -> List a
    revAcc acc []      = acc
    revAcc acc (x :: xs) = revAcc (x :: acc) xs

||| | Reverse a vector, preserving length.
public export
reverseVec : Vect n a -> Vect n a
reverseVec [] = []
reverseVec (x :: xs) = snoc (reverseVec xs) x

||| | Zip two vectors of equal length.
public export
zip : Vect n a -> Vect n b -> Vect n (a, b)
zip [] [] = []
zip (x :: xs) (y :: ys) = (x, y) :: zip xs ys

||| | Map a function over a vector, preserving length.
public export
mapVect : (a -> b) -> Vect n a -> Vect n b
mapVect f [] = []
mapVect f (x :: xs) = f x :: mapVect f xs

||| | A signed integer type that can be negative.
|||
||| @ magnitude the unsigned magnitude
||| @ negative whether the value is negative
public export
record SInt where
  constructor MkSInt
  magnitude : Nat
  negative  : Bool

||| | Convert a natural number to a signed integer.
public export
natToSInt : Nat -> SInt
natToSInt n = MkSInt n False

||| | Check if a signed integer is positive.
public export
isPositive : SInt -> Bool
isPositive v = not (negative v)
