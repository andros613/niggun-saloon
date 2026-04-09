\version "2.24.4"


\header {
  title = "Niggun 018 - Keli Ata"
  subtitle = "Jewish Folk Song (part of Hallel davening) - Chabad-Lubavitch Melody"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Shevat 5786 / January 2026 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}


upperAOne = \relative c' {
  \mark \markup { "A1" }
  | d4 g g g
  | fis8 g a( g) a2
  | d,4 fis fis4. fis8
  | d8 fis a( fis) g2
}

upperATwo = \relative c'' {
  \mark \markup { "A2" }
  | g4 bes bes bes
  | bes8 c d( bes) c2
  | bes8. a16 g8 bes a8. g16 fis8( a)
  | g2( f2)
}

upperBOne = \relative c'' {
  \mark \markup { "B1" }
  | bes4 d8 d8 d2
  | bes8( d f d) c2
  | a4 c c c
  | a8( c ees c) bes2
}

upperBTwo = \relative c'' {
  \mark \markup { "B2" }
  | g4 bes8 bes bes2
  | bes8( c d bes) c2
  | bes8. a16 g8 bes a8.( g16 fis8 a)
  | g1
}

% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \upperAOne
  \upperATwo
  \upperBOne
  \upperBTwo
}

% ===== %
% Parts %
% ===== %

myTempo = \tempo 4 = 60

upper = {
  \clef treble
  \key g \minor
  \time 4/4
  \myTempo

  \sectionUpperA
  
}

upperMidi = \upper

% ==== %
% Text %
% ==== %

textAOne = \lyricmode {
  kei- li a- to̞ v'- o- de- ko̞ e- lo- kai a- ro- m'- me- ko̞
}

textATwo = \textAOne

textBOne = \lyricmode {
  ho- du la- shem ki tov ki l'- o- lo̞m chas- do
}

textBTwo = \textBOne

% TODO: MI version

textAll = {
  \textAOne
  \textATwo
  \textBOne
  \textBTwo
}

textAllMI = {
  % TODO: MI version
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upper

bodyVoiceMidi = \new Voice = "body" \upperMidi

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"cello" \bodyVoice
}

staffUpperMidi = \new Staff = upper {
  \set Staff.midiInstrument = #"cello" \bodyVoiceMidi
%   \bodyVoiceMidi
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
    \staffUpperMidi
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
  \vspace #5
}

\markup {
  \line {
    \hspace #25
    \column {
      \line { You are my God and I shall thank You; }
      \vspace #0.5
      \line { my God, I shall exalt You. }
      \vspace #0.5
      \line { Give thanks to Hashem because He is good, }
      \vspace #0.5
      \line { for His kindness is eternal. }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { וְאוֹדֶךָּ אַתָּה קֵלִי }
          \vspace #0.5
          \line { אֲרוֹמְמֶךָּ אֱלֹקַי }
          \vspace #0.5
          \line { טוֹב כִּי לַיי הוֹדוּ }
          \vspace #0.5
          \line { חַסְדּוֹ לְעוֹלָם כִּי }
          \vspace #0.5
        }
      }
    }
  }
}


\markup {
  \vspace #15
}


\markup {
  \vspace #2
  \fill-line {
    \line { \small "Hebrew text and translation: https://www.chabad.org/library/bible_cdo/aid/16339/jewish/Chapter-118.htm" }
  }
}

\markup {
  \vspace #2
  \fill-line {
    \line { \small "Melody: https://www.chabad.org/multimedia/music_cdo/aid/254255/jewish/Keli-Ata.htm" }
  }
}


