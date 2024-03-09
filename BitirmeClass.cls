%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Bitirme tezi class dosyası%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%"\th@MakeThesisPrologue" kısmında CBU ya uygun sekilde giris bölümünden önceki dosyaların ic düzenlemeleri ve sıralamaları yapıldı.
%"\@tocline" ve "\@toclinenonbold" daki uygun degisikliklerle icindekiler sayfasında sayfa numaralarının yazım sitili degistirildi.
% İcindekiler sayfasının görünümü "\def\@chapter" ve "\def\numberedsectionwithtwoarguments" kısımlarındaki "\addtocontents" ve "\addcontentsline" 
%komutları icinde yapılan degisiklikler yardımıyla uygun hale getirildi.(CBU Fen Bilimleri enstitüsü icindekiler sayfasının görünümünü önemsememekle
%beraber lazım olursa ilgili kısımlarda degisiklik yapılabilir.)



\NeedsTeXFormat{LaTeX2e}[10/03/2014]
\ProvidesClass{BitirmeClass}[10/03/2014]
\LoadClass[a4paper,oneside,onecolumn]{report}[10/03/2014]
\RequirePackage{ifthen}
\RequirePackage[hang,labelsep=period]{caption}
\RequirePackage{calc}
\captionsetup [table]{position=top, aboveskip=5pt, belowskip=5pt}
\captionsetup [figure]{position=bottom, aboveskip=5pt, belowskip=5pt}

\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}



\ProcessOptions


%Heceleme için hyphenpenalty değerini küçültebilirsiniz. 
%Değer küçüldükçe hecelemek isteyecek, değer büyükdükce hecelemekten kaçacaktır.

\hyphenpenalty=10000
\exhyphenpenalty=10000

\newlength{\ChapterUstenBosluk}
\setlength{\ChapterUstenBosluk}{30mm}

\newcommand{\sol}{\textquotedblleft}          %% Sol tırnak için tanımlandı
\newcommand{\sag}{\textquotedblright}         %% Sağ tırnak için tanımlandı orjinalleri biraz uzun gibi :)
\newcommand{\sagb}{\sag\space}                %% Sağ tırnak ve bir boşluk

\newlength{\mistixI}
\newlength{\mistixII}

\newlength{\LoFparskip}     %% List of Figure parskip , figür listesinde herbir madde arasındaki bosluk
\setlength{\LoFparskip}{0em}

\newlength{\LoTparskip}     %% List of Table parskip , tablo listesinde herbir madde arası bosluk
\setlength{\LoTparskip}{0em}

\newlength{\ToCparskip}     %% Table of Content parskip , icindekiler listesinde herbir madde arasındaki bosluk
\setlength{\ToCparskip}{0em}

\newif\if@KisaltmalarVar  %% Sembol Listesi Olsun mu?
\@KisaltmalarVarfalse

\newif\if@ToCisDotted   %% ToC Noktalı / Noktasız
\@ToCisDottedfalse      %% Default = Noktasız

\newif\if@OnayDateVar   %% Onay Tarihi tezi yazan tarafından belirtilmiş mi? \onaydate{11/10/2004 gibi}
\@OnayDateVarfalse      %% Default = False

\newcommand*{\ToCLineisDotted}{\@ToCisDottedtrue}

\newcommand{\th@StoreIn}[2]{\gdef#1{#2}}  %% Stores the second arg in the command specified by the first arg.

         
\renewcommand*{\author}[2]{
    \th@StoreIn{\th@isimsoyisim}{#1 #2}
    \th@StoreIn{\th@soyisimisim}{#2, #1}
}

\newcommand{\BolumBaskani}[1]{\th@StoreIn{\th@BolumBaskani}{#1}}
\newcommand{\teziyoneten}[1]{\th@StoreIn{\th@TeziYoneten}{#1}}
\newcommand{\onaydate}[1]{\@OnayDateVartrue\th@StoreIn{\th@OnayDate}{#1}}

\newcommand*{\th@titleFtSz}{\fontseries{b}\fontsize{12}{12}\selectfont}             %% Title Font Boyutu
\newcommand*{\th@HdFnt}{\normalfont\selectfont\bfseries}                       %% Başlıklar Kalın (Bold) olacak
\newcommand*{\th@ChSz}{\normalsize\fontsize{10}{10}\selectfont}                     %% Chapter Font Boyutu 
\newcommand*{\th@ScSz}{\normalsize\fontsize{10}{10}\selectfont}                     %% Section Font Boyutu

\renewcommand{\title}[1]{\th@StoreIn{\th@title}{#1}}
\renewcommand{\date}[1]{\th@StoreIn{\th@date}{#1}}


%
% Satır arası geni�li�i kodlar� WinEdt'nin �rnek tezinden d�n��t�r�lm��t�r.
%
\newlength{\defbaselineskip}
\setlength{\defbaselineskip}{\baselineskip}
\newcommand{\setlinespacing}[1]{\setlength{\baselineskip}{#1 \defbaselineskip}}         %%\setlinespacing --> #1 * \defbaselineskip i�lemini ger�ekle�tiriyor
\newcommand{\doublespacing}{\setlength{\baselineskip}{2.0 \defbaselineskip}}            %%\doublespacing = 2*\defbaselineskip
\newcommand{\singlespacing}{\setlength{\baselineskip}{\defbaselineskip}}                %%\singlespacing = 1*\defbaselineskip
\newcommand{\oneandonehalf}{\setlength{\baselineskip}{1.5 \defbaselineskip}}            %%\oneandonehalf = 1.5*\defbaselineskip
\newcommand{\LoFspacing}{\setlength{\baselineskip}{1.3 \defbaselineskip}}               %%\LoFspacing = 1.2*\defbaselineskip, fig�r listesinde �ift sat�rl� maddelerdeki sat�r aras� bo�luk
\newcommand{\LoTspacing}{\setlength{\baselineskip}{1.3 \defbaselineskip}}               %%\LoTspacing = 1.2*\defbaselineskip tablo listesinde �ift sat�rl� maddelerdeki sat�r aras� bo�luk
\newcommand{\ToCspacing}{\setlength{\baselineskip}{1.3 \defbaselineskip}}               %%\ToCspacing = 1.2*\defbaselineskip, icindekiler listesinde �ift sat�rl� maddelerdeki sat�r aras� bo�luk

\newlength{\spacebeforechapterToC} % ToC 'da 1.B�L�M yaz�s�ndan �nceki bo�luk
\setlength{\spacebeforechapterToC}{12mm}

\newlength{\spaceafterchapterToC} % ToC 'da 1.B�L�M yaz�s�ndan sonraki bo�luk (1.B�L�M ile B�L�M ba�l��� aras�ndaki bo�luk.)
\setlength{\spaceafterchapterToC}{7mm}

%
% Sayfa yap�s� tan�mlan�yor...
%

\AtBeginDocument{
        \setlength{\headheight}{10.0mm}         %% Sayfa Ba�l��� (Numaras�) = 10 mm
        \setlength{\headsep}{5mm}             %% Sayfa Ba�l��� ile Sayfa Metni Aras� Bo�luk
        
        \setlength{\marginparsep}{0mm}
        \setlength{\marginparwidth}{0mm}
        \setlength{\leftmargini}{1.25em}
        \setlength{\leftmarginii}{2.2em}
        \setlength{\leftmarginiii}{2.2em}
        \setlength{\leftmarginiv}{2.2em}
        \setlength{\leftmarginv}{2.2em}
        \setlength{\leftmarginvi}{2.2em}
        \setlength{\leftmargin}{0mm}
        \setlength{\labelsep}{.5em}
        \setlength{\labelwidth}{1.5em}
        \setlength{\footskip}{10mm}
        \setlength{\topskip}{0mm}
       \setlength{\parindent}{0pt}             %% Paragraflar�n ilk sat�rlar�n�n ne kadar i�eri girece�i
        \setlength\parskip{10 pt}              %% Paragraflar aras� bosluk
        \pagestyle{plain}
        \markright{}
        \onecolumn
        \raggedbottom
        \normalsize
        \normalfont
        \oneandonehalf
        \setcounter{tocdepth}{5}
        \setcounter{secnumdepth}{10}            %% B�t�n ba�l�klar numaralanacak
        }
        

\newcommand*{\th@ChapterStyle}{\th@HdFnt\th@ChSz}
\newcommand*{\th@SectionStyle}{\th@HdFnt\th@ScSz}
\newcommand*{\th@SubSectionStyle}{\th@HdFnt\th@ScSz}
\newcommand*{\th@OtherSecHeadStyles}{\th@HdFnt\th@ScSz}


\newcommand*{\th@DoChapCenter}{\centering}
\newcommand*{\th@ChapHead}[1]{\protect\th@ChapterStyle \protect\th@DoChapCenter #1}

\newcommand*{\chapternameToC}{\normalsize\selectfont BÖLÜM\normalfont}
\newcommand*{\contentsnameToC}{\normalsize\selectfont İÇİNDEKİLER\normalfont}
\newcommand*{\ozetnameToC}{\normalsize\selectfont ÖZET\normalfont}
\newcommand*{\tesekkurnameToC}{\normalsize\selectfont TEŞEKKÜR\normalfont}
\newcommand*{\ozgecmisnameToC}{\normalsize\selectfont ÖZGEÇMİŞ\normalfont}
\newcommand*{\bibnameToC}{\normalsize\selectfont KAYNAKLAR\normalfont}

\def\prefacename{\th@ChapHead{ÖNSÖZ}}%
\def\refname{\th@ChapHead{KAYNAKLAR}}%
\def\abstractname{\th@ChapHead{ÖZET}}%
\def\bibname{\th@ChapHead{KAYNAKLAR}}%
\def\chaptername{\th@ChapHead{BÖLÜM}}%
\def\contentsname{\th@ChapHead{İÇİNDEKİLER}}%
\def\figurename{Şekil}%
\def\tablename{Tablo}%
\def\partname{\th@ChapHead{KISIM}}%

\newcommand*{\th@DefTheChapter}{\arabic{chapter}}
\newcommand*{\th@DefTheSection}{\th@DefTheChapter.\arabic{section}}
\newcommand*{\th@DefTheSubsection}{\th@DefTheSection.\arabic{subsection}}
\newcommand*{\th@DefTheSubsubsection}{\th@DefTheSubsection.\arabic{subsubsection}}
\newcommand*{\th@DefTheParagraph}{\th@DefTheSubsubsection.\arabic{paragraph}}

\renewcommand*{\thechapter}{\th@DefTheChapter}
\renewcommand*{\thesection}{\th@DefTheSection}
\renewcommand*{\thesubsection}{\th@DefTheSubsection}
\renewcommand*{\thesubsubsection}{\th@DefTheSubsubsection}
\renewcommand*{\theparagraph}{\th@DefTheParagraph}

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      #1 \nobreak
       \if@ToCisDotted
       \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
         mu$}
       \fi
      \hfil\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
  
\def\@tocline#1#2#3#4#5{%
  \vskip 10\p@
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \if@ToCisDotted
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
          mu$}
     \fi
     \hfill
     \nobreak
     \nobreak\hb@xt@\@pnumwidth{\hss\protect\bf #5}
     \par}%
  \fi}

\def\@toclinenonbold#1#2#3#4#5{%
  \vskip 10\p@
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \if@ToCisDotted
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
          mu$}
     \fi
     \hfill
     \nobreak
     \nobreak\hb@xt@\@pnumwidth{\hss#5}
     \par}%
  \fi}


\newcommand*\l@mistix{\@toclinenonbold{1}{0mm}{0mm}}
\renewcommand*\l@section{\@toclinenonbold{1}{5mm}{8mm}}
\renewcommand*\l@subsection{\@toclinenonbold{2}{10mm}{13mm}}
\renewcommand*\l@subsubsection{\@toclinenonbold{3}{15mm}{18mm}}
\renewcommand*\l@paragraph{\@tocline{4}{0mm}{4.1em}}
\renewcommand*\l@table{\@toclinenonbold{1}{0mm}{5.5em}}
\renewcommand*\l@figure\l@table


\newcommand*{\th@title}{
    \ClassError{CBU}{*** You must specify the TITLE of your thesis! ***}
    {Use the \protect\title{} command in the preamble.}}

\newcommand*{\th@date}{
    \ClassError{CBU}{*** You must specify the DATE of your thesis! ***}
    {Use the \protect\date{} command in the preamble.}}


\newcommand*{\th@TeziYoneten}{
    \ClassError{CBU}{*** You must specify the TEZIYONETEN of your thesis! ***}
    {Use the \protect\TeziYoneten{} command in the preamble.}}
    
\newcommand*{\th@BolumBaskani}{
    \ClassError{CBU}{*** You must specify the TEZIYONETEN of your thesis! ***}
    {Use the \protect\BolumBaskani{} command in the preamble.}}

\newcommand*{\th@isimsoyisim}{
        \ClassError{CBU}{*** You must specify the AUTHOR of your thesis! ***}
        {Use the \protect\author{}{} command in the \MessageBreak
                preamble. The first arg is your first name and \MessageBreak
                middle initial.  The second arg is your last name.}}

\newcommand{\th@ozetStash}{
    \ClassError{CBU}{*** You must specify an ozet! ***}
    {Use the \protect\ozetpage[]{} command in the \MessageBreak
        preamble.  If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}


\newcommand{\th@ozgecmisStash}{
    \ClassError{CBU}{*** You must specify an ozgecmis ***}
    {Use the \protect\ozgecmispage[]{} command in the \MessageBreak
        preamble.  If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\renewcommand{\abstract}[1]{\th@StoreIn{\th@abstractStash}{#1}}
\newcommand{\ozet}[1]{\th@StoreIn{\th@ozetStash}{#1}}
\newcommand{\ozgecmis}[1]{\th@StoreIn{\th@ozgecmisStash}{#1}}
\newcommand{\tesekkur}[1]{\th@StoreIn{\th@tesekkurStash}{#1}}

\def\section{\@ifstar\unnumberedsection\numberedsection}
\def\numberedsection{\@ifnextchar[%]
  \numberedsectionwithtwoarguments\numberedsectionwithoneargument}
\def\unnumberedsection{\@ifnextchar[%]
  \unnumberedsectionwithtwoarguments\unnumberedsectionwithoneargument}
\def\numberedsectionwithoneargument#1{\numberedsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsectionwithoneargument#1{\unnumberedsectionwithtwoarguments[#1]{#1}}
\def\numberedsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vspace*{15pt}\goodbreak
  \refstepcounter{section}%
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \hspace{-0.75em}
  \begin{tabular}{ll} 
  \thesection.\ & \parbox[t]{\textwidth - \widthof{\thesection.\ } - 1em}{#2}
  \end{tabular}
  \endgroup\goodbreak
  \setlength{\mistixI}{\widthof{#2}}
  \setlength{\mistixII}{\textwidth - \widthof{\thesection.\ }}
  \ifthenelse{\mistixI > \mistixII}{\vspace{1em}}{}
  %\ifthenelse{\widthof{#2} > {\textwidth - \widthof{\thesection.\ }}}{\vspace{1cm}}{\vspace{0cm}}
  \addcontentsline{toc}{section}{\protect\normalfont\thesection. \protect #1}}
\def\unnumberedsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vspace*{15pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{section}{\protect\bf #1}}
    
\def\subsection{\@ifstar\unnumberedsubsection\numberedsubsection}
\def\numberedsubsection{\@ifnextchar[%]
  \numberedsubsectionwithtwoarguments\numberedsubsectionwithoneargument}
\def\unnumberedsubsection{\@ifnextchar[%]
  \unnumberedsubsectionwithtwoarguments\unnumberedsubsectionwithoneargument}
\def\numberedsubsectionwithoneargument#1{\numberedsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsectionwithoneargument#1{\unnumberedsubsectionwithtwoarguments[#1]{#1}}
\def\numberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vspace*{15pt}\goodbreak
  \refstepcounter{subsection}%
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \thesubsection.\ 
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{subsection}{\protect\normalfont\thesubsection. \protect #1}}
\def\unnumberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vspace*{15pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{subsection}{\protect\bf #1}}

\def\subsubsection{\@ifstar\unnumberedsubsubsection\numberedsubsubsection}
\def\numberedsubsubsection{\@ifnextchar[%]
  \numberedsubsubsectionwithtwoarguments\numberedsubsubsectionwithoneargument}
\def\unnumberedsubsubsection{\@ifnextchar[%]
  \unnumberedsubsubsectionwithtwoarguments\unnumberedsubsubsectionwithoneargument}
\def\numberedsubsubsectionwithoneargument#1{\numberedsubsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsubsectionwithoneargument#1{\unnumberedsubsubsectionwithtwoarguments[#1]{#1}}
\def\numberedsubsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
   \vspace*{15pt}\goodbreak
  \refstepcounter{subsubsection}%
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \thesubsubsection.\ 
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{subsubsection}{\protect\normalfont\thesubsubsection. \protect #1}}
\def\unnumberedsubsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vspace*{15pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{subsubsection}{\protect\bf #1}}

\def\paragraph{\@ifstar\unnumberedparagraph\numberedparagraph}
\def\numberedparagraph{\@ifnextchar[%]
  \numberedparagraphwithtwoarguments\numberedparagraphwithoneargument}
\def\unnumberedparagraph{\@ifnextchar[%]
  \unnumberedparagraphwithtwoarguments\unnumberedparagraphwithoneargument}
\def\numberedparagraphwithoneargument#1{\numberedparagraphwithtwoarguments[#1]{#1}}
\def\unnumberedparagraphwithoneargument#1{\unnumberedparagraphwithtwoarguments[#1]{#1}}
\def\numberedparagraphwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
   \vspace*{15pt}\goodbreak
  \refstepcounter{paragraph}%
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \theparagraph.\ 
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{paragraph}{\protect\bf\protect\numberline{\theparagraph.}\protect\bf #1}}
\def\unnumberedparagraphwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vspace*{15pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{paragraph}{\protect\bf #1}}

\let\th@OldAppCmd\appendix
\renewcommand\appendix{
	\@AppendixVartrue\clearpage
	\th@OldAppCmd
	\def\thechapter{\preappendixname-\arabic{chapter}}
	\captionsetup[table]{listof=false}
	\captionsetup[longtable]{listof=false}
	\captionsetup[figure]{listof=false}
	\addcontentsline{toc}{mistix}{\protect\!\!\!\!\!\!\!\protect\appendixnameToC}
}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                      \global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \addtocontents{toc}{\protect\addvspace{10\p@}}
                          \addcontentsline{toc}{mistix}{\thechapter. \protect #1}
                    \else
                      \relax
                    \fi
                    \chaptermark{#1}%
                    %LoT ve LoF da b�l�mler aras� ge�i�de bir bo�luk b�rak�lacaksa...
                    %\addtocontents{lof}{\protect\addvspace{10\p@}}%
                    %\addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
		\fi
                    }

\def\@makechapterhead#1{
%    \thispagestyle{empty}%
    \vspace*{35mm}%
    {\parindent \z@ \raggedright
    \normalfont
    \th@HdFnt\th@ScSz \centering \thechapter. #1\par\nobreak
    \vskip 20\p@
  }}
\def\@schapter#1{
    \@makeschapterhead{#1}
    \@afterheading
    }
    
\def\@makeschapterhead#1{%
  \vspace*{\ChapterUstenBosluk}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \th@HdFnt\th@ScSz #1\par\nobreak
    \vskip 20\p@}}
  
\newcommand*{\th@DisKapak}{    
     \thispagestyle{empty}
    \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
        \centering\item[]
        \th@titleFtSz T.C.\\ MANİSA CELAL BAYAR ÜNİVERSİTESİ\\ FEN EDEBİYAT FAKÜLTESİ \\
        \vspace{3cm}
        \th@titleFtSz MATEMATİK BÖLÜMÜ\\ [5pt] BİTİRME PROJESİ\\
        \vspace{3cm}
        \th@titleFtSz \th@title 
        \vspace{3cm}
         
        \th@titleFtSz \underline{DANIŞMAN}\\[5pt] \th@TeziYoneten \\
        \vfill
        \th@titleFtSz \underline{HAZIRLAYAN}\\[5pt] \th@isimsoyisim \\
        \vfill
        \includegraphics{logo.eps}\\
        \th@titleFtSz MANİSA  \th@date \\
    \end{list}}


\newcommand*{\th@IcKapak}{
\newpage
  \clearpage
\thispagestyle{empty}
    \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
       \centering\item[]
        \th@titleFtSz T.C.\\[5pt] MANİSA CELAL BAYAR ÜNİVERSİTESİ\\[5pt] FEN EDEBİYAT FAKÜLTESİ\\[5pt] MATEMATİK BÖLÜMÜ\\
        \vspace{6.5cm}
        \th@titleFtSz \th@title \\
        \vspace{6cm}
        \th@isimsoyisim \\
        \vspace{2.5cm}
        \th@titleFtSz BİTİRME PROJESİ
    \end{list}}
    
    
    
\newcommand{\th@onaypage}{
\newpage
  \clearpage
   \thispagestyle{empty} %% E�er comment edilirse Sayfa numaras� g�z�k�yor.
    \begin{minipage}[t]{\textwidth}
    Manisa Celal Bayar Üniversitesi\\ Fen Edebiyat Fakültesi Matematik Bölümü\\[10pt]   
    Bu çalışma tarafımdan incelenmiş olup Bitirme Projesi olarak kabul edilmiştir.\\
      
    \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
    \centering\item[]
    \raggedleft{\if@OnayDateVar \th@OnayDate \else .... / .... / ....... \fi}\\[1cm]
    \raggedright{\textbf{Danışman:} \th@TeziYoneten \\[5pt] \textbf{Öğrenci \hspace{7.4pt}:} \th@isimsoyisim}\\[3cm]
    \rule{\textwidth}{0.4mm}\vspace{2cm}
  \raggedright{ {\bf ONAY} \\[5pt]  Yukarıdaki imzaların adı geçen öğretim üyesi ve öğrencisine ait olduğunu onaylarım.}\\[1cm] 
   \raggedleft{\if@OnayDateVar \th@OnayDate \else .... / .... / ....... \fi}\\[1cm]
   \raggedleft{Fen Edebiyat Fakültesi\\ Matematik Bölümü Başkanı\\ \th@BolumBaskani}
    \end{list}
    \end{minipage}
}
   

\newcommand{\th@ozetpage}{
  \newpage
    \clearpage
    \addcontentsline{toc}{mistix}{\protect\ozetnameToC}
    \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
    \centering\item[]
    \vspace*{55mm}
        \th@ChapterStyle ÖZET\\
    \end{list}
\vskip 20\p@
    \sloppy
    \th@ozetStash   % the actual ozet
    
}

\newcommand{\th@ozgecmispage}{
    \clearpage
    \addcontentsline{toc}{mistix}{\protect\ozgecmisnameToC}%
    \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
    \centering\item[]
       \vspace*{55mm}
        \th@ChapterStyle {\bf ÖZGEÇMİŞ}\\
    \end{list}
\vskip 20\p@
    \sloppy
    \th@ozgecmisStash   % the actual ozgecmis
}


\newcommand{\th@tesekkurpage}{
    \clearpage
    \addcontentsline{toc}{mistix}{\protect\tesekkurnameToC}%
    \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
    \centering\item[]
       \vspace*{55mm}
        \th@ChapterStyle TEŞEKKÜR\\
    \end{list}
     \vspace*{-5mm}
    \sloppy
    \th@tesekkurStash   % the actual tesekkur
}

\renewcommand\tableofcontents{
    \setlength{\ChapterUstenBosluk}{-5mm}
    \chapter*{\contentsname\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \addcontentsline{toc}{mistix}{\protect\contentsnameToC}%
    
    \normalfont\normalsize\
    \setlength{\ChapterUstenBosluk}{30mm}
    \newlength{\th@oldparskip}
    \setlength{\th@oldparskip}{\parskip}
    \setlength{\parskip}{\ToCparskip}
    \@starttoc{toc}
    \setlength{\parskip}{\th@oldparskip}
    
    }

\renewenvironment{thebibliography}[1]
     {
    \setlength{\ChapterUstenBosluk}{-5mm}
     \chapter*{\bibname}%
     \setlength{\ChapterUstenBosluk}{30mm}
     \thispagestyle{empty}
     \addcontentsline{toc}{mistix}{\protect\bibnameToC}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
	    \advance\leftmargin by 0em
	    \setlength\itemindent{0em}
            %\setlength{\leftmargin}{-\leftmargin}
            %\advance\leftmargin by 2em
%           \setlength{\itemsep}{-0.4em}%
%           \setlength{\itemindent}{0mm}%
%           \setlength{\listparindent}{0mm}%
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\newcommand{\th@MakeThesisPrologue}{
        \th@DisKapak
        \th@IcKapak
        \th@onaypage
        \normalfont
        \pagenumbering{roman}%
        \setcounter{page}{0} 
        \th@ozgecmispage
        \th@tesekkurpage
         \th@ozetpage
         \tableofcontents
        \clearpage     
        \addtocontents{toc}{\protect\addvspace{5mm}}%%icindekiler k�sm�nda giristen �nceki bosluk
        \newpage
	\pagenumbering{arabic}
        \oneandonehalf
        }

\let\th@OldBeginDocument\document
\renewcommand*{\document}{
    \th@OldBeginDocument
    \th@MakeThesisPrologue
}
\endinput
