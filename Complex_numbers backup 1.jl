import Pkg
import Base 

z = 2 + 2im

abs(z)

z̄=conj(z)

abs2(z)


using LaTeXStrings

println("Demonstration of Polar form if a Complex number")

θ = π / 4  


arc = range(0, stop=θ, length=1000)
x_arc = cos.(arc)
y_arc = sin.(arc)


Plots.plot(x_arc, y_arc, label="θ", legend=:right, title="z", xlabel=L"""\mathbb{R}""", ylabel=L"""\mathbf{i}""", line=(:solid, :blue))


Plots.plot!([0, 10], [0, 10], label="r", line=(:solid, :red))


plot!([0, 10], [0, 0], label="Real-axis", line=(:dash, :black))
scatter!([10],[10], label=L"""re^{iθ}""", marker=:circle, markersize=5, color=:green)

w = 3-1im
printstyled("zw = $(z*w)\n",color=:blue)
r = abs(z)
s = abs(w)
θ = atan(z.im/z.re)
φ = atan(w.im/w.re)
polarform = r*s*exp(1)^(1im*(θ + φ))
printstyled("rse^i(θ+φ) = $polarform",color=:red)

using ComplexPlots, Plots, ComplexValues
zc = cispi.(2*(0:100) / 100);
Plots.plot(@. Polar(zc);label="Unit DisK",)

zc = cispi.(2*(0:100) / 100);
gr()
Plots.plot(@. Polar(zc);label=L"""Compact\,\,\Omega\,\, set""",)
Plots.plot!(@. Polar(zc+zc);label=L"""Superset\,\, of\,\,\, \Omega""",legend=:topleft)

import GLMakie

# Parameters for the annular region Omega
c = 0.0 + 0.0im  # Center of the annulus in the complex plane
r1 = 1.0         # Outer radius
r2 = 0.5         # Inner radius

# Parameters for the closed set F (for example, a small circle inside Omega)
r_F = 0.3        # Radius of the closed set F
center_F = 0.5 + 0.5im  # Center of the closed set F

# Create a grid of points
x = GLMakie.LinRange(-1.5, 1.5, 400)
y = GLMakie.LinRange(-1.5, 1.5, 400)


xx = repeat(x, length(y)) # Create a 1D vector and repeat it for all y values
yy = repeat(y, inner = length(x)) # Repeat y values for all x values

# Reshape xx and yy into matrices to form the mesh grid
xx = reshape(xx, length(x), length(y))
yy = reshape(yy, length(x), length(y))

# Define the complex grid zz
zz = xx .+ im .* yy

# Define the region Omega (annulus: r2 < |z - c| < r1)
omega = (abs.(zz .- c) .> r2) .& (abs.(zz .- c) .< r1)

# Plotting the region Omega
fig = GLMakie.Figure(size = (800, 600))
ax = GLMakie.Axis(fig[1, 1], title = "Region Ω and Set F in the Complex Plane")

# Plot Omega using scatter
GLMakie.scatter!(ax, real(zz[omega]), imag(zz[omega]), color = :blue, alpha = 0.3, label = "Ω")

# Plot the closed set F (a circle)
theta = GLMakie.LinRange(0, 2 * π, 200)
x_F = real(center_F) .+ r_F * cos.(theta)
y_F = imag(center_F) .+ r_F * sin.(theta)

# Plot F
GLMakie.plot!(ax, x_F, y_F, color = :red, label = "Set F")

# Add axis labels
ax.xlabel = "Re(z)"
ax.ylabel = "Im(z)"

# Display the figure
fig


import GLMakie
using GLMakie
f = GLMakie.Figure(size = (800, 300))

ax = GLMakie.PolarAxis(f[1, 1], title = "sin(z)",theta_as_x = false)
lineobject = GLMakie.lines!(ax, 0..2pi, sinh, color = :red,)

ax = GLMakie.PolarAxis(f[1, 2], title = "cos(z)", theta_as_x = false)
lineobject = GLMakie.lines!(ax,0..2pi, cosh, color = :orange)

ax = GLMakie.PolarAxis(f[1, 3], title = L"""\mathcal{e}^{z}""", theta_as_x = false)
ez = z -> exp(1)^z
lineobject = GLMakie.lines!(ax,0..2pi, ez, color = :blue)
f
