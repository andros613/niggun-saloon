\version "2.24.4"


\header {
  title = "Niggun 011 - Nyet Nyet Nikavo"
  subtitle = "Jewish Folk Song (Chabad-Lubavitch melody)"
%   subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Elul 5785 / September 2025 | v02 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}



upperAOne = \relative c' {
  \mark \markup { "A" }
  | f4 f c8 c c4
  | d8 d d4 a8 a a4
  | d2 c4 d8 e
  | f4 f f2
}

upperBOne = \relative c' {
  \mark \markup { "B" }
  | a'8 a a4 g8 g g4
  | f8 f f4 c8 c c4
  | c2 c4 d8 e
  | f4 f f2
}


% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \repeat volta 2 {
    \upperAOne
  }
}

sectionUpperB = {
  \repeat volta 2 {
    \upperBOne
  }
}

% ===== %
% Parts %
% ===== %


upper = {
  \clef treble
  \key f \major
  \time 4/4
  \tempo 4 = 120

  \sectionUpperA
  \sectionUpperB
  
}

% ==== %
% Text %
% ==== %

textAOne = \lyricmode {
  nyet nyet ni- ka- vo kro- me B-g ad- na- vo ay ay ay- ay ay ay ay
}

textBOne = \lyricmode {
  ay- ay- ay, ay- ay- ay, ay- ay- ay, ay- ay- ay, ay ay ay- ay ay ay ay
}

textAll = {
  \textAOne
  \textBOne
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upper

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"accordion" \bodyVoice
}

staffLyrics = \new Lyrics \with {
  alignBelowContext = "upper"
  \override VerticalAxisGroup.remove-empty = ##t
} \lyricsto "body" { \textAll }

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


\markup {
  \vspace #2
}

\markup {
  \line {
    \hspace #30
    \column {
      \fontsize #1.5 {
        \line { No, no, there is no one }
        \vspace #0.5
        \line { Except for G-D alone }
        \vspace #0.5
      }
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #2 {
          \line { ניקאווא ניעט ניעט }
          \vspace #0.5
        \line { אדנאווא ב-ג קראמיע }
          \vspace #0.5
        }
      }
    }
  }
}

\markup {
  \vspace #30
}

\markup {
  \vspace #2
  \fill-line {
	\line { \small "Melody: https://crownheights.info/chabad-news/902912/nyet-nyet-nikavo-the-full-song-and-its-history/" }
}
}

\markup {
%   \vspace #1
  \fill-line {
	\line { \small "Translation: https://www.zemirotdatabase.org/view_song.php?id=1030" }
}
}
