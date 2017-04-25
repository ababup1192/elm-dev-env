module Update exposing (..)

import Models exposing (Model)
import Messages exposing (..)

-- Update
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        newLeft  nStr = Result.withDefault 0 (String.toInt nStr)
        newRight nStr = Result.withDefault 0 (String.toInt nStr)
        newCount = model.count + 1
    in
        case msg of
            Left nStr ->
                ( { model | left  = newLeft nStr  } , Cmd.none )
            Right nStr ->
                ( { model | right = newRight nStr } , Cmd.none )
            Tick newTime ->
                ( { model | count = newCount } , Cmd.none )

