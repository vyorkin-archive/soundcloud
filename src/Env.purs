module SoundCloud.Env
  ( Env
  , mkEnv
  ) where

import Prelude
import Effect (Effect)
import SoundCloud.Data.LogLevel (LogLevel)

type Env =
 { logLevel ∷ LogLevel
 }

mkEnv ∷ LogLevel → Effect Env
mkEnv logLevel = do
  pure { logLevel }
