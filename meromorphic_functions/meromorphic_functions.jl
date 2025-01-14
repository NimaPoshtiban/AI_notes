### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 44e8679f-0904-424b-9d03-1fb4d758b82e
# ╠═╡ show_logs = false
begin
	
	import Pkg
	Pkg.activate()
    import GLMakie
	import Images
	import PlutoUI
	using LaTeXStrings
	
end

# ╔═╡ ef9f1682-d0ea-11ef-2939-a74ae60120f5
md"""
# Meromorphic Functions and the Logarithm
"""

# ╔═╡ 1c11aa62-adc9-4974-bd5b-1f511663353c
md"""
## Zeros and Poles

Meromorphic functions are determined by their zeros and poles.

1) Removeable singularities

2) Poles

3) Essential singularities

A point singularity of a function is a complex number $z_{0}$ such that $f$ is defined in a neighborhood of $z_{0}$ but not at the point $z_{0}$ itself is called 
**Isolated singularity**

**note**: consider $\Omega$ a connected open set




"""

# ╔═╡ 1300606e-90d3-4cbe-ac68-071ba7442f79
md"""
### order of n
Suppose $f$ is holomorphic on $\Omega$, has a zero point at $z_{0} \in \Omega$ and does not vanished identically in $\Omega$, then there exists a neighborhood $U \subset \Omega$ of $z_{0}$, a non-vanishing holomorphic function $g$ on $U$, and a unique positive integer $n$ such that

$$f(z)=(z-z_{0})^{n}g(z)\quad\forall z\in U$$

we say $f$ has a **zero of order n** (or multiplicity) at $z_{0}$, if zero is order of $1$ then it is called **simple**

#### Principal parts and Residue

let's define a deleted neighborhood of $z_{0}$ to be an open disk centered at $z_{0}$
, minus the point $z_{0}$, that is, the set:

$$\left\{\,z: 0< \left|z-z_{0}\right| < r \right\}\,\,\text{for some r}\quad \exists r > 0$$

then the function $f$ defined in a deleted neighborhood of $z_{0}$ has a **pole** $z_{0}$, if the function $\dfrac{1}{f}$ defined to be $0$ at $z_{0}$, is holomorphic in a full neighborhood of $z_{0}$

$$\large\implies \dfrac{1}{f(z)}\,=(z-z_{0})^{n}g(z)$$

If $f$ has a pole at $z_{0} \in \Omega$, then in a neighborhood of that point there exists a non-vanishing holomorphic function $h$ and a unique **positive integer** such that:

$\large f(z)=(z-z_{0})^{-n}h(z),$ from previous info 

$\large \implies h(z)=\dfrac{1}{g(z)}$

The integer $n$ is called the order (or multiplicity) of the pole and describes the rate at which the function grows near $z_{0}$. if the pole is the order of $1$ then it is called **simple**


If $f$ has a pole of order $n$ at $z_{0}$ then:

$$\large f(z)=\underline{\frac{a_{-n}}{(z-z_{0})^{n}}+\frac{a_{n-1}}{(z-z_{0})^{n-1}}+\cdots + \frac{a_{-1}}{(z-z_{0})}} + G(z)$$

The **sum** (the underlined part of the function) is called the **principal part** of $f$ at the pole $z_{0}$ and the coefficient $a_{-1}$ is the **residue** of $f$ at that pole $\implies res_{z_{0}}f\,=a_{-1}$

If $P(z)$ is denotes the principal part above and $\mathcal{C}$ is any circle centered at $z_{0}$

$$\implies \large \dfrac{1}{2\pi i}\oint_{\mathcal{C}}{P(z)dz}\,=\,a_{-1}$$

when $f$ has a simple pole at $z_{0}$ $\large \implies res_{z_{0}}=\lim_{z\to z_{0}}{(z-z_{0})}f(z)$

### Conclusion


If $f$ has a pole of order $n$ at $z_{0}$ then 


$$\Large res_{z_{0}}f\,=\,\lim_{z\to z_{0}} \dfrac{1}{(n-1)!}(\frac{d}{dz})^{n-1}(z-z_{0})^{n}f(z)$$
"""

# ╔═╡ 6a537f8b-c7ea-4526-821c-7c13bcfd3167
md"""
## Residue Formula

If $f$ is holomorphic in an open set containing a toy contour $\gamma$ and its interior points except for poles at the points $z_{1},\cdots\,z_{n}$ inside $\gamma$
then:

$$\Large \oint_{\gamma}f(z)dz\,=2\pi i\sum_{k=1}^{N}res_{z_{k}}f$$

Example:

$f(z)=\dfrac{e^{z}}{1+e^{z}}$
has a pole in $z=i\pi$ 

$\implies (z-i\pi)f(z)=e^{z}\dfrac{z-i\pi}{e^{z}-e^{i\pi}}$

$\implies res_{i\pi}f=-e^{i\pi}$
"""

# ╔═╡ 09eb9fec-56b7-45e0-b724-f958814ebbee
begin
#proof that iπ is a pole
e = exp(1)
function fz(z::Complex)
	return e^(real.(z)) / real.(1+e^(z))
end
printstyled("$( real.(fz(im*pi)))") 
end

# ╔═╡ 578c634d-5deb-4de8-990b-607e27706319
md"""
## Riemann's Theorem on Removable Singularities

If $f$ is a function that is holomorphic on an open set $\Omega$ except possibly at one point $z_{0} \in $\Omega$ if $f$ is bounded on $\Omega-\left\{z_{0}\right\}$ then $z_{0}$ is a **removable** singularity 


Suppose that $f$ has an isolated singularity at the point $z_{0}$.


Then $z_{0}$ is a pole of $f$ $\iff \lim_{z\to z_{0}}\left|f(z)\right| = \infty$

Isolated singularities belong to one of three categories:

- Removable singularities ($f$ is bounded near $z_{0}$)
- Pole singularities ($\lim_{z\to z_{0}}\left|f(z)\right| = \infty$)
- essential singularities: any singularity that is not removable or a pole.($f(z)=e^{\frac{1}{z}}$)

**Unlike Removable singularities and Pole singularities, it is typical for a holomorphic function to behave erratically near an essential singularity**
"""

# ╔═╡ 94392ae7-1244-46d6-81d1-f5d2d4890a67
md"""
## Casorati-Weierstrass Theorem

Suppose $f$ is holomorphic in the punctured disk $D_{r}(z_{0})-\left\{z_{0}\right\}$
and has an essential singularity at $z_{0}$. Then the image of $D_{r}(z_{0})-\left\{z_{0}\right\}$ under $f$ is dense in the complex plane.

$$g(z)=\dfrac{1}{f(z)-w},\quad \left|g(z)\right| \le \frac{1}{\delta}\,,\,\delta >0$$

A function $f$ on an $\Omega$ is **meromorphic** if there exists a sequence of points $\left\{z_{0},z_{1},z_{2}\cdots\right\}$ that has no limit points in $\Omega$,and such that:

The function $f$ is holomorphic in $\Omega - \left\{z_{0},z_{1},z_{2}\cdots\right\}$ and $f$ has poles at the points $\left\{z_{0},z_{1},z_{2}\cdots\right\}$

**A meromorphic function in the complex plane that is either holomorphic at $\infty$ or has a pole at $\infty$ is said to be meromorphic in the extended complex plane**

example: $F(z)=f(\dfrac{1}{z})$
"""

# ╔═╡ 805c3022-4afc-49a9-b83c-0a122605b13b
md"""
## Mittag-Leffler's Theorem
The meromorphic functions in the extended complex plane are the rational functions.

$$z_{k}\in\mathbb{C},\,\,f(z)=f_{k}(z)+g_{k}(z)$$

where $f(z_{k})$ is the principal part of $f$ at $z_{k}$ and $g_{k}$ is holomorphic in a neighborhood of $z_{k}$, in particular, $f_{k}$ is a polynominal in $\dfrac{1}{z-z_{k}}$ 

$$f(1/z)=\tilde{f_{\infty}}(z) + \tilde{g}_{\infty}(z)$$
where $\tilde{g}_{\infty}$ is holomorphic in a neighborhood of the origin and $\tilde{f_{\infty}}$ is the principal part of $f(1/z)$ at $0$, that is a polynominal in $\dfrac{1}{z}$ 

Let $f_{\infty}(z)=\tilde{f}_{\infty}(1/z)$. We contend that function $H$.

$$H=f-f_{\infty}-\sum_{k=1}^{n}f_{k}$$ is entire and bounded
"""

# ╔═╡ 9523c4a8-6ddd-48eb-8e1a-e71f25b4335d
md"""
## Riemann Sphere (one-point compactification of $\mathbb{C}$)

Consider Euclidian space $\mathbb{R}^{3}$ with coordinates $(X,Y,Z)$ where $XY-Plane$
is identified with $\mathbb{C}$, We denote by $\mathbb{S}$ the sphere centered at $(0,0,1/2)$ and of **radius**$\,1/2$.

This sphere is of unit diameter and lies on top of the origin of the **complex plain**. Also, let $\mathcal{N}=(0,0,1)$ denote the north pole of the sphere.


Given any point $W=(X,Y,Z)$ on $\mathbb{S}$ different from the north pole, the line joining $\mathcal{N}$ and $W$ intersects the $XY-Plane$ in a single point, which we denote by $w=x+iy$ is called **Stereographic Projection** of $W$

Given any point $w$ in $\mathbb{C}$. the line joining $\mathcal{N}$ and $w=(x,y,0)$ intersects the sphere at $\mathcal{N}$ and another point, which we call $W$

Giving $w$ in terms of $W$

$$x=\dfrac{X}{1-Z},\quad y=\dfrac{Y}{1-Z}$$

Giving $W$ in terms of $w$

$$X=\dfrac{x}{x^{2}+y^{2}+1},\quad Y=\dfrac{y}{x^{2}+y^{2}+1},\quad Z=\dfrac{x^{2}+y^{2}}{x^{2}+y^{2}+1}$$

As the point $w$ goes to $\infty$ in $\mathbb{C}$ ($|w|\to\infty$) the corresponding $w$ on $\mathbb{S}$ comes arbitarily close to $\quad\mathcal{N}\quad$($\mathcal{N}$ points at $\infty$)

A meromorphic function on the **extended complex plane** can be thought of as a map from $\mathbb{S}$ to itself, where the image of a pole is now a tractable point on $\mathbb{C}$, namely $\mathcal{N}$

"""

# ╔═╡ 5534fbe8-bf84-4acb-a810-e016746b2fbe
begin
    fig = GLMakie.Figure(size = (800, 600))
	ax =  GLMakie.Axis3(fig[1, 1], title = "Riemann Sphere",xticksvisible=false,yticksvisible=false,zticksvisible=false,xticklabelsvisible=false,yticklabelsvisible=false,zticklabelsvisible=false)
    # Create the sphere
    θ = range(0, 2π, length=50)
    φ = range(0, π, length=50)
    x = [sin(ϕ) * cos(θ) for ϕ in φ, θ in θ]
    y = [sin(ϕ) * sin(θ) for ϕ in φ, θ in θ]
    z = [cos(ϕ) for ϕ in φ, θ in θ]


   	GLMakie.surface!(ax, x, y, z, colormap = :deep,	 colorrange = (80, 190),			shading=GLMakie.MultiLightShading)
	 
	GLMakie.text!(fig[1, 1],  GLMakie.Point3f0(1, 0, 1.1), text = L"""\mathcal{N}""", color = :red,fontsize=34)
	GLMakie.text!(fig[1, 1],  GLMakie.Point3f0(-1, -1, -1.1), text = "0", color = :black)

    fig
end

# ╔═╡ d1bb3150-0e91-4300-8d5d-874406d078e9
md"""
## The Argument Principle and Its Applications

### Argument Principle
Suppose that $f$ is in an open set containing a circle $\mathcal{C}$ and its interior. If $f$ has no poles and never vanishes on  $\mathcal{C}$ then:

$$\dfrac{1}{2\pi i}\oint_{\mathcal{C}}\dfrac{f^{'}(z)}{f(z)}dz\,= \text{(number of zeros of f) - (number of poles of f) inside }\mathcal{C}$$

**This holds true for toy contours.**
"""

# ╔═╡ 13cc8484-feec-47fc-97b4-22dd0081120f
md"""
### Rouche's Theorem

Suppose that $f$ and $g$ are holomorphic in an open set containing a circle $\mathcal{C}$ and its interior.

If $|f(z)|>|g(z)|\,\,\, \forall z\in \mathcal{C}$ 

Then $f$ and $f+g$ have the **same number of zeros** inside the circle $\mathcal{C}$
"""

# ╔═╡ fdc6a7ab-c2c9-4eb1-b59a-4471ae671e82
md"""
### Open Mapping Theorem

If $f$ is holomorphic and non-constant in a region $\Omega$, then $f$ is **open**.
"""

# ╔═╡ a16eeff4-896c-4e6b-abef-3cc2bb93bcd3
md"""
### Maximum Modules Principle

Suppose that $\Omega$ is a region with compact closure $\overline{\Omega}$, if $f$ is holomorphic on $\Omega$ and continuous on $\overline{\Omega}$, then:

$$\underset{z\in\Omega}{sup}|f(z)|\le\underset{z\in\overline{\Omega}-\Omega}{sup}|f(z)|$$
 
then$\implies$ $f$ attains its **maximum** in $\overline{\Omega}$
"""

# ╔═╡ c705cafa-1d63-4d09-96e5-866dd51bf543
md"""
## Homotopy and Simply Connected Domains

Two curves are **homotopic** if one curve can be deformed into the other by a **continuous** transformation without ever leaving $\Omega$

If $f$ is holomorphic in $\Omega$ then $\Large\oint_{\gamma_{0}}f(z)dz = \oint_{\gamma_{1}}f(z)dz$ when ever two curves $\gamma_{0},\gamma_{1}$ are homotopic in $\Omega$

A region $\Omega$ in the **complex plane** is **simply connected** if any two pair of curves in $\Omega$ with the same end-points are **homotopic**

Any **homotopic** function in a **simply connected** domain has a **primitive**.

If $f$ is **holomorphic** in the **simply connected** region $\Omega$ then

$$\oint_{\gamma}f(z)dz=0\quad \forall\quad \text{closed curve}\,\,\gamma \in \Omega$$
"""

# ╔═╡ 1eb03400-6759-4a91-96cb-489ffba97600
homotopy_url = "https://upload.wikimedia.org/wikipedia/commons/7/7e/HomotopySmall.gif"

# ╔═╡ 1309bb2b-9891-45b2-ab3b-f8f43facca32
md"""
**Example of homotopic curves**

$(PlutoUI.Resource(homotopy_url, :width => 200, :autoplay => "", :loop => ""))
"""

# ╔═╡ aff05d93-251f-4633-9fd4-ce9def5cc7d6
md"""
## The Complex logartihm

**Branch**: A branch of the complex logarithm is a continuous function that selects one of the possible values for each complex number. To make the function single-valued.

If $\Omega$ is a **simply connected** with $1\in\Omega$ and $0\not\in\Omega$, then there exists a **branch of logarithm** $F(z)=\log_{\Omega}(z)$ so that 

1) $$F\quad \text{is holomorphic in}\quad \Omega$$
2) $\mathcal{e}^{F(z)}=z\,\,\forall\,\,z\in\Omega$
3) $F(r)=\log(r)\quad \text{whenever r is a Real Number and near 1}.$

If $\Omega$ is **simply connected domain** with $1\in\Omega$ and $0\not\in\Omega$,
then $\Large z^{\alpha} = \mathcal{e}^{\alpha\log(z)}\,\,\forall z\in\Omega$

**Every non-zero complex number $\large w$ can be written as: $\Large w=\mathcal{e}^{z}$**

If $f$ is a **nowhere vanishing holomorphic** function in a **simply connected** region $\Omega$ then there exists a **holomorphic** function $g$ on $\Omega$ such that

$$\Large f(z)=\mathcal{e}^{g(z)}\,\,\forall\,\,z\in\Omega$$
"""

# ╔═╡ c1cf34e7-c55e-42d6-88af-183cda28c54e
complexlog_url= "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Riemann_surface_log.svg/220px-Riemann_surface_log.svg.png"

# ╔═╡ 3c28adf6-c2ae-4718-8f51-72a500f2519c
md"""

$(PlutoUI.Resource(complexlog_url, :width => 200, :autoplay => "", :loop => ""))

A plot of the multi-valued imaginary part of the complex logarithm function shows the branches.
"""

# ╔═╡ b0ff6127-6ae8-4634-ab7d-60b0cba2f842
md"""
# Fourier Series and Harmonic functions

The coefficients of the power series expansion of $f$ are given by

$$a_{n}=\dfrac{1}{2\pi r^{n}}\oint_{0}^{2\pi}f(z_{0}+re^{i\theta})e^{-ni\theta} d\theta\,\,,\,\forall n\ge 0,\,\, \forall\, r\,\, 0<r<R$$

Moreover if $n<0$ then the Integral is **zero**

If f is **holomorphic** in a disk $D_{R}(z_{0})$ then

$$f(z_{0})=\dfrac{1}{2\pi}\oint_{0}^{2\pi}f(z_{0}+re^{i\theta})d\theta ,\,\, \forall\, r\,\, 0<r<R$$

If f is **holomorphic** in a disk $D_{R}(z_{0})$, and $u=Re(f)$,then

$$u(z_{0})=\dfrac{1}{2\pi}\oint_{0}^{2\pi}u(z_{0}+re^{i\theta})d\theta ,\,\, \forall\, r\,\, 0<r<R$$

Every **harmonic function** in a disk is the **real part** of a **holomorphic** function in that disk.
"""

# ╔═╡ Cell order:
# ╠═ef9f1682-d0ea-11ef-2939-a74ae60120f5
# ╠═44e8679f-0904-424b-9d03-1fb4d758b82e
# ╠═1c11aa62-adc9-4974-bd5b-1f511663353c
# ╠═1300606e-90d3-4cbe-ac68-071ba7442f79
# ╠═6a537f8b-c7ea-4526-821c-7c13bcfd3167
# ╠═09eb9fec-56b7-45e0-b724-f958814ebbee
# ╠═578c634d-5deb-4de8-990b-607e27706319
# ╠═94392ae7-1244-46d6-81d1-f5d2d4890a67
# ╠═805c3022-4afc-49a9-b83c-0a122605b13b
# ╠═9523c4a8-6ddd-48eb-8e1a-e71f25b4335d
# ╠═5534fbe8-bf84-4acb-a810-e016746b2fbe
# ╠═d1bb3150-0e91-4300-8d5d-874406d078e9
# ╠═13cc8484-feec-47fc-97b4-22dd0081120f
# ╠═fdc6a7ab-c2c9-4eb1-b59a-4471ae671e82
# ╠═a16eeff4-896c-4e6b-abef-3cc2bb93bcd3
# ╠═c705cafa-1d63-4d09-96e5-866dd51bf543
# ╠═1eb03400-6759-4a91-96cb-489ffba97600
# ╠═1309bb2b-9891-45b2-ab3b-f8f43facca32
# ╠═aff05d93-251f-4633-9fd4-ce9def5cc7d6
# ╠═c1cf34e7-c55e-42d6-88af-183cda28c54e
# ╠═3c28adf6-c2ae-4718-8f51-72a500f2519c
# ╠═b0ff6127-6ae8-4634-ab7d-60b0cba2f842
