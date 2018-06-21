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
        [ width fill, height fill, padding 5, onClick (UpdateNewCategory "") ]
        (text "+")


closeDialogButton : Element Styles variation Msg
closeDialogButton =
    button CloseDialogButton
        [ alignRight
        , moveUp 10
        , moveRight 15
        , paddingLeft 5
        , paddingRight 5
        , paddingTop 2
        , paddingBottom 2
        , onClick CloseDialog
        ]
        (text "x")


dialog : Model -> Element Styles variation Msg
dialog model =
    case model.newCategory of
        Just name ->
            modal Dialog [ moveDown 20, center, padding 20 ] <|
                column None
                    []
                    [ closeDialogButton
                    , row None [ spacing 10 ] <|
                        [ Input.text None [ width (px 80), center, spacing 5 ] <|
                            { onChange = UpdateNewCategory
                            , value = name
                            , label = Input.labelLeft (text "New Category")
                            , options = []
                            }
                        , button None
                            [ onClick (AddCategory name)
                            , width (px 80)
                            ]
                            (text "Add")
                        ]
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
