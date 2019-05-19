module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Halogen as H
import Halogen.Aff (awaitBody, runHalogenAff, selectElement)
import Halogen.VDom.Driver (runUI)
import SoundCloud.App (runApp)
import SoundCloud.Component.Root as Root
import SoundCloud.Data.LogLevel as LogLevel
import SoundCloud.Env (mkEnv)
import Web.DOM.ParentNode (QuerySelector(..))

main :: Effect Unit
main = runHalogenAff do
  body ← awaitBody
  head ← selectElement $ QuerySelector "head"
  let logLevel = LogLevel.Dev
  env ← liftEffect $ mkEnv logLevel

  let root ∷ Root.Component' Aff
      root = H.hoist (runApp env) Root.component

  io ← runUI root Nothing body

  pure unit
