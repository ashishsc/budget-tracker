module View exposing (..)

import Element exposing (..)
import Element.Attributes exposing (..)
import Html exposing (Html)
import Styles exposing (Styles, stylesheet)
import Types exposing (Model)


view : Model -> Html msg
view model =
    viewport stylesheet (mainColumn model)


mainColumn : Model -> Element Styles variation msg
mainColumn model =
    column Styles.Container [ width fill, height fill ] items


category : String -> Element Styles variation msg
category name =
    button Styles.Category [ width (percent 50), height fill, padding 5 ] (text name)


items : List (Element Styles variation msg)
items =
    [ row Styles.None
        [ spacing 10, height fill ]
        [ category "Clothes"
        , category "Food"
        , category "Groceries"
        , category "Drinking"
        ]
    ]
