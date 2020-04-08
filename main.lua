local function load_palette(str)
  for i = 0, 15, 1 do
    poke((16320 + (i * 3)), tonumber(string.sub(str, ((i * 6) + 1), ((i * 6) + 2)), 16))
    poke((16320 + (i * 3) + 1), tonumber(string.sub(str, ((i * 6) + 3), ((i * 6) + 4)), 16))
    poke((16320 + (i * 3) + 2), tonumber(string.sub(str, ((i * 6) + 5), ((i * 6) + 6)), 16))
  end
  return nil
end
local function init()
  solids = {true, [3] = true}
  p = {vx = 0, vy = 0, x = 120, y = 68}
  load_palette("699fad3a708e2b454f111215151d1a1d3230314e3f4f5d429a9f87ede6cbf5d893e8b26fb6834c704d2b40231e151015")
  mset(13, 10, 1)
  mset(14, 10, 1)
  mset(15, 10, 1)
  mset(16, 10, 1)
  return mset(17, 10, 1)
end
local function solid(x, y)
  return solids[mget((x // 8), (y // 8))]
end
local function _0_()
  if btn(2) then
    p.vx = -1
  elseif btn(3) then
    p.vx = 1
  else
    p.vx = 0
  end
  if (solid((p.x + p.vx), (p.y + p.vy)) or solid((p.x + p.vx + 7), (p.y + p.vy)) or solid((p.x + p.vx), (p.y + p.vy + 7)) or solid((p.x + p.vx + 7), (p.y + p.vy + 7))) then
    p.vx = 0
  end
  if (solid(p.x, (p.y + p.vy + 8)) or solid((p.x + 7), (p.y + p.vy + 8))) then
    p.vy = 0
  else
    p.vy = (p.vy + 0.20000000000000001)
  end
  if ((p.vy == 0) and btnp(4)) then
    p.vy = -2.5
  end
  if ((p.vy < 0) and (solid((p.x + p.vx), (p.y + p.vy)) or solid((p.x + p.vx + 7), (p.y + p.vy)))) then
    p.vy = 0
  end
  p.x = (p.x + p.vx)
  p.y = (p.y + p.vy)
  cls()
  map()
  return rect(p.x, p.y, 8, 8, 12)
end
TIC = _0_
return init()
