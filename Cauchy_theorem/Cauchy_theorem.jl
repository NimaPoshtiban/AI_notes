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

$$\large f(\mathcal{z})\,=\,\frac{1}{2\pi i} \oint_{\mathcal{C}}{\dfrac{f(\zeta)}{\zeta\,-\mathcal{z}}d\varsigma}$$
"""

# ╔═╡ 7b4891f0-b9de-4c20-bd84-14fa870df02b
md"""
# Cauchy integral formula for the *nth* derivative of $f(z)$


$\large f^{(n)}(\mathcal{z})\,=\,\frac{n!}{2\pi i}\oint_{\mathcal{C}}{\dfrac{f(\zeta)}{(\zeta\,-\mathcal{z})^{n+1}}d\zeta}$
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

$$\Large \implies f(z)\,=\,\sum_{n=0}^{\infty}{\left(\frac{1}{2\pi i}\oint_{\mathcal{C}}{\dfrac{f(\zeta)}{(\zeta-z_{0})^{n+1}}d\zeta}\right)\cdot(z-z_{0})^{n}}$$
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

# ╔═╡ 901084be-66c3-4886-a1d3-52a672c41c5b
md"""
## Liouville's theorem

- if $f$ is **entire** and **bounded** then the $f$ is constant:

$$\left|f^{'}(z_0)\right|\,\le \frac{B}{R} \text{where}\,\, B\,\,\text{is bounded},\,\,R>0\,\,\text{letting}\,\,R\to\infty$$

Every **non-constant** polynominal $P(z)\,=\,a_{n}z^{n}+\cdots+a_{0}\,$ with complex coefficient has a **root** in $\mathbb{C}$

Every polynominal $P(z)\,=\,a_{n}z^{n}+\cdots+a_{0}\,$ of degree $n\ge1$ has precisely $n$ roots in $\mathbb{C}\,$ if the roots denoted by $w_{1},\cdots w_{n}$ then $P$ can be factored as:


$$P(z)\,=\,c(z-w_{1})(z-w_{2})\cdots (z-w_{n})\,\, \text{for some}\, c \in \mathbb{C},\,\,c=a_{n}$$

"""

# ╔═╡ 5f275013-d215-4669-9890-042132a6a7be
md"""
### Extra notes

If $f$ is **holomorphic** in a **region** $\Omega$ that vanishes on a sequence of distinct points with a limit point in $\Omega\,$ $\implies f$ is identically 0

given two holomorphic functions $f,g$ in a region $\Omega$ and $f(z)\,=\,g(z)$ for all $z$ in **some non-empty** subset of $\,\Omega\,\implies$  $f(z)=g(z)$

suppose given two functions $f$ and $F$ analytic in region $\,\Omega\,$ and $\,\Omega^{\prime}\,$ with $\,\Omega\,\subset\Omega^{\prime}\,\,$ if $f$ and $F$ agree on the smaller set $\Omega\,$,then $F$ is analytic continuation of $f$ into the region $\Omega^{\prime}$.

Then there can be **only one** such analytic continuation since $F$ is **uniquely determined** by $f$
"""

# ╔═╡ a7225e73-e0af-4a6f-ace9-62dd023e8ea9
md"""
## Morera's Theorem:

If $f$ is a continuous complex function on an open set $\Omega$ in the complex plane, and if for every closed curve $T$ in  $\Omega\,$ then 

$$\oint_{T}{f_{n}(z)\,dz\,=\,0}$$

If $\left\{f_{n}\right\}_{n=1}^{\infty}$ is a sequence of **holomorphic** functions that converges uniformely to a function $f$ in every compact subset of $\Omega$ then $f$ is **holomorphic** in $\Omega$

$$\oint_{T}{f_{n}(z)\,dz\,=\,0}\quad\text{for all}\,\,n \implies \oint_{T}{f(z)\,dz}$$
"""

# ╔═╡ b5f89a08-1be4-4bb6-910e-e3130755fa76
md"""
### Extra notes

given $\delta>0$, let $\Omega_{\delta}$ denote the subset of $\Omega$ defined by:

$$\Omega_{\delta}\,=\left\{\,z\in\Omega\,\,:\,\,\overline{D_{\delta}}(z) \subset \Omega\right\}$$

$$\implies \large{\underset{z \in \Omega}{sup}} \left|F^{\prime}(z)\right|\le \frac{1}{\delta}\,\large{\underset{\zeta \in \Omega}{sup}} \left|F(\zeta)\right|$$

whenever $F$ is holomorphic in $\,\Omega\,$ then $\,F=f_{n}-f$ 

This info helps to construct holomorphic functions as a series:

$$F(z)\,=\sum_{n=1}^{\infty}{f_{n}(z)}$$
"""

# ╔═╡ 128d94f2-7b23-4df3-bdba-d03bdba8fcee
md"""
## Holomorphic functions defined in terms of integrals

$$f(z)\,=\int_{b}^{a}{F(z,s)ds}$$

where $F$ is **holomorphic** in the **first argument $z$** and is **continues in the second argument $s$** 
"""

# ╔═╡ a31c02e7-80f0-4259-9523-ad690ebc65ba
md"""
## Symmetry principle

if $I$ denotes the interior part of the boundry $\Omega^{+}\,$and$\,\Omega^{-}$ then

$$\Omega^{+}\,\cup\,I\,\cup\,\Omega^{-}\,=\Omega$$

if $f^{+}$ and $f^{-}$ are holomorphic functions in $\Omega^{+}$ and $\Omega^{-}$ respectively that extend continuously to $I$ and

$$f^{+}(x)\,=f^{-}(x)\quad\text{for all}\,\, x\in I$$


 $f$ is defined on $\Omega$ by:

$$f(z)\,=\,\left\{ \begin{array}{cl}f^{+}(z)&: z \in \Omega^{+} \\
f^{+}(z)=f^{-}(z)&:\,\,z\in I \\ 
f^{-}(z)&: z\in\Omega^{-}\end{array}\right.$$

Then $f$ is holomorphic on all of the $\Omega$
"""

# ╔═╡ 0886ac8f-e962-4abf-bbd7-fcfa06251b98
md"""
## Shwartz reflection principle

if $f$ is a **holomorphic** function in $\Omega^{+}$ that extends continuously to $I$ such that $f$ is real-valued on $I\,\,$, then there exists a function $F$ **holomorphic** in all of $\Omega$ such that $F\,f\,$ on $\Omega^{+}$

$$F(z)=\sum \overline{a_{n}}(z-z_{0})^{n},\,\,\,\,\overline{f(x)}=f(x)\,\,\text{whenever}\,\, x\in I$$
"""

# ╔═╡ 713592b8-2081-4d1d-bddf-c2d005a91327
md"""
### Extra notes

**singularity** : points where the function is not holomorphic and are "poles"

any function holomorphic in a neighborhood of compact set $K$ can be approximated uniformly on $K$ by rational functions whose **singularities** are in $K^{c}$

If $K^{c}$ is connected, any function holomorphic on a neighborhood of $K$ can be approximated uniformely on $K$ by polynominals.

Suppose $f$ is holomorphic on $\Omega$ and $K\subset \Omega$ is compact, then there exists finitely many segments $\gamma_{1}\cdots\gamma_{n}\,$ in $\Omega-K$ such that

$$f(z)=\sum_{n=1}^{N}{\frac{1}{2\pi i}} \oint_{\gamma_{n}}{\frac{f(\zeta)}{\zeta-z}d\zeta}\quad\text{for all}\,\,z\in K$$

for any line segment $\gamma$ entirely contained in $\Omega-K\,$, there exists a sequence of rational functions with singularities on $\gamma$ that approximate the integral $\oint_{\gamma}{\frac{f(\zeta)}{(\zeta-z)}d\zeta}$ uniformly on $K$, if $K^{c}$ is connected and $z_{0}\not\in K$ then the function

$$\dfrac{1}{z-z_{0}}$$

can be approximated uniformly on $K$ by polynominals


"""

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
# ╠═901084be-66c3-4886-a1d3-52a672c41c5b
# ╠═5f275013-d215-4669-9890-042132a6a7be
# ╠═a7225e73-e0af-4a6f-ace9-62dd023e8ea9
# ╠═b5f89a08-1be4-4bb6-910e-e3130755fa76
# ╠═128d94f2-7b23-4df3-bdba-d03bdba8fcee
# ╠═a31c02e7-80f0-4259-9523-ad690ebc65ba
# ╠═0886ac8f-e962-4abf-bbd7-fcfa06251b98
# ╠═713592b8-2081-4d1d-bddf-c2d005a91327
