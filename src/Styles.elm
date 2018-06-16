module Styles exposing (..)

import Color
import Style exposing (..)
import Style.Color


type Styles
    = CategoryStyle CategoryColor
    | Container
    | None


type CategoryColor
    = Red
    | Green
    | Blue
    | Yellow


stylesheet : StyleSheet Styles variation
stylesheet =
    styleSheet
        [ style (CategoryStyle Red)
            [ Style.Color.background Color.red ]
        , style (CategoryStyle Green)
            [ Style.Color.background Color.green ]
        , style (CategoryStyle Blue)
            [ Style.Color.background Color.blue ]
        , style (CategoryStyle Yellow)
            [ Style.Color.background Color.yellow ]
        ]
