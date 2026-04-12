\version "2.24.4"


\header {
  title = "Niggun 006 - Baruch Hashem"
  subtitle = "Jewish Folk Song (Zusha & Pumbadisa melody)"
  % subsubtitle = "Transliteration Style: Tehillat Hashem English"
  subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Sivan 5785 / June 2025 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}



upperAOne = \relative c' {
  \partial 2 r8 c\f\( \mark \markup { "A" } b c
  | d4 d c b8 c 
  | d2. d8 e
  | f4 e8 d e4 c
  | d2\)
}

upperBOne = \relative c' {
  \partial 2 r4 \mark \markup { "B1" } d\(
  | g g g a8 g 
  | f4 e d2
  | f4 e8 d e4 c
  | f2.\)
}

upperBTwo = \relative c' {
  \mark \markup { "B2" }
  d4\( 
  | g g g a8 g 
  | f4 e d2
  | f4 e8 d c4 b8 c
  | d2\)
}

upper = \relative c' {
  \clef treble
  \key d \minor
  \time 4/4
  \tempo 4 = 120
	\repeat volta 2 {
		
  \repeat volta 2 {
  \upperAOne
}
  \upperBOne
	\upperBTwo
}
}


textAOne = \lyricmode {
  Ba- ruch Ha- shem Ba- ruch __ _ Ha- shem yai dai dai dai dai dai dai dai
}
textBOne = \lyricmode {
  Ba- ruch Ha- shem Ba- __ _ ruch Ha- shem yai dai dai dai dai dai
}
textBTwo = \lyricmode {
  Ba- ruch Ha- shem Ba- __ _ ruch Ha- shem yai dai dai dai dai dai dai
}


textAll = {
  \textAOne
%   \textATwo
  \textBOne
  \textBTwo

}

theScore = {
  \new PianoStaff <<
    \new Staff = upper { \set Staff.midiInstrument = #"cello" \new Voice = "singer" \upper }
    % \new Staff = upper { \set Staff.midiInstrument = #"trumpet" \new Voice = "singer" \upper }
    % \new Staff = lower { \lower }
    \new Lyrics \lyricsto "singer"  {
      \textAll
    }
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
  \theScore
  }
}
  \midi { 
	}
}
