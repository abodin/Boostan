%% در این قسمت تعریف شده است که این بسته به نسخه بالاتر یا مساوری 2e از LaTex نیاز دارد. نسخه های کمتر از آن در این قالب قابل استفاده نیست.
\NeedsTeXFormat{LaTeX2e}

%% نام  قالب را تعیین می کند و همچنین بیان می کند که آخرین به روز رسانی  این قالب در چه زمانی بوده است. یک توصف مختصر هم از این بسته در اینجا امده است.
\ProvidesClass{Boostan-Thesis}

%% تمام پارامترهای ورودی برای تنظیم متن را به کلاس زیر ارسال می‌کنیم
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}% or report or book or paper or what

\ProcessOptions % Now we'll execute any options passed in

%% Instead of defining each and every little detail required to create a new document class,
%% you can base your class on an existing document class.
\LoadClass[10pt,a4paper]{memoir}% or report or book or paper or whatever you class is closest to


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% در مورد تقدم و تاخر وارد کردن بسته ها تنها باید به چند نکته دقت کرد:
%%% الف) بسته xepersian حتما حتما باید آخرین بسته ای باشد که فراخوانی می شود
%%% ب) بسته hyperref جزو آخرین بسته هایی باید باشد که فراخوانی می شود.
%%% ج) بسته glossaries حتما باید بعد از hyperref فراخوانی شود. 
%%% د) بسته listings باید حتما قبل از  hyperref فراخوانی شود. 
%%%%%%%%%%%%%%%%%

%% تمام بسته های مورد نیاز برای ایجاد یک پایان نامه به صورت کامل اینجا آورده شده است در صورتی که بخواهید از بسته های دیگر استفاده کنید بهتر است که انها را به گونه ای انتخاب کنید که با این بسته ها تداخل نداشده باشد. نکته این که به نظر من استفاده از همین بسته ها کافی است.
\usepackage{amsthm,amssymb,amsmath}
%% برای تنظیم حاشیه صفحات
\usepackage[top=3cm, bottom=2.5cm, left=2cm, right=2.5cm]{geometry}
%% برای رنگی کردن متن و استفاده از رنگ در متن این دو بسته مورد نیاز است.
\usepackage[usenames,dvipsnames]{color}
\usepackage[usenames,dvipsnames]{xcolor}

%\usepackage{fancybox}

%%%%%%%%%%%%%%%
%%% بسته ای برای وارد کردن Watermarking
%\usepackage{draftwatermark}
%
%%% تنظیمات مربوط به ایجاد watermarking
%%% درصد روشنایی watermark
%\SetWatermarkLightness{.98}
%%% زاویه متن Watermark
%\SetWatermarkAngle{45}
%%% اندازه watermark
%\SetWatermarkScale{1.5}
%%% اگر بخواهید watermark شما یک رنگ دیگر داشته باشد، این سه خط را فعال کنید و رنگ مورد نظر خود را انتخاب کنید
%%\definecolor{orange}{RGB}{229,252,219} 
%%\let\oldSetWatermarkText\SetWatermarkText
%%\renewcommand{\SetWatermarkText}[1]{\oldSetWatermarkText{\textcolor{orange}{#1}}}
%
%%% متن watermark، این متن را شما می توانید در قبل از \begin{document}  مقداردهی کنید، به طور پیش فرض هیچ مقدار ندارد و هیچ گونه Watermark ای گذاشته نمی شود.
%\gdef\@status{}
%\def\status#1{\gdef\@status{#1}}

%%%%%%%%%%%%%%%

%% این سه بسته برای آوردن استایل‌های فصل‌های memoir مورد نیاز است. 
\usepackage{fourier} % or what ever
\usepackage[scaled=.92]{helvet}%. Sans serif - Helvetica
\usepackage{calc}
\usepackage{verbatim}
%% بسته ای برای استفاده از اشکال برای آیتم‌ها
\usepackage{pifont}
%% بسته ای برای آوردن فهرست اختصارات در متن 
\usepackage[intoc]{nomencl}

\DisemulatePackage{fancyhdr} 
%% اگر بخواهید چند شکل را در کنار همدیگر داشته باشید، از این بسته استفاده می‌کنیم.
\usepackage[font=footnotesize,labelformat=empty]{subfig}
%% بسته ای برای این که در جدول یک متن را در چند سطر بیاوریم. 
\usepackage{multirow}
%% بسته‌ای برای وارد کردن نمایه در متن
\usepackage{makeidx}

%%%%%%%%%%%%%%%

%% بسته ای برای وارد کردن کدهای برنامه نویسی (MATLAB، JAVA و ...( در متن
%% بارگذاری بسته listings باید قبل از hyperref باشد و گرنه با خطا مواجه خواهیم شد
\usepackage{listings}

%%==================== تنظیمات listing

%%  در این قسمت تمام ابزارهای مورد نیاز در نوشتن برنامه ها اورده شده 
%%  است. با استفاده از این ابزارهای می‌توان برنامه های مورد نیاز را در مستند جای داد.
\definecolor{listinggray}{gray}{.98}
%% انتخاب رنگ پشت زمینه 
\lstset{% general command to set parameter(s)
% زبان برنامه نویسی که به طور پیش فرض انتخاب می شود.
language=Java,
% رنگ پیش فرض برای پیش زمینه
backgroundcolor=\color{listinggray},
%% میزان طول محیط listings را مشخص می کند، به صورت پیش فرض \textwidth است. 
%linewidth=\textwidth ,
%% نوع قالب دور محیط listings را تعیین می کند. 
frameround=fttt,
frame=trBL,
%% is selected at the beginning of each listing. You could use \footnotesize,
%% \small, \itshape, \ttfamily, or something like that. The last token of
%% basic style must not read any following characters.
basicstyle=\ttfamily, % print whole listing small
%%   با این دستور استایل keyword ها را مشخص می کنیم. مثلا در این حالت گفته ایم که keyword ها را با رنگ آبی مشخص کند، و آن ها را bold‌کند. دقت کنید که keyword های زبان‌هایی که این بسته پشتیبانی می‌کند، 
%% در این بسته تعریف شده است. مثلا در JAVA کلمه main به صورت پیش فرض تعریف شده است و در صورت وجود آن در کد شما آن را Latex آبی رنگ می‌کند. 
keywordstyle=\color{blue}\bfseries,
% underlined bold black keywords
%identifierstyle=, % nothing happens
%framexleftmargin=5mm, frame=shadowbox, rulesepcolor=\color{red}
%% استایل String را در متن مشخص می کند. مثلا در این جا گفته شده است که رشته ها را با رنگ قرمز و به صورت ایتالیک نمایش بده.
stringstyle=\ttfamily\color{red}, % typewriter type for strings
%% نحوه استایل comment را مشخص می کند. دقت کنید که رنگ انتخاب شده نوعی رنگ سبز است، برای این که این رنگ شناخته شود می بایست دو بسته color و xcolor به صورتی که فراخوانی شده است، فراخوانی شود. 
commentstyle=\color{LimeGreen},
lineskip = .5pt,
%% سه دستور بعدی نحوه نمایش شماره خطوط را مشخص می کند. 
numberstyle=\footnotesize, 
%% تعیین فاصله بین شماره خطوط و محیط listings
numbersep=10pt,
%% محل قرارگیری شماره خطوط
numbers=left,
%% تعیین محل قرارگیری caption محیط. بطور پیش فرض در بالای محیط است که به پایین محیط تغییر داده شده است. 
captionpos=b, 
%% توسط breakline می توانید خاصیت شکسته شدن خطوط بلند را در محیط listings فعال و یا غیرفعال کنید.
%% activates or deactivates automatic line breaking of long lines.
breaklines=true,
%% باعث می شود که فاصله های بین رشته های نمایان شود.
%% lets blank spaces in strings appear  or as blank spaces
showstringspaces=true} 

%% البته شما می توانید این موارد پیش فرض را به ازای هر کد تغییر دهید. به عنوان مثال، ما یک کد در پوشه Code در شاخه فعلی قرار دادیم، می خواهیم آن را وارد متن کنیم، کافی است که خطوط زیر را در محل مناسبی که می خواهیم کد را قرار دهیم وارد کنیم. در این مثال یک فایل کد JAVA به نام myCode.java را می خواهیم وارد کنیم. 
%%\begin{latin}
%%\lstinputlisting[breaklines=true,numbers=left,language=Java, basicstyle=\ttfamily, numberstyle=\footnotesize, numbersep=10pt, captionpos=b, frame=single, breakatwhitespace=false]{Code/myCode.java}
%%\end{latin}


%%%%%%%%%%%%%%%

\usepackage{framed}
%% بسته ای برای وارد کردن الگوریتم در متن
\usepackage{algorithm}
\usepackage{algorithmic}
\floatname{algorithm}{الگوریتم}

%% بسته ای برای تنظیم caption‌ تصاویر و جداول، این تنظیمات شامل رنگ، فونت و اندازه و فاصله caption جداول و تصاویر می باشد. 
\usepackage{caption}
%%% تنظیمات مربوط به زیرنویس اشکال و جداول، این تنظیمات را تنها زمانی می‌توانید انجام دهید که بسته caption را فراخوانی کرده‌باشید. 
\captionsetup{margin=10pt,font=small,labelfont=bf,textfont={small},skip=9pt}

%% در این قالب از بسته graphx برای انجام کارهای گرافیکی استفاده می‌شود. این بسته
%% برای اضافه کردن تصویرها به متن استفاده شده است.
\usepackage{graphicx}

%% برای اضافه کردن تصاویر به متن این امکان وجود دارد که تصاویر را در پوشه‌های
%% متفاوت قرار داد. با این کار از زیاد شدن پرونده‌ها در مسیر مستند جلوگیری می
%% شود. علاوه بر این دسته‌ای از تصاویر وجود دارد که بین همه مستندها مشترک است
%% برای نمونه نماد پژوهشکده که بین همه مشترک است.  از این رو تعداد مسیر به عنوان
%% مسیرهای پیش فرض برای جستجوی تصاویر تعیین شده است.

%% بسته ای برای رسم اشکال و نمودارها
\usepackage{tikz,times}
\usetikzlibrary{mindmap,backgrounds,shadows}

%% بسته ای برای رنگی کردن لینک ها و فعال سازی لینک ها در یک نوشتار، بسته hyperref باید جزو آخرین بسته‌هایی باشد که فراخوانی می‌شود. 

\usepackage{hyperref}
%% در این قسمت تنظیمات بسته hyperref را قرار می دهیم.
%% این تنظیمات شامل موارد زیر است.
\hypersetup{
%% موقعی که فایل پی دی اف خروجی را باز می کنید صفحه به صورت عریض و بزرگ باز می شود.
pdfmenubar=false, pdfstartview=FitH, 
%% در قسمت مراجع شماره صفحه ای که به آن مرجع ارجاع داده است را وارد می کند،
%% مواردی که برای فعال سازی این که شماره اشکال را به صورت ارجاعی نشان دهد
%pagebackref =true,hyperfigures=true,
%% به جای استفاده از مربع قرمز دور موارد ارجاعی از لینک های رنگی استفاده کند.
colorlinks=true,
%% رنگ برخی از لینک ها در زیر تعریف شده است. 
linkcolor=blue, anchorcolor=green, citecolor=magenta, urlcolor=cyan, filecolor=magenta, pdftoolbar=true
%bookmarksopen = true,
%bookmarksopenlevel = 1
%%% اگر این option را true‌ بکنیم، آن‌گاه در کنار bookmark شماره فصل و بخش و زیربخش نیز می آید. مثلا می‌نویسد: ۱.۲ طراحی شبکه
%bookmarksnumbered = true
}


%% بسته‌ای برای وارد کردن واژه نامه در متن، این بسته باید بعد از hyperref حتما صدا زده شود. 
\usepackage[xindy]{glossaries}
%%زی‌پرشین (به انگلیسی: XePersian) یک بسته حروف‌چینی رایگان و متن‌باز برای نگارش مستندات پارسی/انگلیسی با زی‌لاتک است.
%% در واقع، زی‌پرشین، کمک می‌کند تا به آسانی، مستندات را به پارسی، حروف‌چینی کرد. این بسته را وفا خلیقی نوشته است،
%% و به طور منظم، آن را بروز‌رسانی کرده و باگ‌های آن را رفع می‌کند.
%% نکته مهم این جا است که بسته Xepersian برای پشتیبانی از زبان فارسی آورده شده است، و 
%% می بایست آخرین بسته ای باشد که شما وارد می کنید، دقت کنید: آخرین بسته 



\usepackage{xepersian}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% نکته اول: اندازه فونت.

%% نحوه تنظیم اندازه فونت ها، برگرفته از:
%% http://www.parsilatex.com/forum/SMF/index.php?topic=1349.0
%%اول باید دقت کنید که برای مثال فونت B Nazanin (مثل اکثر فونت‌های فارسی) از فونت‌هایی است که نسبت 10:12 داره (البته همه این طور نیستند فونت XB Zar نسبتش 10:10 و فونت Adobe Arabic نسبتش 10:14). 
%%نسبت 10:12 یعنی اینکه سایز ۱۲ این فونت معادل سایز 10pt استاندارد PostScript می‌باشد... که در واقع کوچکترین سایز استاندارد نوشتارهای بلند رسمی است.
%
%%سه سایز‌ استاندارد برای فن نوشتار‌های رسمی وجود دارد 
%%۱- سایز 10pt که سایز کوچک نامیده شده (که فونت‌سایز پیشفرض تک می‌باشد.(
%%۲- سایز 11pt که سایز متوسط نامیده می‌شود  
%%۳- سایز 12pt که سایز بزرگ محصوب می‌شود
%%در فونت‌های 10:12 
%%اندازه ۱۲ همان 10pt است
%%اندازه ۱۳ همان 11pt است  (در واقع ۱۳.۲ معادل 11pt  است)
%%اندازه ۱۴ همان 12pt است (در واقع ۱۴.۴ معادل 12pt است)
%%اگر می‌خواهید اندازه پایه‌ی نوشته‌های عادی 14 شود (یعنی متن عادی به اندازه 14 شود و سایر نوشته‌ها به نسبت آن تغییر کنند) از آنجا که اندازه ۱4 همان 12pt است باید دو کار زیر را انجام دهیم:
%% عمل اول: در دستور  loadClass عدد 12pt را بگذارید.
%% \LoadClass[12pt]{...}
%% عمل دوم: به هنگام بارگزاری کردن فونت‌های 10:12 باید از پارامتر Scale=1.2 در دستور انتخاب فونت استفاده کنید. 
%%مثلا در این جا به صورت زیر باید نوشت:
%%\settextfont[Scale=1.3]{B Nazanin} 
%%\settextfont[Scale=1.2]{XB Niloofar}
%% که اندازه می شود 1.2*12 که می آید 14.4 اگر 1.2 را کمتر کنیم می توانیم دقیقا اندازه 14 را بدست آوریم. 
%% تنظیمات پش فرض برای قلم و رنگ آن. در این قسمت نوع نوشتن متن و سرایندها تعیین شده است.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% نکته دوم: نوع فونت فارسی یا انگلیسی بودن آن. 
%% در نرم افزار word وقتی شما از یک فونت به عنوان نمونه B Nazanin استفاده می کنید، word در هنگام مواجه با کلمات انگلیسی، این کلمات را به
%% یک فونت پیش فرض تبدیل می کند.چرا که اغلب فونت هایی که ما با آن ها کار می کنیم، تنها می توانند زبان فارسی و یا انگلیسی را پشتیبانی کنند. مثلا B Nazanin فقط برای پشتیبانی از زبان فارسی است و نه برای انگلیسی، لذا Word چنین رفتاری را  بدون این که شما متوجه شوید انجام می دهد. اما در LATEX این گونه نیست. برای حل این مشکل دو راه حل دارید:

%% راه حل اول: از فونت های سری XB مثل XB Niloofar .و... استفاده کنید. برای این موضوع به قسمت قلم‌ها و حروف سایت پارسی لاتک مراجعه کنید در ضمن در مرکز دانلود سایت این فونت ها قرار داده شده است. فونت های سری XB، XM، XW هم می توانند زبان فارسی را پشتیبانی کنند و هم زبان انگلیسی را. 

%% راه حل دوم: در کل در xepersian اگر از فونت هایی مثل سری XB که هم فارسی و هم انگلیسی را پشتیبانی می کنند استفاده نکنید، می بایست عبارات انگلیسی در متن فارسی را در داخل یک \lr{} قرار دهید تا فهمیده شود که این عبارت باید با فونت انگلیسی نوشته شود، و توسط دستور \setlatintextfont نیز یک فونت انگلیسی تعریف کنید. مانند آن چه که در ادامه آمده است. 

%% در کل به نظر من راه حل دوم بهتر است. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%  با دستور زیر می توانید فونتی مخصوص عبارات فارسی تعیین کنید:
\settextfont[Scale=1.3]{B Nazanin}
%%\settextfont[Scale=1.2]{XB Niloofar}
%% شما با دستور زیر بعد از فراخوانی بسته xepersian می توانید فونت انگلیسی را تعیین کنید
%% دقت کنید که عبارات انگلیسی شما باید در دستور \lr{} قرار گیرد تا xepersian بتواند بفمهد که این عبارات انگلیسی است
\setlatintextfont[Scale=1]{Times New Roman}
%%\setlatintextfont[Scale=1.1]{Linux Libertine}

% % تعریف برای فونت اعداد و ارقام
%\setdigitfont[Scale=1.1]{XB Zar}

%% توسط دستورات defpersianfont و deflatinfont به ترتیب می توان یکسری فونت فارسی و انگلیسی دیگر تعریف کرد که در جاهای دیگر متن بتوان از آن استفاده کرد. برای استفاده کافی است که عبارتی که می خواهیم فونت آن عوض شود را به صورت زیر به عنوان نمونه بنویسیم.
%% \versionfont{این یک مثال است. }

%% تعریف یکسری فونت برای قسمت عنوان پروژه و ما بقی قسمت ها فونت قسمت "موسسه " در صفحه عنوان

\defpersianfont\tablefont[Scale=.8]{XM Traffic}
\defpersianfont\pejoheshfont[Scale=1.4]{Titr Bold}
%%فونت اسم گروه XB Titre
\defpersianfont\groupfont[Scale=1.4]{Zar}
%%% فونت عنوان گزارش
\defpersianfont\titlefont[Scale=2.4]{Titr Bold}
%% فونت نسخه گزارش
\defpersianfont\versionfont[Scale=1.6]{Mitra}
\defpersianfont\payanFont[Scale=1.8]{XB Yas}
\defpersianfont\nastaliq[Scale=2]{IranNastaliq}
\defpersianfont\farsifontshafigh[Scale=1.3]{Adobe Arabic}
\defpersianfont\titrt[Scale=1]{XB Titre}
\defpersianfont\traffict[Scale=1]{B Traffic}
\defpersianfont\farsifontsayeh[Scale=1.5]{XB Kayhan Sayeh}
\defpersianfont\titlefont[Scale=2.4]{Titr}

%% فونت‌های مورد نیاز برای صفحه شروع 
\defpersianfont\logofontR[Scale=1.2]{Zar}
\defpersianfont\typefontR[Scale=1.3]{B Nazanin}
\defpersianfont\titlefontR[Scale=2]{Titr}
\defpersianfont\datafontR[Scale=1.4]{Zar}

\deflatinfont\tableFontEn[Scale=.9]{Adobe Arabic}

%%  با استفاده از این دستور می‌توان فونت و فارسی و یا انگلیسی بودن اعداد در فرمول‌ها را به حالت اولیه (یعنی پیش‌فرض لاتک) برگرداند.
\DefaultMathsDigits

%\DeclareMathSizes{textsize}{mathsize}{scriptsize}{scriptscriptsize}
% گزینه اول: این برای چه دسته فونتی است. پیش فرض استایل ما فونت 10pt است. 
% گزینه دوم: اندازه فونت توابع و موجودات ریاضی درون متن.
% گزینه سوم: برای اسکریپت ها، اندازه زیرنویس و بالانویس.
% گزینه چهارم: برای زیرنویس زیرنویس.

% در دستورات زیر ما برای سه حالت، اندازه‌های مورد نظر را تعریف کرده ایم. 
\DeclareMathSizes{10}{11}{9}{8}   % For size 10 text
\DeclareMathSizes{11}{12}{11}{10}   % For size 11 text
\DeclareMathSizes{12}{13}{12}{11}  % For size 12 text

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% قالب صفحه و انتخاب حاشیه ها

%%% برای تعیین اندازه صفحه ابتدا باید اندازه stock و page را با دو دستور زیر تعیین کنیم. برای کارهای ما که هر صفحه ی خروجی در یک صفحه پرینت می شود، این دو مقدار به صورت مساوی مقدار دهی می شود. 
%%% در دو دستور زیر ما مقادیر استاندارد برای کاغذ A4 را قرار داده ایم.
\setlength{\headsep}{30pt}
%%%%\setstocksize{29.7cm}{21cm}
%%%%\settrimmedsize{29.7cm}{21cm}{*}
%%%\setlength{\trimtop}{0pt}
%%%\setlength{\trimedge}{\stockwidth}
%%%\addtolength{\trimedge}{-\paperwidth}
%%% در مرحله ی بعدی باید ابعادمتن در کاغذ را مشخص کنیم. 
%%%%\settypeblocksize{24.2cm}{16cm}{*}
%%% تعیین کننده حاشیه از بالا (آرگومان اول) و یا از پایین (آرگومان دوم) و یا نسبی (آرگومان سوم)
%%% دقت شود برای جلوگیری از ابهام تنها باید یکی از موارد فوق داده شود.
%%%%\setulmargins{2.5cm}{*}{*}
%%% به مانند دستور بالا، حاشیه از سمت چپ (آرگومان اول) و ...
%%%%\setlrmargins{2cm}{*}{*}
%%%\setmarginnotes{10pt}{10pt}{\onelineskip}
%%%%\setheadfoot{\onelineskip}{2\onelineskip}
%%%\setheaderspaces{*}{2\onelineskip}{*}
%%%%\checkandfixthelayout


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% تعریف برخی نمادهای item و شماره گذاری برای استفاده
\newcommand{\idx}[1]{\index{#1}#1}
%% می تواند برای ارایه نکات در محیط itemize به کار رود، روند این کار به این صورت است،  (شکل یک تیر)
\newcommand{\arc}{\item[\Large\color{red}\ding{247}]}
\newcommand{\arcO}{\noindent\textcolor{red}{\Large\ding{247}}\;}
%% این شکل می‌تواند برای بیان مزایای یک قضیه بکار رود (شکل تیک)
\newcommand{\tick}{\item[\large\color{green}\ding{52}]}
\newcommand{\tickO}{\noindent\textcolor{green}{\Large\ding{52}}\;}
%% برای  بیان معایب و یا نکات منفی (شکل یک ضربدر)
\newcommand{\X}{\item[\Large\color{red}\ding{56}]}
\newcommand{\XO}{\noindent\textcolor{red}{\LARGE\ding{56}}\;}
%% بیان موارد یک قضیه (شکل یک دست)
\newcommand{\hand}{\item[\Large\color{blue}\ding{45}]}
\newcommand{\handO}{\noindent\textcolor{blue}{\LARGE\ding{45}}\;}
%% برای مواردی که: این موارد شامل .... می شود، توسط عناصر زیر مشخص می شود (شکل یک درخت)
\newcommand{\tree}{\item[\Large\color{ForestGreen}\ding{171}]}
\newcommand{\treeO}{\noindent\textcolor{ForestGreen}{\Large\ding{171}}\;}
%% برای این که چند مورد را تعریف کنیم (علامت دست که دو گرفته)
\newcommand{\two}{\item[\LARGE\color{blue}\ding{44}]}
\newcommand{\twoO}{\noindent\textcolor{blue}{\LARGE\ding{44}}\;}
%% (شکل یک قیچی)
\newcommand{\sci}{\item[\footnotesize\color{OrangeRed}\ding{108}]}
\newcommand{\sciO}{\noindent\textcolor{OrangeRed}{\footnotesize\ding{108}}\;}


\newcommand{\tele}{\item[\Large\color{Bittersweet}\ding{37}]}
\newcommand{\teleO}{\noindent\textcolor{Bittersweet}{\huge\ding{37}}\;}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% با دستور newtheoremstyle شما می توانید یک استایل جدید برای محیط هایی چون plain، definition‌ و ... تعریف کنید. شکل کلی این دستور به صورت زیر است.

%%\newtheoremstyle{stylename}% name of the style to be used
%%  {spaceabove}% measure of space to leave above the theorem. E.g.: 3pt
%%  {spacebelow}% measure of space to leave below the theorem. E.g.: 3pt
%%  {bodyfont}% name of font to use in the body of the theorem
%%  {indent}% measure of space to indent
%%  {headfont}% name of head font
%%  {headpunctuation}% punctuation between head and body
%%  {headspace}% space after theorem head; " " = normal interword space
%%  {headspec}% Manually specify head
% % تعریف محیط‌های گوناگون مانند محیط برای قضیه و ... 
%% theoremstyle = > plain, definition, remark 
%% با دستور newtheorem یک نوع از استایلی که در بالای آن تعریف شده است ایجاد می کنیم. 
\theoremstyle{plain}
\newtheorem{theorem}{قضیه}
\newtheorem{lemma}{لم}
\newtheorem{proposition}{گزاره}
\theoremstyle{definition}
\newtheorem{definition}{تعریف}
\newtheorem{example}{مثال}
\newtheorem{prob}{سوال}
\theoremstyle{remark}
\newtheorem{corollary}{نتیجه}
\newtheorem{remark}{ملاحظه}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% در ادامه یکسری محیط جالب به صورت کادر رنگی برای استفاده های مختلف تعریف می شود. 
 
\makeatletter
\newdimen\errorsize \errorsize=0.2pt
% Frame with a label at top
\newcommand\LabFrame[2]{%
	\baselineskip=.4cm
    \fboxrule=\FrameRule
    \fboxsep=-\errorsize
    \textcolor{FrameColor}{%
    \fbox{%
      \vbox{\nobreak
      \advance\FrameSep\errorsize
      \begingroup
        \advance\baselineskip\FrameSep
        \hrule height \baselineskip
        \nobreak
        \vskip-\baselineskip
      \endgroup
      \vskip 0.5\FrameSep
      \hbox{\hskip\FrameSep \strut
        \textcolor{TitleColor}{\textbf{#1}}}%
      \nobreak \nointerlineskip
      \vskip 1.3\FrameSep
      \hbox{\hskip\FrameSep
        {\normalcolor#2}%
        \hskip\FrameSep}%
      \vskip\FrameSep
    }}}}
\definecolor{FrameColor}{rgb}{0.25,0.25,1.0}
\definecolor{TitleColor}{rgb}{1.0,1.0,1.0}

\newenvironment{contlabelframe}[2][\Frame@Lab\ (ادامه)]{% 
  % Optional continuation label defaults to the first label plus
  \def\Frame@Lab{#2}%
  \def\FrameCommand{\LabFrame{#2}}%
  \def\FirstFrameCommand{\LabFrame{#2}}%
  \def\MidFrameCommand{\LabFrame{#1}}%
  \def\LastFrameCommand{\LabFrame{#1}}%
  \MakeFramed{\advance\hsize-\width \FrameRestore} 
}{\endMakeFramed} 
%\newcounter{theoremu}

\newenvironment{colorBox}[1]{%
  \par
  %\refstepcounter{theoremu}%
  \begin{contlabelframe}{{#1}}
 \noindent\ignorespaces}
{\end{contlabelframe}} 
\makeatother  

%% این محیط به صورت یک کادر سایه دار با سایه سیاه رنگ 
\newsavebox\mybox
\newenvironment{myshadowbox}{%
\begin{lrbox}{\mybox}%
\begin{minipage}{\dimexpr(\textwidth-2\fboxsep-2\fboxrule-\shadowsize)}
\baselineskip=.90cm
}{%
\end{minipage}
\end{lrbox}%
\vskip10pt
\noindent
\shadowbox{\usebox\mybox}%
\vskip10pt
}

%% این محیط برای مواقعی مفید است که می خواهیم یک تمرین و یا سوال طرح کنیم. در این حالت دستوری به نام probsec به صورت زیر تعریف شده است:
%% \probsec{....}
%% که قسمت نقطه چین را می توان به صورت خالی رها نمود. با نوشتن این دستور عبارت سوال به طور خودکار نوشته می شود و سپس شماره آن نیز به طور خودکار قرار داده می شود. اگر شما در نقطه چین موردی را بنویسید این مورد به صورت عنوان سوال قرار می گیرد.  یعنی مثلا در کد زیر:
%% \probsec{شبکه}
%% در این صورت مثلا می نویسد: سوال ۱: شبکه و خود سوال از خط بعدی شروع می شود. 


%% برای شماره گذاری محیط یاد شده ابتدا یک counter‌ تعریف می کنیم. 
\newcounter{problemcount}
\addtocounter{problemcount}{1} % set them to some other numbers than 0

\newcommand\probsec[1]{{\noindent\normalfont\bfseries{\textcolor{blue}{
سوال \arabic{problemcount}\, {#1}}}\\ }
\addtocounter{problemcount}{1} 
}



%% محیطی برای قرار دادن abstract در گزارش و یا  در ابتدای هر فصل. در صورت استفاده از این محیط، متون داخل آن با فونتی متفاوت با فونت متن نوشته شده و در ابتدای متن نیز یک کلمه چکیده اضافه می شود. 


\let\oldabstract\abstract
\let\endoldabstract\endabstract

\renewenvironment{abstract}{
\section*{چکیده}
\settextfont[Scale=1.2]{Adobe Arabic} 
\setlatintextfont[Scale=1]{Times New Roman}
}{\\*[8pt]}



%% یک کادر رنگی دیگر 

\newcommand{\handBS}{\noindent\textcolor{ForestGreen}{\Huge\ding{45}}}
\newcommand{\noteB}[1]{
\tikzstyle{mybox1} = [draw=YellowGreen, fill=green!15,very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle1} =[fill=YellowGreen, text=white]
\tikzstyle{fancytitle2} =[fill=YellowGreen!5, text=white]
\tikzstyle{fancytitle3} =[fill=white, text=white]
\begin{center}
\begin{tikzpicture}
\node [mybox1] (box){%
    \IfFileExists{St/note.png}{\begin{minipage}{.85\textwidth}}{\begin{minipage}{.93\textwidth}}
    \baselineskip=.95cm
     \setRTL #1
    \end{minipage}
};
\node[fancytitle1, left=10pt] at (box.north east) {\hboxR{نکته}};
\IfFileExists{St/note.png}
{\node[fancytitle3, left=3pt,   rounded corners] at (box.west) {\includegraphics[width=.07\textwidth]{St/note}}; }
{\node[fancytitle2,  rounded corners] at (box.west) {\handBS};}
\end{tikzpicture}
\end{center}
}


\newcommand{\treeBS}{\noindent\textcolor{blue}{\Huge\ding{171}}}
\newcommand{\goalB}[1]{
\tikzstyle{mybox1} = [draw=blue, fill=blue!15,very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle1} =[fill=blue!90, text=white]
\tikzstyle{fancytitle2} =[fill=blue!5, text=white]
\tikzstyle{fancytitle3} =[fill=white, text=white]
\begin{center}
\begin{tikzpicture}
\node [mybox1] (box){%
     \IfFileExists{St/compass.png}{\begin{minipage}{.85\textwidth}}{\begin{minipage}{.93\textwidth}}
    \baselineskip=.95cm
     \setRTL #1
    \end{minipage}
};
\node[fancytitle1, left=10pt] at (box.north east) {\hboxR{مسیر}};
\IfFileExists{St/compass.png}
{\node[fancytitle3, left=3pt,   rounded corners] at (box.west) {\includegraphics[width=.07\textwidth]{St/compass}}; }
{\node[fancytitle2,  rounded corners] at (box.west) {\treeBS};}
\end{tikzpicture}
\end{center}
}


\newcommand{\arcBS}{\noindent\textcolor{red}{\Huge\ding{247}}}
\newcommand{\warningB}[1]{
\tikzstyle{mybox1} = [draw=red, fill=red!15,very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle1} =[fill=red!90, text=white]
\tikzstyle{fancytitle2} =[fill=red!4, text=white]
\tikzstyle{fancytitle3} =[fill=white, text=white]
\begin{flushleft}
\begin{tikzpicture}
\node [mybox1] (box){%
     \IfFileExists{St/warining.png}{\begin{minipage}{.85\textwidth}}{\begin{minipage}{.93\textwidth}}
    \baselineskip=.95cm
     \setRTL #1
    \end{minipage}
};
\node[fancytitle1, left=10pt] at (box.north east) {\hboxR{توجه}};
\IfFileExists{St/warining.png}
{\node[fancytitle3,left=1pt,   rounded corners] at (box.west) {\includegraphics[width=.07\textwidth]{St/warining}}; }
{\node[fancytitle2,  rounded corners] at (box.west) {\arcBS};}
\end{tikzpicture}
\end{flushleft}
}


\newcommand{\envBS}{\noindent\textcolor{Violet}{\Huge\ding{41}}}
\newcommand{\referB}[1]{
\tikzstyle{mybox1} = [draw=Violet, fill=Violet!10,very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle1} =[fill=Violet!50, text=white]
\tikzstyle{fancytitle2} =[fill=Violet!20, text=white]
\tikzstyle{fancytitle3} =[fill=white, text=white]
\begin{flushleft}
\begin{tikzpicture}
\node [mybox1] (box){%
     \IfFileExists{St/home.png}{\begin{minipage}{.85\textwidth}}{\begin{minipage}{.93\textwidth}}
    \baselineskip=.95cm
     \setRTL #1
    \end{minipage}
};
\node[fancytitle1, left=10pt] at (box.north east) {\hboxR{مراجع مفید}};
\IfFileExists{St/home.png}
{\node[fancytitle3,left=1pt,   rounded corners] at (box.west) {\includegraphics[width=.07\textwidth]{St/home}}; }
{\node[fancytitle2,  rounded corners] at (box.west) {\envBS};}
\end{tikzpicture}
\end{flushleft}
}



\newcommand{\twoBS}{\noindent\textcolor{YellowOrange}{\Huge\ding{44}}}
\newcommand{\infoB}[1]{
\tikzstyle{mybox1} = [draw=YellowOrange, fill=YellowOrange!10,very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle1} =[fill=YellowOrange!50, text=white]
\tikzstyle{fancytitle2} =[fill=YellowOrange!15, text=white]
\tikzstyle{fancytitle3} =[fill=white, text=white]
\begin{center}
\begin{tikzpicture}
\node [mybox1] (box){%
     \IfFileExists{St/info.png}{\begin{minipage}{.85\textwidth}}{\begin{minipage}{.93\textwidth}}
    \baselineskip=.95cm
     \setRTL #1
    \end{minipage}
};
\node[fancytitle1, left=10pt] at (box.north east) {\hboxR{مطالب بیشتر}};
\IfFileExists{St/info.png}
{\node[fancytitle3,left=1pt,   rounded corners] at (box.west) {\includegraphics[width=.07\textwidth]{St/info}}; }
{\node[fancytitle2,  rounded corners] at (box.west) {\twoBS};}
\end{tikzpicture}
\end{center}
}


\newcommand{\teleBS}{\noindent\textcolor{Mulberry}{\Huge\ding{37}}}
\newcommand{\problemB}[1]{
\tikzstyle{mybox1} = [draw=Mulberry, fill=Mulberry!10,very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle1} =[fill=Mulberry!50, text=white]
\tikzstyle{fancytitle2} =[fill=Mulberry!15, text=white]
\tikzstyle{fancytitle3} =[fill=white, text=white]
\begin{center}
\begin{tikzpicture}
\node [mybox1] (box){%
     \IfFileExists{St/question.png}{\begin{minipage}{.85\textwidth}}{\begin{minipage}{.93\textwidth}}
    \baselineskip=.95cm
     \setRTL #1
    \end{minipage}
};
\node[fancytitle1, left=10pt] at (box.north east) {\hboxR{سوال}};
\IfFileExists{St/question.png}
{\node[fancytitle3,left=1pt,   rounded corners] at (box.west) {\includegraphics[width=.07\textwidth]{St/question}}; }
{\node[fancytitle2,  rounded corners] at (box.west) {\teleBS};}
\end{tikzpicture}
\end{center}
}


% ایجاد یک محیط برای ارایه مراجع مفید. این محیط به صورت یک کادر رنگی زیبا با پشت زمینه آبی کمرنگ در صفحات اصلی گزارش قرار می گیرد
% این محیط می تواند برای ارایه یک نکته و ... استفاده شود. من در این جا برای بیان مراجع مفید در هر بخش از آن استفاده کرده ام. 

\tikzstyle{mybox} = [draw=red, fill=blue!20, very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle} =[fill=red, text=white]

\newcommand{\goodRef}[1]{
\referB{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% % تنظیمات مربوط به فصل، بخش، زیربخش و .... 

%% این دستور تعیین می‌کند که چه تا چه عمقی شماره‌گذاری شود. در خود متن نه در فهرست مطالب دقت کنید که برای تعیین این که در فهرست مطالب تا چه عمقی شماره گذاری صورت بگیرد باید از دستور
%% \setcounter{tocdepth}{....}
%% استفاده کرد که در ادامه می آید. 
\setcounter{secnumdepth}{3}

% %% انواع مختلف استایل‌های برای عنوان فصل‌ها 
%% در ادامه برخی از استایل های زیبا برای عنوان فصل تعریف می شود. برای استفاده از این استایل ها کافی است که  از دستور  \chapterstyle به همراه نام استایل استفاده کنید. 
%% کد این استایل ها از بسته MemoirChapStyles استخراج شده است. 

% % تعاریف مربوط به استایل اول: با استفاده از کلاس memoir 
\newsavebox{\ChpNumBox}
\definecolor{ChapBlue}{rgb}{0.00,0.65,0.65}
\makeatletter
\newcommand *{\thickhrulefill}{\leavevmode\leaders\hrule height 1\p@ \hfill \kern \z@}
\newcommand *\BuildChpNum[2]{
\begin{tabular}[t]{@{}c@{}}
\makebox[0pt][c]{#1\strut} \\[.5ex]
\colorbox{ChapBlue}{
\rule[-10em]{0pt}{0pt}
\rule{1ex}{0pt}\color{black}#2\strut
\rule{1ex}{0pt}}
\end{tabular}}



% تعریف استایل اول برای شروع فصل‌ها
\makechapterstyle{BlueBox}{%
\renewcommand{\chapnamefont}{\LARGE\scshape}
\renewcommand{\chapnumfont}{\Huge\bfseries}
\renewcommand{\chaptitlefont}{\Huge\bfseries}
\setlength{\beforechapskip}{5pt}
\setlength{\midchapskip}{26pt}
\setlength{\afterchapskip}{40pt}
\renewcommand{\printchaptername}{}
\renewcommand{\chapternamenum}{}
\renewcommand{\printchapternum}{%
\sbox{\ChpNumBox}{%
\BuildChpNum{\chapnamefont\@chapapp}%
{\chapnumfont\thechapter}}}
\renewcommand{\printchapternonum}{%
\sbox{\ChpNumBox}{%
\BuildChpNum{\chapnamefont\vphantom{\@chapapp}}%
{\chapnumfont\hphantom{\thechapter}}}}
\renewcommand{\afterchapternum}{}
\renewcommand{\printchaptertitle}[1]{%
\usebox{\ChpNumBox}\hfill
\parbox[t]{\hsize-\wd\ChpNumBox-1em}{%
\vspace{\midchapskip}%
\thickhrulefill\par
\chaptitlefont ##1\par}}%
}

%%% تعریف استایل دوم  برای شروع فصل‌ها
\makechapterstyle{asuappendix}{%
\setlength{\beforechapskip}{-\topfiddle}
\setlength{\midchapskip}{1.0\onelineskip}
\setlength{\afterchapskip}{1.0\onelineskip}
\renewcommand*{\chapnamefont}{\normalfont}
\renewcommand*{\chapnumfont}{\chapnamefont}
\renewcommand*{\printchaptername}{%
\chapnamefont\MakeUppercase{\@chapapp}}
\renewcommand*{\printchapternum}{\centering\chapnumfont \thechapter}
\renewcommand*{\chaptitlefont}{\normalfont\centering}
\renewcommand*{\printchapternonum}{}
\renewcommand*{\afterchaptertitle}{\clearpage}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% اختصاص - به عنوان جداکننده شماره بخش و زیربخش
%%\SepMark{-}
%% به صورت پیش‌فرض بعد از شماره بخش - نداریم، مگر آنکه شماره زیر بخش پس از آن آمده باشد. از آنجا که مطابق قالب کنفرانس در هر صورت
%% پس از شماره بخش و شماره زیربخش به جداکننده نیاز داریم از دستورات زیر استفاده می‌کنیم:
%%\makeatletter
%%\renewcommand \thesection {\@arabic\c@section\@SepMark}
%%\renewcommand \thesubsection {\thesection\@arabic\c@subsection\@SepMark}
%%\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% تنظیمات مربوط به صفحات شروع مستند %%%%%%%%%%%%%%%%%%%%%%%%%%%

%% توسط دستور \myData می توانید تاریخ و ساعت را وارد متن خود کنید. 
\newcommand{\myData}{
\شمارجدید\ساعت
\شمارجدید\دقیقه
\تر\زمان‌به‌وقت‌امروز{%
\ساعت \زمان \تقسیم \ساعت 60  ساعت \محتوای\ساعت {}
\دقیقه \زمان \ضرب \ساعت 60 \بیفزابر \دقیقه -\ساعت
 \گرعدد\دقیقه=0\گرنه و \محتوای\دقیقه{} دقیقه\رگ }
 \امروز{} در  \زمان‌به‌وقت‌امروز{} 
}

\newcommand{\fatitle}{گراف‌های فولرین با تعداد  زیادی تطابق‌های \\کامل نمایی }
\newcommand{\faAuthor}{فرهاد مهرورزی}
\newcommand{\fasupervisor}{دکتر حسن یوسفی آذری}
\newcommand{\fadate}{\today}
\newcommand{\famajor}{در رشته هوش مصنوعی}
\newcommand{\falevel}{جهت دریافت درجه کارشناسی ارشد}
\newcommand{\fadepart}{دانشکده برق و کامپیوتر - گروه هوش مصنوعی}
\newcommand{\entitle}{Fullerene graphs with exponentially many perfect matchings}
\newcommand{\enAuthor}{Farhad Mehrvarzi}
\newcommand{\ensupervisor}{Prof. H. Yousefi Azari}
\newcommand{\engdate}{February 2011}
\newcommand{\enlevel}{{A thesis submitted to the Graduate Studies Office
\\In partical fulfillment of the requirements for}}
\newcommand{\enmajor}{ The degree of Master in thesis \\Applied Mathematics}
\newcommand{\enDep}{University College of Science\\ School of Mathematics, Statistics and\\ Computer Science}


\gdef\@type{گزارش نهايي پروژه}
\def\type#1{\gdef\@type{#1}}
%% عنوان محصول را تعیین می‌کند. این عنواند در ایجاد عنوان در مستند استفاده
%% می‌شود این عنوان در هر مستند باید ایجاد شود در غیر این صورت از عنوان
%% پیشفرض استفاده خواهد شد.
\gdef\@farsititle{عنوان محصول}
\def\farsititle#1{\gdef\@farsititle{#1}}
%% زیر عنوان یک متن ساده را تعیین می‌کند که یک هدف مهم محصول را تعیین می‌کند
%% این عنوان می تواند برای یک محصول در نظر گرفته نشود. از این داده برای 
%% ایجاد عنوان و سایر مکان های محصول استفاده می‌شود.
\gdef\@subtitle{کاربرد محصول برای استفاده در زیر عنوان}
\def\subtitle#1{\gdef\@subtitle{#1}}
%% افراد و گروه های که در تهیه این مستند و محصول همکاری داشته اند را تعیین
%% می کند این داده همواره باید بیان شود. این داده در نوشتن عنوان و دیگر قسمت
%% های مستند مورد استفاده قرار می‌گیرد.
\gdef\@farsiAuthor{نام نویسنده}
\def\farsiAuthor#1{\gdef\@farsiAuthor{#1}}
%% تاریخ نهایی نوشتن مستند را تعیین می‌کند این تاریخ در نوشتن عنوان استفاده
%% می‌شود این تارخ باید تعیین شود در غیر این صورت به صورت پیش فرض یک تاریخ
%% برای آن استفاده می شود.
\gdef\@farsidate{\today}
\def\farsidate#1{\gdef\@farsidate{#1}}


\gdef\@farsisupervisor{دکتر ........} 
\def\farsisupervisor#1{\gdef\@farsisupervisor{#1}}


\gdef\@farsiadviser{دکتر ........} 
\def\farsiadviser#1{\gdef\@farsiadviser{#1}}


\gdef\@farsilevel{کارشناسی ارشد} 
\def\farsilevel#1{\gdef\@farsilevel{#1}}

\gdef\@farsimajor{مهندسی کامپیوتر} 
\def\farsimajor#1{\gdef\@farsimajor{#1}}


\gdef\@englishtitle{Your Thesis Title} 
\def\englishtitle#1{\gdef\@englishtitle{#1}}


\gdef\@englishAuthor{Moh Da} 
\def\englishAuthor#1{\gdef\@englishAuthor{#1}}


\gdef\@englishsupervisor{Dr} 
\def\englishsupervisor#1{\gdef\@englishsupervisor{#1}}

\gdef\@englishadvisor{Dr} 
\def\englishadvisor#1{\gdef\@englishadvisor{#1}}



\gdef\@englishDate{Aug 2012} 
\def\englishDate#1{\gdef\@englishDate{#1}}



%%  برگه نخست در مستند را ایجاد می‌کند. در این برگه تنها نام پروردگار
%%% ذکر می‌شود. برای ایجاد نام پرودگار یک تصویر استفاده می‌شود به نام god.ps
%%% که باید در پوشه image کنار پرونده اصلی مستند قرار گرفته شده باشد.
\newcommand{\Godpage}
{	
	 \thispagestyle{empty}
	\pagenumbering{gobble}
    \begin{center}
     \includegraphics[width=.7\textwidth]{Pic/god}
    \end{center}
    \newpage
}

\def\acknowledgementpage{\newpage
\thispagestyle{empty}

\vspace{1cm}
\par\noindent}
%%% این کد، ایجاد عنوان را در باز نویسی می‌کند. بر اساس داده های که برای یک
%%% مستند کاربری در نظر گرفته شده است این عنوان ایجاد می‌شود. در صورتی که 
%% داده های مورد نیاز وارد نشود داده های پیش فرض استفاده خواهد شد.
%% نماد به کار رفته در این عنوان با پرونه ای به نام logo.ps در پوشه images
%%% در کنار مستند اصلی باید قرار گرفته شده باشد.

\definecolor{authorcol}{rgb}{.51,0,.51}

\newcommand{\lshortTitle}[1]{
\begin{flushleft}
\vspace*{\stretch{.1}}

\begin{flushright}\includegraphics[width=#1\textwidth]{Pic/logo}\end{flushright}
\newlength{\centeroffset}
\setlength{\centeroffset}{-0.5\oddsidemargin}
\addtolength{\centeroffset}{0.5\evensidemargin}
\addtolength{\textwidth}{-\centeroffset}
\thispagestyle{empty}

\vspace*{\stretch{2}}

\noindent\hspace*{\centeroffset}\makebox[0pt][l]{
\begin{minipage}{\textwidth}
\flushleft
{ \titlefont\textcolor{magenta}\@title \\*[10pt]}
\noindent\color{gray}{\rule[-1ex]{\textwidth}{5pt}\\[2.5ex]
\hfill{\farsifontsayeh\large\@type }}
\end{minipage}}

\vspace{\stretch{2}}

\noindent\hspace*{\centeroffset}\makebox[0pt][l]{
\begin{minipage}{\textwidth}
{\flushleft\textcolor{authorcol}{\bfseries\@farsiAuthor\\*[5pt]}}
{\flushleft\textcolor{authorcol}{\bfseries\@farsisupervisor\\*[5pt]}}
{\flushleft\textcolor{authorcol}{\bfseries\@farsidate}\\}
\end{minipage}}

\vspace{\stretch{1.5}}

\end{flushleft}
\clearpage
}

\makeatletter
\newcommand{\farsicover}{
\ignorespaces
\begin{center}
\thispagestyle{empty}
\begin{table}
\begin{tabular}{ccc}
\includegraphics[width=.15\textwidth]{Pic/logo}&
\begin{minipage}{0.55\linewidth}
\vskip 0.9cm
\begin{center}\Large
\typefontR{\huge
دانشگاه تهران 
}
 \\* [0.5cm]
پردیس دانشکده فنی\\ [0.5cm]
\fadepart \\*[1cm]
\end{center}
\end{minipage}
&
\includegraphics[width=.15\textwidth]{Pic/logoF}
\end{tabular}
\end{table}
\vskip 2cm
%\LARGE{عنوان:}
%\\ [0.5cm]
\textbf{\LARGE{\@farsititle}}
\vskip 2cm
\LARGE{
نگارش:}
 \\ [0.4cm] \Large{\@farsiAuthor}
\vskip 1.5cm
\LARGE{
استاد راهنما:}
 \\ [0.4cm] \Large{\@farsisupervisor}
\vskip 1.5cm
\LARGE{
استاد مشاور:}
 \\ [0.4cm] \Large{\@farsiadviser}
\vskip 2cm

پایان‌نامه جهت دریافت در رشته‌ی
 \@farsilevel \\* [0.3cm]

\@farsimajor\\* [0.3cm] 
\large{\@farsidate}
\end{center}
\clearpage
}
\makeatother

\newcommand{\thesisInfo}{

 \clearpage\newpage
 \thispagestyle{empty}
\begin{center}
\large\bfseries به نام او
\end{center}
\vspace*{\stretch{3}}
\noindent 
پایان نامه جهت دریافت \@farsilevel
 \\*[20pt] 
عنوان: \@farsititle
 \\*[20pt] 
نگارش: \@farsiAuthor  
 \\*[20pt]
استاد راهنما:  \@farsisupervisor
 \\*[20pt]

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% باز تعریف محیط document، هر دستوری که می خواهید در ابتدای برنامه اجرا شود را در این قسمت بنویسید.
%%%============================ پاورقی
% تنظیم‌های مربوط به پاورقی: فاصله پاورقی با متن + فاصله بین خطوط در پاورقی
\setlength{\footnotesep}{0.5cm}
\setlength{\skip\footins}{2cm}


\let\olddocument\document
\let\endolddocument\enddocument
\renewenvironment{document}{
\olddocument
% تنظیم استایل سرفصل
%\chapterstyle{BlueBox}
%\pagestyle{plain}
%% تنظیم فاصله بین خطوط با دستور \baselineskip
\baselineskip = 1 cm
\pagenumbering{arabic}

% توسط این دستور خط بالای پاورقی به صورت کامل و با اندازه textwidth‌ کشیده می‌شود. این دستور برای بسته bidi است، و انواع حالت‌های دیگری را نیز به شرح زیر دارد:
% \autofootnoterule , \rightfootnoterule , \leftfootnoterule , \LRfootnoterule , \textwidthfootnoterule

\textwidthfootnoterule
%\SetWatermarkText{\@status} 
}{
\endolddocument
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% این دستور تعیین می کند که در فهرست مطالب تا چه عمقی فهرست نمایش داده شود (subsubsection)
\setcounter{tocdepth}{4}

%% کد لازم برای مشکل وارد کردن بخش در فهرست مطالب با بسته Hyperref

\makeatletter
\renewcommand*\l@part[2]{
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}
    \addvspace{2.25em \@plus\p@}
    \setlength\@tempdima{3em}
    \begingroup
      \parindent \z@ \if@RTL\leftskip\else\rightskip\fi \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries\textcolor{blue}{بخش} #1
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}
    \endgroup
  \fi}
\makeatother


%% با این دستور در فهرست مطالب در هنگام آوردن شماره و عنوان فصل در ابتدای آن یک کلمه فصل می گذارد یعنی مثلا می نویسد: (فصل اول: مقدمه ای بر شبکه ..................... ۱)
\renewcommand*{\cftchaptername}{
فصل
\space}






%  تنظیمات مربوط به فهرست مطالب، بازنویسی محیط فهرست مطالب برای تعیین فاصله خطوط، قرار دادن در bookmark ها
\let\Oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	%\pagenumbering{harfi}
	\baselineskip=.90cm
	\pdfbookmark[0]{ فهرست مطالب}{title}
	\clearpage
	\Oldtableofcontents*\clearpage
	\baselineskip=.95cm
	\savepagenumber
	\pagenumbering{arabic}
} 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%===========================تنظمیات محیط شکل
% بازنویسی محیط شکل
\makeatletter
\let\oldfigure\figure
\def\figure{\@ifnextchar[\figure@i \figure@ii}
\def\figure@i[#1]{\oldfigure[#1]\centering}
\def\figure@ii{\oldfigure\centering}
\makeatother

% تعریف دو متغیر برای  نام شکل و جدول: برای مثال در متن شما می توانید بنویسید (\figurename\ref{figure label} 
% آن ‌گاه در متن نوشته می شود: مثلا شکل ۲.۱ اگر شما این پارامتر را به تصویر نسبت دهید می نویسد: تصویر ۲.۱
\renewcommand{\figurename}{شکل}

% دو دستور زیر عنوان لیست تصاویر را به  فهرست اشکال تغییر می‌دهد. 
\renewcommand{\listfigurename}{فهرست اشکال}
%% در دستورات زیر محیط فهرست اشکال باز تعریف شده و اولا این محیط به bookmark اضافه شده و ثانیا مشکل صفحات اضافی حل شده است. ثالثا فاصله خطوط برای زیبایی در این 
%% محیط اندکی کم شده است، ولی دوباره بعد از آوردن این محیط به حالت اولیه برگشته است. در ضمن از شماره گذاری حرفی برای این محیط استفاده شده است. 
\let\Oldlistoffigures\listoffigures
\renewcommand{\listoffigures}{
	\pagenumbering{harfi}
	\restorepagenumber
	\baselineskip=.90cm
	\pdfbookmark[0]{ فهرست اشکال}{titleFig}
	%\addcontentsline{toc}{chapter}{فهرست اشکال}
	\Oldlistoffigures*\clearpage
	\baselineskip=.95cm
	\savepagenumber
	\pagenumbering{arabic}
} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%============================ تنظیمات مربوط به فونت و اندازه جداول
% تنظیمات مربوط به جدول و فونت آن
%
%\newcolumntype{I}{!{\vrule width 1.5pt}}
%\newlength\savedwidth
%\newcommand\whline
%{\noalign{\global\savedwidth\arrayrulewidth\global\arrayrulewidth 1.5pt}\hline\noalign{\global\arrayrulewidth\savedwidth}}
%
%\newcolumntype{R}{>{\centering\tableFont}c}
%\newcolumntype{T}{>{\centering\arraybackslash\tableFont}p{.4\linewidth}}
%
%% بازنویسی محیط جدول
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}{
\begingroup
\vspace{3mm}
\oldtable[!ht]
\centering
}
{\endoldtable
\vspace{-3mm}

\endgroup}



% بازنویسی محیط tabular به منظور تنظیم فونت‌های جدول
\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}{\bgroup
\settextfont[Scale=.8]{XM Traffic}
\setlatintextfont[Scale=.9]{Linux Libertine}
\oldtabular}
{\endoldtabular \egroup}

% تنظیم کننده فاصله بین خطوط (ردیف‌ها) در یک جدول
\renewcommand{\arraystretch}{1.2}
% تنظیم کننده ضخامت خطوط جدول
%\renewcommand{\arrayrulewidth}{.55pt}
% تنظیم فاصله بین خطوط دو خطه (||) و یا (حالت افقی ||)
%\renewcommand{\doublerulesep}{1pt}

% دو دستور زیر عنوان لیست جداول را به فهرست جداول  تغییر می‌دهد. 
\renewcommand{\listtablename }{فهرست جداول}
%% دستوری که توسط آن نام دستور  \tablename به جدول تغییر پیدا می کند. با این دستور هر جای متن که بنویسید \tablename عبارت جدول گذاشته می شود. 
%\renewcommand{\tablename}{جدول}
%% در دستورات زیر محیط فهرست جداول باز تعریف شده و اولا این محیط به bookmark اضافه شده و ثانیا مشکل صفحات اضافی حل شده است. ثالثا فاصله خطوط برای زیبایی در این 
%% محیط اندکی کم شده است، ولی دوباره بعد از آوردن این محیط به حالت اولیه برگشته است. در ضمن از شماره گذاری حرفی برای این محیط استفاده شده است. 
\let\Oldlistoftables\listoftables
\renewcommand{\listoftables}{
	\pagenumbering{harfi}
	\restorepagenumber
	\baselineskip=.90cm
	\pdfbookmark[0]{فهرست جداول}{titleTab}
	%\addcontentsline{toc}{chapter}{فهرست جداول}
	\Oldlistoftables*\clearpage
	\baselineskip=.95cm
	\savepagenumber
	\pagenumbering{arabic}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%============================ فهرست اختصارات
% دستوراتی برای قرار دادن فهرست اختصارات 
%% برای وارد کردن فهرست اختصارات  نیازمند بسته nomencl هستیم که در قسمت usepackage وارد شد. 
\renewcommand{\nomname}{فهرست اختصارات}
\makenomenclature
% دستور \nomitemsep برای تنظیم فاصله بین item های فهرست اختصارات 
\setlength{\nomitemsep}{-7pt}
%% این دستور هم برای این است که محیط فهرست اختصارات یک محیط لاتین است ولی عنوان آن فارسی است.
%% محیط لاتین باید در سمت چپ و عنوان باید در سمت راست وجود داشته باشد
\renewcommand{\nompreamble}{\begin{latin}}
\renewcommand{\nompostamble}{\end{latin}}
%% تعریف یک دستور برای قرار دادن در پاورقی و اضافه کردن به لیست فهرست اختصارات 
\def\inpabr #1#2{\lr{#1\LTRfootnote{#2}}\nomenclature{#1}{#2}}
%% همانند دستور بالا تنها تفاوت در این است که دیگر در پاورقی آورده نمی‌شود. 
\def\inabr #1#2{\lr{#1}\nomenclature{#1}{#2}}


\let\Oldprintnomenclature\printnomenclature
\renewcommand{\printnomenclature}{
\pagenumbering{harfi}
\restorepagenumber
\markboth{\nomname}{\nomname} % maybe with \MakeUppercase
\baselineskip=.90cm
%%  معمولا فهرست اختصارات  در گزارشات تخصصی بعد از فهرست ها قرار می دهند. ما هم از همین رویه استفاده کردیم.
%% دستور \printnomenclature برای وارد کردن واژه نامه. option بعد از آن یعنی [70pt] نشان‌دهنده میزان فاصله بین کلمات و توضیح آن ها می‌باشد. 
\Oldprintnomenclature[70pt]\clearpage
\baselineskip=.95cm
%\pagenumbering{arabic}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% این دستور موجب تغییر نام بخش appendix‌ به پیوست می شود. 
\renewcommand{\appendixtocname}{پیوست ها}


% تنطمیات مربوط به محیط مراجع 


% کارهای پایانی بعد از اتمام نوشته
% آوردن مراجع در انتهای گزارش با فرمت IEEE 
% فرمت مراجع می تواند برای ACM و ... نیز باشد. برای این کار کافی است تنها  پارامتر style را باید تغییر دهید. 
% مراجع همگی در یک فایل bibtex با پسوند .bib  وجود دارد، که می بایست در پوشه اصلی گزارش قرار داده شود.
\let\Oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
	\let\appendix\relax
	\baselineskip=.5cm
	\renewcommand{\bibname}{مراجع}
	\clearpage
	\phantomsection
	\bibliographystyle{ieeetr-fa}
	\Oldbibliography{#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%============================ واژه نامه
%% تعاریف مربوط به تولید واژه نامه


%style=listgroup,nonumberlist

\newglossarystyle{mylistFa}{
\glossarystyle{list}
\renewenvironment{theglossary}{}{}
\renewcommand*{\glossaryheader}{}
\renewcommand*{\glsgroupheading}[1]{\section*{\glsgetgrouptitle{##1}} }
\renewcommand*{\glsgroupskip}{}
\renewcommand*{\glossaryentryfield}[5]     {\noindent\glstarget{##1}{##2}\dotfill \space ##3 \\}
\renewcommand*{\glossarysubentryfield}[6]{\glossaryentryfield{##2}{##3}{##4}{##5}{##6}}
}

\newglossarystyle{mylistEn}{
\glossarystyle{list}
\renewenvironment{theglossary}{}{}
\renewcommand*{\glossaryheader}{}
\renewcommand*{\glsgroupheading}[1]{\begin{LTR} \section*{\lr{\glsgetgrouptitle{##1}}} \end{LTR}}
\renewcommand*{\glsgroupskip}{}
\renewcommand*{\glossaryentryfield}[5]     {\noindent\glstarget{##1}{##3}\dotfill \space ##2 \\}
\renewcommand*{\glossarysubentryfield}[6]{\glossaryentryfield{##2}{##3}{##4}{##5}{##6}}
}


% تعریف دو نمونه واژه نامه
\newglossary[glg]{english}{gls}{glo}{واژه‌نامه انگلیسی به فارسی}
\newglossary[blg]{persian}{bls}{blo}{واژه‌نامه فارسی به انگلیسی}


% توسط این دستور واژه مورد نظر در متن، هر دو واژه نامه و پاورقی می آید.
\newcommand{\inpdic}[2]{
	\newglossaryentry{fa-#1}{type=persian,name={#1}, sort={#1},description={\lr{#2}}}\gls{fa-#1}\LTRfootnote{#2}
	\newglossaryentry{en-#1}{type=english,name={\lr{#2}}, sort={#2},description={#1}}\glsuseri{en-#1}
}

% توسط این دستور واژه مورد نظر در متن، هر دو واژه نامه  می آید.
\newcommand{\indic}[2]{
	\newglossaryentry{fa-#1}{type=persian,name={#1}, sort={#1},description={\lr{#2}}}\gls{fa-#1}
	\newglossaryentry{en-#1}{type=english,name={\lr{#2}}, sort={#2},description={#1}}\glsuseri{en-#1}
}

% توسط این دستور واژه مورد نظر فقط در هر دو واژه نامه  می آید.
\newcommand{\ingls}[2]{
	\newglossaryentry{fa-#1}{type=persian,name={#1}, sort={#1},description={\lr{#2}}}\glsuseri{fa-#1}
	\newglossaryentry{en-#1}{type=english,name={\lr{#2}}, sort={#2},description={#1}}\glsuseri{en-#1}
}

\makeglossaries
\glsdisablehyper
\makeindex

%% در این جا محیط هر دو واژه نامه را باز تعریف کرده ایم، تا اولا مشکل قرار دادن صفحه اضافی را حل کنیم، ثانیا عنوان واژه نامه ها را با دستور addcontentlist وارد فهرست مطالب کرده ایم.
\let\Oldprintglossary\printglossary
\renewcommand{\printglossary}{
	\let\appendix\relax
	\baselineskip=.75cm
	
	\clearpage
	\phantomsection
	\twocolumn{}
	\addcontentsline{toc}{chapter}{واژه نامه انگلیسی به فارسی}
	\glossarystyle{mylistEn}
	\Oldprintglossary[type=english]

	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{واژه نامه فارسی به انگلیسی}
	\glossarystyle{mylistFa}
	\Oldprintglossary[type=persian]
	\onecolumn{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% قرار دادن نمایه کلمات به عنوان آخرین قسمت گزارش
%% در دستورات زیر محیط نمایه را باز تعریف کرده ایم، در این باز تعریف فونت این محیط را به یکی از فونت های سری XB بردیم تا مشکلی از بابت نوشتن فارسی و انگلیسی با یک فونت به وجود نیاید. 
\let\Oldprintindex\printindex
\renewcommand{\printindex}{
	\let\appendix\relax
	\baselineskip=.75cm
	\clearpage
	\phantomsection
	\settextfont[Scale=1.2]{XB Niloofar}
	\Oldprintindex
	\settextfont[Scale=1.3]{B Nazanin} 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% تنظیمات مربوط به بسته pagenote 

%

\notepageref
\renewcommand*{\notesname}{نکات}
\renewcommand*{\notedivision}{\chapter{\notesname}}
\renewcommand*{\pagerefname}{صفحه}
\makepagenote
\continuousnotenums

\newcommand{\handNote}{\item[\Huge\color{red}\ding{45}]}
%% در این جا ما محیط pagenote را باز تعریف کرده ایم. با این کار هر وقت که در متن از pagenote استفاده کنیم در یک محیط itemize با یک item یک علامت دست در حال نوشتن با رنگ قرمز 
%% می گذارد و سپس می نویسد نکته ۳: و سپس خود نکته را با رنگی غیر از رنگ سیاه برای تمایز با متن می نویسد. 
\let\Oldpagenote\pagenote
\renewcommand{\pagenote}[1]{
\begin{itemize}
\handNote
\textcolor{red}{\textbf{نکته 
\Oldpagenote{#1}:}}\\
\textcolor{Brown}{#1}
\end{itemize}
}

\renewcommand*{\notenumintext}[1]{#1}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% دستور لازم برای تعریف محیط lr برای این که بدون هیچ مشکلی بتوان در عنوان فصل و یا بخش انگلیسی نوشت، 
% نکته مهم: این دستورات باید به عنوان آخرین دستورات استایل شما باشد. 
\makeatletter
\let\orig@lr\lr
\renewcommand*{\lr}[1]{\texorpdfstring{\orig@lr{#1}}{#1}}
\makeatother

\makeatletter
\defpersianfont\chaptertitlefont[Scale=1.6]{B Titr}

\newcommand\mycustomraggedright{%
 \if@RTL\raggedleft%
 \else\raggedright%
 \fi}
\def\@part[#1]#2{%
\ifnum \c@secnumdepth >-2\relax
\refstepcounter{part}%
\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
\else
\addcontentsline{toc}{part}{#1}%
\fi
\markboth{}{}%
{\centering
\interlinepenalty \@M
\ifnum \c@secnumdepth >-2\relax
 \huge\bfseries \partname\nobreakspace\thepart
\par
\vskip 20\p@
\fi
\LARGE\bfseries #2\par}%
\@endpart}
\def\@makechapterhead#1{%
  \vspace*{200\p@}%
  {\parindent \z@ \raggedleft \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries \raggedleft{ #1}\par\nobreak
    \vskip 50\p@
  }}

%اگه می‌خواین که کلمه «فصل» رو هم داشته باشین، خط پایین رو غیرفعال کنین.
%\renewcommand{\chaptername}{}
%  نکته جانبی و بی‌ربط به این بحث: اگه می‌خواین که صفحات اول هر فصل، شماره صفحه نداشته باشن، ۹ خط پایین رو فعال کنین.
%\let\origchapter\chapter
%\renewcommand*{\chapter}{% 
%  \fancypagestyle{plain}{%
%    %\fancyhf{}%
%    \renewcommand{\headrulewidth}{0pt}%
%    \renewcommand{\footrulewidth}{0pt}%
%  }%
%\origchapter
%}

\makeatother

\nouppercaseheads
\makepagestyle{mystyle}
\makeevenhead{mystyle}{}{}{\itshape\leftmark\vskip -2mm}
\makeoddhead{mystyle}{}{}{\itshape\leftmark\vskip -2mm}
\makeheadrule{mystyle}{ \textwidth }{.8pt}
\makeevenfoot{mystyle}{}{\thepage}{}
\makeoddfoot{mystyle}{}{\thepage}{}
%\makepsmarks{mystyle}{%
%  \createmark{chapter}{left}{nonumber}{}{}}






\makeatletter
\newcommand{\englishcover}{
\clearpage
\thispagestyle{empty}

\begin{latin}
	\begin{center}
	\begin{table}
	\begin{tabular}{ccc}
	\includegraphics[width=.15\textwidth]{Pic/logo}&
	\begin{minipage}{0.55\linewidth}
	\vskip 0.5cm
	\begin{center}\Large
	{\Large
	University of Tehran}\\* [0.2cm]
	Faculity of Engineering\\*[0.2cm]
	Epartment of Electical and\\*[0.2cm]
	Computer Engineering\\*[0.2cm]
	\end{center}
	\end{minipage}
	&
	\includegraphics[width=.15\textwidth]{Pic/logoF}
	\end{tabular}
	\end{table}
		\vskip 2cm
		\huge{\@englishtitle}
		\vskip 2cm
		\Large{By :}         \\ \Large\textit{{\@englishAuthor}}
		\vskip 1.5cm
		\Large{Supervisor :} \\ \Large\textit{{\@englishsupervisor}}
		\vskip 1.5cm
		\Large{Consulating Advisor :} \\ \Large\textit{{\@englishadvisor}}
		\vskip 1.5cm
		\large{Thesis submitted to the Graduate Studies Office in partial fulfillment of the}\\*[5pt]
		\large{requirements for the degree of }\\*[5pt]
		\large{Master of Science in Computer Engineering - Master Intelligence and Robotics,}
		\vskip 1cm
		\Large{\@englishDate}
\end{center}
\end{latin}
}
\makeatother
























