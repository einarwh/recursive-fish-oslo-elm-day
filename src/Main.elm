module Main exposing (main)

import Box exposing (..)
import Fishy exposing (fishShapes)
import Fitting exposing (createPicture)
import Picture exposing (..)
import Rendering exposing (toSvg, toSvgWithBoxes)
import Svg exposing (Svg)
import Html exposing (..)
import Html.Attributes exposing (..)

placeInsideDiv : Svg msg -> Html msg 
placeInsideDiv svg = 
  div [ style "padding" "50px" ] [ svg ]

main : Html msg
main = 
  let 
    box = { a = { x = 100.0, y = 100.0 }
          , b = { x = 300.0, y = 0.0 }
          , c = { x = 0.0, y = 300.0 } }
    fish = createPicture fishShapes
  in     
    box |> squareLimit 3 fish 
        |> toSvgWithBoxes (500, 500) [ ]
        |> placeInsideDiv
 