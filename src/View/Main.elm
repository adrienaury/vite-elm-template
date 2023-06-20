module View.Main exposing (..)

import Css
import Html.Styled as Styled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import Tailwind.Theme as Tw
import Tailwind.Breakpoints as Breakpoints

import View.Field as View
import View.Footer as View
import View.Masking as View

mainView : Styled.Html msg
mainView =
    Styled.main_
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
        [ Styled.section
            [ Attr.css
                [ Tw.basis_1over2
                ]
            ]
            [
                View.fieldSequence,
                View.fieldSequence,
                View.footer
            ]
        , Styled.section []
            [ View.masking
            ]
        ]
