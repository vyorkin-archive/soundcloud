module SoundCloud.Style.Transition
  ( transitionIn
  , transitionOut
  , transitionAll
  , transitionBounce
  ) where

import Prelude (flip)
import CSS

transitionIn ∷ Number → CSS
transitionIn = flip transitionAll easeIn

transitionOut ∷ Number → CSS
transitionOut = flip transitionAll easeOut

transitionAll ∷ Number → TimingFunction → CSS
transitionAll t fn = transition "all" (sec t) fn (sec t)

transitionBounce ∷ TimingFunction
transitionBounce = cubicBezier 0.3 0.3 0.7 1.4
