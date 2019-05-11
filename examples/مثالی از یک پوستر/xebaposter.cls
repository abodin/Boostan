%%
%% This is file `xebaposter.cls'
%% 
%% Copyright © 2015-2016 by Seiied-Mohammad-Javad Razavian <javadr@gmail.com>
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%  http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% This work is “author-maintained” (as per LPPL maintenance status)
%% by Seiied-Mohammad-Javad Razavian.
%% The Current Maintainer of this work is Seiied-Mohammad-Javad Razavian
%% 
%% A relatively comfortable latex class to produce posters with a grid based
%% layout. It comes with a number of combinable styles and is (maybe only for
%% the writer) easy to extend, as all the graphics is based on pgf.
%%
%%
%% Copyright (C) 2007-2011 Brian Amberg
%% Copyright (C) 2011      Reinhold Kainhofer <reinhold@kainhofer.com>
%% Copyright (C) 2015-2016      Seiied-Mohammad-Javad Razavian <javadr@gmail.com>
%%
%% 12. September 2016: ver 2.51
%%     - typo in package inf.
%% 1. September 2016: ver 2.5
%%     - In persian mode with gird enabled option, grid numbers set on left side of the sheet.
%%     -There is no need to set \setLTR before \shade or \fill command, it fixed in new version of bidi.
%% 11. February 2015: ver 2.42
%%     - Correcting some other typos in the package's documentaion.
%% 10. February 2015: ver 2.41
%%     - Correcting two typos in the package's documentaion.
%% 9. February 2015: ver 2.4
%%     - bidi ver 18.2 and later has not provice bidi@tikzpicture environment anymore, istead Vafa Khalighi the creator and maintainer of xepersian have improved the tikzpicture environment in RTL mode, so the package just use tikzpicture in both ltr and rtl poster. 
%% 30. September 2015: ver 2.3
%%     - 
%% 1. September 2015: ver 2.21
%%     - if xebaposter's user didn't set persian/latin option, by default it will be set latin but in case xepersian package is being loaded the default will be persian unless the user set latin explicitly. 
%% 1. September 2015: ver 2.2
%%     - persian/latin options added to the class and default is latin. From now on, this class can be used for both latin and persian poster.  The only thing that should be mentioned is the persian one must be compiled with xelatex but the latin one should be compiled with pdflatex or xelatex. For latin poster pdflatex is preferred because shading feature of tikz doesn't work properly with xelatex from TeXLive2013! the bug reported in http://tex.stackexchange.com/questions/262877.
%% 28. August 2015:
%%     - A bidi@tikzpicture is used instead of tikzpicture because it causes some unwanted extra spaces in the poster.
%% 21. August 2015: 
%%     - The xebaposter is named after changing the baposter style to adapt with right to left text like persian.
%% 29. September 2011: 
%%     - Finally fixed confusion with paper size handling and landscape. This required seperate handling of papersizes 
%%       known to the geometry package and other packages.
%% 26. September 2011:
%%     - Reverted drawing of faded borders to manual method, as the current result does not work with evince, 
%%       and produced spurious colored boxes with okular and acroread.
%%     - Added one more example due to popular request
%% 16. September 2011:
%%     - Removed nag package, such that it compiles on older systems
%%     - Added more examples
%% 15. September 2011:
%%     - Merged fork by (rk) back into mainline, essentially taking over all the great improvements that Reinhold Kainhofer coded.
%%       We call this version 2, as it breaks the interface in some small points. Essentially watch out for this:
%%       - no/yes keys are now false/true
%%       - the shade-lr etc. keys have the hypen removed, and are now called shadelr etc.
%      - Added more examples, which are all adapted to work with the current version
%% 27. August 2011 (rk):
%%     - Completely factored out all drawing commands to handler functions, assigned via choice keys
%%     - Added cornerradius, boxheaderheight, boxpadding options
%%     - Added missing roundedright
%% 26. August 2011 (rk):
%%     - Turned headerbox cmd into posterbox environment (allows verbatim)
%%     - pass several options to packages
%%     - added debug cls option to reduce default output
%%     - rewrote several loops and ifthenelse
%%     - Use boolean and choice keys for all options
%%     - Changed all choice options to set a global function to
%%       \baposter@OPTION@OPTIONVALUE, which are a functions that execute the
%%       option's setting (drawing routine, color setting for tikz, etc.)
%%     - Add a5paper
%% 07. April 2011: Fixed paper size handling
%%     - Fixed Paper Size handling, you can now specify all page sizes using paperwidth=, paperheight= class options.
%%     - Added rudimentary documentation of the available keys.
%% 11. December 2010: Fixed "Empty Second Page" bug
%%     - A second empty page was introduced when a document ended with
%%           \end{poster}
%%         \end{document}
%%       This was fixed thanks to a suggestion by Martin Aulbach
%%     - Added
%%         \thispagestyle{empty}%%       to suppress page numbers, which became visible when the margins are large.
%%       The underlying problem of page-size handling has not yet been solved.
%% 30. September 2010: Border Bugfixes
%%     - Correct background color with textborder=rounded-small, Thanks to Ke Chen for the bugreport and patch
%%     - Correctly draw rectangular text boxes, Thanks to abenkst for the bugreport and fix
%% 10. June 2010: Added option to set the number of columns
%%     - added a class option to set the number of columns
%%         - columns=5: sets the number of columns to 5, possible values are 1..6, default is 3 in portrait and 4 in landscape format
%% 29. April 2009: Incorporated Patches by Arne Henningsen
%%     - added some class options
%%        - a4shrink: shrink the paper to A4 size (for printing drafts or handouts)
%%        - movebody=Xpt: move the text/poster body Xpt to the right
%%                    (or to the left if Xpt is negative),
%%                    e.g. for manually centering the poster on the page
%%        - showframe: use the "showframe" option of the "geometry" package
%%        - a0paper (default): set paper size to A0
%%        - archE: set paper size to Arch E
%%     - setting "background" can be "none" now (otherwise the "showframe"
%%          option has no effect)
%%     - the page number has been removed (it was mostly not visible before)
%%     - the "margin=" option works now
%% 04. December 2008
%%     - Mainly an update to the landscape example
%% 14. November 2008
%%     - Actually center the title when eyecatcher is used.
%% 04. November 2008
%%     - Fixed bug with eyecatcher not working.
%% 26. June 2008
%%     - Fixed bug with plain background mode.
%% 14. June 2008
%%     - Support for portrait/landscape switching.
%%     - Some smaller bugfixes.
%% 01. June 2007
%%     - First version released.
%%
%% Use this class with xelatex
%%
%% I have confirmed that this package works with
%%   - texlive 2015 
%%
%%
%% TODO:
%% -) Rename backgrounds back to shaded-tb shade-lr
%% -) Rename textborder back to rounded-small (consistent naming needed!)
%% -) Rename headershade back to shade-lr, shade-tb, shade-tb-inverse
%% -) Rename headershape back to small-rounded
%% -) Option value consistency (small-rounded vs. rounded-small; missing ones)
%% -) Rename \xebaposterHeaderSetShade, \xebaposterHeaderDrawText to include @ and verb
%%
%%
%% Licence: GPL
\ProvidesClass{xebaposter}[2016/09/12 v2.51 xebaposter class]
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\LoadClass{article}
\typeout{baposter: Brian Amberg, 2007, 2008, 2009, 2010, 2011 | http://www.brian-amberg.de/uni/poster/}
\typeout{baposter: Reinhold Kainhofer, 2011 | http://reinhold.kainhofer.com/}
\typeout{xebaposter: Seiied-Mohammad-Javad Razavian, 2015-2016 | https://github.com/javadr/xebaposter/}
%
%% Define lengths only once on inclusion, such that we can make multiple posters
\newlength{\xebaposter@basepaperwidth}%
\newlength{\xebaposter@basepaperheight}%
\newlength{\xebaposter@basemargin}%
\newlength{\xebaposter@finalpaperwidth}%
\newlength{\xebaposter@finalpaperheight}%
\newlength{\xebaposter@finalmargin}%
\newlength{\headerheight}%
\newlength{\colwidth}%
\newlength{\colheight}%
\newlength{\xebaposter@@colspacing}%
\newlength{\xebaposter@box@@cornerradius}%
\newlength{\xebaposter@box@@boxheaderheight}%
\newlength{\xebaposter@box@@boxpadding}%
\newlength{\boxstartx}%
\newlength{\boxstarty}%
\newlength{\boxwidth}%
\newlength{\boxheight}%
\newlength{\xebaposter@titleimage@left@width}%
\newlength{\xebaposter@titleimage@right@width}%
\newlength{\xebaposter@titleimage@textwidth}%
\newbox\xebaposter@box@content%
\newbox\xebaposter@titleimage@left%
\newbox\xebaposter@titleimage@title%
\newbox\xebaposter@titleimage@right%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages
%-------------------------------------------------------------------------------
% The only ``weird'' dependency of this package is pgf. All the rest should be
% installed on any decent system.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\typeout{Use Packages}%
\RequirePackage{xkeyval}%
\RequirePackage{calc}%
\RequirePackage[cmyk]{xcolor}%
\RequirePackage{ifxetex}
%\ifxetex
%    \def\pdftexversion{140}%
%    \def\pgfsysdriver{pgfsys-dvipdfm.def}%
%\fi  
\RequirePackage{tikz}%
\RequirePackage{pgf}%
%\makeatletter
%\def\pgfsys@papersize#1#2{%
%  \pdfpageheight#2\relax%
%  \pdfpagewidth#1\relax}
%\makeatother
\RequirePackage{ifthen}%
\RequirePackage[T1]{fontenc}%
%\RequirePackage{biditools}
%\RequirePackage[l2tabu, orthodox]{nag}%
\usetikzlibrary{decorations}%
\usetikzlibrary{fadings}%
\usetikzlibrary{snakes}%
\usetikzlibrary{calc}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Choose a smaller value for larger fonts
\newcommand{\xebaposter@fontscale}{0.292}%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zoom
%-------------------------------------------------------------------------------
% We scale the page from fontscale * papersize up to papersize
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%% Paper sizes
\newif\if@landscape%
\newif\if@geometryKnowsThisSize%
\DeclareOptionX{landscape}{\@landscapetrue}%
\DeclareOptionX{portrait}{}%
%
\newcommand{\xebaposter@setfinalpapersize}[2]{%
\if@geometryKnowsThisSize
  \setlength{\xebaposter@finalpaperwidth}{#1}%
  \setlength{\xebaposter@finalpaperheight}{#2}%
\else
\if@landscape
% Transpose length, if geometry does not handle the papersize based on the key
  \setlength{\xebaposter@finalpaperwidth}{#2}%
  \setlength{\xebaposter@finalpaperheight}{#1}%
\else
  \setlength{\xebaposter@finalpaperwidth}{#1}%
  \setlength{\xebaposter@finalpaperheight}{#2}%
\fi
\fi
}
%
% Default paperwidth and paperheight = a0paper
\DeclareOptionX{paperwidth}[841mm]{\setlength{\xebaposter@finalpaperwidth}{#1}}%
\DeclareOptionX{paperheight}[1189mm]{\setlength{\xebaposter@finalpaperheight}{#1}}%
\DeclareOptionX{archA}         {                           \xebaposter@setfinalpapersize{9in}{12in}}%
\DeclareOptionX{archB}         {                           \xebaposter@setfinalpapersize{12in}{18in}}%
\DeclareOptionX{archC}         {                           \xebaposter@setfinalpapersize{18in}{24in}}%
\DeclareOptionX{archD}         {                           \xebaposter@setfinalpapersize{24in}{36in}}%
\DeclareOptionX{archE}         {                           \xebaposter@setfinalpapersize{36in}{48in}}%
\DeclareOptionX{archE1}        {                           \xebaposter@setfinalpapersize{30in}{42in}}%
\DeclareOptionX{archE2}        {                           \xebaposter@setfinalpapersize{26in}{38in}}%
\DeclareOptionX{archE3}        {                           \xebaposter@setfinalpapersize{27in}{39in}}%
\DeclareOptionX{a0paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{841mm}{1189mm}}%g
\DeclareOptionX{a1paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{594mm}{841mm}}%g
\DeclareOptionX{a2paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{420mm}{594mm}}%g
\DeclareOptionX{a3paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{297mm}{420mm}}%g
\DeclareOptionX{a4paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{210mm}{297mm}}%g
\DeclareOptionX{a5paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{148mm}{210mm}}%g
\DeclareOptionX{a6paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{105mm}{148mm}}%g
\DeclareOptionX{b0paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{1000mm}{1414mm}}%g
\DeclareOptionX{b1paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{707mm}{1000mm}}%g
\DeclareOptionX{b2paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{500mm}{707mm}}%g
\DeclareOptionX{b3paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{353mm}{500mm}}%g
\DeclareOptionX{b4paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{250mm}{353mm}}%g
\DeclareOptionX{b5paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{176mm}{250mm}}%g
\DeclareOptionX{b6paper}       {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{125mm}{176mm}}%g
\DeclareOptionX{ansiapaper}    {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{8.5in}{11in}}%
\DeclareOptionX{ansibpaper}    {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{11in}{17in}}%
\DeclareOptionX{ansicpaper}    {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{17in}{22in}}%
\DeclareOptionX{ansidpaper}    {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{22in}{34in}}%
\DeclareOptionX{ansiepaper}    {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{34in}{44in}}%
\DeclareOptionX{letterpaper}   {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{8.5in}{11in}}%
\DeclareOptionX{legalpaper}    {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{8.5in}{14in}}%
\DeclareOptionX{executivepaper}{\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{7.25in}{10.5in}}%
\DeclareOptionX{screen}        {\@geometryKnowsThisSizetrue\xebaposter@setfinalpapersize{225mm}{180mm}}%g
%
% Margin
\setlength{\xebaposter@finalmargin}{1.5cm}%
\DeclareOptionX{fontscale}[0.292]{\renewcommand{\xebaposter@fontscale}{#1}}%
\DeclareOptionX{margin}   [1.5cm]{\setlength{\xebaposter@finalmargin}{#1}}%
%
% move text/poster body to the right (or to the left if negative)
\newlength{\xebaposter@movebody}%
\setlength{\xebaposter@movebody}{0cm}%
\DeclareOptionX{movebody}[0cm]{\setlength{\xebaposter@movebody}{#1}}%
%
%
\newif\if@debug%
\DeclareOptionX{debug}{\@debugtrue}%
%% Will be passed on to other packages (xcolor and geometry), still we don't want unused warnings
\DeclareOptionX{table}{}%
\DeclareOptionX{showframe}{}%
%
\newif\if@xebaposter@persian
\newif\if@xebaposter@latin
\DeclareOptionX{persian}{\@xebaposter@persiantrue}
\DeclareOptionX{latin}{\@xebaposter@latintrue}
%
\ProcessOptionsX%
%
\if@debug
\newcommand{\debug}[1]{\typeout{#1}}%
\else
\newcommand{\debug}[1]{}%
\fi
%
%%% when user didn't set persian/latin option, if he/she uses xepersian the default will be persian, otherwise default will be latin. 
\if@xebaposter@latin
    \relax
\else
    \if@xebaposter@persian
        \relax
    \else
        \AtBeginDocument{\@ifpackageloaded{xepersian}{\@xebaposter@persiantrue}{}}
    \fi
\fi
%
\setlength{\xebaposter@basepaperwidth} {\xebaposter@fontscale\xebaposter@finalpaperwidth }%
\setlength{\xebaposter@basepaperheight}{\xebaposter@fontscale\xebaposter@finalpaperheight}%
\setlength{\xebaposter@basemargin}     {\xebaposter@fontscale\xebaposter@finalmargin}%
\newlength{\xebaposter@basemarginright}%
\setlength{\xebaposter@basemarginright}{\xebaposter@basemargin}%
\addtolength{\xebaposter@basemarginright}{-\xebaposter@fontscale\xebaposter@movebody}%
\newlength{\xebaposter@basemarginleft}%
\setlength{\xebaposter@basemarginleft}{\xebaposter@basemargin}%
\addtolength{\xebaposter@basemarginleft}{\xebaposter@fontscale\xebaposter@movebody}%
%
\typeout{Paperwidth=\the\xebaposter@finalpaperwidth}%
\typeout{Paperheight=\the\xebaposter@finalpaperheight}%
\typeout{BasePaperwidth=\the\xebaposter@basepaperwidth}%
\typeout{BasePaperheight=\the\xebaposter@basepaperheight}%
\RequirePackage[
   paperwidth=\xebaposter@basepaperwidth,%
   paperheight=\xebaposter@basepaperheight,%
   tmargin=\xebaposter@basemargin,%
   bmargin=\xebaposter@basemargin,%
   lmargin=\xebaposter@basemarginleft,%
   rmargin=\xebaposter@basemarginright,%
   ]{geometry}%
%
\RequirePackage{pgfpages}
\if@landscape
\if@geometryKnowsThisSize
\pgfpagesuselayout{resize to}[physical paper width=\xebaposter@finalpaperheight,physical paper height=\xebaposter@finalpaperwidth]%
\else
\pgfpagesuselayout{resize to}[physical paper width=\xebaposter@finalpaperwidth,physical paper height=\xebaposter@finalpaperheight]%
\fi
\else
\pgfpagesuselayout{resize to}[physical paper width=\xebaposter@finalpaperwidth,physical paper height=\xebaposter@finalpaperheight]%
\fi
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Default functions for borders/backgrounds
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% These functions will all be redefined from the actual option values. In
%% particular, they will be set to \xebaposter@optionname@optionvalue, which
%% should do the actual work / setting for that particular optionvalue.
%
\newcommand{\xebaposterPosterDrawBackground}[2]{} % Draw poster background
%
\newcommand{\xebaposterBoxGetShape}{}             % Returns path of text box shape
\newcommand{\xebaposterBoxDrawBackground}[2]{}    % Draw bg of boxes
\newcommand{\xebaposterBoxDrawBorder}[1]{}        % Draw border of individual boxes
%
\newcommand{\xebaposterHeaderGetShape}{}          % Returns path of text box shape
\newcommand{\xebaposterHeaderSetShade}[3]{}       % Set bg style for box headers
\newcommand{\xebaposterHeaderDrawBackground}[3]{} % Draw background of box header
\newcommand{\xebaposterHeaderDrawBorder}[1]{}     % Draw border of box header
\newcommand{\xebaposterHeaderDrawText}[1]{}       % Draw text inside box header
%
\newcommand{\@@previousbox}{notset}             % stores the previously processed box for below=auto
%
% Function to set a user-defined background
\newcommand{\xebaposter@backgroundCmd}{\error{No background command defined. Use \background{...} to define background}}%
\newcommand{\background}[1]{\renewcommand{\xebaposter@backgroundCmd}{#1}}%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Handle poster and box options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\debug{Handling keys}%
%
%%
%% POSTER OPTIONS
%%
%% Store all poster options in variables of the form \xebaposter@option
%% choose-keys also store the index in \xebaposter@optionnr
%% choose-keys typically also assign a function
\definecolor{xebaposter@silver}{cmyk}{0,0,0,0.7}%
\define@boolkey[ba]{poster}[xebaposter@]{grid}                 [false]       {}%
\define@boolkey[ba]{poster}[xebaposter@]{eyecatcher}           [true]        {}%
\define@cmdkey [ba]{poster}[xebaposter@]{headerheight}         [0.1\textheight]{}%
\define@cmdkey [ba]{poster}[xebaposter@]{columns}              [{}]          {}%
\define@cmdkey [ba]{poster}[xebaposter@]{colspacing}           [1em]         {}%
\define@cmdkey [ba]{poster}[xebaposter@]{bgColorOne}           [xebaposter@silver]{}%
\define@cmdkey [ba]{poster}[xebaposter@]{bgColorTwo}           [green]       {}%
%
% background can be one of: shadeLR, shadeTB, plain, user, none
\define@choicekey*+[ba]{poster}{background}%
    [\xebaposter@background\xebaposter@backgroundnr]%
    {shadeLR, shadeTB, plain, user, none} [plain] {%
  \debug{Poster background: \xebaposter@background}%
  \renewcommand{\xebaposterPosterDrawBackground}[2]{%
      \csname xebaposter@background@\xebaposter@background\endcsname{##1}{##2}}%
}{%
  \PackageWarning{xebaposter}{Unknown background `\xebaposter@background' (use
      shadeLR, shadeTB, plain, none, or user). If user is used, you also
      have to define \background{...}.}%
  \renewcommand{\xebaposterPosterDrawBackground}[2]{\xebaposter@background@none{##1}{##2}}
}%
%
%
%%
%%  BOX OPTIONS
%%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{cornerradius}          [1em]         {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{boxheaderheight}       [2em]         {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{boxpadding}            [0.5em]       {}%
%
%
% textborder can be one of: none, bars, coils, triangles, rectangle, rounded,
% roundedleft, roundedsmall, faded; UNIMPLEMENTED: roundedright
\edef\xebaposter@box@textborder@validvalues{none,bars,coils,triangles,rectangle,rounded,roundedleft,roundedsmall,faded}%
\define@choicekey*+[ba]{posterbox}{textborder}%
    [\xebaposter@box@textborder\xebaposter@box@textbordernr]%
    {none,bars,coils,triangles,rectangle,rounded,roundedleft,roundedright,roundedsmall,faded} [rectangle] {%
  \debug{Text border: \xebaposter@box@textborder}%
  \renewcommand{\xebaposterBoxGetShape}{%
      \csname xebaposter@box@boxshape@\xebaposter@box@textborder\endcsname}%
  \renewcommand{\xebaposterBoxDrawBorder}[1]{%
      \csname xebaposter@box@drawborder@\xebaposter@box@textborder\endcsname{##1}}%
}{%
  \PackageWarning{xebaposter}{Unknown text-border style `\xebaposter@box@textborder'.
      Edit your file to choose a valid option (\xebaposter@box@textborder@validvalues).}%
  \renewcommand{\xebaposterBoxGetShape}{\xebaposter@boxshape@rectangle}%
  \renewcommand{\xebaposterBoxDrawBorder}[1]{\xebaposter@drawborder@rectangle{##1}}%
}%
%
% boxshade can be one of: shadelr, shaderl, shadetb, plain, none
\define@choicekey*+[ba]{posterbox}{boxshade}%
    [\xebaposter@box@boxshade\xebaposter@box@boxshadenr]%
    {shadelr,shaderl,shadetb,plain,none} [none] {%
  \debug{Box shade: \xebaposter@box@boxshade}%
  \renewcommand{\xebaposterBoxDrawBackground}[2]{%
      \csname xebaposter@box@drawbackground@\xebaposter@box@boxshade\endcsname{##1}{##2}}%
}{%
  \PackageWarning{xebaposter}{Unknown boxshade style `\xebaposter@boxshade'.
      Edit your file to choose a valid option.}%
  \renewcommand{\xebaposterBoxDrawBackground}[2]{\xebaposter@box@drawbackground@none{##1}{##2}}%
}%
%
% headershade can be one of: shadelr,shaderl, shadetb, shadetbinverse, plain
\define@choicekey*+[ba]{posterbox}{headershade}%
    [\xebaposter@box@headershade\xebaposter@box@headershadenr]%
    {shadelr,shaderl, shadetb, shadetbinverse, plain} [shadelr] {%
  \debug{Header shade: \xebaposter@box@headershade}%
  \renewcommand{\xebaposterHeaderSetShade}[3]{%
      \csname xebaposter@box@headershade@\xebaposter@box@headershade\endcsname{##1}{##2}{##3}}
}{%
  \PackageWarning{xebaposter}{Unknown headershade style `\xebaposter@box@headershade'.
      Edit your file to choose a valid option.}%
  \renewcommand{\xebaposterHeaderSetShade}[3]{\xebaposter@box@headershade@none{##1}{##2}{##3}}%
}%
%
% headershape can be one of: rectangle, rounded, smallrounded, roundedleft, roundedright
\define@choicekey*+[ba]{posterbox}{headershape}%
    [\xebaposter@box@headershape\xebaposter@box@headershapenr]%
    {rectangle,rounded,smallrounded,roundedleft,roundedright} [roundedright] {%
  \debug{Header shape: \xebaposter@box@headershape}%
  \renewcommand{\xebaposterHeaderGetShape}{%
      \csname xebaposter@box@headershape@\xebaposter@box@headershape\endcsname}%
  \renewcommand{\xebaposterHeaderDrawText}[1]{%
      \csname xebaposter@box@headerdrawtext@\xebaposter@box@headershape\endcsname{##1}}%
  \renewcommand{\xebaposterHeaderDrawBorder}[1]{%
      \csname xebaposter@box@headerdrawborder@\xebaposter@box@headershape\endcsname{##1}}%
}{%
  \PackageWarning{xebaposter}{Unknown headershape style `\xebaposter@headershape'.
      Edit your file to choose a valid option.}%
  \renewcommand{\xebaposterHeaderGetShape}{\xebaposter@box@headershape@rectangle}%
  \renewcommand{\xebaposterHeaderDrawText}[1]{\xebaposter@box@headerdrawtext@rectangle{##1}}%
  \renewcommand{\xebaposterHeaderDrawBorder}[1]{\xebaposter@box@headerdrawborder@rectangle{##1}}%
}%
%
% headerborder can be one of: open, closed, none
\define@choicekey*+[ba]{posterbox}{headerborder}%
    [\xebaposter@box@headerborder\xebaposter@box@headerbordernr]%
    {open,closed,none} [open] {%
  \debug{Header border: \xebaposter@box@headerborder}%
%   \renewcommand{\xebaposterHeaderBorder}{
%       \csname xebaposter@headerborder@\xebaposter@box@headerborder\endcsname}
}{%
  \PackageWarning{xebaposter}{Unknown headerborder style `\xebaposter@headerborder'.
      Edit your file to choose a valid option.}%
%   \renewcommand{\xebaposterHeaderBorder}{\xebaposter@box@headerborder@rectangle}
}%
%
%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{borderColor}           [yellow]      {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{headerColorOne}        [red]         {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{headerColorTwo}        [brown]       {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{headerFontColor}       [black]       {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{boxColorOne}           [magenta]     {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{boxColorTwo}           [cyan]        {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{headerfont}            [\scshape\Large]   {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{textfont}              [{}]          {}%
%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{linewidth}             [2pt]         {}%
%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{below}  [notset]{}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{above}  [notset]{}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{aligned}[notset]{}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{bottomaligned}[notset]{}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{column} [0]     {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{row}    [0]     {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{span}   [1]     {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{height} [auto]  {}%
\define@cmdkey[ba]{posterbox}[xebaposter@box@]{name}   [noname]{}%
%
% Set some default values, the poster and posterbox environments can override:
\setkeys[ba]{poster}{%
  % Debug grid
  grid=false,%
  % Is there an eyecatcher image
  eyecatcher=true,%
  columns={},%
  % Colours
  bgColorOne=xebaposter@silver,%
  bgColorTwo=green,%
  %
  colspacing=1em,%
  headerheight=0.1\textheight,%
  background=shadeLR,%
}{}%
\setkeys[ba]{posterbox}{%
  % Position
  column=0,row=0,span=1,%
  below=notset,above=notset,%
  bottomaligned=notset,%
  aligned=notset,%
  height=auto,%
  % Name
  name=noname,%
  % Box design: border:
  linewidth=2pt,%
  borderColor=yellow,%
  cornerradius=1em,%
  % text box:
  textfont={},%
  boxshade=plain,%
  boxColorOne=magenta,%
  boxColorTwo=cyan,%
  textborder=faded,%
  boxpadding=0.5em,%
  % header
  headerfont=\scshape\Large,% or headerfont=\color{white}\textsf\textbf
  headerFontColor=black,%
  headerColorOne=red,%
  headerColorTwo=brown,%
  headershape=rectangle,%
  headershade=shadelr,%
  headerborder=none,%
  boxheaderheight=2em,%
}{}%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Background options and functions (one function for each possible value)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\xebaposter@background@shaderl}[2]{%
  \debug{xebaposter: Using shade right left background.}%
    \begin{tikzpicture}[remember picture,overlay]%
    \shade [shading=axis,left color=#2,right color=#1] (current page.north east)%
           rectangle(current page.south west);%
  \end{tikzpicture}%
}%
\newcommand{\xebaposter@background@shadelr}[2]{%
  \debug{xebaposter: Using shade left right background.}%
    \begin{tikzpicture}[remember picture,overlay]%
    \shade [shading=axis,left color=#1,right color=#2] (current page.north west)%
           rectangle(current page.south east);%
  \end{tikzpicture}%
}%
\newcommand{\xebaposter@background@shadetb}[2]{%
  \debug{xebaposter: Using shade top to bottom background.}%
    \begin{tikzpicture}[remember picture,overlay]%
    \shade [shading=axis,top color=#1,bottom color=#2] (current page.north west)%
           rectangle(current page.south east);%
  \end{tikzpicture}%
}%
\newcommand{\xebaposter@background@plain}[2]{%
  \debug{xebaposter: Using plain background.}%
  \begin{tikzpicture}[remember picture,overlay]%
    \fill [#1] {(current page.north west) rectangle (current page.south east)};%
  \end{tikzpicture}%
}%
\newcommand{\xebaposter@background@user}[2]{%
  \debug{xebaposter: Using user background.}%
    {\xebaposter@backgroundCmd}%
}%
\newcommand{\xebaposter@background@none}[2]{%
  \debug{xebaposter: Using no background.}%
}%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Return shape path of text box (depending on the box shape)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\xebaposter@box@boxshape@none}{\xebaposter@box@boxshape@rectangle}%
\newcommand{\xebaposter@box@boxshape@bars}{%
  (\xebaposter@box@name tnw) -- (\xebaposter@box@name sw) %
  (\xebaposter@box@name se) -- (\xebaposter@box@name tne)%
}%
\newcommand{\xebaposter@box@boxshape@coils}{\xebaposter@box@boxshape@bars}%
\newcommand{\xebaposter@box@boxshape@triangles}{\xebaposter@box@boxshape@bars}%
\newcommand{\xebaposter@box@boxshape@rectangle}{%
  (\xebaposter@box@name tnw) -- (\xebaposter@box@name sw) -- %
  (\xebaposter@box@name se) -- (\xebaposter@box@name tne)%
}%
\newcommand{\xebaposter@box@boxshape@faded}{%
  (\xebaposter@box@name tnw) -- (\xebaposter@box@name sw) %
  (\xebaposter@box@name tne) -- (\xebaposter@box@name se)%
  }%
\newcommand{\xebaposter@box@boxshape@rounded}{%
  [rc] \xebaposter@box@boxshape@rectangle%
}%
\newcommand{\xebaposter@box@boxshape@roundedsmall}{%
  [src] \xebaposter@box@boxshape@rectangle%
}%
\newcommand{\xebaposter@box@boxshape@roundedleft}{%
  (\xebaposter@box@name tnw) {[rc]-- (\xebaposter@box@name sw)} -- %
  (\xebaposter@box@name se) -- (\xebaposter@box@name tne)%
}%
\newcommand{\xebaposter@box@boxshape@roundedright}{%
  (\xebaposter@box@name tnw) -- (\xebaposter@box@name sw) {[rc]-- %
  (\xebaposter@box@name se)} -- (\xebaposter@box@name tne)%
}%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Draw box background (one function for each possible value)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% These functions take no arguments
\newcommand{\xebaposter@box@drawbackground@none}[2]{%
  \tikzstyle{box colors}=[]%
}%
\newcommand{\xebaposter@box@drawbackground@plain}[2]{%
  \tikzstyle{box colors}=[fill=#1]%
  \fill[box colors] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawbackground@shadelr}[2]{%
  \tikzstyle{box colors}=[shading=axis, left color=#1, right color=#2]%
  \fill[box colors] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawbackground@shaderl}[2]{%
  \tikzstyle{box colors}=[shading=axis, left color=#2, right color=#1]%
  \fill[box colors] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawbackground@shadetb}[2]{%
  \tikzstyle{box colors}=[shading=axis, top color=#1, bottom color=#2]%
  \fill[box colors] \xebaposterBoxGetShape;%
}%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Draw box border
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% These functions take two arguments: borderColor
\newcommand{\xebaposter@box@drawborder@none}[1]{}%
\newcommand{\xebaposter@box@drawborder@bars}[1]{%
  \draw[color=#1] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawborder@coils}[1]{%
  \draw[color=#1,segment amplitude=0.35em,segment length=0.4em,snake=coil] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawborder@triangles}[1]{%
  \draw[color=#1,segment amplitude=0.2em,segment length=0.4em,snake=triangles] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawborder@rectangle}[1]{%
  \draw[color=#1] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawborder@rounded}[1]{%
  \draw[color=#1] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawborder@roundedleft}[1]{%
  \draw[color=#1] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawborder@roundedright}[1]{%
  \draw[color=#1] \xebaposterBoxGetShape;%
}%
\newcommand{\xebaposter@box@drawborder@faded}[1]{%
  % This is the right way to do it, but it does not work with evince, and has problems during printing, so instead we do
  %\draw[color=#1,path fading=south] \xebaposterBoxGetShape;%
  % this
  \foreach \x in {0,1,...,90} \draw[color=#1!\x] ($(\xebaposter@box@name tnw)!{(100-\x)/100}!(\xebaposter@box@name sw)$) -- ($(\xebaposter@box@name tnw)!{(100-(\x+10))/100}!(\xebaposter@box@name sw)$);%
  \foreach \x in {0,1,...,90} \draw[color=#1!\x] ($(\xebaposter@box@name tne)!{(100-\x)/100}!(\xebaposter@box@name se)$) -- ($(\xebaposter@box@name tne)!{(100-(\x+10))/100}!(\xebaposter@box@name se)$);%
}%
\newcommand{\xebaposter@box@drawborder@roundedsmall}[1]{%
  \draw[color=#1] \xebaposterBoxGetShape;%
}%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Return shape path of text box (depending on the box shape)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% These functions take no arguments
% TODO: For headerborder==none, use (\xebaposter@box@name outer tnw) instead!
\newcommand{\xebaposter@box@headershape@rectangle}{%
  (\xebaposter@box@name tnw) -- (\xebaposter@box@name nw) -- %
  (\xebaposter@box@name ne) -- (\xebaposter@box@name tne)%
}%
\newcommand{\xebaposter@box@headershape@smallrounded}{%
  (\xebaposter@box@name tnw) {[src] -- (\xebaposter@box@name nw) -- %
  (\xebaposter@box@name ne)} -- (\xebaposter@box@name tne)%
}%
\newcommand{\xebaposter@box@headershape@roundedright}{%
  (\xebaposter@box@name tnw) -- (\xebaposter@box@name nw) {[rc] -- %
  (\xebaposter@box@name ne)} -- (\xebaposter@box@name tne)%
}%
\newcommand{\xebaposter@box@headershape@roundedleft}{%
  (\xebaposter@box@name tnw) {[rc]-- (\xebaposter@box@name nw)} -- %
  (\xebaposter@box@name ne) -- (\xebaposter@box@name tne)%
}%
\newcommand{\xebaposter@box@headershape@rounded}{%
  (\xebaposter@box@name tnw) {[rc] -- (\xebaposter@box@name nw) -- %
  (\xebaposter@box@name ne) } -- (\xebaposter@box@name tne)%
}%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Header text drawing (one function for each possible value of headershape)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% These functions take one argument: the header text
\newcommand{\xebaposter@box@headerdrawtext@rectangle}[1]{%
\if@xebaposter@persian
  \path (\xebaposter@box@name ne) +(0em,-0.5\xebaposter@box@@boxheaderheight) node[anchor=east,inner sep=0.4em] {#1};%
\else
  \path (\xebaposter@box@name nw) +(0em,-0.5\xebaposter@box@@boxheaderheight) node[anchor=west,inner sep=0.4em] {#1};%
\fi  
}%
\newcommand{\xebaposter@box@headerdrawtext@smallrounded}[1]{%
  \path (\xebaposter@box@name nw) +(0.5\boxwidth,-0.5\xebaposter@box@@boxheaderheight) node[anchor=center] {#1};%
}%
\newcommand{\xebaposter@box@headerdrawtext@roundedright}[1]{%
\if@xebaposter@persian
  \path (\xebaposter@box@name ne) +(0em,-0.5\xebaposter@box@@boxheaderheight)%
        node[anchor=east,inner sep=0.4em,text depth=0.4em] {#1};%
\else
  \path (\xebaposter@box@name nw) +(0em,-0.5\xebaposter@box@@boxheaderheight)%
        node[anchor=west,inner sep=0.4em,text depth=0.4em] {#1};%
\fi 
}%
\newcommand{\xebaposter@box@headerdrawtext@roundedleft}[1]{%
\if@xebaposter@persian
  \path (\xebaposter@box@name ne) +(0em,-0.5\xebaposter@box@@boxheaderheight)%
        node[anchor=east,inner sep=0.4em] {#1};
\else 
  \path (\xebaposter@box@name nw) +(0em,-0.5\xebaposter@box@@boxheaderheight)%
        node[anchor=west,inner sep=0.4em] {#1};
\fi 
}%
\newcommand{\xebaposter@box@headerdrawtext@rounded}[1]{%
    \path (\xebaposter@box@name nw) +(0.5\boxwidth,-0.5\xebaposter@box@@boxheaderheight) node[anchor=center] {#1};%
}%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Header shade options and functions (one function for each possible value)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% These functions take two arguments: headerColorOne, headerColorTwo and borderColor
\newcommand{\xebaposter@box@headershade@shadelr}[3]{%
    \debug{Header-Shade: Shade Left - Right}%
    \tikzstyle{header colors}=[%
      color=#3,%
      shading=axis,%
      left color=#1,%
      right color=#2%
    ]%
}%
\newcommand{\xebaposter@box@headershade@shaderl}[3]{%
    \debug{Header-Shade: Shade Right - Left}%
    \tikzstyle{header colors}=[%
      color=#3,%
      shading=axis,%
      left color=#2,%
      right color=#1%
    ]%
}%
\newcommand{\xebaposter@box@headershade@shadetb}[3]{%
    \debug{Header-Shade: Shade Top - Bottom}%
    \tikzstyle{header colors}=[%
      color=#3,%
      shading=axis,%
      top color=#1,%
      bottom color=#2%
    ]%
}%
\newcommand{\xebaposter@box@headershade@shadetbinverse}[3]{%
    \debug{Header-Shade: Shade Top - Bottom - Inverse }%
    \tikzstyle{header colors}=[%
      color=#3,%
%      top color=#1!75!#2,%
%      bottom color=#2!100!#1,%
      top color=#2,%
      bottom color=#1,%
      shading angle=20%
    ]%
    \colorlet{xebaposterHeaderFontColor}{white}%
}%
\newcommand{\xebaposter@box@headershade@plain}[3]{%
    \debug{Header-Shade: Plain}%
    \tikzstyle{header colors}=[%
      color=#3,%
      fill=#1%
    ]%
}%
\newcommand{\xebaposter@box@headershade@none}[3]{%
    \debug{Header-Shade: none}%
    \tikzstyle{header colors}=[]%
}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The main poster environment
%%% \begin{xebaposter}{settings}{Eye Catcher}{Title}{Author}{University Logo}
%%%-----------------------------------------------------------------------------
%%% The settings are
%%%   - grid=true,[false]:Show grid to help with alignment
%%%   - colspacing=0.7em: Column spacing
%%%   - columns=4:        number of columns (default 4 in landscape and 3 in portrait format) (maximum number is 6)
%%%   - color=[orange]:   xcolor color definition used as the main color of the poster
%%%   - colortwo=[white]: The other color for gradient based layouts
%%%   - textborder=none,bars,coils,triangles,rectangle,rounded,roundedsmall,roundedleft,roundedright,[faded]
%%%                       The style of the box around the text area
%%%   - headerborder=none,closed,open
%%%                       No extra border around box header, full border around box header or border that is open below.
%%%   - headershape=rectangle,rounded,roundedleft,roundedright
%%%                       Shape of the box-header region
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{poster}[5]{% BEGIN poster begin
  \thispagestyle{empty}% Suppress Page Number
  \debug{Poster Starts}%
  % This setkeys call parses all provided options and depending on the option
  % value, assigns different handler functions to the \xebaposter(Box|Header)*
  % functions. Once that is done, we don't have to care about particular
  % values for border, shading, etc. All we have to do is call the
  % handler functions and let them do their job.
  % This also allows the user to override the poster-wide defaults on a per-box
  % basis.
  \setkeys[ba]{posterbox,poster}{#1}%
%
  % TODO: Move all those assignments to the key macros!
  % Parse Keys%
  \colorlet{bgColorOne}{\xebaposter@bgColorOne}%
  \colorlet{bgColorTwo}{\xebaposter@bgColorTwo}%
%
  %% Boxes%
  \setlength{\headerheight}{\xebaposter@headerheight}%
  \setlength{\colheight}{\textheight-\xebaposter@headerheight}%
  \renewcommand{\@@previousbox}{notset}%
%
  \debug{Format}%
  % Set default for columns if unset (4 for landscape, 3 for portrait)
  \ifthenelse{\equal{\xebaposter@columns}{}}{%
    \renewcommand{\xebaposter@columns}{\if@landscape4\else3\fi}%
  }{}%
%
  \debug{Columns: \xebaposter@columns}%
  \setlength{\xebaposter@@colspacing}{\xebaposter@colspacing}%
  \setlength{\colwidth}{\textwidth}%
  \addtolength{\colwidth}{\xebaposter@@colspacing*(1-\xebaposter@columns)}%
  \ifcase\xebaposter@columns\relax%
    \error{You need to have at least one column!}%
  \or % 1
    \setlength{\colwidth}{\colwidth}%
  \or % 2
    \setlength{\colwidth}{0.5\colwidth}%
  \or % 3
    \setlength{\colwidth}{0.3333333333333\colwidth}%
  \or % 4
    \setlength{\colwidth}{0.25\colwidth}%
  \or % 5
    \setlength{\colwidth}{0.2\colwidth}%
  \or % 6
    \setlength{\colwidth}{0.16666666666\colwidth}%
  \else % >6
    \error{You do not want so many columns}%
  \fi%
%
  \newcommand{\xebaposter@reference}{north west}%
%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % A box with a header and some content. The basic unit of the poster%
  %---------------------------------------------------------------------------%
  % Each box has a name and can be placed absolutely or relatively.%
  % The only inconvenience is that you can only specify a relative position %
  % towards an already declared box. So if you have a box attached to the %
  % bottom, one to the top and a third one which should be inbetween, you %
  % have to specify the top and bottom boxes before you specify the middle %
  % box.%
  %%
  % below=  name of other node%
  % above=  name of other node%
  % aligned=name of other node%
  % bottomaligned=name of other node%
  % column= [0]     %
  % row=    [0]     %
  % span=   [1]     %
  % height= <size in percent of column height>,[auto]%
  % name=   [noname]%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
  % Backward-compatibility definition (\headerbox command uses posterbox env):
  \newcommand{\headerbox}[3]{%
    \begin{posterbox}[##2]{##1}%
      ##3%
    \end{posterbox}%
  }%
%
  \newenvironment{posterbox}[2][]{%
    \debug{Poster box options: ##1}%
    % Override the poster-wide defaults on a per-box basis
    \setkeys[ba]{posterbox}{##1}%
%
\if@xebaposter@persian
    \def\xebaposter@box@title{\rl{##2}}%
\else    
    \def\xebaposter@box@title{{##2}}%
\fi    
%
    \colorlet{borderColor}{\xebaposter@box@borderColor}%
    \colorlet{headerColorOne}{\xebaposter@box@headerColorOne}%
    \colorlet{headerColorTwo}{\xebaposter@box@headerColorTwo}%
    \colorlet{headerFontColor}{\xebaposter@box@headerFontColor}%
    \colorlet{boxColorOne}{\xebaposter@box@boxColorOne}%
    \colorlet{boxColorTwo}{\xebaposter@box@boxColorTwo}%
%
    \setlength{\xebaposter@box@@cornerradius}{\xebaposter@box@cornerradius}%
    \setlength{\xebaposter@box@@boxheaderheight}{\xebaposter@box@boxheaderheight}%
    \setlength{\xebaposter@box@@boxpadding}{\xebaposter@box@boxpadding}%
%
%
    %% The columns is always given absolute
\if@xebaposter@persian
    % boxstartx = (columns-column-span) * colwidth + (columns-column-span) * colspacing    
%    \setlength{\boxstartx}{(\xebaposter@columns+-\xebaposter@box@column+-\xebaposter@box@span)*\colwidth+(\xebaposter@columns+-\xebaposter@box@column+-\xebaposter@box@span)*\xebaposter@@colspacing}%   
   \setlength{\boxstartx}{\xebaposter@columns\colwidth}%
    \addtolength{\boxstartx}{-\xebaposter@box@column\colwidth}%
    \addtolength{\boxstartx}{-\xebaposter@box@span\colwidth}%
    \addtolength{\boxstartx}{\xebaposter@columns\xebaposter@@colspacing}%
    \addtolength{\boxstartx}{-\xebaposter@box@column\xebaposter@@colspacing}%
    \addtolength{\boxstartx}{-\xebaposter@box@span\xebaposter@@colspacing}%
\else
    % boxstartx = column * colwidth + column * colspacing
    \setlength{\boxstartx}{(\colwidth+\xebaposter@@colspacing)*\xebaposter@box@column}%
\fi 
%
    %% The width is gvien absolute
    % Box Width = span * colwidth + (span-1) * colspacing
    \setlength{\boxwidth}{\xebaposter@box@span\colwidth} %
    \addtolength{\boxwidth}{\xebaposter@@colspacing*(\xebaposter@box@span-1)}%
%
    %% Measure the content of the box%
    \setbox\xebaposter@box@content=\hbox\bgroup%
      \begin{pgfinterruptpicture}%
        \begin{minipage}[t]{\boxwidth-\xebaposter@box@@boxpadding*2}
\if@xebaposter@persian
        \persian%
\fi
          \xebaposter@box@textfont\bgroup%
  }% End of posterbox preamble
  %%% HERE COME THE ACTUAL CONTENTS OF THE POSTERBOX ENVIRONMENT
  {% posterbox handling after contents (i.e. drawing everything)
          \egroup%
        \end{minipage}%
      \end{pgfinterruptpicture}%
    \egroup%
    \setlength{\boxheight}{\ht\xebaposter@box@content}%
    \addtolength{\boxheight}{\dp\xebaposter@box@content}%
    \addtolength{\boxheight}{\xebaposter@box@@boxheaderheight} % Header%
    \addtolength{\boxheight}{2\xebaposter@box@@boxpadding} % Inner Sep
%
    \ifthenelse{\equal{\xebaposter@box@height}{bottom}}{%
    }{\ifthenelse{\equal{\xebaposter@box@height}{auto}}{%
    }{ % Neither auto nor bottom%
      \setlength{\boxheight}{\xebaposter@box@height\colheight}%
    }}%
%
    %% Determine the box position%
    \debug{Setting Coordinates}%
    \debug{Upper Right}%
    \debug{\xebaposter@box@name}%
%
    %%% Upper Right Corner%
    % if below=auto, set it to the previous box
    % TODO: We should generalize this to the previous box of the used column,
    %       currently we use the previous box, which might be in a different column
    \ifthenelse{\equal{\xebaposter@box@below}{auto}}{%
        \edef\xebaposter@box@below{\@@previousbox}%
        \debug{Box \xebaposter@box@name  has below=auto, placing it below box \xebaposter@box@below.}%
    }{}%
    \xdef\@@previousbox{\xebaposter@box@name}%
%
    \ifthenelse{\not\equal{\xebaposter@box@below}{notset} }{%
      %% Below%
      \debug{Below}%
      \path[shape=coordinate] (\boxstartx,0pt |- \xebaposter@box@below se) ++(0pt,-\xebaposter@@colspacing) coordinate(\xebaposter@box@name nw);%
    }{%
      \ifthenelse{\not\equal{\xebaposter@box@aligned}{notset} }{%
        %% Aligned%
        \debug{Aligned: \xebaposter@box@aligned}%
        \path[shape=coordinate] (\boxstartx,0pt |- \xebaposter@box@aligned nw) coordinate(\xebaposter@box@name nw);%
      }{%
        %% Fixed%
        \debug{Fixed}%
        \setlength{\boxstarty}{\xebaposter@box@row\colheight}%
        \path[shape=coordinate] (\boxstartx,\colheight-\boxstarty) coordinate(\xebaposter@box@name nw);%
    }}%
%
    %% Lower Left Corner%
    \debug{Lower Left}%
    \ifthenelse{\equal{\xebaposter@box@above}{bottom}}{%
      %% Above = Bottom%
      \debug{Above bottom}%
      \ifthenelse{\equal{\xebaposter@box@below}{notset} \and \equal{\xebaposter@box@aligned}{notset}}{%
      \path[shape=coordinate] (\boxstartx,\boxheight) coordinate(\xebaposter@box@name nw);%
      }{}%
      \path[shape=coordinate] (\boxstartx+\boxwidth,0pt)                                                           coordinate(\xebaposter@box@name se);%
      }{\ifthenelse{\not \equal{\xebaposter@box@bottomaligned}{notset}}{%
        \path[shape=coordinate] (\boxstartx+\boxwidth,0pt |- \xebaposter@box@bottomaligned se)                       coordinate(\xebaposter@box@name se);%
      }{{\ifthenelse{\not \equal{\xebaposter@box@above}{notset}}{%
        %% Above = Node%
        \path[shape=coordinate] (\boxstartx+\boxwidth,0pt |- \xebaposter@box@above nw)  +(0pt,\xebaposter@@colspacing) coordinate(\xebaposter@box@name se);%
      }{%
        %% Above = notset%
        \debug{Above=not set}%
        \ifthenelse{\equal{\xebaposter@box@height}{bottom}}{%
          %% height=bottom%
          \debug{height=bottom}%
          \path[shape=coordinate] (\boxstartx+\boxwidth,0pt)                                                       coordinate(\xebaposter@box@name se);%
        }{ %% height=auto or fixed%
          \debug{height=auto or fixed}%
          \path[shape=coordinate] (\xebaposter@box@name nw) ++(\boxwidth,-\boxheight)                                coordinate(\xebaposter@box@name se);%
	  }}}}}%
%
        %
    % Set coordinates relative to nw,se%
    \debug{Fixing Coordinates}%
    \path[shape=coordinate]%
      (\xebaposter@box@name nw) +(0pt,-\xebaposter@box@@boxheaderheight)    coordinate(\xebaposter@box@name tnw)%
      (\xebaposter@box@name nw |- \xebaposter@box@name se)                  coordinate(\xebaposter@box@name sw)%
      (\xebaposter@box@name se |- \xebaposter@box@name nw)                  coordinate(\xebaposter@box@name ne)%
      (\xebaposter@box@name ne) +(0pt,-\xebaposter@box@@boxheaderheight)    coordinate(\xebaposter@box@name tne)%
%
      (\xebaposter@box@name nw)  +(-0.025em,0pt)                          coordinate(\xebaposter@box@name outer nw)%
      (\xebaposter@box@name tnw) +(-0.025em,0pt)                          coordinate(\xebaposter@box@name outer tnw)%
      (\xebaposter@box@name sw)  +(-0.025em,0pt)                          coordinate(\xebaposter@box@name outer sw)%
%
      (\xebaposter@box@name ne)  +( 0.025em,0pt)                          coordinate(\xebaposter@box@name outer ne)%
      (\xebaposter@box@name tne) +( 0.025em,0pt)                          coordinate(\xebaposter@box@name outer tne)%
      (\xebaposter@box@name se)  +( 0.025em,0pt)                          coordinate(\xebaposter@box@name outer se);%
%
      %% Setting the bg colors of the box header
      \xebaposterHeaderSetShade{headerColorOne}{headerColorTwo}{borderColor}%
%
      \tikzstyle{rc}=[rounded corners=\xebaposter@box@@cornerradius];%
      \tikzstyle{src}=[rounded corners=0.5em];%
%

    %% Now that everything is set up, draw the actual box, with bg and header
    \begin{scope}[line width=\xebaposter@box@linewidth]%
      %% Header%
      \debug{Header}%
      \debug{Header-Shape: \xebaposter@box@headershape, header-border: \xebaposter@box@headerborder (\xebaposter@box@headerbordernr)}%
      % TODO: Also turn this last ifcase construct into a handler function
      %       We only need to determine (fill|shade)(draw|)...
       \xebaposterHeaderDrawBackground{bgColorOne}{bgColorTwo}{borderColor}
       \xebaposterHeaderDrawBorder{borderColor}
      \ifcase\xebaposter@box@headerbordernr\relax%
        % open
        \ifthenelse{\equal{\xebaposter@box@headershade}{plain}}{%
          \filldraw  [style=header colors] \xebaposterHeaderGetShape;%
        }{%
          \shadedraw [style=header colors] \xebaposterHeaderGetShape;%
        }%
      \or
        % closed
        \ifthenelse{\equal{\xebaposter@box@headershade}{plain}}{%
          \filldraw  [style=header colors] \xebaposterHeaderGetShape -- cycle;%
        }{%
          \shadedraw [style=header colors] \xebaposterHeaderGetShape -- cycle;%
        }%
      \or
        % none
        \ifthenelse{\equal{\xebaposter@box@headershade}{plain}}{%
          \fill      [style=header colors] \xebaposterHeaderGetShape;%
        }{%
          \shade     [style=header colors] \xebaposterHeaderGetShape;%
        }%
      \fi
      %
      %% Draw the text inside the box header:
    %%% %%% %%% %%% %%% buggy part because of color!! %%% %%% %%% %%% %%% %%% 
      \xebaposterHeaderDrawText{\hbox{{\color{headerFontColor}\xebaposter@box@headerfont%
      {\xebaposter@box@title}}}};%
      %
      %% Text borders (border around boxes)
      \debug{Poster boxes}%
      % First set box shade
      \xebaposterBoxDrawBackground{boxColorOne}{boxColorTwo}%
      \xebaposterBoxDrawBorder{borderColor}%
      %%
      %% Text Box%
      \debug{Drawing Text}%
      \path (\xebaposter@box@name tnw) node(text) [anchor=north west,%
            outer sep=-0.000em,text width=\boxwidth-2\xebaposter@box@@boxpadding,inner sep=\xebaposter@box@@boxpadding,%
            text justified] {{\usebox{\xebaposter@box@content}}};%
    \end{scope}%
    %
    % Finally store the box name as the previous box for the next call
%     \xdef\@@previousbox{\xebaposter@box@name}%
  }% END of posterbox definition
%
  %% Poster Background%
  \xebaposterPosterDrawBackground{bgColorOne}{bgColorTwo}%
  %% Poster header/title
  \hspace{-1.5em}%
  \begin{tikzpicture}[inner sep=0pt,outer sep=0pt,line width=0.05em,align=right]%
    \useasboundingbox (0em,0em) rectangle(\textwidth,\textheight);%
    \path[shape=coordinate]%
      (0pt,\colheight) coordinate(north west) (\textwidth,\colheight) coordinate(north east)%
      (0pt,0pt) coordinate(south west) (\textwidth,0pt) coordinate(south east);%
%
    \ifxebaposter@eyecatcher% Has eye catcher
      \debug{Eyecatcher found!}%
      \setbox\xebaposter@titleimage@left=\hbox{#2}%
    \else% Has no eye catcher%
      \setbox\xebaposter@titleimage@left=\hbox{}%
    \fi%
    \setlength{\xebaposter@titleimage@left@width}{\wd\xebaposter@titleimage@left}%
    \setbox\xebaposter@titleimage@right=\hbox{#5}%
    \setlength{\xebaposter@titleimage@right@width}{\wd\xebaposter@titleimage@right}%
    \setlength{\xebaposter@titleimage@textwidth}{\textwidth}%
    \addtolength{\xebaposter@titleimage@textwidth}{-\xebaposter@titleimage@left@width}%
    \addtolength{\xebaposter@titleimage@textwidth}{-\xebaposter@titleimage@right@width}%
%
    \debug{#3}%
    %
    %
    %      % Draw Header%
    \draw (north west) +(0em,1em+0.5\headerheight) node(image)[anchor=west]   { {\usebox{
\if@xebaposter@persian
    \xebaposter@titleimage@right
\else
    \xebaposter@titleimage@left
\fi     }} };%
    \draw (north east) +(0em,1em+0.5\headerheight) node(logo) [anchor=east]   { {\usebox{
\if@xebaposter@persian
    \xebaposter@titleimage@left
\else 
    \xebaposter@titleimage@right
\fi     }} };%
    %
    \ifxebaposter@eyecatcher% Has eye catcher%
      \draw (image.east) node(title)[anchor=west,text width=\xebaposter@titleimage@textwidth]{%
        \begin{minipage}{\xebaposter@titleimage@textwidth}%
          \begin{center}%
\if@xebaposter@persian
          \textbf{\Huge \rl{#3}}\\%
          {\Large \rl{#4}}%
\else
          \textbf{\Huge #3}\\%
          {\Large #4}%
\fi          
          \end{center}%
        \end{minipage}%
      };%
    \else% Has no eye catcher
      \draw (image.east) node(title)[anchor=west]  { {\begin{minipage}{\xebaposter@titleimage@textwidth}
\if@xebaposter@persian      
      \persian{\bfseries\Huge\rl{#3}}\\{\Large\rl{#4}}
\else
      {\bfseries\Huge #3}\\{\Large #4}
\fi      
      \end{minipage}} };%
    \fi
  }% END poster begin
% The body
  {% BEGIN poster end
    % The end, draw gridlines if neccesary
    \ifxebaposter@grid
      \newdimen{\gridpos}%
      \pgfmathsetmacro{\z}{\xebaposter@columns-1}%
      \foreach \y in {0,...,\z}%
      {%
        \setlength{\gridpos}{\y\colwidth+\y\xebaposter@@colspacing}%
        \draw[draw=green,draw opacity=0.7] (\gridpos,0pt)  -- (\gridpos,\colheight)%
            (\gridpos+\colwidth,0pt)  -- (\gridpos+\colwidth,\colheight);%
      }%
      % Horizontal lines, every 0.1:
      %% Explicitly list all percentages, because with {0.0, 0.1, ..., 1.0} we
      %% get rounding errors in the displayed numbers!
      \foreach \y in {0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0}%
        {\if@xebaposter@persian
            \draw[draw=green,draw opacity=0.7]  (\textwidth,\colheight-\y\colheight) --%
                (0pt,\colheight-\y\colheight) node[anchor=east] {\y};%        
        \else
            \draw[draw=green,draw opacity=0.7] (0pt,\colheight-\y\colheight)  --%
                (\textwidth,\colheight-\y\colheight) node[anchor=west] {\y};%
        \fi|}%    
    \fi%
  \end{tikzpicture}%
%  \xkvview{}
 \par
  }% END poster end
