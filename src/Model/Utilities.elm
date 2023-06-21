module Model.Utilities exposing (..)

import Model.Main exposing (..)

updateFieldName : Model -> Int -> String -> Model
updateFieldName model index name =
    let
        updater i field =
            if (index == i) then
                { field | name = name }
            else
                field
        fields = List.indexedMap updater model.fields
    in
        {model | fields = fields}

updateFieldSynthesize : Model -> Int -> Bool -> Model
updateFieldSynthesize model index value =
    let
        updater i field =
            if (index == i) then
                { field | synthesize = value }
            else
                field
        fields = List.indexedMap updater model.fields
    in
        {model | fields = fields}

updateFieldRegexPattern : Model -> Int -> String -> Model
updateFieldRegexPattern model index pattern =
    let
        updater i field =
            if (index == i) then
                case field.generator of
                Regex _ ->
                    { field | generator = Regex pattern }
                --_ -> field
            else
                field
        fields = List.indexedMap updater model.fields
    in
        {model | fields = fields}
