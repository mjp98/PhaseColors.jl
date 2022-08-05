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

const nist_colors =  RGB{Float32}(1.0f0,0.0f0,0.0f0)
RGB{Float32}(1.0f0,0.14999998f0,0.0f0)
RGB{Float32}(1.0f0,0.3f0,0.0f0)
RGB{Float32}(1.0f0,0.45f0,0.0f0)
RGB{Float32}(1.0f0,0.6f0,0.0f0)
RGB{Float32}(1.0f0,0.75f0,0.0f0)
RGB{Float32}(1.0f0,0.9f0,0.0f0)
RGB{Float32}(0.95000005f0,1.0f0,0.0f0)
RGB{Float32}(0.79999995f0,1.0f0,0.0f0)
RGB{Float32}(0.65f0,1.0f0,0.0f0)
RGB{Float32}(0.5f0,1.0f0,0.0f0)
RGB{Float32}(0.35000002f0,1.0f0,0.0f0)
RGB{Float32}(0.20000005f0,1.0f0,0.0f0)
RGB{Float32}(0.049999952f0,1.0f0,0.0f0)
RGB{Float32}(0.0f0,1.0f0,0.099999905f0)
RGB{Float32}(0.0f0,1.0f0,0.25f0)
RGB{Float32}(0.0f0,1.0f0,0.4000001f0)
RGB{Float32}(0.0f0,1.0f0,0.54999995f0)
RGB{Float32}(0.0f0,1.0f0,0.70000005f0)
RGB{Float32}(0.0f0,1.0f0,0.8499999f0)
RGB{Float32}(0.0f0,1.0f0,1.0f0)
RGB{Float32}(0.0f0,0.8499999f0,1.0f0)
RGB{Float32}(0.0f0,0.70000005f0,1.0f0)
RGB{Float32}(0.0f0,0.54999995f0,1.0f0)
RGB{Float32}(0.0f0,0.4000001f0,1.0f0)
RGB{Float32}(0.0f0,0.25f0,1.0f0)
RGB{Float32}(0.0f0,0.099999905f0,1.0f0)
RGB{Float32}(0.05000019f0,0.0f0,1.0f0)
RGB{Float32}(0.19999981f0,0.0f0,1.0f0)
RGB{Float32}(0.3499999f0,0.0f0,1.0f0)
RGB{Float32}(0.5f0,0.0f0,1.0f0)
RGB{Float32}(0.6500001f0,0.0f0,1.0f0)
RGB{Float32}(0.8000002f0,0.0f0,1.0f0)
RGB{Float32}(0.9499998f0,0.0f0,1.0f0)
RGB{Float32}(1.0f0,0.0f0,0.9000001f0)
RGB{Float32}(1.0f0,0.0f0,0.75f0)
RGB{Float32}(1.0f0,0.0f0,0.5999999f0)
RGB{Float32}(1.0f0,0.0f0,0.4499998f0)
RGB{Float32}(1.0f0,0.0f0,0.3000002f0)
RGB{Float32}(1.0f0,0.0f0,0.1500001f0)
RGB{Float32}(1.0f0,0.0f0,0.0f0)

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

const math_colors = [RGB{Float32}(0.19999999f0,0.73333323f0,0.7882353f0)
    RGB{Float32}(0.27058822f0,0.6705882f0,0.83137256f0)
    RGB{Float32}(0.30588233f0,0.6156863f0,0.8666667f0)
    RGB{Float32}(0.32549024f0,0.54901963f0,0.90588236f0)
    RGB{Float32}(0.33725488f0,0.49411762f0,0.9372549f0)
    RGB{Float32}(0.3921569f0,0.4431373f0,0.9411765f0)
    RGB{Float32}(0.44313714f0,0.3921569f0,0.9411765f0)
    RGB{Float32}(0.47843125f0,0.34509802f0,0.9372549f0)
    RGB{Float32}(0.5215687f0,0.2862745f0,0.93333334f0)
    RGB{Float32}(0.5803921f0,0.25490195f0,0.9019608f0)
    RGB{Float32}(0.64313745f0,0.21960783f0,0.8666667f0)
    RGB{Float32}(0.70196104f0,0.17254904f0,0.8313726f0)
    RGB{Float32}(0.7490196f0,0.12549019f0,0.7921569f0)
    RGB{Float32}(0.7882353f0,0.109803915f0,0.717647f0)
    RGB{Float32}(0.8156863f0,0.109803915f0,0.6470586f0)
    RGB{Float32}(0.84313726f0,0.11372548f0,0.5686277f0)
    RGB{Float32}(0.8666667f0,0.12941176f0,0.49411768f0)
    RGB{Float32}(0.87843144f0,0.1647059f0,0.43529415f0)
    RGB{Float32}(0.89411765f0,0.20784312f0,0.37254885f0)
    RGB{Float32}(0.9019608f0,0.23921567f0,0.31372565f0)
    RGB{Float32}(0.9137255f0,0.28627455f0,0.254902f0)
    RGB{Float32}(0.9333334f0,0.38039222f0,0.227451f0)
    RGB{Float32}(0.9490196f0,0.46666664f0,0.20784312f0)
    RGB{Float32}(0.9647059f0,0.55294126f0,0.17647058f0)
    RGB{Float32}(0.96862745f0,0.627451f0,0.14117646f0)
    RGB{Float32}(0.94509804f0,0.6862746f0,0.11372551f0)
    RGB{Float32}(0.909804f0,0.74117655f0,0.09411767f0)
    RGB{Float32}(0.8745098f0,0.7843137f0,0.06666666f0)
    RGB{Float32}(0.8235294f0,0.827451f0,0.035294116f0)
    RGB{Float32}(0.74117655f0,0.8352941f0,0.031372547f0)
    RGB{Float32}(0.63529414f0,0.83137256f0,0.04705882f0)
    RGB{Float32}(0.51372546f0,0.8235294f0,0.058823526f0)
    RGB{Float32}(0.3921569f0,0.8156863f0,0.0745098f0)
    RGB{Float32}(0.33725494f0,0.8117647f0,0.20000002f0)
    RGB{Float32}(0.3019609f0,0.80784315f0,0.29019612f0)
    RGB{Float32}(0.254902f0,0.8039216f0,0.37254915f0)
    RGB{Float32}(0.18431371f0,0.8f0,0.44705868f0)
    RGB{Float32}(0.20392156f0,0.7882353f0,0.5254902f0)
    RGB{Float32}(0.21960783f0,0.76862746f0,0.6117648f0)
    RGB{Float32}(0.21960783f0,0.75686276f0,0.6901961f0)
    RGB{Float32}(0.19999999f0,0.73333323f0,0.7882353f0)]

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
