module Types exposing (..)


type Msg
    = NoOp
    | UpdateNewCategory String
    | AddCategory String
    | CloseNewCategoryDialog


{-| Category name
-}
type Category
    = Category String


type alias Model =
    { categories : List Category
    , newCategory : Maybe String
    }
