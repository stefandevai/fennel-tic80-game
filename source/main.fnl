(fn init []
  (global solids { 1 true 3 true })
  (global p { :x 120 :y 68 :vx 0 :vy 0 })

  (load-palette "699fad3a708e2b454f111215151d1a1d3230314e3f4f5d429a9f87ede6cbf5d893e8b26fb6834c704d2b40231e151015")

  (mset 13 10 1)
  (mset 14 10 1)
  (mset 15 10 1)
  (mset 16 10 1)
  (mset 17 10 1))

(fn solid [x y]
  (. solids (mget (// x 8) (// y 8))))

(global TIC
  (fn []
    (if
      (btn 2) (set p.vx -1)
      (btn 3) (set p.vx 1)
      (set p.vx 0))

    (when (or
          (solid (+ p.x p.vx) (+ p.y p.vy))
          (solid (+ p.x p.vx 7) (+ p.y p.vy))
          (solid (+ p.x p.vx) (+ p.y p.vy 7))
          (solid (+ p.x p.vx 7) (+ p.y p.vy 7)))
      (set p.vx 0))

    (if (or
          (solid p.x (+ p.y p.vy 8))
          (solid (+ p.x 7) (+ p.y p.vy 8)))
      (set p.vy 0)
      (set p.vy (+ p.vy 0.2)))

    (when (and
            (= p.vy 0)
            (btnp 4))
      (set p.vy -2.5))

    (when (and
            (< p.vy 0)
            (or
              (solid (+ p.x p.vx) (+ p.y p.vy))
              (solid (+ p.x p.vx 7) (+ p.y p.vy))))
      (set p.vy 0))
    
    (set p.x (+ p.x p.vx))
    (set p.y (+ p.y p.vy))
    
    (cls)
    (map)
    (rect p.x p.y 8 8 12)))

(init)
