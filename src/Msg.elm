module Msg exposing (..)

import Model.Main exposing (..)

type Msg
    = Add FieldDefinition -- add a new field to the list

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Add field ->
        (field :: model, Cmd.none)
