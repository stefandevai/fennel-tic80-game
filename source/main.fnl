(fn init []
  (load-palette "699fad3a708e2b454f111215151d1a1d3230314e3f4f5d429a9f87ede6cbf5d893e8b26fb6834c704d2b40231e151015"))

(global TIC ; Function called once every frame
  (fn []
    (cls)   ; Clears the screen
    (map))) ; Draws the map

(init)
