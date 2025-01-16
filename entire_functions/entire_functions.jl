import Pkg

function fz(z)::Complex
    e = exp(1)
    return (e^(1im*π*z)-e^(-1im*π*z)) / 2im
end

function cosinez(z)::Complex
    z = z^0.5
    sum = Complex(0,0)
    for i = 0:10
        sum += ((-1)^i)*(z^(i)/factorial(2*i))
    end
    return sum
end


using GLMakie
using LaTeXStrings
r = range(0,10,length=10000)
real_fz = [real.(fz(z)) for z in r]
imag_fz = [imag.(fz(z)) for z in r*1im]
rad = [sqrt(x^2 + y^2) for (x, y) in zip(real_fz, imag_fz)]
θ = [atan(y,x) for (x,y) in zip(real_fz,imag_fz)]
f = Figure(size = (800, 400))

real_cz = [real.(cosinez(z)) for z in r]
imag_cz = [imag.(cosinez(z)) for z in r*1im]
radcz = [sqrt(x^2 + y^2) for (x, y) in zip(real_cz, imag_cz)]
θcz = [atan(y,x) for (x,y) in zip(real_cz,imag_cz)]


ax = PolarAxis(f[1, 1],title = L"""f(z)=\frac{e^{i\pi z}-e^{-i\pi z}}{2i}""",rticklabelsvisible=true)
lineobject = scatter!(ax, rad, θ, color = :orange)

ax = PolarAxis(f[1, 2],title = L"""cos z^{1/2}=\sum_{n=0}^{\infty}(-1)^{n}\frac{z^{n}}{(2n)!}""",rticklabelsvisible=true)
lineobject = scatter!(ax, radcz, θcz, color = :red)
    
f





