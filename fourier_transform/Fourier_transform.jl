import Pkg
import GLMakie
import FFTW
using LaTeXStrings

begin
    fig = GLMakie.Figure(size = (600, 600))
    ax =  GLMakie.Axis(fig[1, 1], limits = (-2, 2, -2, 2), title = "Horizontal Strip in Complex Plane")
a = -1
b = 1
    
    polygon_vertices = GLMakie.Point2f0.([
        (-2, a), (2, a), (2, b), (-2, b)
    ])

    # Draw the horizontal strip as a polygon
    GLMakie.poly!(ax, polygon_vertices, color = (:grey, 0.5))

    # Draw the boundaries
    GLMakie.lines!(ax, [-2, 2], [a, a], color = :red)
    GLMakie.lines!(ax, [-2, 2], [b, b], color = :red)

    fig
end

begin
using GLMakie
using FFTW
function f(z)
    return exp(-π * z^2)
end

# Define the range for z and the sample points
z = LinRange(-10, 10, 1024)
f_values = f.(z)

# Compute the Fourier transform using FFT
F_transform = fftshift(fft(f_values))

# Frequency range for the Fourier transform
dz = z[2] - z[1]
N = length(z)
freq = fftshift(fftfreq(N, dz))

# Convert data to Point2f type for plotting
original_function_points = Point2f.(collect(z), collect(f_values))
fourier_transform_points = Point2f.(collect(freq), collect(abs.(F_transform)))

# Plot the original function and its Fourier transform using GLMakie
fig = Figure(size = (1200, 600))

ax1 = Axis(fig[1, 1], title = "Original Function", xlabel = "z", ylabel = "f(z)")
lines!(ax1, collect(z), collect(f_values), color = :blue)

ax2 = Axis(fig[1, 2], title = "Fourier Transform", xlabel = "Frequency (ξ)", ylabel = "|F(ξ)|")
lines!(ax2, collect(freq), collect(abs.(F_transform)), color = :red)

fig[1, 1] = ax1
fig[1, 2] = ax2
fig
end


begin
using GLMakie
using FFTW

# Define the function
c = 1.0  # You can change this value as needed
function f(z)
    return (1 / π) * (c / (c^2 + z^2))
end

# Define the range for z and the sample points
z = LinRange(-10, 10, 1024)
f_values = f.(z)

# Compute the Fourier transform using FFT
F_transform = fftshift(fft(f_values))

# Frequency range for the Fourier transform
dz = z[2] - z[1]
N = length(z)
freq = fftshift(fftfreq(N, dz))

# Plot the original function and its Fourier transform using GLMakie
fig = Figure(size = (1200, 600))

ax1 = Axis(fig[1, 1], title = "Original Function", xlabel = "z", ylabel = "f(z)")
lines!(ax1, z, f_values, color = :blue)

ax2 = Axis(fig[1, 2], title = "Fourier Transform", xlabel = "Frequency (ξ)", ylabel = "|F(ξ)|")
lines!(ax2, freq, abs.(F_transform), color = :red)

fig[1, 1] = ax1
fig[1, 2] = ax2

    fig
end

begin
    fig = GLMakie.Figure(size = (600, 600))
    ax = GLMakie.Axis(fig[1, 1], limits = (-2, 2, -2, 2), title = "Sector of Complex Plane",xticksvisible=false,yticksvisible=false,xlabel="Real axis",ylabel="Im Axis")

    θ = range(-π/4, π/4; length=10000)
    x = cos.(θ)
    y = sin.(θ)

    GLMakie.lines!(ax, [0, 0], [0, 2])
    GLMakie.lines!(ax, [0, 2], [0, 0])
    GLMakie.lines!(ax, [0, 2], [0, 2])
  
    GLMakie.scatter!(ax, [x; -x], [y; -y], color = :blue)
    GLMakie.poly!(ax, GLMakie.Point2f0.([(0, 0), (2, π/4), (2, -π/4)]), color = (:lightblue, 0.5))
    
    fig
end




