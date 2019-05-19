module SoundCloud.CSS.ClassName
  ( class_
  , className_
  , scoped
  ) where

import Prelude

import CSS (class IsString)
import CSS as CSS
import Halogen.HTML (ClassName(..))
import Prelude.Unicode ((∘))
import Prim.RowList (class RowToList)
import Record.Extra (class MapRecord, mapRecord)

className_ ∷ ∀ a. IsString a ⇒ String → a
className_ = class_ ∘ ClassName

class_ ∷ ∀ a. IsString a ⇒ ClassName → a
class_ (ClassName x) = CSS.fromString $ "." <> x

-- | Make class names scoped by
-- | prefixing with the given string.
scoped
  ∷ ∀ row xs row'
  . RowToList row xs
  ⇒ MapRecord xs row String String () row'
  ⇒ String
  → Record row
  → Record row'
scoped s = mapRecord ((s <> "-") <> _)
