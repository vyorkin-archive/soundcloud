module SoundCloud.Component.Util where

import Prelude

import Data.Const (Const)
import Halogen as H

-- | When a component has no queries or messages, it has no public interface and
-- | can be considered an "opaque" component. The only way for a parent to
-- | interact with the component is by sending input.
type OpaqueSlot = H.Slot (Const Void) Void
