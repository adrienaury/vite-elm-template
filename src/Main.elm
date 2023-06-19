module Main exposing (..)

import Css.Global
import Html.Styled as Html
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import Tailwind.Theme as Tw

import View.Main as View

main =
    Html.toUnstyled <|
        Html.div [ Attr.css [ Tw.bg_color Tw.gray_50 ] ]
            [ -- This will give us the standard tailwind style-reset as well as the fonts
              Css.Global.global Tw.globalStyles
            , View.mainView
            ]