\version "2.24.4"

\header {
  title = "Niggun 002a - Shalom Aleichem Melody 2"
  subtitle = "Jewish Folk Song"
  arranger = "Arranged by Amichai Andy Rosenbaum | Iyar 5785 / May 2025 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

upperAOne = \relative c' {
  \mark \markup { "A1" }
  c8\( d16 d d8 d c16 c d d d8 d~ |
  8 d d c f f4\) 
}

upperATwo = \relative c' {
  \mark \markup { "A2" }
  e8\( |
  g8 d d16 d d8 c16 c d8 d8.
}

upperAEndingOne = \relative c' {
  d16 |
  d8 c f e d2\) |
}

upperAEndingTwo = \relative c' {
  a'16 |
  a8 g f e d\) d e f |
}

upperBOne = \relative c' {
  \mark \markup { "B1" }
  g'4\( g8. f16 a8 a4 g8 |
  f4 f8. d16 g8 g4 f8\) |
  \mark \markup { "B2" }
  d4\( d d c |
  r8 f g e f d e f\) |
}

upperBTwo = \relative c' {
  \mark \markup { "B1" }
  g'4\( g8. f16 a8 a4 g8 |
  f4 f8. d16 g8 g4 f8\) |
  \mark \markup { "B3" }
  d2\( d4 c |
  r8 f g e d2\) |
}


upper = \relative c' {
  \clef treble
  \key d \minor
  \time 4/4
  \tempo 4 = 110

  \repeat volta 4 {

  \repeat volta 2 {

  \upperAOne
  \upperATwo
    \alternative {
      \volta 1 { \upperAEndingOne }
      \volta 2 { \upperAEndingTwo }
  }
  
  % \upperAOneShort
  % \upperAThree

  }

  \upperBOne
  \upperBTwo
  }
}

textAOne = \lyricmode {
  \markup \bold { 1. Sha } -- \markup \bold lom \markup \bold a -- \markup \bold lei -- \markup \bold chem | ma -- la -- chei ha -- sha -- \markup \bold reit |
}


textATwo = \lyricmode {
  \markup \bold  "2. Bo - a" -- \markup \bold chem \markup \bold l' -- \markup \bold sha -- \markup \bold lom | ma -- la -- chei ha -- sha -- lom |
}

textAThree = \lyricmode {
  \markup \bold "3. (*Bar') - chu" -- \markup \bold ni \markup \bold l' -- \markup \bold sha -- \markup \bold lom | ma -- la -- chei ha -- sha -- lom |
}

textAFour = \lyricmode {
  \markup \bold { 4. Tzeit } -- \markup \bold chem \markup \bold l' -- \markup \bold sha -- \markup \bold lom | ma -- la -- chei ha -- sha -- lom |
}

textAX = \lyricmode {
  ma -- la -- chei el -- yon |
}

textAY = \lyricmode {
  mi -- me -- lech | ma -- la -- chei { ha -- m' -- } la -- chim
}

textAZ = \lyricmode {
  ha -- | Ka -- dosh Ba -- ruch | Hu
}

textAZAy = \lyricmode {
  ha -- | Ka -- dosh Ba -- ruch | Hu ay ay ay
}

textBOne = \lyricmode {
  \markup \bold Sha -- \markup \bold lom \markup \bold a -- \markup \bold lei -- \markup \bold chem | ma -- la -- chei ha -- sha -- \markup \bold reit _ |
}

textBTwo = \lyricmode {
  \markup \bold "Bo - a" -- \markup \bold chem \markup \bold l' -- \markup \bold sha -- \markup \bold lom | ma -- la -- chei ha -- sha -- lom _ |
}

textBThree = \lyricmode {
  \markup \bold "(*Bar') - chu" -- \markup \bold ni \markup \bold l' -- \markup \bold sha -- \markup \bold lom | ma -- la -- chei ha -- sha -- lom _ |
}

textBFour = \lyricmode {
  \markup \bold  Tzeit -- \markup \bold chem \markup \bold l' -- \markup \bold sha -- \markup \bold lom | ma -- la -- chei ha -- sha -- lom _ |
}

textBX = \lyricmode {
  ma -- la -- chei __ _ el -- __ _ _ yon __ _ _ _ |
}

textBY = \lyricmode {
  mi -- __ _ _ me -- lech | ma -- la -- chei "ha m'" -- la -- chim __ _
}

textBZ = \lyricmode {
  ha -- | Ka -- dosh Ba -- __ _ ruch | Hu
}


theScore = {
  \new PianoStaff <<
    \new Staff = upper { \set Staff.midiInstrument = #"trumpet" \new Voice = "singer" \upper }
    % \new Staff = lower { \lower }
    \new Lyrics \lyricsto "singer"  { \textAOne \textAX \textAY \textAZ \textAZAy \textBOne \textBX \textBY \textBZ }
    \new Lyrics \lyricsto "singer"  { \textATwo \textAX \textAY \textAZ \textAZAy \textBTwo \textBX \textBY \textBZ }
    \new Lyrics \lyricsto "singer"  { \textAThree \textAX \textAY \textAZ \textAZAy \textBThree \textBX \textBY \textBZ }
    \new Lyrics \lyricsto "singer"  { \textAFour \textAX \textAY \textAZ \textAZAy \textBFour \textBX \textBY \textBZ }
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
    \hspace #3
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
