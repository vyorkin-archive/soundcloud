module SoundCloud.Tool.StylesheetGenerator (main) where

import Prelude

import CSS (Rendered, renderedSheet)
import Data.Array (foldMap)
import Data.Maybe (Maybe(..))
import Data.Traversable (traverse)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class (liftEffect)
import Effect.Console (error, log)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Node.Path as Path
import Prelude.Unicode ((∘))
import SoundCloud.Style as App
import Text.Prettier (Parser(..), defaultOptions)
import Text.Prettier as Prettier

main ∷ Effect Unit
main = launchAff_ $ traverse process stylesheets

stylesheets ∷ Array (Tuple String (Array Rendered))
stylesheets =
  [ Tuple "app" [App.stylesheet]
  ]

process ∷ Tuple String (Array Rendered) → Aff Unit
process (Tuple name sheets) =
  case rendered of
    Nothing →
      liftEffect $ error "error generating stylesheet"
    Just css → do
      let formatted = foldMap formatCSS css
      fileName ← liftEffect $ Path.resolve ["styles", name <> ".css"] "."
      writeTextFile UTF8 fileName formatted
      liftEffect ∘ log $ "generated stylesheet " <> fileName
  where
    rendered = traverse renderedSheet sheets

formatCSS ∷ String → String
formatCSS = Prettier.format (defaultOptions { parser = CSS })
