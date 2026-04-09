\version "2.24.4"

\header {
  title = "Niggun 001 - Rabbi Eade"
  subtitle = "Jewish Chassidich Niggun heard from Rabbi Moshe Chaim Eade at Aish HaTorah"
  % composer = "foo"
  arranger = "Arranged by Amichai Rosenbaum Nissan 5785 / April 2025 | v02 | BS''D"
  % poet = "foo"
  % instrument = "Piano and Voice"
  copyright = "© 2025 / 5785 by Amichai Rosenbaum, All Rights Reserved"
}

upperACommon = \relative c' {
  \mark \markup { "A1" }
  d8\( d16 d d d f8 e d | f2.\) |

  \mark \markup { "A2" }
  d8\( d16 d d d f8 e d | a4 d8 cis4.\) |

  \mark \markup { "A3" }
  d8\( d16 d d d f8 e d | g4 a8 bes4.\) |

}

upperAFirst = \relative c'{
  \mark \markup { "A4" }
  f4\( a8 e4 f16 e | d2.\)
}

upperASecond = \relative c'{
  \mark \markup { "A4" }
  f4\( a8 e4 f16 e | d2~ 8\) d16 e
}

upperBCommon = \relative c' {
  \mark \markup { "B1" }
  f8\( f16 e d8 g g16 f e8 |
  f8 f16 e d8 e d c\) |
}

upperBFirst = \relative c' {
  \mark \markup { "B2" }
  d\( e f g f e16 g |
  f4. e4\) d16 e
}

upperBSecond = \relative c' {
  \mark \markup { "B3" }
  c8\( bes a f' e f |
  d2~ 8\) d16 e
}

upperBFourth = \relative c' {
  \mark \markup { "B3" }
  c8\( bes a f' e f |
  d4. c8\) f g
}

upperBEnd = \relative c' {
  \mark \markup { "B3" }
  c8\( bes a f' e f |
  d2.\)
}

upperCCommon = \relative c' {
  \mark \markup { "C1" }
  a'4.\( d4. |
  a8 bes a g a g |
  f4 a8 c4.\) |

  \mark \markup { "C2" }
  a8\( bes a g c c |
  c8. bes16 a bes a4.\) |

  \mark \markup { "C3" }
  a8\( bes a g a g |
  f8 g8 f16 e d4.\) |
}

upperCFirst = \relative c' {
  \mark \markup { "C4" }
  d8\( e f g f e16 g |
  f4. e4\) f16 g |
}

upperCSecond = \relative c' {
  \mark \markup { "C4" }
  d8\( e f g f e16 g |
  f4. e4\) d16 e |
}

upper = \relative c' {
  \clef treble
  \key d \minor
  \time 6/8
  \tempo 8 = 110

  \upperACommon
  \upperAFirst
  \upperACommon
  \upperASecond

  \upperBCommon
  \upperBFirst
  \upperBCommon
  \upperBSecond

  \upperBCommon
  \upperBFirst
  \upperBCommon
  \upperBFourth

  \upperCCommon
  \upperCFirst
  \upperCCommon
  \upperCSecond

  \upperBCommon
  \upperBFirst
  \upperBCommon
  \upperBEnd

}


% TODO: lower piano with chords

theScore = {
  \new PianoStaff <<
    \new Staff = upper { \set Staff.midiInstrument = #"french horn" \new Voice = "singer" \upper  }
    % \new Staff = lower { \lower }
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

