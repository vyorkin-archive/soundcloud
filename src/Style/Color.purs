module SoundCloud.Style.Color where

import Prelude (otherwise, ($), (*))
import CSS (darken, lighten, rgb, rgba)
import Color (Color, isLight)
import SoundCloud.Style.Base16

-- #ffffff
backgroundLight ∷ Color
backgroundLight = base00

-- #f2f4f8
background ∷ Color
background = rgb 242 244 248

-- #e0e0e0
backgroundDark ∷ Color
backgroundDark = base01

-- #c5c8c6
backgroundDarker ∷ Color
backgroundDarker = base02

-- #b4b7b4
backgroundDarkest ∷ Color
backgroundDarkest = base03

backgroundInversed ∷ Color
backgroundInversed = foreground

-- #1d1f21
foreground ∷ Color
foreground = base07

-- #282a2e
foregroundLight ∷ Color
foregroundLight = base06

foregroundLighter ∷ Color
foregroundLighter = lightenX 2.0 foregroundLight

foregroundMuted ∷ Color
foregroundMuted = lighten 0.25 foregroundLight

foregroundLightest ∷ Color
foregroundLightest = lighten 0.35 foregroundLight

foregroundInversed ∷ Color
foregroundInversed = background

link ∷ Color
link = lighten_ base0D

linkHover ∷ Color
linkHover = lightenX 2.0 link

default ∷ Color
default = darken_ background

defaultLight ∷ Color
defaultLight = lighten_ default

-- #3971ED
info ∷ Color
info = base0C

infoLight ∷ Color
infoLight = lighten_ info

-- #198844
success ∷ Color
success = base0B

successLight ∷ Color
successLight = lighten_ success

-- #CC342B
warning ∷ Color
warning = base08

warningLight ∷ Color
warningLight = lighten_ warning

-- #F96A38
danger ∷ Color
danger = base09

dangerLight ∷ Color
dangerLight = lighten_ danger

translucent ∷ Color
translucent = rgba 0 0 0 0.1

-- Utils

lighten_ ∷ Color → Color
lighten_ = lighten lightnessDelta

lightenX ∷ Number → Color → Color
lightenX x = lighten $ lightnessDelta * x

darken_ ∷ Color → Color
darken_ = darken lightnessDelta

darkenX ∷ Number → Color → Color
darkenX x = darken $ lightnessDelta * x

lightnessDelta ∷ Number
lightnessDelta = 0.04

-- | Return a readable foreground text color (either `black` or `white`)
-- | for a given background color.
textColor ∷ Color → Color
textColor c | isLight c = foreground
            | otherwise = background
