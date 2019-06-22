module SoundCloud.Sandbox.Exists1 where

import Prelude
import Data.Exists (Exists, mkExists, runExists)

data Foo a = Foo a (a -> String)

type FooE = Exists Foo

mkFooE :: forall a. (Show a) => a -> FooE
mkFooE a = mkExists (Foo a show)

getStrings :: Array FooE -> Array String
getStrings = map (runExists get)
  where
  get :: forall a. Foo a -> String
  get (Foo a toString) = toString a

items :: Array FooE
items = [mkFooE 0, mkFooE 0.5, mkFooE "test"]

items' :: Array String
items' = getStrings items
