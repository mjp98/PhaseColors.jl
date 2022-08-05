module PhaseColors

using Colors
using ColorSchemes

export canonicalphase
export phasecolormaps

"""
    canonicalphase(z)

returns the phase of complex number, normalised from -pi,pi to 0,1
"""
function canonicalphase(z)
    phase = angle(z)/(2π)
    return mod(phase,1)
end

function phaseandabs(z)
    return canonicalphase(z), abs(z)
end

"""
    portrait(z,cm::Function)

colors an array z according angle(z) using the color function cm
"""
portrait(z,cm::Function) = map(cm,z)

"""
    portrait(z,cm::ColorScheme)

colors an array z according angle(z) using the colormap cm
"""
portrait(z,cm::ColorScheme) = portrait(z,phasecolor(cm))

"""
    phasecolor(cm::ColorScheme)

returns a mapping from a number x to an RGB color corresponding to the colorscheme cm and the phase of x.
"""
function phasecolor(cm::ColorScheme)
  return f(x) = RGB(get(cm,canonicalphase(x)))
end

function ℂ(x::AbstractVector{<:Real},y::AbstractVector{<:Real})
    return x' .+ im*y
end

function ℂ(xlims,ylims;n=128,nx=n,ny=n)
    x = LinRange(xlims...,nx)
    y = LinRange(ylims...,ny)
    return ℂ(x,y)
end

ℂ(xmax::Real,ymax::Real;kwargs...) = ℂ((-xmax,xmax),(-ymax,ymax);kwargs...)

ℂ(max::Real=2; kwargs...) = ℂ(max,max;kwargs...)

ℂ2x(z) = [real(w) for w in @view z[1,:]]
ℂ2y(z) = [imag(w) for w in @view z[:,1]]
ℂ2xy(z) = ℂ2x(z),ℂ2y(z)

const nist_colors = [HSV{Float32}(0.0f0,1.0f0,1.0f0)
    HSV{Float32}(60.0f0,1.0f0,1.0f0)
    HSV{Float32}(180.0f0,1.0f0,1.0f0)
    HSV{Float32}(240.0f0,1.0f0,1.0f0)
    HSV{Float32}(360.0f0,1.0f0,1.0f0)]

const nist = ColorScheme(nist_colors,"cyclic","NIST phase colorscheme")

const blueorange_colors = [RGB{Float32}(0.0f0,0.0f0,0.0f0)
    RGB{Float32}(0.1f0,0.2f0,0.5f0)
    RGB{Float32}(0.088889f0,0.233333f0,0.555556f0)
    RGB{Float32}(0.077778f0,0.266667f0,0.611111f0)
    RGB{Float32}(0.066667f0,0.3f0,0.666667f0)
    RGB{Float32}(0.055556f0,0.333333f0,0.722222f0)
    RGB{Float32}(0.044444f0,0.366667f0,0.777778f0)
    RGB{Float32}(0.033333f0,0.4f0,0.833333f0)
    RGB{Float32}(0.022222f0,0.433333f0,0.888889f0)
    RGB{Float32}(0.011111f0,0.466667f0,0.944444f0)
    RGB{Float32}(0.0f0,0.5f0,1.0f0)
    RGB{Float32}(0.044444f0,0.533333f0,0.977778f0)
    RGB{Float32}(0.088889f0,0.566667f0,0.955556f0)
    RGB{Float32}(0.133333f0,0.6f0,0.933333f0)
    RGB{Float32}(0.177778f0,0.633333f0,0.911111f0)
    RGB{Float32}(0.222222f0,0.666667f0,0.888889f0)
    RGB{Float32}(0.266667f0,0.7f0,0.866667f0)
    RGB{Float32}(0.311111f0,0.733333f0,0.844444f0)
    RGB{Float32}(0.355556f0,0.766667f0,0.822222f0)
    RGB{Float32}(0.4f0,0.8f0,0.8f0)
    RGB{Float32}(1.0f0,1.0f0,1.0f0)
    RGB{Float32}(1.0f0,0.9f0,0.3f0)
    RGB{Float32}(0.988889f0,0.855556f0,0.266667f0)
    RGB{Float32}(0.977778f0,0.811111f0,0.233333f0)
    RGB{Float32}(0.966667f0,0.766667f0,0.2f0)
    RGB{Float32}(0.955556f0,0.722222f0,0.166667f0)
    RGB{Float32}(0.944444f0,0.677778f0,0.133333f0)
    RGB{Float32}(0.933333f0,0.633333f0,0.1f0)
    RGB{Float32}(0.922222f0,0.588889f0,0.066667f0)
    RGB{Float32}(0.911111f0,0.544444f0,0.033333f0)
    RGB{Float32}(0.9f0,0.5f0,0.0f0)
    RGB{Float32}(0.877778f0,0.455556f0,0.0f0)
    RGB{Float32}(0.855556f0,0.411111f0,0.0f0)
    RGB{Float32}(0.833333f0,0.366667f0,0.0f0)
    RGB{Float32}(0.811111f0,0.322222f0,0.0f0)
    RGB{Float32}(0.788889f0,0.277778f0,0.0f0)
    RGB{Float32}(0.766667f0,0.233333f0,0.0f0)
    RGB{Float32}(0.744444f0,0.188889f0,0.0f0)
    RGB{Float32}(0.722222f0,0.144444f0,0.0f0)
    RGB{Float32}(0.7f0,0.1f0,0.0f0)
    RGB{Float32}(0.0f0,0.0f0,0.0f0)]


# based on blueorange from https://github.com/fredrik-johansson/arb/blob/202a24d96570c0e1639301fea09fbf7c40f24a70/examples/complex_plot.c
# public domain

const blueorange = ColorScheme(blueorange_colors,"cyclic","BlueOrange phase colorscheme")

const math_colors = [HSL{Float32}(185.6f0,0.59523815f0,0.49411765f0),
	HSL{Float32}(197.2028f0,0.6244542f0,0.5509804f0),
	HSL{Float32}(206.85315f0,0.67772514f0,0.5862745f0),
	HSL{Float32}(216.89189f0,0.75510204f0,0.6156863f0),
	HSL{Float32}(224.31372f0,0.827027f0,0.6372549f0),
	HSL{Float32}(234.42857f0,0.8235294f0,0.6666667f0),
	HSL{Float32}(245.57143f0,0.8235294f0,0.6666667f0),
	HSL{Float32}(253.50993f0,0.8251366f0,0.64117646f0),
	HSL{Float32}(261.81818f0,0.8291457f0,0.6098039f0),
	HSL{Float32}(270.18182f0,0.76744187f0,0.57843137f0),
	HSL{Float32}(279.27274f0,0.7081545f0,0.54313725f0),
	HSL{Float32}(288.2143f0,0.66141737f0,0.5019608f0),
	HSL{Float32}(296.11765f0,0.72649574f0,0.45882353f0),
	HSL{Float32}(306.24277f0,0.75545853f0,0.4490196f0),
	HSL{Float32}(314.33334f0,0.7627119f0,0.4627451f0),
	HSL{Float32}(322.58063f0,0.76229507f0,0.47843137f0),
	HSL{Float32}(330.31915f0,0.7401575f0,0.49803922f0),
	HSL{Float32}(337.25275f0,0.7459017f0,0.52156866f0),
	HSL{Float32}(345.6f0,0.76419216f0,0.5509804f0),
	HSL{Float32}(353.25443f0,0.77168953f0,0.57058823f0),
	HSL{Float32}(2.857143f0,0.7924528f0,0.58431375f0),
	HSL{Float32}(13.0f0,0.84112155f0,0.5803922f0),
	HSL{Float32}(20.95238f0,0.8790698f0,0.57843137f0),
	HSL{Float32}(28.65672f0,0.91780823f0,0.57058823f0),
	HSL{Float32}(35.260666f0,0.9295154f0,0.55490196f0),
	HSL{Float32}(41.32076f0,0.8833334f0,0.5294118f0),
	HSL{Float32}(47.596157f0,0.8188977f0,0.5019608f0),
	HSL{Float32}(53.30097f0,0.85833335f0,0.47058824f0),
	HSL{Float32}(60.29703f0,0.91818184f0,0.43137255f0),
	HSL{Float32}(67.02438f0,0.9276018f0,0.43333334f0),
	HSL{Float32}(75.0f0,0.89285713f0,0.4392157f0),
	HSL{Float32}(84.30769f0,0.8666667f0,0.44117647f0),
	HSL{Float32}(94.28571f0,0.8325991f0,0.44509804f0),
	HSL{Float32}(106.53846f0,0.6190477f0,0.5058824f0),
	HSL{Float32}(118.63636f0,0.57391304f0,0.54901963f0),
	HSL{Float32}(132.85715f0,0.5833333f0,0.5294118f0),
	HSL{Float32}(145.60509f0,0.62549806f0,0.49215686f0),
	HSL{Float32}(153.02014f0,0.5889328f0,0.49607843f0),
	HSL{Float32}(162.85715f0,0.5555556f0,0.49411765f0),
	HSL{Float32}(172.55475f0,0.5502008f0,0.4882353f0),
	HSL{Float32}(185.6f0,0.59523815f0,0.49411765f0)]

const math = ColorScheme(math_colors,"cyclic","Alternative phase colorscheme")

# A dictionary of colorschemes for complex phase domain coloring

const phasecolormaps = Dict(
    :math => math,
    :nist => nist,
    :blueorange => blueorange,
    :hsv => ColorSchemes.colorschemes[:hsv],
    :phase => ColorSchemes.colorschemes[:phase],
    :twilight => ColorSchemes.colorschemes[:twilight],
    :julia_colorscheme => ColorSchemes.colorschemes[:julia_colorscheme]
)

end
