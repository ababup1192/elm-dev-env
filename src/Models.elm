module Models exposing (..)


-- Model
type alias Model =
    { left: Int, right: Int, count: Int }

initialModel : Model
initialModel = { left = 0, right = 0, count = 0 }