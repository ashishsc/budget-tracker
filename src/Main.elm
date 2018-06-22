module Main exposing (..)

import Html exposing (Html)
import String
import Types exposing (Category(..), Model, Msg(..))
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
      , newCategory = Nothing
      , newExpense = Nothing
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UpdateNewCategory categoryName ->
            ( { model | newCategory = Just categoryName }, Cmd.none )

        CloseDialog ->
            ( { model | newCategory = Nothing }, Cmd.none )

        AddCategory name ->
            if String.isEmpty name then
                ( model, Cmd.none )
            else
                ( { model
                    | newCategory = Nothing
                    , categories = model.categories ++ [ Category name ]
                  }
                , Cmd.none
                )


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
