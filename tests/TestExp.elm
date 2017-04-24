module TestExp exposing (..)

import Test exposing (Test)
import Expect exposing (Expectation)

(=>) : String -> (() -> Expectation) -> Test
(=>) = Test.test

(===) : a -> a -> () -> Expectation
(===) a b _ = Expect.equal a b

infixl 8 =>
