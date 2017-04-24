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
      "Plus1" =>
        calcNum { left = 2, right = 2, count = 0 } === 4,
      "Minus1" =>
        calcNum { left = 2, right = 2, count = 1 } === 0,
      "Multi1" =>
        calcNum { left = 2, right = 2, count = 2 } === 4,
      "Divide1" =>
        calcNum { left = 2, right = 2, count = 3 } === 1,

      "Plus2" =>
        calcNum { left = 5, right = 5, count = 4 } === 10,
      "Minus2" =>
        calcNum { left = 5, right = 5, count = 5 } === 0,
      "Multi2" =>
        calcNum { left = 5, right = 5, count = 6 } === 25,
      "Divide2" =>
        calcNum { left = 5, right = 5, count = 7 } === 1
    ]
