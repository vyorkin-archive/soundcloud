module SoundCloud.Capability.Navigation
  ( class Navigation
  , navigate
  , logout
  ) where

import Prelude

import Control.Monad.Trans.Class (lift)
import Halogen (HalogenM)
import Prelude.Unicode ((∘))
import SoundCloud.Data.Route (Route)

class Monad m <= Navigation m where
  navigate ∷ Route → m Unit
  logout ∷ m Unit

instance navigationHalogenM
  ∷ Navigation m
  ⇒ Navigation (HalogenM state action slots output m) where
  navigate = lift ∘ navigate
  logout = lift logout
