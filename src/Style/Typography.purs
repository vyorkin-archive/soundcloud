module SoundCloud.Style.Typography
  ( fontWeights
  , fontSizes
  , stylesheet
  ) where

import CSS

import CSS.ListStyle.Type (ListStyleType(..)) as ListStyleType
import CSS.ListStyle.Type (listStyleType)
import SoundCloud.Style.Color as Color
import Prelude (discard, ($))

type FontWeights =
  { hairline ∷ FontWeight
  , thin ∷ FontWeight
  , light ∷ FontWeight
  , normal ∷ FontWeight
  , medium ∷ FontWeight
  , semibold ∷ FontWeight
  , bold ∷ FontWeight
  , extrabold ∷ FontWeight
  , black ∷ FontWeight
  }

fontWeights ∷ FontWeights
fontWeights =
  { hairline: weight 100.0
  , thin: weight 200.0
  , light: weight 300.0
  , normal: weight 400.0
  , medium: weight 500.0
  , semibold: weight 600.0
  , bold: weight 700.0
  , extrabold: weight 800.0
  , black: weight 900.0
  }

type FontSizes =
  { xs2 ∷ Size Rel
  , xs ∷ Size Rel
  , sm ∷ Size Rel
  , base ∷ Size Rel
  , lg ∷ Size Rel
  , xl ∷ Size Rel
  , xl2 ∷ Size Rel
  , xl3 ∷ Size Rel
  , xl4 ∷ Size Rel
  , xl5 ∷ Size Rel
  }

fontSizes ∷ FontSizes
fontSizes =
  { xs2: rem 0.725 -- 10px
  , xs: rem 0.75   -- 12px
  , sm: rem 0.875  -- 14px
  , base: rem 1.0  -- 16px
  , lg: rem 1.125  -- 18px
  , xl: rem 1.25   -- 20px
  , xl2: rem 1.5   -- 24px
  , xl3: rem 1.875 -- 30px
  , xl4: rem 2.25  -- 36px
  , xl5: rem 3.0   -- 48px
  }

stylesheet ∷ Rendered
stylesheet = render do
  ul ? do
    listStyleType ListStyleType.None
    paddingLeft $ px 0.0
  a ? do
    color Color.link
    textDecoration noneTextDecoration
  a & hover ? do
    color Color.linkHover
