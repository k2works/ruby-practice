# coding: utf-8
require 'fiber'

p fr = Fiber.new { Fiber.current } # >> #<Fiber:0x007f94c9205110>
p fr_current = fr.resume # >> #<Fiber:0x007f94c9205110>

# frのファイバとfrが返すFiber.currentは同じなのでtrueが返る
p fr == fr_current # >> true

# このコンテキストのFiber.currentとfr_currentは違うのでfalseが返る
p Fiber.current == fr_current # >> false

