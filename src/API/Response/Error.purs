module SoundCloud.API.Response.Error
  ( Error(..)
  ) where

import Prelude

import Affjax (ResponseFormatError, printResponseFormatError)
import Foreign (MultipleErrors)

data Error
  = HttpError ResponseFormatError
  | JsonError MultipleErrors

instance showWebError ∷ Show Error where
  show = case _ of
    HttpError e → printResponseFormatError e
    JsonError e → show e
