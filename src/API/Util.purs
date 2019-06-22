module SoundCloud.API.Util
  ( decode
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import SoundCloud.API.Response (Response)
import SoundCloud.Capability.Logging (class Logging, logError)

decode ∷ ∀ a m. Logging m ⇒ Response a → m (Maybe a)
decode = case _ of
  Left err → logError (show err) *> pure Nothing
  Right xs → pure $ Just xs
