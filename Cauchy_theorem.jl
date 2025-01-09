### A Pluto.jl notebook ###
# v0.20.3

#> [frontmatter]
#> title = "Cauchy Theorem"
#> date = "2025-01-09"
#> tags = ["Complex", "analysis", "cauchy", "julia"]
#> description = "Complex Analysic notes"
#> 
#>     [[frontmatter.author]]
#>     name = "Nima Poshitban"

using Markdown
using InteractiveUtils

# ╔═╡ f080efa9-e2ca-453b-a2c8-a2980def70a2
begin
	using PlutoExtras
    import Pkg
    # careful: this is _not_ a reproducible environment
    # activate the global environment
    Pkg.activate()
    import GLMakie
	using LaTeXStrings
end

# ╔═╡ 6ceda520-2bda-45de-bac9-fa7b0c2b2f44
initialize_eqref()

# ╔═╡ 02abf497-5eff-4034-8efb-320cfab3f0f8
md"""
# Cauchy Theorem
"""

# ╔═╡ fce5e360-ce73-11ef-050d-9519dcd2504f
md"""
## Cauchy Integral Formulas

**C** is a toy contour

**Toy contour**: any closed curve where the notion of the interior is obvious

$$\large f(\mathcal{z})\,=\,\frac{1}{2\pi i} \oint_{\mathcal{C}}{\dfrac{f(\varsigma)}{\varsigma\,-\mathcal{z}}d\varsigma}$$
"""

# ╔═╡ 7b4891f0-b9de-4c20-bd84-14fa870df02b
md"""
# Cauchy integral formula for the *nth* derivative of $f(z)$


$\large f^{(n)}(\mathcal{z})\,=\,\frac{n!}{2\pi i}\oint_{\mathcal{C}}{\dfrac{f(\varsigma)}{(\varsigma\,-\mathcal{z})^{n+1}}d\varsigma}$
for all $z\,$ in the interior of $C$
"""

# ╔═╡ e7615219-2f07-4562-97c8-eb6dad6c0af0
md"""
## Poisson Integral
$\large u(r,\theta)\,=\frac{1}{2\pi}\int_{0}^{2\pi}{P_{r}(\theta-\varphi)u(1,\varphi)d\varphi}$
"""

# ╔═╡ 2f269727-8bfc-409b-bbec-ff123763923f
md"""
## Cauchy inequalities
$f\longrightarrow holomorphic$ in an open set $\Omega$ 


disk $D$ centered at $z_{0}$ and has a radius of $R$

then: 

$\left|f^{(n)}(z_{0}) \right| \, \le \, \dfrac{n!\left\|f\right\|_{\mathcal{C}}}{R^{n}}$

where $\left\|f\right|_{\mathcal{C}}\,=\,\underset{z\in \mathcal{C}}{sup}|f(\mathcal{z})|$ denotes the supremum of $|f|$ on the boundary cirlce $\mathcal{C}$
"""

# ╔═╡ 8e8ea96d-7ec1-497d-bd04-c98a42328df7
md"""
## Power Series Expansion

if $f \longrightarrow holomorphic$ in an open set $\Omega$

and disk $D$ centered at $z_{0}$ where closure is contained in $\Omega$

$\implies f\quad$ has a power series expansion at $z_{0}$

$f(\mathcal{z})\,=\,\sum_{n=0}^{\infty}{a_{n}(z-z_{0})^{n}}$ for all $\mathcal{z} \in D$

and the **coefficients** are given by:

$\large a_{n}\,=\,\dfrac{f^{(n)}(z_{0})}{n!}$

$$\Large \implies f(z)\,=\,\sum_{n=0}^{\infty}{\left(\frac{1}{2\pi i}\oint_{\mathcal{C}}{\dfrac{f(\varsigma)}{(\varsigma-z_{0})^{n+1}}d\varsigma}\right)\cdot(z-z_{0})^{n}}$$
"""

# ╔═╡ 6d49c912-01bb-47dc-83cf-f4cc5ceef2ee
md"""

**Example of Cauchy Integral**

"""

# ╔═╡ 3409248d-a2dc-4feb-bdff-821d5c345e40
C = range(0,2π,360)

# ╔═╡ 1fd7fe59-2958-4b41-92a3-3a3eb24fa822
fvarsigma = t -> exp(1).^(im.*t)

# ╔═╡ c4de20d6-207a-4077-9823-b067f08561a0
# Evaluate the contour
contour = fvarsigma.(C)

# ╔═╡ df513847-1a44-4c4b-a2f3-8c20f84c48cf
begin
f = GLMakie.Figure()

ax = GLMakie.Axis(f[1, 1], xlabel = "Re(z)", ylabel = "Im(z)", title = L""" e^{z}\quad \text{is entire}""")

GLMakie.lines!(ax,C,imag(contour), color=:red,label=L"""Im(e^{z})""")
GLMakie.lines!(ax,C,real(contour),color=:blue,label=L"""Re(e^{z})""")
GLMakie.lines!(ax, real(contour), imag(contour), zeros(length(C)), color=:green, label="A Toy Contour", linewidth=4)
GLMakie.axislegend(ax)
end

# ╔═╡ 87109724-d864-4a0a-b45f-f2f553d7c60e
f

# ╔═╡ Cell order:
# ╠═f080efa9-e2ca-453b-a2c8-a2980def70a2
# ╠═6ceda520-2bda-45de-bac9-fa7b0c2b2f44
# ╠═02abf497-5eff-4034-8efb-320cfab3f0f8
# ╠═fce5e360-ce73-11ef-050d-9519dcd2504f
# ╠═7b4891f0-b9de-4c20-bd84-14fa870df02b
# ╠═e7615219-2f07-4562-97c8-eb6dad6c0af0
# ╠═2f269727-8bfc-409b-bbec-ff123763923f
# ╠═8e8ea96d-7ec1-497d-bd04-c98a42328df7
# ╠═6d49c912-01bb-47dc-83cf-f4cc5ceef2ee
# ╠═3409248d-a2dc-4feb-bdff-821d5c345e40
# ╠═1fd7fe59-2958-4b41-92a3-3a3eb24fa822
# ╠═c4de20d6-207a-4077-9823-b067f08561a0
# ╠═df513847-1a44-4c4b-a2f3-8c20f84c48cf
# ╠═87109724-d864-4a0a-b45f-f2f553d7c60e
