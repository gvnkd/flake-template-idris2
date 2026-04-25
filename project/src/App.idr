||| | Module demonstrating structured application patterns.
|||
||| Shows exception handling, state, and linear resources.
module App

import Control.App
import Math
import Types

||| | A simple counter state tag.
public export
record CounterState where
  constructor MkCounter

||| | Compute a greeting message for a person.
public export
greet : Person -> String
greet p = "Hello, " ++ firstName p ++ "!"

||| | An example application using App with state.
|||
||| Demonstrates:
||| - State management with get/put
||| - Combining interfaces with Has
|||
||| @ es the list of error types (must include AppHasIO for run)
public export
exampleApp : Has [State CounterState Int] Init => App Init ()
exampleApp = do
  c <- get CounterState
  put CounterState (c + 1)
  c' <- get CounterState
  pure ()
