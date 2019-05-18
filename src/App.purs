module SoundCloud.App where

import Prelude

import Control.Monad.Reader (class MonadAsk, ReaderT, asks, runReaderT)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Aff.Class (class MonadAff)
import Effect.Class (class MonadEffect)
import Prelude.Unicode ((∘))
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
