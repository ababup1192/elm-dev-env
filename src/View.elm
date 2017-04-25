module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import Messages exposing (..)
import Models exposing (Model)
import Operation exposing (..)


-- View
view : Model -> Html Msg
view model =
    let
        { left, right, count } = model
        leftText = toString left
        rightText = toString right
        op  = toOpText <| toOp <| count
        res = toString <| calcNum model
           in
        div [ class "expression" ] 
        [ input [ type_ "number", value leftText, onInput Left   ] [],
          p [] [ text op ],
          input [ type_ "number", value rightText, onInput Right ] [],
          p [] [ text res ]
        ]

