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

toss : Picture -> Picture
toss p = tossBox >> p

aboveRatio : Int -> Int -> Picture -> Picture -> Picture
aboveRatio m n p1 p2 =
  \box ->
    let
      f = toFloat m / toFloat (m + n)
      (b1, b2) = splitVertically f box
    in
      (p1 b1) ++ (p2 b2)

above : Picture -> Picture -> Picture
above = aboveRatio 1 1

besideRatio : Int -> Int -> Picture -> Picture -> Picture
besideRatio m n p1 p2 =
  \box ->
    let
      f = toFloat m / toFloat (m + n)
      (b1, b2) = splitHorizontally f box
    in
      (p1 b1) ++ (p2 b2)

beside : Picture -> Picture -> Picture
beside = besideRatio 1 1
