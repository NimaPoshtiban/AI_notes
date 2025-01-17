import Pkg 
import GLMakie
import SpecialFunctions


s=Complex(abs(randn(1)[1]),randn(1)[1])
s1 = SpecialFunctions.gamma(s+1)
sgammas = s*SpecialFunctions.gamma(s)
result = isapprox(s1,sgammas)

f = GLMakie.Figure(size=(800,200),title="Γ(s+1)=sΓ(s) is $result")
ax = GLMakie.Axis(f[1,1],title="Γ(s+1)",subtitle="Γ(s+1)=sΓ(s) => $result",xlabel="Re",ylabel="Im")

GLMakie.scatter!(ax,real.(s1),imag.(s1))
ax = GLMakie.Axis(f[1,2],xlabel="Re",ylabel="Im",title="sΓ(s)",subtitle="Γ(s+1)=sΓ(s) => $result")
GLMakie.scatter!(ax,real.(sgammas),imag.(sgammas))
printstyled("Γ(s+1)=sΓ(s) is $result",color=:green)
f


function xi_zeta(s::Complex)::Complex
    return π^(-s/2) * SpecialFunctions.gamma(s/2) * SpecialFunctions.zeta(s)
end

result = isapprox(xi_zeta(s),xi_zeta(1-s))
printstyled("ξ(s)=ξ(1-s) => $result",color=:green)
f = GLMakie.Figure(size=(800,200))
ax = GLMakie.Axis(f[1,1],title="ξ(s)",subtitle="ξ(s)=ξ(1-s) => $result",xlabel="Re",ylabel="Im")

GLMakie.scatter!(ax,real.(xi_zeta(s)),imag.(xi_zeta(s)))

ax = GLMakie.Axis(f[1,2],title="ξ(1-s)",subtitle="ξ(s)=ξ(1-s) => $result",xlabel="Re",ylabel="Im")

GLMakie.scatter!(ax,real.(xi_zeta(1-s)),imag.(xi_zeta(1-s)))
f
