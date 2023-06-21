port module Msg exposing (..)

import Model.Main exposing (..)
import Model.Utilities exposing (updateFieldName)
import Yaml

-- PORTS

port updateYaml : String -> Cmd msg

-- MESSAGES

type Msg
    = Add FieldDefinition   -- add a new field to the list
    | ChangeName Int String -- update field name (index in the list, new name)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Add field ->
      let
        newFields = model.fields ++ [field]
        newYaml = Yaml.file newFields
      in
        ({model | fields = newFields }, updateYaml newYaml)
    ChangeName i name ->
      let
        newModel = updateFieldName model i name
        newYaml = Yaml.file newModel.fields
      in
      
      ( newModel, updateYaml newYaml )
