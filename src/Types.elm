module Types exposing (..)

import EverySet exposing (EverySet)


type Msg
    = NoOp
    | UpdateNewCategory String
    | AddCategory String
    | AddExpense Expense
    | CloseDialog


{-| Category name
-}
type Category
    = Category String


type ExpenseId
    = ExpenseId String


type alias Expense =
    { name : String
    , id : ExpenseId
    , value : Int
    , category : Maybe Category
    }


type alias Model =
    { categories : List Category
    , newCategory : Maybe String
    , expenses : EverySet Expense
    , newExpense : Maybe Expense
    }
