module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import SoundCloud.Test.API.Endpoint as Endpoint
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

main ∷ Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  Endpoint.spec
