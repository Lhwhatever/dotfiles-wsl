# .tex File Snippets

This folder contains various snippets for `.tex` files.

The snippets are organized as follows:

* Basic snippets (`basic.snippets`) - contains snippets common for most use cases. See the rest of this document.
* Math sippets (`math*.snippets`) - contains snippets for mathematical use. See [math.md](math.md).

## Basic Snippets
The basic snippets comprises templates and helpers for various environment and LaTeX commands.

### Templates
Templating is first achieved by using the basic template `template<tab>`. 'Addons' can be included in the final tab stop in the preamble. The currently available addons include:

* Math (`mathtemp<tab>`) - includes helpful commands for various formatting options for mathematical objects.

### Environment
You can quickly create an environment using any of the following snippets:

* `descr` - `description` (comes with one `\item[...] ...`)
* `itmi` - `itemize` (comes with one `\item ...`)
* `enum` - `enumerate` (comes with one `\item ...`)

### Command Helpers
The currently available command helpers are:

* **Heading family**
    * `h0<tab>` - `\chapter`
    * `h1<tab>` - `\section` 
    * `h2<tab>` - `\subsection`
    * `h3<tab>` - `\subsubsection`

    The starred versions of these commands can also be made by including `*` before the `<tab>`.

* Ellipses after commas will be automatically converted to `\dotsc`.
