module Msg exposing (..)

import Model.Main exposing (..)

type Msg
    = Add FieldDefinition   -- add a new field to the list
    | ChangeName Int String -- update field name (index in the list, new name)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Add field ->
      let
        newFields = model.fields ++ [field]
      in
        ({model | fields = newFields}, Cmd.none)
    ChangeName i name ->
      let
        updateFieldName index field =
          if (index == i) then
            { field | name = name }
          else
            field
        fields =
          List.indexedMap updateFieldName model.fields
      in
        ( {model | fields = fields}, Cmd.none )
