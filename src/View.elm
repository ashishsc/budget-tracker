module View exposing (..)

import Array exposing (Array, fromList)
import Element exposing (..)
import Element.Attributes exposing (..)
import Html exposing (Html)
import Styles exposing (CategoryColor(..), Styles(..), stylesheet)
import Types exposing (Category(..), Model)


view : Model -> Html msg
view model =
    viewport stylesheet (mainColumn model)


mainColumn : Model -> Element Styles variation msg
mainColumn model =
    column Styles.Container [ width fill, height fill ] (items model.categories)


categoryColors : Array CategoryColor
categoryColors =
    fromList [ Red, Green, Blue, Yellow ]


categoryButton : Int -> Category -> Element Styles variation msg
categoryButton index (Category name) =
    let
        catColor : CategoryColor
        catColor =
            Array.get (index % Array.length categoryColors) categoryColors
                |> Maybe.withDefault Blue
    in
    button (Styles.CategoryStyle catColor)
        [ width (percent 50), height fill, padding 5 ]
        (text name)


items : List Category -> List (Element Styles variation msg)
items categories =
    [ wrappedRow Styles.None
        [ height fill ]
        (List.indexedMap categoryButton categories)
    ]
