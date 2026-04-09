\version "2.24.4"


\header {
  title = "Niggun 013 - Vesamachta"
  subtitle = "Jewish Folk Song (Chabad-Lubavitch melody)"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Tishrei 5786 / October 2025 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}


upperA = \relative c' {
  \mark \markup { "A" }
  | e16 fis g a b8 b b b b b
  | d8 c4 b8 b8 a16 b a8 g
  | c8 b4 a8 a e e e
  | g8 b a c b4 a
}

endingAOne = \relative c'' {
%   | g8 d16 g d'8 c b2  % more complex version
  | g4 d'8 c b2  % more simple version
}

endingATwo = \relative c'' {
  | g4 fis e2
}

upperB = \relative c'' {
  \mark \markup { "B" }
  % First part
  | e4 b c8 b4.
  | e4 b c8 b4.
  | e4 d c b
  | a8 a c( b) a2
  % Second part
  | d4 a b8 a4.
  | d4 a b8 a4.
  | d4 c b a
  | g8 g b( a) g2
}


upperC = \relative c' {
  \mark \markup { "C" }
  | fis16 g a4 a8 a a a4
  | g8 b g b a a a4
%   | e'8 e e c16 b a8 a a4  % more complex version
  | e'8 e e4 a,8 a a4  % more simple version
}

endingCOne = \relative c' {
  | e8 a a g16 fis g2
}

endingCTwo = \relative c' {
  | e8 a g fis e2
}


% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \repeat volta 2 {
    \upperA
    
    \alternative {
      \endingAOne
      \endingATwo
    }
  }
}

sectionUpperB = {
  \repeat volta 2 {
    \upperB
  }
}

sectionUpperC = {
  \repeat volta 2 {
    \upperC
    
    \alternative {
      \endingCOne
      \endingCTwo
    }
  }
}

% ===== %
% Parts %
% ===== %


upper = {
  \clef treble
  \key e \minor
  \time 4/4
  \tempo 4 = 110

  \sectionUpperA
  \sectionUpperB
  \sectionUpperC
  
}

% ==== %
% Text %
% ==== %

textAOne = \lyricmode {
%   yai- dai- dai- dai- 
% Lilypond is not tracking the amount of time, so the '4' doesn't mean anything
% it's just skipping the first 38 notes here.
%   yai- dai- dai- dai- \markup { "..." } \repeat unfold 33 { \skip 4 }
  \repeat unfold 38 { \skip 4 }
}

textBOne = \lyricmode {
  \repeat unfold 2 { v'- so̞- mach- to̞ b'- cha- ge- cho̞ v'- ho̞- yi- so̞ ach so̞- mei- ach }
}

textBOneMI = \lyricmode {
  \repeat unfold 2 { ve- sa- mach- ta be- chag- ge- cha ve- ha- yi- ta ach sa- me- ach }
}

textAll = {
  \textAOne
  \textBOne
}

textAllMI = {
  \textAOne
  \textBOneMI
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upper

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"clarinet" \bodyVoice
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


\markup {
  \vspace #2
}

\markup {
  \line {
    \hspace #25
    \column {
      \line { And you shall rejoice in your festivals }
      \vspace #0.5
      \line { And you shall be altogether joyful }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { בְּחַגֶּךָ וְשָׂמַחְתָּ }
          \vspace #0.5
          \line { שָׂמֵחַ אַךְ וְהָיִיתָ }
          \vspace #0.5
        }
      }
    }
  }
}

\markup {
  \vspace #20
}


\markup {
  \vspace #2
  \fill-line {
    \line { "Words from" \italic "Devarim" "(Deuteronomy) 16:14, 15" }
  }
}

\markup {
  \vspace #2
  \fill-line {
    \line { "Melody: https://www.chabad.org/multimedia/music_cdo/aid/140746/jewish/Vesomachto.htm" }
  }
}


