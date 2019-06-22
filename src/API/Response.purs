module SoundCloud.API.Response
  ( Response
  , toResponse
  , module SoundCloud.API.Response.Error
  ) where

import Prelude

import Affjax (ResponseFormatError)
import Data.Argonaut.Core (Json)
import Data.Argonaut.Core as J
import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Simple.JSON (class ReadForeign, readJSON)
import SoundCloud.API.Response.Error (Error(..))

type Response = Either Error

toResponse ∷ ∀ a. ReadForeign a ⇒ Either ResponseFormatError Json → Response a
toResponse = case _ of
  Left e  → Left $ HttpError e
  Right x → lmap JsonError $ readJSON $ J.stringify x

-- pure $ case res.body of
--   Left err → Left $ HttpError err
--   Right x  → do
--     let
--       json = J.stringify x
--       result = readJSON $ json
--     case result of
--       Left jerr → Left $ JsonError jerr
--       Right v   → Right v
