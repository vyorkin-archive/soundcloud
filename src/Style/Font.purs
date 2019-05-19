module SoundCloud.Style.Font where

import CSS

import CSS.Common (normal)
import Data.Maybe (Maybe(..))
import Data.NonEmpty (singleton)
import Prelude (discard, ($))
import Prelude.Unicode ((∘))
import SoundCloud.Style.Typography (fontWeights)

systemUI :: GenericFontFamily
systemUI = mkFont "system-ui"

blinkMacSystemFont :: GenericFontFamily
blinkMacSystemFont = mkFont "BlinkMacSystemFont"

appleSystem :: GenericFontFamily
appleSystem = mkFont "-apple-system"

segoeUI :: GenericFontFamily
segoeUI = mkFont "Segoe UI"

roboto :: GenericFontFamily
roboto = mkFont "Roboto"

oxygen :: GenericFontFamily
oxygen = mkFont "Oxygen"

ubuntu :: GenericFontFamily
ubuntu = mkFont "Ubuntu"

cantarell :: GenericFontFamily
cantarell = mkFont "Cantarell"

firaSans :: GenericFontFamily
firaSans = mkFont "FiraSans"

droidSans :: GenericFontFamily
droidSans = mkFont "DroidSans"

helveticaNeue :: GenericFontFamily
helveticaNeue = mkFont "Helvetica Neue"

stylesheet ∷ Rendered
stylesheet = render do
  fontFace do
    fontFaceFamily "Roboto Thin"
    fontFaceSrc $ singleton $ FontFaceSrcUrl "../assets/fonts/Roboto/Roboto-Thin.ttf" $ Just TrueType
    fontWeight fontWeights.thin
    fontStyle normal
  fontFace do
    fontFaceFamily "Roboto Light"
    fontFaceSrc $ singleton $ FontFaceSrcUrl "../assets/fonts/Roboto/Roboto-Light.ttf" $ Just TrueType
    fontWeight fontWeights.light
    fontStyle normal
  fontFace do
    fontFaceFamily "Roboto Regular"
    fontFaceSrc $ singleton $ FontFaceSrcUrl "../assets/fonts/Roboto/Roboto-Regular.ttf" $ Just TrueType
    fontWeight fontWeights.normal
    fontStyle normal
  fontFace do
    fontFaceFamily "Roboto Medium"
    fontFaceSrc $ singleton $ FontFaceSrcUrl "../assets/fonts/Roboto/Roboto-Medium.ttf" $ Just TrueType
    fontWeight fontWeights.medium
    fontStyle normal
  fontFace do
    fontFaceFamily "Roboto Bold"
    fontFaceSrc $ singleton $ FontFaceSrcUrl "../assets/fonts/Roboto/Roboto-Bold.ttf" $ Just TrueType
    fontWeight fontWeights.bold
    fontStyle normal
  fontFace do
    fontFaceFamily "Roboto Black"
    fontFaceSrc $ singleton $ FontFaceSrcUrl "../assets/fonts/Roboto/Roboto-Black.ttf" $ Just TrueType
    fontWeight fontWeights.black
    fontStyle normal

mkFont ∷ String → GenericFontFamily
mkFont = GenericFontFamily ∘ fromString
