module Main where

import Prelude

import Data.Either (hush)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class (liftEffect)
import Halogen as H
import Halogen.Aff (awaitBody, runHalogenAff, selectElement)
import Halogen.VDom.Driver (runUI)
import Prelude.Unicode ((∘), (≢))
import Routing.PushState (PushStateInterface)
import Routing.PushState (matchesWith) as Routing
import SoundCloud.App (runApp)
import SoundCloud.Component.Root as Root
import SoundCloud.Data.LogLevel as LogLevel
import SoundCloud.Data.Route (Route)
import SoundCloud.Data.Route as Route
import SoundCloud.Env (mkEnv)
import Web.DOM.ParentNode (QuerySelector(..))

main :: Effect Unit
main = runHalogenAff do
  body ← awaitBody
  head ← selectElement $ QuerySelector "head"
  let logLevel = LogLevel.Dev
  env ← liftEffect $ mkEnv logLevel
  loc ← liftEffect $ env.location.locationState

  let root ∷ Root.Component' Aff
      root = H.hoist (runApp env) Root.component

      initialRoute ∷ Maybe Route
      initialRoute = hush $ Route.parse loc.path

  io ← runUI root initialRoute body

  liftEffect $ runRouter io env.location

runRouter ∷ Root.IO → PushStateInterface → Effect Unit
runRouter io = void ∘ Routing.matchesWith Route.parse (navigate io)

navigate ∷ Root.IO → Maybe Route → Route → Effect Unit
navigate io old new = when (old ≢ Just new) $
  launchAff_ $ io.query (H.tell $ Root.Navigate new)
