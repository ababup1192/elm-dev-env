module Tests exposing (..)

-- Test modules
import Test exposing (..)
import TestExp exposing (..)

-- Test target modules
import Hello

all : Test
all =
    describe "Hello module Test"
    [
      "hello" =>
        Hello.hello === "Hello, Elm!"
    ]

