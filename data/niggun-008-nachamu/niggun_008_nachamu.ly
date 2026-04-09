\version "2.24.4"


\header {
  title = "Niggun 008 - Nachamu"
  subtitle = "Jewish Folk Song (Shabbat Nachamu, from Isaiah 40:1-2)"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  copyright = "© 2025 / 5785 by Amichai Rosenbaum, All Rights Reserved"
}

\markup {
  \vspace #1
  \fill-line {
  \line { Arranged by Amichai Rosenbaum Av 5785 / August 2025 | v02 | BS''D }
}
}



upperAOne = \relative c'' {
  \mark \markup { "A1" }
  g8.\( fis16 e8 g8. fis16 e8
  | fis4. d
  | fis8 e d fis g fis
  | e4. b\)
}

upperATwo = \relative c'' {
  \mark \markup { "A2" }
  g8.\( fis16 e8 g8. fis16 e8
  | fis4. d
  | fis8 e d fis g fis
  | e2.\)
}

upperBOne = \relative c'' {
  \mark \markup { "B1" }
  b8.\( a16 g8 b8. a16 g a
  | a4. fis
  | a8 g fis a b a
  | g4. e\)
}

upperBTwo = \relative c'' {
  \mark \markup { "B2" }
  b8.\( a16 g8 b8. a16 g a
  | a4. fis4~ 16 fis
  | a8 g fis a g fis %16 g
  | e2.\)
}

upper = \relative c' {
  \clef treble
  \key e \minor
  \time 6/8
  \tempo 4. = 50
  
  \repeat volta 2 {

  \upperAOne
  \upperATwo
  \upperBOne
  \upperBTwo
  
  }

}


textAOne = \lyricmode {
  na- cha- mu na- cha- mu a- mi, yo- __ _ _ mar e- lo- kei- chem:
}

textATwo = \lyricmode {
  na- cha- mu na- cha- mu a- mi, yo- mar e- lo- __ _ kei- chem:
}

textBOne = \lyricmode {
  dab'- ru al- leiv y'- ru- sho̞- la- yim v'- __ _ kir- u __ _ ei- le- ho̞
}

textBTwo = \lyricmode {
  dab'- ru al- leiv y'- ru- sho̞- la- yim v'- kir- u ei- le- __ _ _ ho̞
}


textAll = {
  \textAOne
  \textATwo
  \textBOne
  \textBTwo
}

theScore = {
  \new PianoStaff <<
%     \new Staff = upper { \set Staff.midiInstrument = #"trombone" \new Voice = "singer" \upper }
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


\markup {
  \vspace #6
}

\markup {
  \line {
    \hspace #25
    \column {
      \line { "Console, console My people," }
      \vspace #0.5
      \line { says your G-D. }
      \vspace #0.5
      \line { Speak to the heart of Jerusalem }
      \vspace #0.5
      \line { and call to her... }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { עַמִּי, נַחֲמוּ נַחֲמוּ }
          \vspace #0.5
          \line { אֱלֹהֵיכֶם: יֹאמַר }
          \vspace #0.5
          \line { יְרוּשָׁלַם עַל־לֵב דַּבְּרוּ }
          \vspace #0.5
          \line { אֵלֶיהָ וְקִרְאוּ }
          \vspace #0.5
        }
      }
    }
  }
}


\markup {
  \vspace #12
  \fill-line {
	\line { Hebrew text and melody setting: }
}
}

\markup {
  \vspace #1
  \fill-line {
	\line { "https://www.zemirotdatabase.org/view_song.php?id=35#rec" }
}
}

\markup {
  \vspace #1
  \fill-line {
	\line { "Translation: https://www.chabad.org/library/bible_cdo/aid/15971/jewish/Chapter-40.htm#v1" }
}
}
