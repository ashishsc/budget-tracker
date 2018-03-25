module Main exposing (..)

import Element
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Style


---- MODEL ----


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
    Element.grid Grid
        []
        { columns = [ px 100 px 100 ]
        , rows = [ px 100 ]
        , cells =
            [ cell
                { start = ( 0, 0 )
                , width = 1
                , height = 1
                , content = el Category [] (text "Category")
                }
                { start = ( 0, 0 )
                , width = 1
                , height = 1
                , content = el Category [] (text "Category")
                }
            ]
        }


type Categories
    = Groceries
    | EatingOut
    | HomeGoods
    | Games
    | Alcohol


type MyStyles
    = Grid


stylesheet =
    Style.styleSheet [ Style.style Grid ] []


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
