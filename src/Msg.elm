module Msg exposing (..)

import Model.Main exposing (..)
import Model.Utilities exposing (updateFieldName)
import Yaml

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
        ({model | fields = newFields, masking_yaml = Yaml.file newFields }, Cmd.none)
    ChangeName i name ->
      ( updateFieldName model i name, Cmd.none )
