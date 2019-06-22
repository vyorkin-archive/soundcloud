module SoundCloud.API.Util
  ( decodeWith
  , decode
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import SoundCloud.API.Response (Response)
import SoundCloud.Capability.Logging (class Logging, logError)

decode ∷ ∀ a m. Logging m ⇒ Response a → m (Maybe a)
decode = decodeWith identity

decodeWith ∷ ∀ a b m. Logging m ⇒ (a → b) → Response a → m (Maybe b)
decodeWith f = case _ of
  Left err → logError (show err) *> pure Nothing
  Right x → pure $ Just $ f x
