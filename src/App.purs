module SoundCloud.App where

import Prelude

import Control.Logger (Logger)
import Control.Logger as Logger
import Control.Monad.Reader (class MonadAsk, ReaderT, asks, runReaderT)
import Data.Array (elem)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Aff.Class (class MonadAff)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Now as Now
import Foreign (unsafeToForeign)
import Prelude.Unicode ((∘))
import SoundCloud.Capability.Logging (Severity(..)) as Severity
import SoundCloud.Capability.Logging (class Logging, Message, Severity, consoleLogger)
import SoundCloud.Capability.Navigation (class Navigation, logout, navigate)
import SoundCloud.Capability.Now (class Now)
import SoundCloud.Data.LogLevel (LogLevel)
import SoundCloud.Data.LogLevel as LogLevel
import SoundCloud.Data.Route as Route
import SoundCloud.Env (Env)
import Type.Prelude (class TypeEquals)
import Type.Prelude (from) as Type

newtype App a = App (ReaderT Env Aff a)

runApp ∷ Env → App ~> Aff
runApp env (App m) = runReaderT m env

launchApp_ ∷ ∀ a. Env → App a → Effect Unit
launchApp_ env = launchAff_ ∘ runApp env

derive newtype instance functorApp ∷ Functor App
derive newtype instance applyApp ∷ Apply App
derive newtype instance applicativeApp ∷ Applicative App
derive newtype instance bindApp ∷ Bind App
derive newtype instance monadApp ∷ Monad App
derive newtype instance monadEffectApp ∷ MonadEffect App
derive newtype instance monadAffApp ∷ MonadAff App

instance monadAskApp ∷ TypeEquals e Env ⇒ MonadAsk e App where
  ask = App $ asks Type.from

instance nowApp ∷ Now App where
  now = liftEffect Now.now
  nowDate = liftEffect Now.nowDate
  nowTime = liftEffect Now.nowTime
  nowDateTime = liftEffect Now.nowDateTime

instance loggingApp ∷ Logging App where
  logMessage msg = do
    level ← asks _.logLevel
    Logger.log (consoleLogger # filter level) msg
    where
      filter ∷ LogLevel → Logger App Message → Logger App Message
      filter LogLevel.Dev = identity
      filter LogLevel.Prod = Logger.cfilter isImportant

      isImportant ∷ Message → Boolean
      isImportant e = e.severity `elem` important

      important ∷ Array Severity
      important = [Severity.Warning, Severity.Error]

instance navigationApp ∷ Navigation App where
  navigate route = do
    { pushState } ← asks _.location
    liftEffect $ pushState (unsafeToForeign {}) (Route.print route)
  logout = pure unit
