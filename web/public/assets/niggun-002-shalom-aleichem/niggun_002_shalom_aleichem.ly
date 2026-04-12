\version "2.24.4"

\header {
  title = "Niggun 002 - Shalom Aleichem Melody 1"
  subtitle = "Jewish Folk Song"
  arranger = "Arranged by Amichai Andy Rosenbaum | Iyar 5785 / May 2025 | v02 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

upperAOne = \relative c' {
  \mark \markup { "A1" }
  a4\( f'8 e d4 d |
  cis8 d e d cis bes a4\) |
}

upperAOneShort = \relative c' {
  \mark \markup { "A1" }
  a4\( f'8 e d4 d |
  cis8 d e d cis bes a8\) a8 |
}

upperATwo = \relative c' {
  \mark \markup { "A2" }
  cis8\( cis cis4 d8 cis d f |
  e2 a2\) |
}

upperAThree = \relative c' {
  \mark \markup { "A3" }
  g4\( d' cis bes |
  a1\) |
}

upperBOne = \relative c' {
  \mark \markup { "B1" }
  f8\( g a a a4 a |
  g8 f e f g a g4 |
  f8 e d e f a g f |
  e4. cis8 a2\) |
}

upperBTwo = \relative c' {
  \mark \markup { "B2" }
  e4\( g g g |
  g8 bes a g f e d a |
  f'4 e8 d e d cis e |
  d1\) |
}

upper = \relative c' {
  \clef treble
  \key d \minor
  \time 4/4
  \tempo 4 = 90

  \repeat volta 4 {
  \repeat volta 2 {

  \upperAOne
  \upperATwo
  \upperAOneShort
  \upperAThree

  }

  \upperBOne
  \upperBTwo
  }
}

textAOne = \lyricmode {
  \markup \bold { 1. Sha- } \markup \bold lom \markup \bold a- \markup \bold lei- \markup \bold chem | ma- la- chei ha- sha- _ \markup \bold reit |
}


textATwo = \lyricmode {
  \markup \bold { 2. Bo- a- } \markup \bold chem \markup \bold l'- \markup \bold sha- \markup \bold lom | ma- la- chei ha- sha- _ lom |
}

textAThree = \lyricmode {
  \markup \bold { 3. (*Bar')- chu } \markup \bold ni \markup \bold l'- \markup \bold sha- \markup \bold lom | ma- la- chei ha- sha- _ lom |
}

textAFour = \lyricmode {
  \markup \bold { 4. Tzeit- } \markup \bold chem \markup \bold l'- \markup \bold sha- \markup \bold lom | ma- la- chei ha- sha- _ lom |
}

textAX = \lyricmode {
  ma- la- chei el- __ _ _ _ yon __ _ |
}

textAY = \lyricmode {
  mi- __ _ _ me- lech | ma- la- chei ha- m'- la- chim
}

textAZ = \lyricmode {
  ha- | Ka- dosh Ba- ruch | Hu
}

textAZBar = \lyricmode {
  ha- | Ka- dosh Ba- ruch | \markup { Hu \bold Bar' } |
}

textBOne = \lyricmode {
  \markup \bold Sha- _ \markup \bold lom \markup \bold a- \markup \bold lei- \markup \bold chem | ma- la- chei ha- sha- _ \markup \bold reit |
}

textBTwo = \lyricmode {
  \markup \bold Bo- \markup \bold a- \markup \bold chem \markup \bold l'- \markup \bold sha- \markup \bold lom | ma- la- chei ha- sha- _ lom |
}

textBThree = \lyricmode {
  \markup \bold { (*Bar') chu } _ \markup \bold ni \markup \bold l'- \markup \bold sha- \markup \bold lom | ma- la- chei ha- sha- _ lom |
}

textBFour = \lyricmode {
  \markup \bold  Tzeit- __ _ \markup \bold chem \markup \bold l'- \markup \bold sha- \markup \bold lom | ma- la- chei ha- sha- _ lom |
}

textBX = \lyricmode {
  ma- la- chei _ el- __ _ _ _ yon __ _ _ |
}

textBY = \lyricmode {
  mi- __ _ me- lech | ma- la- chei ha- m'- la- chim
}

textBZ = \lyricmode {
  ha- | Ka- dosh _ Ba- _ ruch _ | Hu
}


theScore = {
  \new PianoStaff <<
    \new Staff = upper { \set Staff.midiInstrument = #"cello" \new Voice = "singer" \upper }
    % \new Staff = lower { \lower }
    \new Lyrics \lyricsto "singer"  { \textAOne \textAX \textAY \textAZ \textBOne \textBX \textBY \textBZ }
    \new Lyrics \lyricsto "singer"  { \textATwo \textAX \textAY \textAZ \textBTwo \textBX \textBY \textBZ }
    \new Lyrics \lyricsto "singer"  { \textAThree \textAX \textAY \textAZ \textBThree \textBX \textBY \textBZ }
    \new Lyrics \lyricsto "singer"  { \textAFour \textAX \textAY \textAZ \textBFour \textBX \textBY \textBZ }
  >>
}

\score {
  \theScore
  \layout { }
  % \midi { \context { \Score midiRepeatTypes #onlyRepeats } }
}

\score {
\unfoldRepeats {
  \transpose c' c  {
  \theScore
}
}
  \midi { }
}

\markup {
    \override #'(direction . -1)
 \vspace #1
  \fill-line {
    \hspace #2
    \column {
      \line { \italic { Say each three times: } }
      \vspace #0.5
      \line { 1. Peace unto you, ministering angels }
      \line { messengers of the Most High }
      \line { of the supreme King of kings }
      \line { the Holy One, blessed he He. }
      \vspace #0.5
      \line { 2. May your coming be in peace, angels of peace, }
      \line { ... }
      \vspace #0.5
      \line { 3. Bless me with peace, angels of peace }
      \line { ... }
      \vspace #0.5
      \line { 4. May your departure be in peace, angels of peace }
      \line { ... }
    }
    \hspace #0.5
    \column  {
      \line { \italic { פעמים: שלוש מהם אחד כל אמור } }
      \vspace #0.5
      \line { הַשָרֵת מַלְאֲכֵי עֲלֵיכֶם שָלוֹם }
      \line { עֶלְיוֹן מַלְאֲכֵי }
      \line { הַמְלָכִים מַלְכֵי מִמֶלֶךְ }
      \line { הוּא בָּרוּךְ הַקָדוֹשׁ }
      \vspace #0.5
      \line { הַשָׁלוֹם מַלְאֲכֵי לְשָׁלוֹם בּוֹאֲכֶם }
      \line { ... }
      \vspace #0.5
      \line { הַשָׁלוֹם מַלְאֲכֵי לְשָלוֹם בָּרְכוּנִי }
      \line { ... }
      \vspace #0.5
      \line { הַשָׁלוֹם מַלְאֲכֵי לְשָלוֹם צֵאתְכֶם }
      \line { ... }
    }
    \hspace #2
  }
}


\markup{
  \vspace #1
  \hspace #8
  \center-column {
  \line { Translation from chabad.org "\"Shalom Aleichem Hebrew and English Text.\"" }
  \line { * In "\"Bar'-chu ni\"" the \italic { Bar' } comes before the beat. }
}
}
