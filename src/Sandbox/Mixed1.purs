module SoundCloud.Sandbox.Mixed1 where

import Prelude

import Data.Exists (Exists, mkExists)
import Data.Map (Map)
import Data.Map as Map

data Rep = RepI Int | RepS String

class HasRep a where rep ∷ a → Rep

data Foo a = Foo a (a → Rep)
type FooE = Exists Foo

mkFooE :: forall a. (HasRep a) => a -> FooE
mkFooE a = mkExists (Foo a rep)

newtype FooMap k = FooMap (Map k FooE)

newtype X = X Int
newtype Y = Y String

instance hasRepX ∷ HasRep X where rep (X n) = RepI n
instance hasRepY ∷ HasRep Y where rep (Y s) = RepS s

foos ∷ FooMap String
foos = FooMap
  $ Map.insert "y" (mkFooE $ Y "y")
  $ Map.singleton "x" (mkFooE $ X 1)

-- reps ∷ FooMap String → Map String Rep
-- reps = map (runExists go)
--   where
--     go ∷ ∀ a. Foo a → Rep
--     go (Foo a toRep) = toRep a
