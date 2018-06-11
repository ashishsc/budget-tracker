module Styles exposing (..)

import Color
import Style exposing (..)
import Style.Color


type Styles
    = Category
    | Container
    | None


stylesheet : StyleSheet Styles variation
stylesheet =
    styleSheet
        [ style Category
            [ Style.Color.background Color.blue ]
        ]
