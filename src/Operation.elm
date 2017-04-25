module Operation exposing (..)

import Models exposing (Model)

type Op
  = Plus
  | Minus
  | Multi
  | Divide

calcNum : Model -> Int
calcNum {left, right, count} =
    let
      op = toOp count
    in
      case op of
        Plus   -> left +  right
        Minus  -> left -  right
        Multi  -> left *  right
        Divide -> left // right

toOp : Int -> Op
toOp count =
    case count % 4 of
        0 -> Plus
        1 -> Minus
        2 -> Multi
        3 -> Divide
        _ -> Plus

toOpText : Op -> String
toOpText op =
    case op of
        Plus   -> "+"
        Minus  -> "-"
        Multi  -> "*"
        Divide -> "/"


