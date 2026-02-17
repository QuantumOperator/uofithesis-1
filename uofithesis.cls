\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uofithesis}[2026/02/11 v0.6 University of Illinois Thesis Class]

\LoadClass[letterpaper,12pt,oneside]{article}
\renewcommand{\thesection}{\arabic{section}}

\RequirePackage[english]{babel}
\RequirePackage{geometry}
\RequirePackage{lmodern}
\RequirePackage{setspace}
% sectsty is partially compatible with tagging, don't use \sectionrule
\RequirePackage{sectsty}

% pgfplots configuration for accessible color schemes
\RequirePackage{etoolbox}
\AtEndPreamble{
  \@ifpackageloaded{pgfplots}{
    \usepgfplotslibrary{colorbrewer}
    % Qualitative color scheme from https://colorbrewer2.org/
    % Color-blind friendly, adjusted for WCAG AA contrast
    \definecolor{aa-teal}{HTML}{168362}
    \definecolor{aa-orange}{HTML}{C05402}
    \definecolor{aa-blue}{HTML}{716CB2}
    \definecolor{aa-pink}{HTML}{e7298a}
    
    \pgfplotscreateplotcyclelist{StrictAA}{
        {aa-teal, fill=aa-teal, draw=black},
        {aa-orange, fill=aa-orange, draw=black},
        {aa-blue, fill=aa-blue, draw=black},
        {aa-pink, fill=aa-pink, draw=black}
    }
  }{}
}

% Styles

\newgeometry{margin=1in}
\allsectionsfont{\normalfont\bfseries\fontsize{12pt}{14.4pt}\selectfont\centering}
\AddToHook{cmd/section/before}{\clearpage}

\renewcommand{\thesection}{Chapter \arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand*{\l@section}{\@dottedtocline{1}{1.5em}{5em}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{6.5em}{2.5em}}


% Options for the title page
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\concentration}[1]{\def\@concentration{#1}}
\newcommand{\minor}[1]{\def\@minor{#1}}
\newcommand{\degreeyear}[1]{\def\@degreeyear{#1}}
\newcommand{\committee}[1]{\def\@committee{#1}}

\newif\ifdissertation
\dissertationtrue % Default to dissertation
\DeclareOption{thesis}{\dissertationfalse}
\ProcessOptions\relax

\def\@degreetext{Submitted in partial fulfillment of the requirements\\for the degree of}
\def\@degreelevel{}

\renewcommand{\maketitle}{%
    \begin{titlepage}
        \newgeometry{margin=1in,vmargin={1.3in,1in}}
        \linespread{1.2}
        \begin{center}%
            \vbox to 3.5in{%
                \tagstructbegin{tag=Title}
                \tagmcbegin{tag=Title}
                % Disable automatic tagging, otherwise a P gets inserted inside the Title
                \tagpdfsetup{para/tagging=false}

                {\fontsize{12pt}{14.4pt}\selectfont \bfseries \@title}

                \tagpdfsetup{para/tagging=true}
                \tagmcend
                \tagstructend

                \vskip 12pt

                by \par

                \vskip 12pt

                {\@author \par}
                \vfill
            }

            \ifdissertation
            \ifdefined\@department
            \def\@degreelevel{ Doctor of Philosophy in \@department}
            \fi
            \def\@thesislabel{Dissertation}
            \else
            \ifdefined\@department
            \def\@degreelevel{ Master of Science in \@department}
            \fi
            \def\@thesislabel{Thesis}
            \fi

            {\@thesislabel\par}
            \vspace{12pt}
            \@degreetext
            \@degreelevel\\
            \ifdefined\@concentration
            with a concentration in \@concentration\\
            \fi
            \ifdefined\@minor
            with a minor in \@minor\\
            \fi
            in the Graduate College of the\\
            University of Illinois Urbana-Champaign, \@degreeyear\par
            \vspace{12pt}
            \vbox to 0.4in{%
                {Urbana, Illinois\par}
                \vfill
            }%
        \end{center}%
        \begin{flushleft}
            {\ifdissertation Doctoral Committee:\else Master's Committee:\fi\par}

            \begin{itemize}[label={}, left-margin=0.5in]
                    \setlength{\itemsep}{0pt}
                    \setlength{\parskip}{0pt}
                    \setlength{\parsep}{0pt}
                    \@committee
            \end{itemize}
        \end{flushleft}
        \par
        \restoregeometry
    \end{titlepage}
}

% Abstract environment
\renewenvironment{abstract}{%
    \thispagestyle{empty}
    \section*{Abstract}
    \vspace{12pt}
    \doublespacing
}{%
}

% Acknowledgements environment
\newenvironment{acknowledgements}{%
    \thispagestyle{empty}
    \section*{Acknowledgements}
    \vspace{12pt}
    \doublespacing
}{%
}
