module Picture exposing (..)

import Box exposing (..)
import Shape exposing (..)
import Style exposing (..)

type alias Rendering = List (Shape, Style)

type alias Picture = Box -> Rendering

blank : Picture 
blank _ = []

turn : Picture -> Picture
turn p = turnBox >> p

flip : Picture -> Picture
flip p = flipBox >> p
