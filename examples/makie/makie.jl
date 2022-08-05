using PhaseColors
using GLMakie

# absarg plot

fig = Figure(resolution = (1024,1024))

ax = Axis(fig[1,1])

cm = phasecolormaps[:math]

x = LinRange(0,2π,400)
y = cis.(x)

lines!(ax,x,abs.(y),color=canonicalphase.(y),colormap=cm,colorrange=(0,1))
