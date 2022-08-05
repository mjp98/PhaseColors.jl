using PhaseColors
using ImageInTerminal

# Visualise colormap

cm = phasecolormaps[:nist]

map(i->get(cm,i),LinRange(0,1,100))


# Visualise phase portrait

# grid 64x64 grid on -2-2im to +2+2im
z = PhaseColors.ℂ(2;n=64)

PhaseColors.portrait(sin.(z),cm)
