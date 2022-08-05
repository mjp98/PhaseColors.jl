using PhaseColors
using Plots

function absarg!(
    x::AbstractVector,
    y::AbstractVector;
    line_c = nist,
    line_z=angle.(y),
    clims=(-π,π),kwargs...)

    plot!(x,abs.(y);line_z,lc=cgrad(line_c,50),clims,kwargs...)

end

function scatter_reim!(Z::AbstractArray{<:Complex};kwargs...)
    return scatter!(real.(Z),imag.(Z);kwargs...)
end
