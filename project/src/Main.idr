module Main

import Types
import Math
import Data.Vect

||| Run the example computations and display results.
main : IO ()
main = do
  putStr "=== Types ==="
  putStrLn ""

  let person := MkPerson "Alice" 30
  putStrLn $ "Person: " ++ firstName person ++ ", age: " ++ show (age person)

  let col := Green
  putStrLn $ "Colour: " ++ colourName col

  let tree := insert 3 (insert 2 (insert 5 Leaf))
  putStrLn $ "Tree sorted: " ++ show (toSortedList tree)

  let vec := [1, 2, 3, 4, 5]
  putStrLn $ "Vector: " ++ show vec
  putStrLn $ "Reversed: " ++ show (Math.reverse vec)

  putStrLn ""
  putStr "=== Math ==="
  putStrLn ""

  putStrLn $ "5! = " ++ show (factorial 5)
  putStrLn $ "fib(10) = " ++ show (fibonacci 10)
  putStrLn $ "2 + 3 = " ++ show (add 2 3)
  putStrLn $ "2 * 3 = " ++ show (Math.mult 2 3)
  putStrLn $ "isEven 4 = " ++ show (isEven 4)
  putStrLn $ "isOdd 7 = " ++ show (isOdd 7)

  putStrLn ""
  putStr "=== Zip ==="
  putStrLn ""

  let zs : Vect 3 (Int, String) := zip [1, 2, 3] ["a", "b", "c"]
  putStrLn $ "Zipped: " ++ show zs

  putStrLn ""
  putStr "=== MapVect ==="
  putStrLn ""

  let ms := mapVect (* 10) [1, 2, 3, 4]
  putStrLn $ "Mapped: " ++ show ms
