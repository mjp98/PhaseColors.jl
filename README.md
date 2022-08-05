# PhaseColors.jl

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://mjp98.github.io/PhaseColors.jl/dev)
[![Build Status](https://github.com/mjp98/PhaseColors.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/mjp98/PhaseColors.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/mjp98/PhaseColors.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/mjp98/PhaseColors.jl)


This is intended to be a lightweight package to help generate visualisations of complex functions with plotting or image packages. It depends on `Colors` and `ColorSchemes`.

## Functionality

 - grid generation on complex plane
 - `canonicalphase(z::Number)`
 - colorschems for phase visualisation

## Examples

The examples folder is intended to include examples for generating common complex visualisations using different plotting packages and image tools such as ImageInTerminal.jl, UnicodePlots.jl, Plots.jl, PlotlyJS.jl, PGFPlotsX.jl and Makie.jl

Starting with

 - 2D phaseportraits
 - absarg plots

 and eventially adding

 - 3D surface plots
 - Riemann sphere
 - hyperbolic projection
 - reim scatter plots

## Development

 - absolute value shading

## Similar packages

For typical use, alternative packages providing complex phase portrait functions may be more useful:

 - ComplexPhasePortraits.jl
 - [ComplexPortraits.jl](https://github.com/luchr/ComplexPortraits.jl)



