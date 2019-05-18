module Main where

import Prelude

import Effect (Effect)
import Effect.Class (liftEffect)
import Halogen.Aff (awaitBody, runHalogenAff, selectElement)
import Halogen.VDom.Driver (runUI)
import SoundCloud.Component.Root (root)
import SoundCloud.Data.LogLevel as LogLevel
import SoundCloud.Env (mkEnv)
import Web.DOM.ParentNode (QuerySelector(..))

main :: Effect Unit
main = runHalogenAff do
  body ← awaitBody
  head ← selectElement $ QuerySelector "head"
  let logLevel = LogLevel.Dev
  env ← liftEffect $ mkEnv logLevel
  io ← runUI root unit body
  pure unit
