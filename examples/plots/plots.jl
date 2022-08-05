using PhaseColors
using Plots

# absarg plot

function absarg!(
    x::AbstractVector,
    y::AbstractVector;
    line_c=nist,
    line_z=canonicalphase.(y),
    clims=(0, 1), kwargs...)

    plot!(x, abs.(y); line_z, lc=cgrad(line_c, 50), clims, kwargs...)

end

x = LinRange(0,2π,100)
y = @. (1+sin(x))*cis(x)

cm = phasecolormaps[:nist]

plot()
absarg!(x,y;line_c=cm,lw=4,label=:none)


function scatter_reim!(Z::AbstractArray{<:Complex}; kwargs...)
    return scatter!(real.(Z), imag.(Z); kwargs...)
end
