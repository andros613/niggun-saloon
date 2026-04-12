\version "2.24.4"


\header {
  title = "Niggun 014 - Mizmor LeDavid - Tehillim (Psalms) 23"
  subtitle = "Jewish Folk Song - popular by Seudah Shlishit (Aish HaTorah setting)"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Nissan 5786 / March 2026 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}


% miz- mor l'- do̞- vid
% ha- shem ro- i lo ech- so̞r
upperAOne = \relative c' {
  | b8 d \mark \markup { "A1" } fis e( g b) 
  | fis4. ~ 8 ~ 8. 16
  | fis8( d') cis b g b
  | fis2.
}

%   bin- os de- she yar'- bi- tzei- ni
%   al- mei m'- nu- chos y'- na- ha- lei- ni
upperATwo = \relative c' {
  \mark \markup { "A2" }
  | fis8( d') cis b g4
  | g8( fis) e b' fis8. 16
  | fis16 b fis8 e16 e e8 d cis
  | b2.
}

%   naf- shi y'- sho- veiv
%   naf- shi y'- sho- veiv
upperAThree = \relative c' {
  % Note: markup is still A1 since it's the same melody as actual upperAOne
  \mark \markup { "A1" }
  | b8( d) fis e( g) b
  | fis2.
  | fis8( d') cis b( g) b
  | fis2.
}

% yan- chei- ni v'- mag'- lei- tze- dek
% l'- ma'an sh'- mo
upperAFour = \relative c' {
  % Note: markup is still A2 since it's the same melody as actual upperATwo
  \mark \markup { "A2" }
  | fis8( d' cis) b g8. g16
  | g8( fis) e b' fis8. 16
  | fis16( b fis8 e d4) cis8
  | b2.
}


upperA = {
  \upperAOne
  \break
  \upperATwo
  \break
  \upperAThree
  \break
  \upperAFour
  \break
}

% gam ki- ei- leich b'- gei tzal- mo̞- ves
% ay- ay- ay- ay- ay- ay
upperBOne = \relative c' {
  \mark \markup { "B1" }
  b4 d8 fis4( g8)
  fis4. ~ 4 fis8
  fis4 e8 d4( cis8)
  b8 b' a b16 a g8 fis
}

% lo- i- ro̞ ro̞ ki- a- to̞ i- mo̞- di
upperBTwo = \relative c' {
  \mark \markup { "B2" }
  e4( fis8) g4 a8
  g2.
  g8 fis e g( b) g
  fis8.( g16 a g fis4.)
}

% shiv- t'- cho̞ u- mish- an- te- cho̞
upperBThree = \relative c' {
  \mark \markup { "B3" }
  fis4( g8 a4) b8
  a2.
  a8( fis) d fis( a) fis
  e8.( fis16 g fis e4.)
}

% shiv- t'- cho̞ u- mish- an- te- cho̞
% hei- mo̞ y'- na- cha- mu- ni
upperBFour = \relative c' {
  \mark \markup { "B4" }
  e8( b') cis d4 d8
  cis b ais b4.
  fis8 fis fis ais8 ais cis
  b2.
}

upperB = {
  \upperBOne
  \break
  \upperBTwo
  \break
  \upperBThree
  \break
  \upperBFour
  \break
}

% ta'a- roch l'- fo̞- nai shul- cho̞n
% ta'a- roch l'- fo̞- nai shul- cho̞n
upperCOne = \relative c' {
  \mark \markup { "C1" }
  fis8( d' cis) b8 ~ 8. fis16
  fis8 d' cis b4.
  fis8 d' cis b a g
  fis8.( g16 a g fis4.)
}

% ta'a- roch l'- fo̞- nai shul- cho̞n
% ne- ged tzo- r'- ro̞y
upperCTwo = \relative c' {
  \mark \markup { "C2" }
  fis8( cis' b) ais8 ~ 8. fis16
  fis8 cis' b ais4.
  fis4 8 ais4 cis8
  b2.
}

% di- shan- to̞ va- she- men ro- shi
% di- shan- to̞ va- she- men ro- shi
upperCThree = \relative c' {
  % Note: markup is still C1 since it's the same melody as actual upperCOne
  \mark \markup { "C1" }
  fis8( d') cis b8 ~ 8. fis16
  fis8 d' cis b8 ~ 8. fis16
  fis8 d' cis b a g
  fis8.( g16 a g fis4.)
}

% di- shan- to̞ va- she- men ro- shi
% ko- si r'- vo̞- yo̞
upperCFour = \relative c' {
  % Note: markup is still C2 since it's the same melody as actual upperCTwo
  \mark \markup { "C2" }
  fis8( cis') b ais8 ~ 8. fis16
  fis8 cis' b ais4.
  fis4 8 ais4 cis8
  b2.
}


upperC = {
  \upperCOne
  \break
  \upperCTwo
  \break
  \upperCThree
  \break
  \upperCFour
  \break
}

% ach tov
% ach tov vo̞- che- sed
% ay- ay- ay- ay- ay- ay-
upperDOne = \relative c' {
  \mark \markup { "B1" }
  b4( d8 fis4 g8)
  fis4. ~ 4 fis8
  fis4 e8 d4( cis8)
  b8 b' a b16 a g8 fis
}

% yir- d'- fu- ni
% ko̞l- y'- mei cha- yo̞y
upperDTwo = \relative c' {
  \mark \markup { "B2" }
  e4 fis8 g4( a8)
  g2.
  g8( fis) e g( b) g
  fis8.( g16 a g fis4.)
}

% v'- shav- ti
% oy v'- shav- ti
% v'- shav- ti
% b'- veis- ha- shem
upperDThree = \relative c' {
  \mark \markup { "B3" }
  fis4( g8) a4( b8)
  a8 d cis b a a
  a8 fis d fis( a) fis
  e8.( fis16 g fis e4.)
}

% v'- shav- ti b'- veis- ha- shem
% l'o- rech yo̞- mim
% ay- ay- ay- ay- ay
upperDFour = \relative c' {
  \mark \markup { "B4" }
  e8( b') cis d4 d8
  cis( b) ais b4.
  fis4 fis8 ais4( cis8)
  b8 fis b d cis b
}

upperD = {
  \upperDOne
  \break
  \upperDTwo
  \break
  \upperDThree
  \break
  \upperDFour
  \break
}


upperEOne = \relative c' {
  % Note: markup is still C1 since it's the same melody as actual upperCOne
  \mark \markup { "C1" }
  fis8 d' cis b4.
  fis8 d' cis b4.
  fis8 d' cis b a g
  fis8.( g16 a g fis4.)
}


upperETwo = \relative c' {
  % Note: markup is still C2 since it's the same melody as actual upperCTwo
  \mark \markup { "C2" }
  fis8 cis' b ais4.
  fis8 cis' b ais4.
  fis4 8 ais4 cis8
  b2.
}


upperE = {
  \upperEOne
  \break
  \upperETwo
  \break
}

% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \upperA
}

sectionUpperB = {
  \upperB
}

sectionUpperC = {
  \upperC
}

sectionUpperD = {
  \upperD
}

sectionUpperE = {
  \upperE
}

% ===== %
% Parts %
% ===== %


upper = {
  \clef treble
  \key b \minor
  \time 6/8
  \tempo 8 = 120

  \sectionUpperA
  \sectionUpperB
  \sectionUpperC
  \sectionUpperD
  \sectionUpperE
  
}

% ==== %
% Text %
% ==== %

%
% ay- ay- ay- ay- ...


textAOneTwo = \lyricmode {
  miz- mor l'- do̞- vid
  ha- shem ro- i lo ech- so̞r
  bin- os de- she yar'- bi- tzei- ni
  al- mei m'- nu- chos y'- na- ha- lei- ni
}

textAThreeFour = \lyricmode {
  naf- shi y'- sho- veiv
  naf- shi y'- sho- veiv
  yan- chei- ni v'- mag'- lei- tze- dek
  l'- ma'an sh'- mo
}

textBOneTwo = \lyricmode {
  gam ki- ei- leich b'- gei tzal- mo̞- ves
  ay- ay- ay- ay- ay- ay
  lo- i- ro̞ ro̞ ki- a- to̞ i- mo̞- di
}

textBThreeFour = \lyricmode {
  shiv- t'- cho̞ u- mish- an- te- cho̞
  shiv- t'- cho̞ u- mish- an- te- cho̞
  hei- mo̞ y'- na- cha- mu- ni
}

textCOneTwo = \lyricmode {
  ta'a- roch l'- fo̞- nai shul- cho̞n
  ta'a- roch l'- fo̞- nai shul- cho̞n
  ta'a- roch l'- fo̞- nai shul- cho̞n
  ne- ged tzo- r'- ro̞y
}

textCThreeFour = \lyricmode {
  di- shan- to̞ va- she- men ro- shi
  di- shan- to̞ va- she- men ro- shi
  di- shan- to̞ va- she- men ro- shi
  ko- si r'- vo̞- yo̞
}

textDOneTwo = \lyricmode {
  ach tov ach tov vo̞- che- sed
  ay- ay- ay- ay- ay- ay-
  yir- d'- fu- ni ko̞l- y'- mei cha- yo̞y
}

textDThreeFour = \lyricmode {
  v'- shav- ti
  oy v'- shav- ti
  v'- shav- ti
  b'- veis- ha- shem
  v'- shav- ti b'- veis- ha- shem l'o- rech yo̞- mim
  ay- ay- ay- ay- ay
}

textE = \lyricmode {
  \repeat unfold 27 { ay- } ay
}

textBOneMI = \lyricmode {
%   \repeat unfold 2 { ve- sa- mach- ta be- chag- ge- cha ve- ha- yi- ta ach sa- me- ach }
}

textAll = {
  \textAOneTwo
  \textAThreeFour
  \textBOneTwo
  \textBThreeFour
  \textCOneTwo
  \textCThreeFour
  \textDOneTwo
  \textDThreeFour
  \textE
}

textAllMI = {
%   \textAOne
%   \textBOneMI
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upper

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"cello" \bodyVoice
}

staffLyrics = \new Lyrics \with {
  alignBelowContext = "upper"
  \override VerticalAxisGroup.remove-empty = ##t
} \lyricsto "body" {
  \textAll
%   \textAllMI
}

theScore = {
  \new PianoStaff <<
    \staffUpper
    \staffLyrics
  >>
}

theScoreMidi = {
  \new PianoStaff <<
    \staffUpper
  >>
}

\score {
    \theScore
  \layout {
    \context {
      \Lyrics
      \override LyricText.font-name = #"Garamond"
%       \override LyricText.font-name = #"Times New Roman,"
    }
 }
  % \midi { \context { \Score midiRepeatTypes #onlyRepeats } }
}

\score {
\unfoldRepeats {
  \transpose c' c  {
  \theScoreMidi
  }
}
  \midi { 
	}
}


% \markup {
%   \vspace #-10
% }

\markup {
  \line {
    \hspace #5
    \column {
      \line { A song of David. }
      \vspace #0.1
      \line { The L‑rd is my shepherd; I shall not want. }
      \vspace #0.1
      \line { He causes me to lie down in green pastures; }
      \vspace #0.1
      \line { He leads me beside still waters. }
      \vspace #0.1
      \line { He restores my soul; }
      \vspace #0.1
      \line { He leads me in paths of righteousness for His name's sake. }
      \vspace #0.1
      \line { Even as I walk in the valley of the shadow of death, }
      \vspace #0.1
      \line { I will fear no evil for You are with me; }
      \vspace #0.1
      \line { Your rod and Your staff, they comfort me. }
      \vspace #0.1
      \line { You set a table before me in the presence of my adversaries; }
      \vspace #0.1
      \line { You anointed my head with oil; my cup overflows. }
      \vspace #0.1
      \line { May only goodness and kindness pursue me all the days of my life, }
      \vspace #0.1
      \line { and I will dwell in the house of the L‑rd for length of days. }
      \vspace #0.1
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { לְדָוִד מִזְמור }
          \vspace #0.1
          \line { אֶחְסָר לֹא רֹעִי ה׳ }
          \vspace #0.1
          \line { יַרְבִּיצֵנִי דֶּשֶׁא בִּנְאוֹת }
          \vspace #0.1
          \line { יְנַהֲלֵנִי מְנֻחוֹת עַל־מֵי }
          \vspace #0.1
          \line { יְשׁוֹבֵב נַפְשִׁי }
          \vspace #0.1
          \line { שְׁמוֹ לְמַעַן בְמַעְגְּלֵי־צֶדֶק יַנְחֵנִי }
          \vspace #0.1
          \line { צַלְמָוֶת בְּגֵיא כִּי־אֵלֵךְ גַּם }
          \vspace #0.1
          \line { עִמָּדִי כִּי־אַתָּה רָע לֹא־אִירָא }
          \vspace #0.1
          \line { יְנַחֲמֻנִי הֵמָּה וּמִשְׁעַנְתֶּךָ שִׁבְטְךָ }
          \vspace #0.1
          \line { צֹרְרָי נֶגֶד שֻׁלְחָן לְפָנַי תַּעֲרֹךְ }
          \vspace #0.1
          \line { רְוָיָה כּוֹסִי רֹאשִׁי בַשֶּׁמֶן דִּשַּׁנְתָּ }
          \vspace #0.1
          \line { חַיָּי כׇּל־יְמֵי יִרְדְּפוּנִי וָחֶסֶד טוֹב אַךְ }
          \vspace #0.1
          \line { יָמִים לְאֹרֶךְ בְּבֵית־ה׳ וְשַׁבְתִּי }
          \vspace #0.1
        }
      }
    }
  }
}


\markup {
  \vspace #2
  \fill-line {
    \line { "Hebrew Text from Tehillim (Psalms) 23: https://www.sefaria.org/Psalms.23" }
  }
}

\markup {
  \vspace #2
  \fill-line {
    \line { "English translation from Chabad.org" }
  }
}


