globals [ best-tour 
          best-tour-cost  
          node-diameter ]

undirected-link-breed [ edges edge ]
breed [ nodes node ]
breed [ ants ant ]

edges-own [ node-a
            node-b
            cost 
            pheromone ]
            
ants-own [ ;; ??? 
  ;; >>>>>>>>   your choice  <<<<<<<<<
   ]
        
;;;;;;;;;;;;;;;::::::;;;;;;;;;
;;; Setup/Reset Procedures ;;;
;;;;;;;;;;;;;;;;;;;;;::::::;;;

to setup
  clear-all
  set node-diameter 1.5
  
  set-default-shape nodes "circle"
  set-default-shape ants "bug"
  
  setup-nodes
  setup-edges
  ;; >>>>>>>>>  setup-ants - initialize ants variables <<<<<<<<<<

  set best-tour get-random-path
  set best-tour-cost get-tour-length best-tour
  
  update-best-tour
  reset-ticks
end

to setup-nodes
  ;; Create x and y ranges that will not allow a node to be created
  ;; that goes outside of the edge of the world.
  let x-range n-values (max-pxcor - node-diameter / 2) [? + 1]
  let y-range n-values (max-pycor - node-diameter / 2) [? + 1]
  
  create-nodes num-of-nodes [
    setxy one-of x-range one-of y-range
    set color yellow
    set size node-diameter
  ]
end

to setup-edges
  let remaining-nodes [self] of nodes 
  while [not empty? remaining-nodes] [
    let a first remaining-nodes
    set remaining-nodes but-first remaining-nodes      
    ask a [
      without-interruption [
        foreach remaining-nodes [
          create-edge-with ? [
            set color red
            set node-a a
            set node-b ?
            set cost ceiling calculate-distance a ?
            set pheromone random-float 0.1
          ]  
        ]
      ]
    ]
  ]
end

;; procedures to setup the ants
to setup-ants
  
end

to reset
  ;; Reset the ant colony and the pheromone in the graph
  ask ants [die]
  ask edges [die]
  setup-edges
  ;;setup-ants
  
  ;; Update the best tour
  set best-tour get-random-path
  set best-tour-cost get-tour-length best-tour
  update-best-tour  
  
  ;; Clear all of the plots in the model and reset the number of ticks
  clear-all-plots
  reset-ticks
end

;;;;;;;;;;;;;;;;;;;;;;
;;; Main Procedure ;;;
;;;;;;;;;;;;;;;;;;;;;;

to go
  
  ; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  ; ants behaviour
  ; for each execution cycle an ants has to find a path and compute its cost (length in our case)
  ; if an ant find a better solution than the current optimal one, this must be updated
  

  ; the pheromone values must be updated too at each execution cycle
  ;; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      
  
  do-plots
  
  tick
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Path Finding Procedures            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; for the initial solution
to-report get-random-path
  let origin one-of nodes
  report fput origin lput origin [self] of nodes with [self != origin] 
end

;; partial example of a method which returns a path
to-report get-as-path
  let origin one-of nodes
  let new-tour (list origin)
  let remaining-nodes [self] of nodes with [self != origin] 
  let current-node origin
  
  
  ;; Create the new path for the ant
  ;; >>>>>>>   ... work needed ...  <<<<<<<<<<
  ;; choose next node
  ;; probabilistic/heuristic choice (see Swarm Intelligence slides..)
  
  
  ;; Move the ant back to the origin
  set new-tour lput origin new-tour
  
  report new-tour
end

;; possible signature of a method to choose the next node 
to-report choose-next-node [current-node remaining-nodes]
  
  ;; >>>>>>>   ... work needed ...  <<<<<<<<<<
  
end

;; possible signature of a method to calculate transition probabilities
to-report calculate-probabilities [current-node remaining-nodes]
  
end


;; procedure to update pheromone levels --> again see Swarm Intelligence slides
to update-pheromone
  ;; Evaporate the pheromone in the graph
  ;; ----->> its an edge's action...
  
  ;; Add pheromone to the paths found by the ants 
  ;; ----->> its an ant's action...
  
end


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Plotting/GUI Procedures ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to update-best-tour
  foreach get-tour-edges best-tour [
    ask ? [ set color green ]
  ]
end

to do-plots
  set-current-plot "Best Tour Cost"
  
  set-current-plot "Tour Cost Distribution"
  set-plot-pen-interval 10
  histogram [tour-cost] of ants 
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Miscellaneous Procedures ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to-report get-tour-edges [tour-nodes]
  let xs but-last tour-nodes
  let ys but-first tour-nodes
  let tour-edges []
  (foreach xs ys [ 
    ask ?1 [ set tour-edges lput edge-with ?2 tour-edges] 
  ])
  report tour-edges
end

to-report get-tour-length [tour-nodes]
  report reduce [?1 + ?2] map [[cost] of ?] get-tour-edges tour-nodes
end

to-report calculate-distance [a b]
  let diff-x [xcor] of a - [xcor] of b
  let diff-y [ycor] of a - [ycor] of b
  report sqrt (diff-x ^ 2 + diff-y ^ 2)
end
@#$#@#$#@
GRAPHICS-WINDOW
187
10
623
467
-1
-1
6.0
1
10
1
1
1
0
0
0
1
0
70
0
70
1
1
1
ticks
30.0

BUTTON
10
10
65
43
Setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
125
10
180
43
Go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
706
418
771
463
Best Tour
best-tour-cost
3
1
11

MONITOR
631
417
698
462
Ticks
ticks
3
1
11

PLOT
630
10
945
229
Best Tour Cost
Time
Cost
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"bestTourCost" 1.0 0 -14439633 true "" "plot best-tour-cost"

PLOT
631
238
945
410
Tour Cost Distribution
Tour Cost
Number of Ants
0.0
1000.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 1 -16777216 true "" ""

SLIDER
10
127
180
160
alpha
alpha
0
20
1
1
1
NIL
HORIZONTAL

SLIDER
10
166
180
199
beta
beta
0
20
5
1
1
NIL
HORIZONTAL

SLIDER
10
205
180
238
rho
rho
0
0.99
0.5
0.01
1
NIL
HORIZONTAL

SLIDER
10
50
180
83
num-of-nodes
num-of-nodes
0
50
10
1
1
NIL
HORIZONTAL

SLIDER
10
89
180
122
num-of-ants
num-of-ants
0
100
10
1
1
NIL
HORIZONTAL

BUTTON
68
10
123
43
Reset
reset
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
193
473
1310
518
NIL
best-tour
17
1
11

@#$#@#$#@
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

link
true
0
Line -7500403 true 150 0 150 300

link direction
true
0
Line -7500403 true 150 150 30 225
Line -7500403 true 150 150 270 225

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.2
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="experiment1" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="30"/>
    <metric>best-tour-cost</metric>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
