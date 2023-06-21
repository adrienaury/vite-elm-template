port module Msg exposing (..)

import Model.Main exposing (..)
import Model.Utilities exposing (..)
import Yaml

-- PORTS

port updateYaml : String -> Cmd msg

-- MESSAGES

type Msg
    = Add FieldDefinition           -- add a new field to the list
    | ChangeName Int String         -- update field name (index in the list, new name)
    | ChangeRegexPattern Int String -- update regex pattern

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
    ChangeRegexPattern i pattern ->
      let
        newModel = updateFieldRegexPattern model i pattern
        newYaml = Yaml.file newModel.fields
      in
      
      ( newModel, updateYaml newYaml )
