module Styles exposing (..)

import Array exposing (Array)
import Color exposing (Color, rgb)
import Style exposing (..)
import Style.Border
import Style.Color
import Style.Font


type Styles
    = CategoryStyle CategoryColor
    | Container
    | Setting
    | Dialog
    | CloseDialogButton
    | None


stylesheet : StyleSheet Styles variation
stylesheet =
    styleSheet
        [ style (CategoryStyle LightGreen)
            [ Style.Color.background lightGreen ]
        , style (CategoryStyle Green)
            [ Style.Color.background green ]
        , style (CategoryStyle DarkGreen)
            [ Style.Color.background darkGreen ]
        , style (CategoryStyle Magenta)
            [ Style.Color.background magenta ]
        , style (CategoryStyle LightPurple)
            [ Style.Color.background lightPurple ]
        , style (CategoryStyle Purple)
            [ Style.Color.background purple ]
        , style (CategoryStyle DarkPurple)
            [ Style.Color.background darkPurple ]
        , style (CategoryStyle Teal)
            [ Style.Color.background teal ]
        , style (CategoryStyle LightBlue)
            [ Style.Color.background lightBlue ]
        , style (CategoryStyle Blue)
            [ Style.Color.background blue ]
        , style (CategoryStyle DarkBlue)
            [ Style.Color.background darkBlue ]
        , style (CategoryStyle Yellow)
            [ Style.Color.background yellow ]
        , style (CategoryStyle Orange)
            [ Style.Color.background orange ]
        , style (CategoryStyle DarkOrange)
            [ Style.Color.background darkOrange ]
        , style (CategoryStyle Red)
            [ Style.Color.background red ]
        , style (CategoryStyle DarkRed)
            [ Style.Color.background darkRed ]
        , style Setting
            [ Style.Color.background darken
            , Style.Color.text white
            , Style.Font.size 80
            ]
        , style Dialog
            [ Style.Color.background darken
            , Style.Color.text white
            , Style.Border.rounded 5
            ]
        , style CloseDialogButton
            [ Style.Font.size 10
            ]
        ]



-- Metro UI colors https://colorlib.com/etc/metro-colors/


type CategoryColor
    = LightGreen
    | Green
    | DarkGreen
    | Magenta
    | LightPurple
    | Purple
    | DarkPurple
    | Teal
    | LightBlue
    | Blue
    | DarkBlue
    | Yellow
    | Orange
    | DarkOrange
    | Red
    | DarkRed


categoryColors : Array CategoryColor
categoryColors =
    Array.fromList
        [ LightGreen
        , Green
        , DarkGreen
        , Magenta
        , LightPurple
        , Purple
        , DarkPurple
        , Teal
        , LightBlue
        , Blue
        , DarkBlue
        , Yellow
        , Orange
        , DarkOrange
        , Red
        , DarkRed
        ]


lightGreen : Color
lightGreen =
    rgb 153 180 51


green : Color
green =
    rgb 0 163 0


darkGreen : Color
darkGreen =
    rgb 30 113 69


magenta : Color
magenta =
    rgb 255 0 151


lightPurple : Color
lightPurple =
    rgb 159 0 167


purple : Color
purple =
    rgb 126 56 120


darkPurple : Color
darkPurple =
    rgb 96 60 186


darken : Color
darken =
    rgb 29 29 29


teal : Color
teal =
    rgb 0 171 169


lightBlue : Color
lightBlue =
    rgb 239 244 255


blue : Color
blue =
    rgb 45 137 239


darkBlue : Color
darkBlue =
    rgb 43 87 151


yellow : Color
yellow =
    rgb 255 196 13


orange : Color
orange =
    rgb 227 162 26


darkOrange : Color
darkOrange =
    rgb 218 83 44


red : Color
red =
    rgb 238 17 17


darkRed : Color
darkRed =
    rgb 185 29 71


white : Color
white =
    rgb 255 255 255
