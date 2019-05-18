module SoundCloud.Capability.Now
  ( class Now
  , now
  , nowDate
  , nowTime
  , nowDateTime
  ) where

import Prelude

import Control.Monad.Trans.Class (lift)
import Data.DateTime (Date, DateTime, Time)
import Data.DateTime.Instant (Instant)
import Halogen (HalogenM)

class Monad m <= Now m where
  now ∷ m Instant
  nowDate ∷ m Date
  nowTime ∷ m Time
  nowDateTime ∷ m DateTime

instance nowHalogenM ∷ Now m ⇒ Now (HalogenM s f g p o m) where
  now = lift now
  nowDate = lift nowDate
  nowTime = lift nowTime
  nowDateTime = lift nowDateTime
