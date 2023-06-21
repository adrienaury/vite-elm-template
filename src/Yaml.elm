module Yaml exposing (..)

import Model.Main exposing (..)

file : List FieldDefinition -> String
file fields =
  """version: "1"
masking:
""" ++ String.concat (List.map masking fields)


masking : FieldDefinition -> String
masking field =
  selector field ++ mask field

selector : FieldDefinition -> String
selector field =
  String.replace "<name>" field.name """
  - selector:
      jsonpath: "<name>"
"""

mask : FieldDefinition -> String
mask field =
  """    masks:
""" ++ synthesize field ++ transient field ++ maskRegex field ++ preserve field

synthesize : FieldDefinition -> String
synthesize field =
  if field.synthesize then """      - add: true
""" else ""

transient : FieldDefinition -> String
transient field =
  if field.transient then """      - add-transient: true
""" else ""

preserve : FieldDefinition -> String
preserve field =
  case field.preserve of
    None -> ""
    Null -> "    preserve: \"null\"\n"
    Empty -> "    preserve: \"empty\"\n"
    Blank -> "    preserve: \"blank\"\n"

maskRegex : FieldDefinition -> String
maskRegex field =
  case field.generator of
    Regex pattern -> String.replace "<pattern>" pattern """      - regex: "<pattern>"
"""
