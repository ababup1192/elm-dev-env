module Main exposing (..)

import Html exposing (program)
import Time exposing (Time, second)

import Models exposing (initialModel, Model)
import Messages exposing (..)
import View exposing (view)
import Update exposing (update)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


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
