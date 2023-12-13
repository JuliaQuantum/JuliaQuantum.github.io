using Luxor
using Colors

begin
    Drawing(600, 400, "logo-dark.png")
    origin()
    # background("white")
    translate(-20, 20)
    scale(1.0)
    juliacircles()
    gsave()
    sethue("white")
    top = -190
    bottom = 150
    left = -230
    right = 200
    weight = 30
    right_adjust = 3
    poly([
        Point(left, top), Point(left+weight, top),
        Point(left+weight, bottom), Point(left, bottom),
    ], action=:fill)
    # a ⟩ mark at 200 using poly(<list>, ...) with flat ends
    poly(
        [
            Point(right, top+right_adjust),
            Point(right+weight, top+right_adjust),
            Point(right+weight+50, (top+bottom)/2),
            Point(right+weight, bottom-right_adjust),
            Point(right, bottom-right_adjust),
            Point(right+50, (top+bottom)/2),
        ],
        action = :fill
    )
    grestore()
    finish()
    preview()
end
