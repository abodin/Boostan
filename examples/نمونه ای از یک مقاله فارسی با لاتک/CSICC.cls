% نام قالب را تعیین می کند و همچنین بیان می کند که آخرین به روز رسانی  این قالب در چه زمانی بوده است. یک توصف مختصر هم از این بسته در اینجا امده است.
\ProvidesClass{CSICC2016}[2023/05/06]

% تمام پارامترهای ورودی برای تنظیم متن را به کلاس زیر ارسال می‌کنیم
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions % Now we'll execute any options passed in

\LoadClass[11pt,twocolumn]{article}

% تمام بسته های مورد نیاز برای ایجاد یک مقاله به صورت کامل اینجا آورده شده است در صورتی که بخواهید از بسته های دیگر استفاده کنید بهتر است که آن‌ها را به گونه ای انتخاب کنید که با این بسته ها تداخل نداشته باشد. 
\RequirePackage{amsthm,amssymb,amsmath}
% اگر بخواهید چند شکل را در کنار همدیگر داشته باشید، از این بسته استفاده می‌کنیم.
\RequirePackage{subcaption}
%بسته‌ای برای نوشتن محیط الگوریتم
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

\RequirePackage{cuted}

% در این قالب از بسته graphx برای انجام کارهای گرافیکی استفاده می‌شود. این بسته برای اضافه کردن تصویرها به متن استفاده شده است.
\RequirePackage{graphicx}
% بسته‌ای برای تبدیل تمامی پاورقی‌ها به آخرنویس
\RequirePackage{endnotes}
% بسته‌ای برای وارد کردن اسامی نویسندگان در مقاله
\RequirePackage{authblk}
% برای تنظیم حاشیه صفحات، لطفا این تنظیم را تغییر ندهید.
\RequirePackage[top=25mm, bottom=25mm, left=20mm, right=20mm, a4paper]{geometry}

%تنظیمات مربوط به طول ستون‌ها و فاصله بین آن‌ها. لطفا این تنظیم را تغییر ندهید.
\setlength{\columnwidth}{82mm}
\setlength{\columnsep}{6mm}

% بسته ای برای رنگی کردن لینک ها و فعال سازی لینک ها در یک نوشتار، بسته hyperref باید جزو آخرین بسته‌هایی باشد که فراخوانی می‌شود. 
\RequirePackage[pagebackref =true,colorlinks=true,citecolor=blue]{hyperref}

%زی‌پرشین (به انگلیسی: XePersian) یک بسته حروف‌چینی رایگان و متن‌باز برای نگارش مستندات پارسی/انگلیسی با زی‌لاتک است. در واقع، زی‌پرشین، کمک می‌کند تا به آسانی، مستندات را به پارسی، حروف‌چینی کرد. این بسته را وفا خلیقی نوشته است،\setlist[itemize]{topsep=0pt}
% و به طور منظم، آن را بروز‌رسانی کرده و باگ‌های آن را رفع می‌کند.
% نکته مهم این جا است که بسته Xepersian برای پشتیبانی از زبان فارسی آورده شده است، و  می بایست آخرین بسته ای باشد که شما وارد می کنید، دقت کنید: آخرین بسته 
\usepackage{xepersian}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  تنظیم اندازه فونت ها،

\settextfont[Scale=1]{IRMitra}
\setlatintextfont[Scale=.88]{Times New Roman}

\defpersianfont\titleFont[Scale=1.5]{IRMitra Bold}
\defpersianfont\AbstractBold[Scale=.95]{IRMitra Bold}
%%  با استفاده از این دستور می‌توان فونت و فارسی و یا انگلیسی بودن اعداد در فرمول‌ها را به حالت اولیه (یعنی پیش‌فرض لاتک) برگرداند.
%\DefaultMathsDigits

%% اختصاص - به عنوان جداکننده شماره بخش و زیربخش
\SepMark{-}


% تغییر نام algorithm به الگوریتم
\floatname{algorithm}{الگوریتم}

% با دستور زیر اندازه فرمولها را تغییر می‌دهیم. این دستور با فونت اندازه ۱۲ به خوبی کار می‌کند ولی با فونت اندازه ۱۱ که دراین مقاله استفاده نموده‌ام که ۶ صفحه بیشتر نشود، مشکلاتی دارد. به سایت: زیر مراجعه فرمایید: http://www.latex-community.org/forum/viewtopic.php?f=5&t=1792
\DeclareMathSizes{10.95}{9.2}{7.3}{5.5} %12,10,8,6

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% تغییر در عنوان صفحه شروع، و تنظیم فونت و فاصله
\bidi@patchcmd{\@maketitle}{\@title}{\vskip 15mm\titleFont\@title}

% دستوراتی برای نحوه نمایش اسامی نویسندگان

\renewcommand\Authands{ و }
\renewcommand\Authfont{\scshape\small}
\renewcommand\Affilfont{\small}

\newenvironment{myonecolumn}{\@twocolumnfalse}{}

% دستوری برای حذف حاشیه قسمت چکیده
\renewenvironment{abstract}{%
}{}

\linespread{1.2}

\let\AbstractBold\bfseries % dummy 

\renewenvironment{abstract}{%
\strip
\small \AbstractBold\noindent\textbf{\Large چکیده}%
\vskip 2mm
}
{\endstrip}


\newenvironment{keywords}{
\strip
\AbstractBold
\noindent\textbf{\Large کلمات کلیدی}%
\vskip 2mm
}{%
\endstrip
\vskip 1cm
}


%\titlespacing\section{0pt}{4pt plus 4pt minus 2pt}{3pt plus 2pt minus 2pt}
%\titlespacing\subsection{0pt}{6pt plus 4pt minus 2pt}{4pt plus 2pt minus 2pt}
%\titlespacing\subsubsection{0pt}{6pt plus 4pt minus 2pt}{4pt plus 2pt minus 2pt}

%% باز تعریف محیط شکل
\bidi@AtBeginEnvironment{figure}{
\def\@floatboxreset{\reset@font\centering\@setminipage}%
}


\theoremstyle{plain}
\newtheorem{theorem}{قضیه}
\newtheorem{principle}{اصل}
\newtheorem{lemma}{لم}
\newtheorem{proposition}{گزاره}
\theoremstyle{definition}
\newtheorem{definition}{تعریف}
\theoremstyle{remark}
\newtheorem{corollary}{نتیجه}
\newtheorem{remark}{ملاحظه}



%% تعریف یک محیط برای  اثبات لم ها. در این محیط بر خلاف محیط proof ساده، یک مربع توخالی می‌گذارد. 
\let\oldproof\proof
\let\oldendproof\endproof
\def\lemmaproof{\paragraph{\textit{اثبات لم.}} }
\def\endlemmaproof{\hfill$\blacksquare$\oldendproof}

%\renewcommand{\bibname}{\large مراجع}
\bibliographystyle{ieeetr-fa}

\let\Oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
\baselineskip=.4cm
\settextfont[Scale=.9]{IRMitra}
\setlatintextfont[Scale=.8]{Times New Roman}
\Oldbibliography{#1}
\settextfont[Scale=1]{IRMitra}
\setlatintextfont[Scale=.88]{Times New Roman}
}%

% حذف شماره صفحه از تمامی صفحات
\pagenumbering{gobble}



% دستورات لازم به منظور تغییر تمامی footnote ها و LTRfootnote ها به endnote
\def\LTRendnote{\@ifnextchar[\@xendnote{\stepcounter{endnote}%
     \protected@xdef\@theenmark{\theendnote}%
     \@endnotemark\@LTRendnotetext}}
\def\RTLendnote{\@ifnextchar[\@xendnote{\stepcounter{endnote}%
     \protected@xdef\@theenmark{\theendnote}%
     \@endnotemark\@RTLendnotetext}}
\let\@LTRdoanenote=0
\let\@RTLdoanenote=0
\long\def\@endnotetext#1{%
     \if@enotesopen \else \@openenotes \fi
     \immediate\write\@enotes{\@doanenote{\@theenmark}}%
     \begingroup
        \def\next{\if@RTL@footnote\else\latinfont\fi#1}%
        \newlinechar='40
        \immediate\write\@enotes{\meaning\next}%
     \endgroup
     \immediate\write\@enotes{\@endanenote}}
\long\def\@LTRendnotetext#1{%
     \if@enotesopen \else \@openenotes \fi
     \immediate\write\@enotes{\@LTRdoanenote{\@theenmark}}%
     \begingroup
        \def\next{\latinfont#1}%
        \newlinechar='40
        \immediate\write\@enotes{\meaning\next}%
     \endgroup
     \immediate\write\@enotes{\@endanenote}}
\long\def\@RTLendnotetext#1{%
     \if@enotesopen \else \@openenotes \fi
     \immediate\write\@enotes{\@RTLdoanenote{\@theenmark}}%
     \begingroup
        \def\next{\persianfont#1}%
        \newlinechar='40
        \immediate\write\@enotes{\meaning\next}%
     \endgroup
     \immediate\write\@enotes{\@endanenote}}
\def\theendnotes{\immediate\closeout\@enotes \global\@enotesopenfalse
  \begingroup
    \makeatletter
    \edef\@tempa{`\string >}%
    \ifnum\catcode\@tempa=12%
      \let\@ResetGT\relax
    \else
      \edef\@ResetGT{\noexpand\catcode\@tempa=\the\catcode\@tempa}%
      \@makeother\>%
    \fi
    \def\@doanenote##1##2>{\def\@theenmark{##1}\par\begingroup\if@RTL@footnote\@RTLtrue\else\@RTLfalse\fi
        \@ResetGT
        \edef\@currentlabel{\csname p@endnote\endcsname\@theenmark}%
        \enoteformat}
     \def\@LTRdoanenote##1##2>{\def\@theenmark{##1}\par\begingroup\@RTLfalse
        \@ResetGT
        \edef\@currentlabel{\csname p@endnote\endcsname\@theenmark}%
        \enoteformat}
         \def\@RTLdoanenote##1##2>{\def\@theenmark{##1}\par\begingroup\@RTLtrue
        \@ResetGT
        \edef\@currentlabel{\csname p@endnote\endcsname\@theenmark}%
        \enoteformat}
    \def\@endanenote{\par\endgroup}%
    \enoteheading
    \enotesize
    \input{\jobname.ent}%
  \endgroup}

\let\footnote=\endnote
\let\footnote\endnote
\let\RTLfootnote\RTLendnote
\let\LTRfootnote\LTRendnote
\renewcommand{\notesname}{پانویس‌ها}



% تنظیم فاصله قبل و بعد از فرمول
\g@addto@macro\normalsize{%
  \setlength\abovedisplayskip{5pt}
  \setlength\belowdisplayskip{5pt}
  \setlength\abovedisplayshortskip{5pt}
  \setlength\belowdisplayshortskip{5pt}
}

\bidi@patchcmd{\list}{\parskip\parsep}{\parskip-3pt}{}{}



\makeatletter
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-7.06939pt \@plus -4.30554pt \@minus -.861108pt}%
                                   {3.902742pt \@plus.861108pt}%
                                   {\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-5.99pt\@plus -3.30554pt \@minus -.861108pt}%
                                     {3.45831pt \@plus .861108pt}%
                                     {\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-5.99pt\@plus -3.30554pt \@minus -.861108pt}%
                                     {3.45831pt \@plus .861108pt}%
                                     {\normalfont\normalsize\bfseries}}
\makeatother
