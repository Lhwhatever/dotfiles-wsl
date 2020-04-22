# Math Snippets
This document describes snippets targeted for mathematical use.

Most of the snippets here have `context "math()"`, i.e. they can only be activated in a mathematical environment. The exceptions are of course those that create mathematical environments.

[[toc]]

## Mathematical Environments
The following snippets create mathematical environments. Of course, this means **they can be activated outside of math mode**. They must be at the start of the line.

* `alin<tab>` and `ali*<tab>` - `align` and `align*` respectively.
* `eqnn<tab>` and `eqn*<tab>` - `equation` and `equation*` respectively.

There is also one snippet to create a simple display mode math environment.
* `\[` - creates the matching `\]` **automatically**.

## Text
The following snippets place text in mathematical environments.
* `txt` becomes `\text{...}`
* `Let` at the start of the line becomes `\text{Let } ` (note the spaces).
* `intt` at the start of the line becomes `\intertext{...}`.

## Brackets
The following snippets help with usage of brackets (i.e. parentheses, square brackets, braces, pipe brackets and angle brackets).

* `(...)lr` - expands to `\left(...\right)`
* `[...]lr` - expands to `\left[...\right]`
* `\{...\}lr` - expands to `\left\{...\right\}`
* `abs` - expands to `\left|\right|`
* `LL<opening> ... [MM<middle>] ... RR<closing>` - expands to `\left<opening> ... \middle<middle> ... \right<closing>`
    * Valid options for `<opening>` are `(`, `[`, `\{`, `|`, `<` (changed to `\langle`) and `.`
    * Valid options for `<closing>` are `)`, `[`, `\}`, `|`, `>` (changed to `\rangle`) and `.`
    * `<middle>` is not validated, but it is suggested for `|` or `/`.

## Greek letters
Greek letters can be entered in three letters or less using the following snippets:

Snippet | Alias   | Letter     | Snippet | Aliases | Letter
--------|---------|------------|---------|---------|-----------
`alf`   | `alph`  | $\alpha$   | `nu`    |         | $\nu$
`bta`   | `beta`  | $\beta$    | `xi`    |         | $\xi$
`gmm`   | `gamm`  | $\gamma$   | `omi`   |         | $\omicron$
`dlt`   | `delt`  | $\delta$   | `pi`    |         | $\pi$
`eps`   |         | $\epsilon$ | `rho`   |         | $\rho$
`zta`   | `zeta`  | $\zeta$    | `sigm`  |         | $\sigma$
`eta`   |         | $\eta$     | `tau`   |         | $\tau$
`tht`   | `thet`  | $\theta$   | `ups`   |         | $\upsilon$
`iot`   |         | $\iota$    | `phi`   |         | $\phi$
`kpp`   | `kapp`  | $\kappa$   | `chi`   |         | $\chi$
`lmb`   | `lamb`  | $\lambda$  | `psi`   |         | $\psi$
`mu`    |         | $\mu$      | `omg`   | `omeg`  | $\omega$

The capital letter variants can be made by capitalizing the first character.

The *var*-iants of the following letters can also be made:

Snippet | Alias           | Letter
--------|-----------------|--------------
`vep`   | `vare`          | $\varepsilon$
`vth`   | `varth`         | $\vartheta$
`vkp`   | `vark`          | $\varkappa$
`vrh`   | `varr`          | $\varrho$
`vsg`   | `vars`          | $\varsigma$
`vph`   | `varph`, `varf` | $\varphi$

## Subscripts and Superscripts
Immediately after `^` or `_`, entering 2 consecutive characters (either alphanumeric or `.`) or `-` followed by such a character will immediately surround the characters with braces.
* `e^2i` becomes `e^{2i}`
* `x_-5` becomes `x_{-5}`

` inv` can also be used as a shortcut for `^{-1}`. I.e. entering `x inv` will become `x^{-1}`; `\sin inv` will become `\sin^{-1}`.

## Fractions
The following snippets help to create fractions in the form $\frac{a}{b}$.

* `//` expands to `\frac{}{}`
* `<a>//` expands to `\frac{<a>}{}`.
    * `<a>` can be a number, Latin alphabet, or command, optionally with subscript/superscript.
* `(...)//` expands to `\frac{...}{}`

## Radicals and Surds
The following snippets help to create radicals in LaTeX.

* `root` expands to `\sqrt[...]{...}`
* `sqrt` expands to `\sqrt{...}`

## Binary Operators
The following snippets help to create binary operators (operators with arity two, not operators on binary numbers).

Snippet     | Symbol
------------|--------
`.<tab>`    | $\cdot$ 
`*<tab>`    | $\times$
`union`     | $\cup$
`xsect`     | $\cap$
`=>`        | $\implies$
`<=>`       | $\iff$
`to` or `->`| $\to$
`in`        | $\in$
`~`         | $\sim$

## Large Operators
The following snippets help to create large operators.

Snippet     | Symbol
------------|--------
`lim`       | $\lim$
`sum`       | $\sum$
`prod`      | $\prod$
`unn`       | $\bigcup$
`xsc`       | $\bigcap$

The above operators (except limit of course) can also be written in the following format:

* `sum ... fr` becomes $\sum_{... = ...}^{...} ...$
* `prod ... for` becomes $\prod_{... \in ...} ...$

## Differential Calculus
The following snippets make use of the `\dif` and `\deriv` commands provided in the `mathtemp` snippet:

* `d<...>` where `<...>` is alphabetical or a LaTeX command produces `\dif <...>`
* `d/d` produces `\deriv{}{...}`
* `d<n>/d` where `n` is an integer produces `\deriv[n]{}{...}`
* `d[n]<y>/d<x>` where `n` is an integer, and `x` and `y` are alphabetical or LaTeX commands produces `\deriv[n]{y}{x}`

## Integral Calculus
The following snippets produce integrals:

* **Antiderivatives** (e.g $\int x^2 \ \mathrm{d}x$)
    * `antid` becomes `\int ... \dif ...`
    * `anti2d` becomes `\iint ... \dif ...`
    * `anti3d` becomes `\iiint ... \dif ...`
* **Definite integrals with limits** (e.g. $\int_a^b x^2 \ \mathrm{d}x$)
    * `intl` becomes `\int_a^b ... \dif ...`
    * `int2l` becomes `\iint_a^b ... \dif ...`
    * `int3l` becomes `\iiint_a^b ... \dif ...`
* **Integrals over domains** (e.g. $\int_S x^2 \ \mathrm{d}x$)
    * `intd` becomes `\int_S ... \dif ...`
    * `int2d` becomes `\iint_S ... \dif ...`
    * `int3d` becomes `\iiint_S ... \dif ...`
* **Closed integrals** (e.g. $\oint_S x \ \mathrm{d}l$)
    * `into` becomes `\oint_S ... \dif ...`
    * `int2o` becomes `\oiint_S ... \dif ...`

## Ellipses
The following snippets create the corresponding ellipses commands based on the preceding operator.

* After `\cdot`: `\dotsm`, deleting the `\cdot` (as in $a_1 \cdot a_2 \cdot a_3 \dotsm$)
* After other binary operators: `\dotsb` (as in $a_1 + a_2 - a_3 + \dotsb$)
