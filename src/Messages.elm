module Messages exposing (..)

import Time exposing (Time)

-- Message
type Msg
    = Left String 
    | Right String
    | Tick Time

