module View.Field exposing (..)

import Css
import Html.Styled as Styled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import Tailwind.Theme as Tw

import Msg exposing (..)
import View.FieldHeader as View
import View.FieldDetails as View
import Model.Main exposing (..)

field : Int -> FieldDefinition -> Styled.Html Msg
field i f =
    case f.generator of
    Regex regex ->
        fieldRegex i f.name regex

fieldRegex : Int -> String -> String -> Styled.Html Msg
fieldRegex i name regex =
    Styled.article
        [ Attr.css
            [ Tw.shadow_md
            , Tw.bg_color Tw.stone_100
            , Tw.rounded_md
            , Tw.p_4
            , Tw.my_2
            ]
        ]
        [ View.header "regex"
        , Styled.div
            [ Attr.css
                [ Tw.grid
                , Css.property "grid-template-columns" "25% 75%"
                , Tw.gap_1
                ]
            ]
            [ Styled.label
                [ Attr.for ("name" ++ (String.fromInt i))
                , Attr.css
                    [ Tw.font_medium
                    ]
                ]
                [ Styled.text "Name" ]
            , Styled.input
                [ Attr.id ("name" ++ (String.fromInt i))
                , Attr.type_ "text"
                , Attr.placeholder "jsonpath"
                , Attr.value name
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
                [ Attr.for ("regex" ++ (String.fromInt i))
                , Attr.css
                    [ Tw.font_medium
                    ]
                ]
                [ Styled.text "Regex" ]
            , Styled.input
                [ Attr.id ("regex" ++ (String.fromInt i))
                , Attr.type_ "text"
                , Attr.placeholder "regex"
                , Attr.value regex
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
        , View.details i
    ]

fieldSequence : Int -> String -> Int -> Int -> Styled.Html Msg
fieldSequence i name start increment =
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
                [ Attr.for ("name" ++ (String.fromInt i))
                , Attr.css
                    [ Tw.font_medium
                    ]
                ]
                [ Styled.text "Name" ]
            , Styled.input
                [ Attr.id ("name" ++ (String.fromInt i))
                , Attr.type_ "text"
                , Attr.placeholder "jsonpath"
                , Attr.value name
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
                [ Attr.for ("start" ++ (String.fromInt i))
                , Attr.css
                    [ Tw.font_medium
                    ]
                ]
                [ Styled.text "Start" ]
            , Styled.input
                [ Attr.id ("start" ++ (String.fromInt i))
                , Attr.type_ "number"
                , Attr.placeholder "start"
                , Attr.value (String.fromInt start)
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
                [ Attr.for ("increment" ++ (String.fromInt i))
                , Attr.css
                    [ Tw.font_medium
                    ]
                ]
                [ Styled.text "Increment" ]
            , Styled.input
                [ Attr.id ("increment" ++ (String.fromInt i))
                , Attr.type_ "number"
                , Attr.placeholder "increment"
                , Attr.value (String.fromInt increment)
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
        , View.details i
    ]