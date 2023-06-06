include("newton_fractal_2.jl")

fractal = NewtonFractal(basin_colors = (RGB(1,0,0),RGB(0,1,0),RGB(0,0,1)), iterations_number = 50, ε=0.5)
build!(fractal)     
#draw(fractal)
save("newton_fractal.png", fractal)
println("Готово!")