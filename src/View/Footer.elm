module View.Footer exposing (..)

import Html.Styled as Styled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import Tailwind.Theme as Tw

import Msg exposing (..)
import View.Button as View

footer : Styled.Html Msg
footer =
    Styled.footer
        [ Attr.css
            [ Tw.grid
            , Tw.grid_cols_4
            , Tw.gap_1
            , Tw.leading_4
            , Tw.font_light
            ]
        ]
        [
            View.button "+regex",
            View.button "+integer",
            View.button "+decimal",
            View.button "+bool",
            View.button "+datetime",
            View.button "+choice",
            View.button "+choice_ref",
            View.button "+sequence"
        ]
