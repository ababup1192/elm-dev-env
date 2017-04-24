module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Time exposing (Time, second)


-- Model
type alias Model =
    { left: Int, right: Int, count: Int }

init : ( Model, Cmd Msg )
init =
    ( { left = 0, right = 0, count = 0 }, Cmd.none )


-- Message
type Msg
    = Left String 
    | Right String
    | Tick Time


-- View
view : Model -> Html Msg
view model =
    div [] 
      [ input [ type_ "number", onInput Left ] [],
        p [] [ text (toOpText <| toOp <| model.count) ],
        input [ type_ "number", onInput Right ] [],
        p [] [ text (toString (calcNum model) )]
      ]


-- Update
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Left nStr ->
            ( { model | left = Result.withDefault  0 (String.toInt nStr) } , Cmd.none )
        Right nStr ->
            ( { model | right = Result.withDefault 0 (String.toInt nStr) } , Cmd.none )
        Tick newTime ->
            ( { model | count = model.count + 1 } , Cmd.none )


-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick


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

-- Main
main : Program Never Model Msg
main =
    program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
