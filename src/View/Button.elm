module View.Button exposing (button)

import Css
import Html.Styled as Styled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import Tailwind.Theme as Tw

button : String -> Styled.Html msg
button label =
    Styled.button
        [ Attr.css
            [ Tw.border_color Tw.stone_500
            , Tw.text_color Tw.stone_500
            , Tw.border_2
            , Tw.rounded_lg
            , Tw.p_2
            , Css.hover
                [ Tw.bg_color Tw.stone_200
                ]
            ]
        ]
        [ Styled.text label ]
