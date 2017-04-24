module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Time exposing (Time, second)

import Model exposing (..)
import Operation exposing (..)


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


-- Main
main : Program Never Model Msg
main =
    program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
