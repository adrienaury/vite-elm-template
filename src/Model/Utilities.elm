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
