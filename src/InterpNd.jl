module InterpNd

using Interpolations

import Base.call
function call(itp::Interpolations.BSplineInterpolation,
              x::AbstractVector,
              xx::AbstractVector)
    didx = [0; 1.0./diff(x)]
    is = map(eachindex(xx)) do i
        im = indmin(abs(x-xx[i]))
        im - didx[im]*(x[im] - xx[i])
    end
    Float64[itp[ii] for ii in is]
end

interp1d = y -> interpolate(y, BSpline(Linear()), OnGrid())

export call, interp1d

end # module
