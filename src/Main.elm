module Main exposing (..)

import Color
import Element as E
import Element.Attributes as EAttr
import Html exposing (Html, text)
import Style as S
import Style.Color


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    E.layout stylesheet <|
        E.grid None
            []
            { columns = [ EAttr.px 100, EAttr.px 100 ]
            , rows = [ EAttr.px 100, EAttr.px 100 ]
            , cells =
                [ E.cell
                    { start = ( 0, 0 )
                    , width = 1
                    , height = 1
                    , content = E.el Cat [] <| E.text "Groceries"
                    }
                ]
            }


type MyStyles
    = Cat
    | None


stylesheet : S.StyleSheet MyStyles variation
stylesheet =
    S.styleSheet
        [ S.style Cat
            [ Style.Color.background Color.blue ]
        ]


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
