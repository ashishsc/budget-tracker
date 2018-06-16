module Main exposing (..)

import Html exposing (Html)
import Types exposing (Category(..), Model)
import View exposing (view)


init : ( Model, Cmd Msg )
init =
    ( { categories =
            List.map Category
                [ "Clothes"
                , "Food"
                , "Groceries"
                , "Drinking"
                , "Reading"
                ]
      }
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
