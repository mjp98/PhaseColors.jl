using PhaseColors
using GLMakie

# absarg plot
x = LinRange(0,2π,400)
y = @. (1+sin(x))*cis(x)

cm = phasecolormaps[:math]

fig = Figure(resolution = (1024,1024))
ax = Axis(fig[1,1])
lines!(ax,x,abs.(y),color=canonicalphase.(y),colorrange=(0,1),colormap=cm)
