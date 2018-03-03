module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


--  target modules


all : Test
all =
    describe "List module Test"
        [ "Test"
            => (List.range 1 10 |> List.drop 3 |> List.map (\x -> x * 2) |> List.head)
            === Just 8
        ]
