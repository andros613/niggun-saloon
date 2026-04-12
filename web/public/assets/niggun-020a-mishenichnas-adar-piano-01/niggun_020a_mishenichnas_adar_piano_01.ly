\version "2.24.4"

\header {
  title = "Mishenichnas Adar"
  subtitle = "Jewish Folk Song"
  arranger = "Arranged by Amichai Andy Rosenbaum | Adar 5785 / March 2025 | v02 | B''H"
  instrument = "Piano and Voice"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

\markup \vspace #1

upper = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  % A1 mi-she-mi-she-
  g'8-1 e'-5 c-3 c-2 c-3 c-2 c-3 c-2 |
  g8-1 e'-5 c-3 c-2 c-3 c-2 c-3 c-2 |
  g'4-5 e-3 d8-2( c-1) d-2 c-1 |
  e1-3 |

  % A2 mi-she-mi-she-
  g,8-1 e'-5 c-3 c-2 c-3 c-2 c-3 c-2 |
  g8-1 e'-5 c-3 c-2 c-3 c-2 c-3 c-2 |
  g'4-5 e-3 d8-2( c-1) d-2 e-3 |
  c4-1-. c-1( d-2 e-3) |

  % B1 mi-she-nich-nas
  r8 f4-4 e8-3 f-4( g-5) e4-3 |
  r8 f4-4( e8-3 f-4 g-5) e4-3 |
  g4-5 e-3 d8-2( c-1) d-2( c-1) |
  e2.-3 r4 |

  % B2 mi-she-nich-nas
  r8 f4-4 e8-3 f-4( g-5) e4-3 |
  r8 f4-4( e8-3 f-4 g-5) e4-3 |
  g4-5 e-3 d8-2( c-1) d-2( e-3) |
  c1-1 |
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  % A1
  <c e g>1-5-3-1 |
  <c e g>1-5-3-1 |
  <c e g>2-5-3-1  <b d g>2-5-3-1 |
  <c e g>1-5-3-1 |

  % A2
  <c e g>1-5-3-1 |
  <c e g>1-5-3-1 |
  <c e g>2-5-3-1  <b d g>2-5-3-1 |
  <c e g>4-5-3-1 r r2 |

  % B1
  <c f a>2-5-2-1 <c e g>2-5-3-1 |
  <c f a>2-5-2-1 <c e g>2-5-3-1 |
  <c e g>2-5-3-1  <b d g>2-5-3-1 |
  <c e g>2.-5-3-1 r4 |

  % B2
  <c f a>2-5-2-1 <c e g>2-5-3-1 |
  <c f a>2-5-2-1 <c e g>2-5-3-1 |
  <c e g>2-5-3-1  <b d g>2-5-3-1 |
  <c e g>1-5-3-1 |

}

text = \lyricmode {
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

\score {
  \new PianoStaff <<
    \new Staff = upper { \new Voice = "singer" \repeat volta 2 \upper }
    \new Lyrics \lyricsto "singer" \text
    \new Staff = lower { \repeat volta 2 \lower }
  >>
  \layout { }
  \midi { }
}
