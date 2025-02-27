% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{pct}
\alias{pct}
\title{Helper for providing a numeric value as percentage}
\usage{
pct(x)
}
\arguments{
\item{x}{\emph{Numeric value in percent}

\verb{scalar<numeric|integer>} // \strong{required}

The numeric value to format as a string percentage for some \code{\link[=tab_options]{tab_options()}}
arguments that can take percentage values (e.g., \code{table.width}).}
}
\value{
A character vector with a single value in percentage units.
}
\description{
A percentage value acts as a length value that is relative to an initial
state. For instance an 80 percent value for something will size the target
to 80 percent the size of its 'previous' value. This type of sizing is
useful for sizing up or down a length value with an intuitive measure. This
helper function can be used for the setting of font sizes (e.g., in
\code{\link[=cell_text]{cell_text()}}) and altering the thicknesses of lines (e.g., in
\code{\link[=cell_borders]{cell_borders()}}). Should a more exact definition of size be required, the
analogous helper function \code{\link[=pct]{pct()}} will be more useful.
}
\section{Examples}{


Use the \code{\link{exibble}} dataset to create a \strong{gt} table. Inside of the
\code{\link[=cell_text]{cell_text()}} call (which is itself inside of \code{\link[=tab_style]{tab_style()}}), we'll use the
\code{pct()} helper function to define the font size for the column labels as a
percentage value.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{exibble |>
  gt() |>
  tab_style(
    style = cell_text(size = pct(75)),
    locations = cells_column_labels()
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_pct_1.png" alt="This image of a table was generated from the first code example in the `pct()` help file." style="width:100\%;">
}}
}

\section{Function ID}{

8-4
}

\section{Function Introduced}{

\code{v0.2.0.5} (March 31, 2020)
}

\seealso{
Other helper functions: 
\code{\link{adjust_luminance}()},
\code{\link{cell_borders}()},
\code{\link{cell_fill}()},
\code{\link{cell_text}()},
\code{\link{cells_body}()},
\code{\link{cells_column_labels}()},
\code{\link{cells_column_spanners}()},
\code{\link{cells_footnotes}()},
\code{\link{cells_grand_summary}()},
\code{\link{cells_row_groups}()},
\code{\link{cells_source_notes}()},
\code{\link{cells_stub_grand_summary}()},
\code{\link{cells_stub_summary}()},
\code{\link{cells_stubhead}()},
\code{\link{cells_stub}()},
\code{\link{cells_summary}()},
\code{\link{cells_title}()},
\code{\link{currency}()},
\code{\link{default_fonts}()},
\code{\link{define_units}()},
\code{\link{escape_latex}()},
\code{\link{google_font}()},
\code{\link{gt_latex_dependencies}()},
\code{\link{html}()},
\code{\link{md}()},
\code{\link{px}()},
\code{\link{random_id}()},
\code{\link{stub}()},
\code{\link{system_fonts}()}
}
\concept{helper functions}
