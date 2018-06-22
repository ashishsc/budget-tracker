module Main exposing (..)

import EverySet exposing (EverySet)
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
      , expenses = EverySet.fromList []
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

        AddExpense expense ->
            if String.isEmpty expense.name then
                ( model, Cmd.none )
            else
                ( { model
                    | newExpense = Nothing
                    , expenses = EverySet.insert expense model.expenses
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
