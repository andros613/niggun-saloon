\version "2.24.4"

\header {
  title = "Mishenichnas Adar"
  subtitle = "Jewish Folk Song"
  % composer = "foo"
  arranger = "Arranged by Amichai Rosenbaum Adar 5786 / March 2026 | v01 | BS''D"
  % poet = "foo"
  instrument = "Piano and Voice"
  copyright = "© 2025 / 5785 by Amichai Rosenbaum, All Rights Reserved"
}

\markup \vspace #1

upper = \relative c' {
  \clef treble
  \key f \major
  \time 4/4
  \tempo 4=120

  % A1 mi-she-mi-she-
  g8 e' c c c c c c |
  g8 e' c c c c c c |
  g'4 e d8( c) d c |
  e1 |

  % A2 mi-she-mi-she-
  g,8 e' c c c c c c |
  g8 e' c c c c c c |
  g'4 e d8( c) d e |
  c4 c( d e) |

  % B1 mi-she-nich-nas
  r8 f4 e8 f( g) e4 |
  r8 f4( e8 f g) e4 |
  g4 e d8( c) d( c) |
  e1 |

  % B2 mi-she-nich-nas
  r8 f4 e8 f( g) e4 |
  r8 f4( e8 f g) e4 |
  g4 e d8( c) d( e) |
  c1 |
  
  \fine
}

textAll = \lyricmode {
  % A1
  Mi- she- mi- she- mi- she- mi- she- |
  Mi- she- mi- she- mi- she- mi- she- |
  Mi- she- nich- nas A- |
  dar |

  % A2
  Mi- she- mi- she- mi- she- mi- she- |
  Mi- she- mi- she- mi- she- mi- she- |
  Mi- she- nich- nas A- |
  dar ay |

  % B1
  Mi- she- nich- nas |
  A- dar |
  mar- bim b' sim- cha! |

  % B2
  Mi- she- nich- nas |
  A- dar |
  mar- bim b' sim- cha! |
}


% ====== %
% Staves %
% ====== %

upper = \transpose c f { \upper }

upperMidi = \upper

bodyVoice = \new Voice = "body" \upper

bodyVoiceMidi = \new Voice = "body" \upperMidi

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"trumpet" \bodyVoice
}

staffUpperMidi = \new Staff = upper {
  \set Staff.midiInstrument = #"trumpet" \bodyVoiceMidi
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