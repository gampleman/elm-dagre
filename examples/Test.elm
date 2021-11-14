module Test exposing (..)

import Dagre.Attributes as DA
import Graph as G
import Html
import Render as R
import Svg exposing (Svg)



{-
   The following tree verifies that Dagre.Order.Transpose works
   But also gives idea that graphviz can draw it with no crossing,
   while elm-dagre draws it with 1 crossing edge.
-}


tree : G.Graph Int ()
tree =
    G.fromNodeLabelsAndEdgePairs
        [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]
        [ ( 0, 1 )
        , ( 0, 2 )
        , ( 1, 3 )
        , ( 1, 4 )
        , ( 2, 5 )
        , ( 2, 6 )
        , ( 3, 7 )
        , ( 3, 8 )
        , ( 0, 7 )
        , ( 0, 5 )
        , ( 0, 6 )
        , ( 4, 0 )
        , ( 4, 4 )

        -- , ( 6, 0 )
        -- , ( 7, 0 )
        -- , ( 4, 8 )
        -- , ( 6, 8 )
        -- , ( 7, 8 )
        ]


type Msg
    = None


main : Html.Html Msg
main =
    R.draw
        [ DA.rankDir DA.LR
        , DA.width 20
        , DA.height 20

        -- , DA.marginX 20
        -- , DA.marginY 20
        -- , DA.rankSep 75
        ]
        R.svgDrawNode
        (R.svgDrawEdge2 [ R.label (\e -> String.fromInt e.from) ])
        tree
