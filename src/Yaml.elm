module Yaml exposing (..)

import Model.Main exposing (FieldDefinition)
import Model.Main exposing (Generator(..))

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
  """ ++ maskRegex field

maskRegex : FieldDefinition -> String
maskRegex field =
  case field.generator of
    Regex pattern -> String.replace "<pattern>" pattern """    - regex: "<pattern>"
    """
