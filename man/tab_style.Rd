% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tab_create_modify.R
\name{tab_style}
\alias{tab_style}
\title{Add custom styles to one or more cells}
\usage{
tab_style(data, style, locations)
}
\arguments{
\item{data}{\emph{The gt table data object}

\verb{obj:<gt_tbl>} // \strong{required}

This is the \strong{gt} table object that is commonly created through use of the
\code{\link[=gt]{gt()}} function.}

\item{style}{\emph{Style declarations}

\verb{<style expressions>} // \strong{required}

The styles to use for the cells at the targeted \code{locations}. The
\code{\link[=cell_text]{cell_text()}}, \code{\link[=cell_fill]{cell_fill()}}, and \code{\link[=cell_borders]{cell_borders()}} helper functions can be
used here to more easily generate valid styles. If using more than one
helper function to define styles, all calls must be enclosed in a \code{\link[=list]{list()}}.
Custom CSS declarations can be used for HTML output by including a
\code{\link[=css]{css()}}-based statement as a list item.}

\item{locations}{\emph{Locations to target}

\verb{<locations expressions>} // \strong{required}

The cell or set of cells to be associated with the style. Supplying any of
the \verb{cells_*()} helper functions is a useful way to target the location
cells that are associated with the styling. These helper functions are:
\code{\link[=cells_title]{cells_title()}}, \code{\link[=cells_stubhead]{cells_stubhead()}}, \code{\link[=cells_column_spanners]{cells_column_spanners()}},
\code{\link[=cells_column_labels]{cells_column_labels()}}, \code{\link[=cells_row_groups]{cells_row_groups()}}, \code{\link[=cells_stub]{cells_stub()}},
\code{\link[=cells_body]{cells_body()}}, \code{\link[=cells_summary]{cells_summary()}}, \code{\link[=cells_grand_summary]{cells_grand_summary()}},
\code{\link[=cells_stub_summary]{cells_stub_summary()}}, \code{\link[=cells_stub_grand_summary]{cells_stub_grand_summary()}}, \code{\link[=cells_footnotes]{cells_footnotes()}},
and \code{\link[=cells_source_notes]{cells_source_notes()}}. Additionally, we can enclose several
\verb{cells_*()} calls within a \code{list()} if we wish to apply styling to
different types of locations (e.g., body cells, row group labels, the table
title, etc.).}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
With the \code{tab_style()} function we can target specific cells and apply styles
to them. This is best done in conjunction with the helper functions
\code{\link[=cell_text]{cell_text()}}, \code{\link[=cell_fill]{cell_fill()}}, and \code{\link[=cell_borders]{cell_borders()}}. At present this function
is focused on the application of styles for HTML output only (as such, other
output formats will ignore all \code{tab_style()} calls). Using the aforementioned
helper functions, here are some of the styles we can apply:
\itemize{
\item the background color of the cell (\code{\link[=cell_fill]{cell_fill()}}: \code{color})
\item the cell's text color, font, and size (\code{\link[=cell_text]{cell_text()}}: \code{color}, \code{font},
\code{size})
\item the text style (\code{\link[=cell_text]{cell_text()}}: \code{style}), enabling the use of italics or
oblique text.
\item the text weight (\code{\link[=cell_text]{cell_text()}}: \code{weight}), allowing the use of thin to
bold text (the degree of choice is greater with variable fonts)
\item the alignment and indentation of text (\code{\link[=cell_text]{cell_text()}}: \code{align} and
\code{indent})
\item the cell borders (\code{\link[=cell_borders]{cell_borders()}})
}
}
\section{Examples}{


Let's use the \code{\link{exibble}} dataset to create a simple, two-column \strong{gt} table
(keeping only the \code{num} and \code{currency} columns). With the \code{\link[=tab_style]{tab_style()}}
function (called twice), we'll selectively add style to the values formatted
by \code{\link[=fmt_number]{fmt_number()}}. In the \code{style} argument of each \code{tab_style()} call, we
can define multiple types of styling with the \code{\link[=cell_fill]{cell_fill()}} and \code{\link[=cell_text]{cell_text()}}
helper functions (enclosed in a list). The cells to be targeted for styling
require the use of helper functions like \code{\link[=cells_body]{cells_body()}}, which is used here
with different columns and rows being targeted.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{exibble |>
  dplyr::select(num, currency) |>
  gt() |>
  fmt_number(decimals = 1) |>
  tab_style(
    style = list(
      cell_fill(color = "lightcyan"),
      cell_text(weight = "bold")
      ),
    locations = cells_body(
      columns = num,
      rows = num >= 5000
    )
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "#F9E3D6"),
      cell_text(style = "italic")
      ),
    locations = cells_body(
      columns = currency,
      rows = currency < 100
    )
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_1.png" alt="This image of a table was generated from the first code example in the `tab_style()` help file." style="width:100\%;">
}}

With a subset of the \code{\link{sp500}} dataset, we'll create a different \strong{gt}
table. Here, we'll color the background of entire rows of body cells and do
so on the basis of value expressions involving the \code{open} and \code{close}
columns.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{sp500 |>
  dplyr::filter(
    date >= "2015-12-01" &
    date <= "2015-12-15"
  ) |>
  dplyr::select(-c(adj_close, volume)) |>
  gt() |>
  tab_style(
    style = cell_fill(color = "lightgreen"),
    locations = cells_body(rows = close > open)
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "red"),
      cell_text(color = "white")
      ),
    locations = cells_body(rows = open > close)
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_2.png" alt="This image of a table was generated from the second code example in the `tab_style()` help file." style="width:100\%;">
}}

With another two-column table based on the \code{\link{exibble}} dataset, let's create
a \strong{gt} table. First, we'll replace missing values with the \code{\link[=sub_missing]{sub_missing()}}
function. Next, we'll add styling to the \code{char} column. This styling will be
HTML-specific and it will involve (all within a list): (1) a \code{\link[=cell_fill]{cell_fill()}}
call (to set a \code{"lightcyan"} background), and (2) a string containing a CSS
style declaration (\code{"font-variant: small-caps;"}).

\if{html}{\out{<div class="sourceCode r">}}\preformatted{exibble |>
  dplyr::select(char, fctr) |>
  gt() |>
  sub_missing() |>
  tab_style(
    style = list(
      cell_fill(color = "lightcyan"),
      "font-variant: small-caps;"
    ),
    locations = cells_body(columns = char)
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_3.png" alt="This image of a table was generated from the third code example in the `tab_style()` help file." style="width:100\%;">
}}

In the following table based on the \code{\link{towny}} dataset, we'll use a larger
number of \code{tab_style()} calls with the aim of styling each location available
in the table. Over six separate uses of \code{tab_style()}, different body cells
are styled with background colors, the header and the footer also receive
background color fills, borders are applied to a column of body cells and
also to the column labels, and, the row labels in the stub receive a custom
text treatment.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{towny |>
  dplyr::filter(csd_type == "city") |>
  dplyr::arrange(desc(population_2021)) |>
  dplyr::select(
    name, land_area_km2, density_2016, density_2021,
    population_2016, population_2021
  ) |>
  dplyr::slice_head(n = 5) |>
  gt(rowname_col = "name") |>
  tab_header(
    title = md(paste("Largest Five", fontawesome::fa("city") , "in `towny`")),
    subtitle = "Changes in vital numbers from 2016 to 2021."
  ) |>
  fmt_number(
    columns = starts_with("population"),
    n_sigfig = 3,
    suffixing = TRUE
  ) |>
  fmt_integer(columns = starts_with("density")) |>
  fmt_number(columns = land_area_km2, decimals = 1) |>
  cols_merge(
    columns = starts_with("density"),
    pattern = paste("\{1\}", fontawesome::fa("arrow-right"), "\{2\}")
  ) |>
  cols_merge(
    columns = starts_with("population"),
    pattern = paste("\{1\}", fontawesome::fa("arrow-right"), "\{2\}")
  ) |>
  cols_label(
    land_area_km2 = md("Area, km^2^"),
    starts_with("density") ~ md("Density, ppl/km^2^"),
    starts_with("population") ~ "Population"
  ) |>
  cols_align(align = "center", columns = -name) |>
  cols_width(
    stub() ~ px(125),
    everything() ~ px(150)
  ) |>
  tab_footnote(
    footnote = "Data was used from their respective census-year publications.",
    locations = cells_title(groups = "subtitle")
  ) |>
  tab_source_note(source_note = md(
    "All figures are compiled in the `towny` dataset (in the **gt** package)."
  )) |>
  opt_footnote_marks(marks = "letters") |>
  tab_style(
    style = list(
      cell_fill(color = "gray95"),
      cell_borders(sides = c("l", "r"), color = "gray50", weight = px(3))
    ),
    locations = cells_body(columns = land_area_km2)
  ) |>
  tab_style(
    style = cell_fill(color = "lightblue" |> adjust_luminance(steps = 2)),
    locations = cells_body(columns = -land_area_km2)
  ) |>
  tab_style(
    style = list(cell_fill(color = "gray35"), cell_text(color = "white")),
    locations = list(cells_footnotes(), cells_source_notes())
  ) |>
  tab_style(
    style = cell_fill(color = "gray98"),
    locations = cells_title()
  ) |>
  tab_style(
    style = cell_text(
      size = "smaller",
      weight = "bold",
      transform = "uppercase"
    ),
    locations = cells_stub()
  ) |>
  tab_style(
    style = cell_borders(
      sides = c("t", "b"),
      color = "powderblue",
      weight = px(3)
    ),
    locations = list(cells_column_labels(), cells_stubhead())
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_4.png" alt="This image of a table was generated from the fourth code example in the `tab_style()` help file." style="width:100\%;">
}}
}

\section{Function ID}{

2-10
}

\section{Function Introduced}{

\code{v0.2.0.5} (March 31, 2020)
}

\seealso{
\code{\link[=cell_text]{cell_text()}}, \code{\link[=cell_fill]{cell_fill()}}, and \code{\link[=cell_borders]{cell_borders()}} as helpers for
defining custom styles and \code{\link[=cells_body]{cells_body()}} as one of many useful helper
functions for targeting the locations to be styled.

Other part creation/modification functions: 
\code{\link{tab_caption}()},
\code{\link{tab_footnote}()},
\code{\link{tab_header}()},
\code{\link{tab_info}()},
\code{\link{tab_options}()},
\code{\link{tab_row_group}()},
\code{\link{tab_source_note}()},
\code{\link{tab_spanner_delim}()},
\code{\link{tab_spanner}()},
\code{\link{tab_stub_indent}()},
\code{\link{tab_stubhead}()},
\code{\link{tab_style_body}()}
}
\concept{part creation/modification functions}
