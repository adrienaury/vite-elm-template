module View.Field exposing (..)

import Css
import Html.Styled as Styled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import Tailwind.Theme as Tw

import View.FieldHeader as View
import View.FieldDetails as View

fieldSequence : Styled.Html msg
fieldSequence =
    Styled.article
        [ Attr.css
            [ Tw.shadow_md
            , Tw.bg_color Tw.stone_100
            , Tw.rounded_md
            , Tw.p_4
            , Tw.my_2
            ]
        ]
        [ View.header "sequence"
        , Styled.div
            [ Attr.css
                [ Tw.grid
                , Css.property "grid-template-columns" "25% 75%"
                , Tw.gap_1
                ]
            ]
            [ Styled.label
                [ Attr.for "name"
                , Attr.css
                    [ Tw.font_medium
                    ]
                ]
                [ Styled.text "Name" ]
            , Styled.input
                [ Attr.id "name"
                , Attr.type_ "text"
                , Attr.placeholder "jsonpath"
                , Attr.value "id"
                , Attr.css
                    [ Tw.px_3
                    , Css.focus
                        [ Tw.bg_color Tw.stone_200
                        ]
                    , Css.hover
                        [ Tw.bg_color Tw.stone_50
                        ]
                    ]
                ]
                []
            , Styled.label
                [ Attr.for "start"
                , Attr.css
                    [ Tw.font_medium
                    ]
                ]
                [ Styled.text "Start" ]
            , Styled.input
                [ Attr.id "start"
                , Attr.type_ "number"
                , Attr.placeholder "start"
                , Attr.value "0"
                , Attr.css
                    [ Tw.px_3
                    , Css.focus
                        [ Tw.bg_color Tw.stone_200
                        ]
                    , Css.hover
                        [ Tw.bg_color Tw.stone_50
                        ]
                    ]
                ]
                []
            , Styled.label
                [ Attr.for "increment"
                , Attr.css
                    [ Tw.font_medium
                    ]
                ]
                [ Styled.text "Increment" ]
            , Styled.input
                [ Attr.id "increment"
                , Attr.type_ "number"
                , Attr.placeholder "start"
                , Attr.value "1"
                , Attr.css
                    [ Tw.px_3
                    , Css.focus
                        [ Tw.bg_color Tw.stone_200
                        ]
                    , Css.hover
                        [ Tw.bg_color Tw.stone_50
                        ]
                    ]
                ]
                []
            ]
        , View.details
    ]