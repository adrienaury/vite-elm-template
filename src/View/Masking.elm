module View.Masking exposing (..)

import Css
import Html.Styled as Styled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import Tailwind.Theme as Tw
import Tailwind.Breakpoints as Breakpoints

masking : Styled.Html msg
masking =
    Styled.div
            [ Attr.css [ Tw.px_5, Tw.my_2, Tw.shadow_lg, Css.property "width" "800px", Css.property "height" "300px", Breakpoints.md [ Css.property "height" "600px" ] ]
            , Attr.id "editor-yaml"
            ]
            []