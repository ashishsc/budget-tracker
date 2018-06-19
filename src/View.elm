module View exposing (..)

import Array exposing (Array, fromList)
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)
import Element.Input as Input
import Html exposing (Html)
import Styles exposing (CategoryColor(..), Styles(..), categoryColors, stylesheet)
import Types exposing (Category(..), Model, Msg(..))


view : Model -> Html Msg
view model =
    viewport stylesheet (mainColumn model)


mainColumn : Model -> Element Styles variation Msg
mainColumn model =
    column Styles.Container
        [ width fill, height fill ]
        (dialog model :: items model.categories)


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


addCategoryButton : Element Styles variation Msg
addCategoryButton =
    button Styles.Setting
        [ width (percent 50), height fill, padding 5, onClick (UpdateNewCategory "") ]
        (text "+")


dialog : Model -> Element Styles variation Msg
dialog model =
    case model.newCategory of
        Just name ->
            modal Dialog [ width (percent 80), height (percent 80), center ] <|
                column None [] <|
                    [ el None [ alignRight, onClick CloseNewCategoryDialog ] (text "x")
                    , Input.text None [] <|
                        { onChange = UpdateNewCategory
                        , value = name
                        , label = Input.labelAbove (text "New Category")
                        , options = []
                        }
                    , button None [ onClick (AddCategory name) ] (text "Add")
                    ]

        Nothing ->
            empty


items : List Category -> List (Element Styles variation Msg)
items categories =
    [ wrappedRow Styles.None
        [ height fill ]
        (List.indexedMap categoryButton categories
            ++ [ addCategoryButton ]
        )
    ]
