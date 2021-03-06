{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
module Patterns where

import qualified Data.Text as T
import Text.RawString.QQ as R (r)

simpleText :: T.Text
simpleText = T.filter (/= ' ')
  [R.r|=%=%=%=%=%
       %=%=%=%=%=
       $*$$=*=$$$
       %=%=%=%=%=
       =%=%=%=%=%|]

treeText :: T.Text
treeText = T.filter (/= ' ')
  [R.r|..|..|
       +-++-+
       |..|.|
       +--|-+
       +--+.||]

exText :: T.Text
exText = T.filter (/= ' ')
  [R.r|x...x...x...
       .\./.\./.\./
       ..x...x...x.
       ./.\./.../.\
       x...x...x...
       .\./.\./.\./|]

vineText :: T.Text
vineText = T.unlines . drop 1 . T.lines $
  [R.r|
   __    __        __          __    __        __          __    __
  (//    \\)    __(//   __    (//    \\)    __(//   __    (//    \\)
  /"      / __  \\)"    \\)_  /"      / __  \\)"    \\)_  /"      / __
'|-..__..-''\_''-.\__..-''  '|-..__..-''\_''-.\__..-''  '|-..__..-''\
(\\  \_    _(\\      _/     (\\  \_    _(\\      _/     (\\  \_    //)
 ""  (\\  //)""     //)      ""  (\\  //)""     //)      ""  (\\   ""
      ""  ""        ""            ""  ""        ""            ""|]

tiledText :: T.Text
tiledText = T.unlines . drop 1 . T.lines $
  [R.r|
 _\__/__/__\__\__\__\__/__\__\__/__/__\__\_
 \  /  /  \  \  \  \  /  \  \  /  /  \  \
 /  \  \  /   ) /   )(    ) /  \  \  /   )
_\__/__/__\__/__\__/__\__/__\__/__/__\__/_
 \  /  /  \  /  \  /  \  /  \  /  /  \  /
 / (  (    ) \  /  \  / (   / (  (    ) \
_\__\__\__/__/__\__/__\__\__\__\__\__/__/_
 \  \  \  /  /  \  /  \  \  \  \  \  /  /
 /   ) /  \ (   / (   /   ) /   ) /  \ (
_\__/__\__/__\__\__\__\__/__\__/__\__/__\_
 \  /  \  /  \  \  \  \  /  \  /  \  /  \
 /  \   )(    )  )  )  )(   /  \   )(    )
_\__/__/__\__/__/__/__/__\__\__/__/__\__/_
 \  /  /  \  /  /  /  /  \  \  /  /  \  /
 /  \ (   / (  (  (  (   /  /  \ (   / (
_\__/__\__\__\__\__\__\__\__\__/__\__\__\_
 \  /  \  \  \  \  \  \  \  \  /  \  \  \
 / (    )  ) /   )  )  ) /  / (    )  ) /
_\__\__/__/__\__/__/__/__\__\__\__/__/__\_
 \  \  /  /  \  /  /  /  \  \  \  /  /  \
 /   )(  (    ) \ (  (   /  /   )(  (    )
_\__/__\__\__/__/__\__\__\__\__/__\__\__/_
 \  /  \  \  /  /  \  \  \  \  /  \  \  /
  )(    ) /  \  \  /   ) /   )(    ) /  \
_/__\__/__\__/__/__\__/__\__/__\__/__\__/_
 /  \  /  \  /  /  \  /  \  /  \  /  \  /|]
