module Main where

import Data.Monoid (mconcat)
import Web.Scotty

main =
  scotty 3000 $
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]
