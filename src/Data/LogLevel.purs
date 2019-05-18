module SoundCloud.Data.LogLevel
  ( LogLevel(..)
  ) where

import Prelude

data LogLevel = Dev | Prod

derive instance eqLogLevel ∷ Eq LogLevel
derive instance ordLogLevel ∷ Ord LogLevel
