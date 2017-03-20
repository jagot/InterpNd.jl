module InterpNd

using Interpolations

function (itp::Interpolations.BSplineInterpolation)(x::AbstractVector,
                                                    xx::AbstractVector)
    didx = [0; 1.0./diff(x)]
    is = map(eachindex(xx)) do i
        im = indmin(abs(x-xx[i]))
        im - didx[im]*(x[im] - xx[i])
    end
    eltype(itp)[itp[ii] for ii in is]
end

(itp::Interpolations.BSplineInterpolation)(x::AbstractVector,
                                           xx) = itp(x,[xx])[1]

interp1d = y -> interpolate(y, BSpline(Quadratic(Flat())), OnGrid())

export interp1d

end # module
