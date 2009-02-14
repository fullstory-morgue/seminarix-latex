% tfbrief is a LaTeX class for letters written in German.
% This class is written by Thomas Fischer <thomas.fischer@t-fischer.net>
% and licensed by the Creative Commons Attribution-Share Alike 3.0 License
% http://creativecommons.org/licenses/by-sa/3.0/

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{tfbrief}[2008/08/15 TF-Brief]

\newcommand{\labelphone}{Telefon}
\newcommand{\labelmobile}{Mobil}
\newcommand{\labelemail}{E-Mail}
\newcommand{\labelwww}{WWW}
\newcommand{\labelourref}{Unser Zeichen}
\newcommand{\labelyourref}{Ihr Zeichen}
\newcommand{\labelviafaxto}[1]{per FAX an #1}
\newcommand{\labelfromanddate}[2]{#1, den #2}
\newcommand{\labelgreeting}{Sehr geehrte Damen und Herren}
\newcommand{\labelleave}{Mit freundlichen Gr{\"u}{\ss}en}
\newcommand{\labelattachment}{Anlagen}

% Replace German text fragments by English text fragments
\DeclareOption{english}{%
  \renewcommand{\labelphone}{phone}%
  \renewcommand{\labelmobile}{mobile}%
  \renewcommand{\labelemail}{email}%
  \renewcommand{\labelwww}{www}%
  \renewcommand{\labelourref}{our reference}
  \renewcommand{\labelyourref}{your reference}
  \renewcommand{\labelviafaxto}[1]{sent via FAX to #1}%
  \renewcommand{\labelfromanddate}[2]{#2}% no location for English letters
  \renewcommand{\labelgreeting}{Dear Sir/Madam}
  \renewcommand{\labelleave}{Sincerely}
  \renewcommand{\labelattachment}{Attachments}
}

\ProcessOptions

\LoadClass[12pt,a4paper]{scrartcl}

\RequirePackage{vmargin}
\RequirePackage{ifthen}
\RequirePackage{textcase}

% The Pazo Math fonts are a family of PostScript fonts suitable
% for typesetting mathematics in combination with the Palatino
% family of text fonts.
% http://tug.ctan.org/info?id=mathpazo
\RequirePackage[sc,osf]{mathpazo}

% The "microtype" package provides a LaTeX interface to pdfTeXs
% micro-typographic extensions: character protrusion and font
% expansion.
% http://tug.ctan.org/info?id=microtype
\RequirePackage{microtype}

% There are problems in LaTeX that it "would be nice" to correct;
% fixltx2e provides a home for these corrections.
% http://tug.ctan.org/info?id=fixltx2e
\RequirePackage{fixltx2e}

% Implements a workaround for the LaTeX bug that marginpars will
% sometimes come out at the wrong margin.
% http://tug.ctan.org/info?id=mparhack
\RequirePackage{mparhack}

% Alternative versions of "ragged"-type commands
% http://tug.ctan.org/info?id=ragged2e
\RequirePackage{ragged2e}



\newlength{\fromwidth}
\newlength{\dummylength}
\setlength{\fromwidth}{5cm}
\newcommand{\TheFromNameShort}{}
\newcommand{\fromnameshort}[1]{\AtBeginDocument{\renewcommand{\TheFromNameShort}{#1}}}
\newcommand{\TheFromName}{}
\newcommand{\fromname}[2][]{\AtBeginDocument{\renewcommand{\TheFromName}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromNameShort}{#1}}}}
\newcommand{\TheFromStreetShort}{}
\newcommand{\fromstreetshort}[1]{\AtBeginDocument{\renewcommand{\TheFromStreetShort}{#1}}}
\newcommand{\TheFromStreet}{}
\newcommand{\fromstreet}[2][]{\AtBeginDocument{\renewcommand{\TheFromStreet}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromStreetShort}{#1}}}}
\newcommand{\TheFromCityCC}{}
\newcommand{\fromcitycc}[1]{\AtBeginDocument{\renewcommand{\TheFromCityCC}{#1}}}
\newcommand{\TheFromCityShort}{}
\newcommand{\fromcityshort}[1]{\AtBeginDocument{\renewcommand{\TheFromCityShort}{#1}}}
\newcommand{\TheFromCity}{}
\newcommand{\fromcity}[2][]{\AtBeginDocument{\renewcommand{\TheFromCity}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromCityShort}{#1}}}}
\newcommand{\TheFromCityCode}{}
\newcommand{\fromcitycode}[1]{\AtBeginDocument{\renewcommand{\TheFromCityCode}{#1}}}
\newcommand{\TheFromCountry}{}
\newcommand{\fromcountry}[1]{\AtBeginDocument{\renewcommand{\TheFromCountry}{#1}}}
\newcommand{\TheFromPhone}{}
\newcommand{\fromphone}[1]{\AtBeginDocument{\renewcommand{\TheFromPhone}{#1}}}
\newcommand{\TheFromFax}{}
\newcommand{\fromfax}[1]{\AtBeginDocument{\renewcommand{\TheFromFax}{#1}}}
\newcommand{\TheFromMobile}{}
\newcommand{\frommobile}[1]{\AtBeginDocument{\renewcommand{\TheFromMobile}{#1}}}
\newcommand{\TheFromEMail}{}
\newcommand{\fromemail}[1]{\AtBeginDocument{\renewcommand{\TheFromEMail}{#1}}}
\newcommand{\TheFromWWW}{}
\newcommand{\fromwww}[1]{\AtBeginDocument{\renewcommand{\TheFromWWW}{#1}}}
\newcommand{\TheYourRef}{}
\newcommand{\yourref}[1]{\AtBeginDocument{\renewcommand{\TheYourRef}{#1}}}
\newcommand{\TheOurRef}{}
\newcommand{\ourref}[1]{\AtBeginDocument{\renewcommand{\TheOurRef}{#1}}}
\newcommand{\TheToName}{}
\newcommand{\toname}[1]{\AtBeginDocument{\renewcommand{\TheToName}{#1}}}
\newcommand{\TheToStreet}{}
\newcommand{\tostreet}[1]{\AtBeginDocument{\renewcommand{\TheToStreet}{#1}}}
\newcommand{\TheToCityCC}{}
\newcommand{\tocitycc}[1]{\AtBeginDocument{\renewcommand{\TheToCityCC}{#1}}}
\newcommand{\TheToCityShort}{}
\newcommand{\tocityshort}[1]{\AtBeginDocument{\renewcommand{\TheToCityShort}{#1}}}
\newcommand{\TheToCity}{}
\newcommand{\tocity}[2][]{\AtBeginDocument{\renewcommand{\TheToCity}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheToCityShort}{#1}}}}
\newcommand{\TheToCityCode}{}
\newcommand{\tocitycode}[1]{\AtBeginDocument{\renewcommand{\TheToCityCode}{#1}}}
\newcommand{\TheToCountry}{}
\newcommand{\tocountry}[1]{\AtBeginDocument{\renewcommand{\TheToCountry}{#1}}}
\newcommand{\TheToFax}{}
\newcommand{\tofax}[1]{\AtBeginDocument{\renewcommand{\TheToFax}{#1}}}
\newcommand{\TheSubject}{Betreff}
\renewcommand{\subject}[1]{\AtBeginDocument{\renewcommand{\TheSubject}{#1}}}
\newcommand{\TheDate}{\today}
\renewcommand{\date}[1]{\AtBeginDocument{\renewcommand{\TheDate}{#1}}}
\newcommand{\TheGreeting}{\labelgreeting,}
\newcommand{\greeting}[1]{\AtBeginDocument{\renewcommand{\TheGreeting}{#1}}}
\newcommand{\TheLeave}{\labelleave,}
\newcommand{\leave}[1]{\AtBeginDocument{\renewcommand{\TheLeave}{#1}}}
\newcommand{\TheSignature}{\vspace{1cm}}
\newcommand{\signature}[1]{\AtBeginDocument{\renewcommand{\TheSignature}{#1}}}
\newcommand{\TheLogo}{}
\newcommand{\logo}[1]{\AtBeginDocument{\renewcommand{\TheLogo}{#1}}}

\setmarginsrb{2.5cm}{2cm}{2cm}{2cm}{0cm}{0cm}{2cm}{2cm}
\setlength{\parindent}{0cm}
\setlength{\parskip}{1.75ex plus 0.75ex minus 0.75ex}

\newenvironment{letter}{
\thispagestyle{empty}
%
\setlength{\unitlength}{1mm}
\begin{picture}(0,0)
%% y-offset of 24 is required
\put(-25,-81){\line(1,0){5}}
\put(-25,-124.5){\line(1,0){7}}
\put(-25,-186.5){\line(1,0){5}}
\end{picture}
%
\begin{minipage}[t]{8cm}
% Alternate position for the logo
%\begin{minipage}[t][2.5cm]{\linewidth}
%\vspace{-0.001mm}\TheLogo
%\end{minipage}\\
\vspace*{2.5cm}
\begin{minipage}[t]{\linewidth}
{\fontfamily{phv}\fontseries{mc}\selectfont \scriptsize \ifthenelse{\equal{\TheFromNameShort}{}}{\TheFromName}{\TheFromNameShort} $\cdot$ \ifthenelse{\equal{\TheFromStreetShort}{}}{\TheFromStreet}{\TheFromStreetShort} $\cdot$ \ifthenelse{\equal{\TheFromCityCC}{}}{\TheFromCityCode}{\TheFromCityCC --\TheFromCityCode} \ifthenelse{\equal{\TheFromCityShort}{}}{\TheFromCity}{\TheFromCityShort} \vspace{-1ex} \rule{0cm}{0cm}\\\hrule\rule{0cm}{0cm}}

\TheToName \\
\ifthenelse{\equal{\TheToStreet}{}}{\vspace*{0.75ex}\\}{\TheToStreet\vspace*{0.6ex}\\}
{\bfseries \ifthenelse{\equal{\TheToCityCC}{}}{\TheToCityCode}{\TheToCityCC --\TheToCityCode} \TheToCity}
\ifthenelse{\equal{\TheToCountry}{}}{}{\vspace*{0.6ex}\\\textbf{\MakeTextUppercase{\TheToCountry}}}
\ifthenelse{\equal{\TheToFax}{}}{}{

\vspace{0.5em}
\fbox{\footnotesize \labelviafaxto{\TheToFax}}}
\end{minipage}
\end{minipage}
%
\hfill
%
\settowidth{\dummylength}{\TheFromName}%
\ifthenelse{\dummylength>\fromwidth}{\setlength{\fromwidth}{\dummylength}}{}%
\settowidth{\dummylength}{\TheFromCity}%
\ifthenelse{\dummylength>\fromwidth}{\setlength{\fromwidth}{\dummylength}}{}%
\settowidth{\dummylength}{\small\TheFromEMail}%
\ifthenelse{\dummylength>\fromwidth}{\setlength{\fromwidth}{\dummylength}}{}%
\settowidth{\dummylength}{\small\TheFromWWW}%
\ifthenelse{\dummylength>\fromwidth}{\setlength{\fromwidth}{\dummylength}}{}%
\settowidth{\dummylength}{\small\TheOurRef}%
\ifthenelse{\dummylength>\fromwidth}{\setlength{\fromwidth}{\dummylength}}{}%
\settowidth{\dummylength}{\small\TheYourRef}%
\ifthenelse{\dummylength>\fromwidth}{\setlength{\fromwidth}{\dummylength}}{}%
\begin{minipage}[t]{\fromwidth}%
\begin{minipage}[t]{\linewidth}%
\TheLogo%
\end{minipage}\par%
\TheFromName\\%
\TheFromStreet\\%
\ifthenelse{\equal{\TheFromCityCC}{}}{\TheFromCityCode}{\TheFromCityCC --\TheFromCityCode}
\TheFromCity\\%
\ifthenelse{\equal{\TheFromCountry}{}}{}{\TheFromCountry\\}%
\ifthenelse{\equal{\TheFromPhone}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\itshape\footnotesize \labelphone\hspace{1em}}\TheFromPhone\\}%
\ifthenelse{\equal{\TheFromFax}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\itshape\footnotesize Fax\hspace{1em}}\TheFromFax\\}%
\ifthenelse{\equal{\TheFromMobile}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\itshape\footnotesize \labelmobile\hspace{1em}}\TheFromMobile\\}%
{\small\ifthenelse{\equal{\TheFromEMail}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\itshape\footnotesize\labelemail\hspace{1em}}{\TheFromEMail}\\}}%
{\small\ifthenelse{\equal{\TheFromWWW}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\itshape\footnotesize\labelwww\hspace{1em}}{\TheFromWWW}\\}}%
\ifthenelse{\equal{\TheOurRef}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\itshape\footnotesize \labelourref\hspace{1em}}\TheOurRef\\}%
\ifthenelse{\equal{\TheYourRef}{}}{}{\\\hspace*{-2cm}\makebox[2cm][r]{\itshape\footnotesize \labelyourref\hspace{1em}}\TheYourRef\\}%
\end{minipage}

\vspace{2cm plus 3.5cm minus 1.75cm}

\begin{flushright}
\labelfromanddate{\TheFromCity}{\TheDate}
\end{flushright}

\vspace{2cm plus 3.5cm minus 1.75cm}

{\bfseries \TheSubject}

\vspace{1cm plus 1cm minus 0.75cm}

\TheGreeting

\begin{FlushLeft}
\renewcommand{\baselinestretch}{1.2}\normalsize
}
{
\renewcommand{\baselinestretch}{1.0}\normalsize
\end{FlushLeft}

\ifthenelse{\equal{\TheLeave}{}}{}{
\vspace{1.5em plus 0.75em minus 0.75em}

\TheLeave
}

\vspace{0.25cm plus 0.25cm minus 0.25cm}

\TheSignature
\TheFromName
}


\newenvironment{attachment}{
%\enlargethispage{2cm}
%\vspace{2cm plus 2fil minus 1cm}
\vspace{2cm plus 2cm minus 1cm}\vfill
\labelattachment
\begin{itemize}
\setlength{\itemsep}{0cm}
}
{\end{itemize}}
