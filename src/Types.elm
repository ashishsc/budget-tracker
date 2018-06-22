module Types exposing (..)


type Msg
    = NoOp
    | UpdateNewCategory String
    | AddCategory String
    | CloseDialog


{-| Category name
-}
type Category
    = Category String


type alias Expense =
    { name : String
    , value : Int
    , category : Category
    }


type alias Model =
    { categories : List Category
    , newCategory : Maybe String
    , newExpense : Maybe Expense
    }
