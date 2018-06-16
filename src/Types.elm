module Types exposing (..)

{-| Category name
-}


type Category
    = Category String


type alias Model =
    { categories : List Category }
