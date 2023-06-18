module Main exposing (..)

import Css
import Css.Global
import Html.Styled as Html
import Html.Styled.Attributes as Attr
import Tailwind.Breakpoints as Breakpoints
import Tailwind.Utilities as Tw
import Tailwind.Theme as Tw

import View.Field as View

main =
    Html.toUnstyled <|
        Html.div [ Attr.css [ Tw.bg_color Tw.gray_50 ] ]
            [ -- This will give us the standard tailwind style-reset as well as the fonts
              Css.Global.global Tw.globalStyles
            , Html.div
                [ Attr.css
                    [ Tw.flex_row
                    , Tw.px_5
                    , Tw.font_sans
                    , Tw.leading_8
                    , Tw.text_color Tw.stone_700
                    , Breakpoints.md
                        [ Tw.flex
                        ]
                    ]
                ]
                [ Html.section []
                    [
                        View.fieldSequence
                    ]
                ]
            ]