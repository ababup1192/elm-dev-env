module Tests exposing (..)

-- Test modules
import Test exposing (..)
import TestExp exposing (..)

-- Test target modules
import Operation exposing (..)

all : Test
all =
    describe "Operation module Test"
    [
      "dummy" =>
        True === True
    ]

