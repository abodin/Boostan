بوستان مجموعه‌ای از استایل‌های لاتک است که به منظور نوشتن هرچه‌ساده‌تر یک گزارش و یا یک کتاب تهیه و تدوین شده است. این استایل در
TexLive2017 و TexLive2018 
قابل بکارگیری است. برای استفاده از استایل،

گام اول: نخست با استفاده از دستور زیر فایل‌های موجود در مخزن را بارگیری نمایید:
git@github.com:abodin/Boostan.git
با اجرای این دستور در مسیری که مشخص کردید، شاخه‌ای به نام Boostan ایجاد می‌شود و فایل‌ها در آن قرار داده می‌گردد. 

گام دوم: در گام بعدی برای این‌که لازم نباشد هر بار مسیر کامل استایل‌ها زده شود، در مسیر نصب TexLive فایل texmf.cnf را بازگشایی نمایید. به عنوان مثال در Ubuntu دستور زیر را برای بازگشایی این فایل تایپ کنید:
/usr/local/texlive/2018/texmf-dist/web2c/texmf.cnf

خط 
TEXMF = {$TEXMFAUXTREES$TEXMFCONFIG,$TEXMFVAR,$TEXMFHOME,!!$TEXMFLOCAL,!!$TEXMFSYSCONFIG,!!$TEXMFSYSVAR,!!$TEXMFDIST}
را بیابید و مسیر شاخه Boostan را به آن اضافه کنید.
TEXMF = {$TEXMFAUXTREES$TEXMFCONFIG,$TEXMFVAR,$TEXMFHOME,!!$TEXMFLOCAL,!!$TEXMFSYSCONFIG,!!$TEXMFSYSVAR,!!$TEXMFDIST,/home/abolfazl/Documents/Boostan}

گام سوم: فونت‌های موجود در پوشه fonts را نصب کنید.

گام چهارم: فایل نمونه را کامپایل کنید. می‌بایست این کامپایل با موفقیت به پایان برسد. 
\documentclass{report}
\input{Boostan-UserManual}

\begin{document}
این یک مثال است. 
\end{document}
