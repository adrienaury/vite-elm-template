module Msg exposing (..)

import Model.Main exposing (..)

type Msg
    = Add FieldDefinition -- add a new field to the list

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Add field ->
      let
        newFields = model.fields ++ [field]
      in
        ({model | fields = newFields}, Cmd.none)
