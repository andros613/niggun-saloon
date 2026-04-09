\version "2.24.4"

\header {
  title = "Mishenichnas Adar"
  subtitle = "Jewish Folk Song"
  % composer = "foo"
  arranger = "Arranged by Amichai Rosenbaum Adar 5785 / March 2025 | v02 | BS''D"
  % poet = "foo"
  instrument = "Piano and Voice"
  copyright = "© 2025 / 5785 by Amichai Rosenbaum, All Rights Reserved"
}

\markup \vspace #1

upper = \relative c' {
  \clef treble
  \key c \major
  \time 4/4
  \tempo 4=100
  
  \override Fingering.avoid-slur = #'inside
  \override Slur.outside-staff-priority = #500

  \mp
  % A1 mi-she-mi-she-
  g8-1 e'-5 c-3 c-2 c-3 c-2 c-3 c-2 |
  g8-1 e'-5 c-3 c-2 c-3 c-2 c-3 c-2 |
  g'4-5 e-3 d8-2( c-1) d-2 c-1 |
  e1-3 |

  % A2 mi-she-mi-she-
  g,8-1 e'-5 c-3 c-2 c-3 c-2 c-3 c-2 |
  g8-1 e'-5 c-3 c-2 c-3 c-2 c-3 c-2 |
  g'4-5 e-3 d8-2( c-1) d-2 e-3 |
  c4-1-. c-1\< d-2 e-3\! |

  \f
  % B1 mi-she-nich-nas
  r8 f4-4 e8-3 f-4( g-5) e4-3 |
  r8 f4-4( e8-3 f-4 g-5) e4-3 |
  g4-5 e-3 d8-2( c-1) d-2( c-1) |
  e1-3 |

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
  c4-5 e-3 g-1 e-3 |
  c-5 e-3 g-1 e-3 |
  c-5 e-4 f-3 fis-2 |
  g-1 f-2 e-3 d-4 |

  % A2
  c4-5 e-3 g-1 e-3 |
  c-5 e-3 g-1 e-3 |
  c-5 e-3 f-2 g-1 |
  c,4-5-. c-5 d-4 e-3 |

  \break
  % B1
  f2-2 e2-3 |
  f2-2 e2-3 |
  c4-5 e-4 f-3 fis-2 |
  g-1 f-2 e-3 d-4 |

  % B2
  f2-2 e2-3 |
  f2-2 e2-3 |
  c4-5 e-3 f-2 g-1 |
  c,-2 g-3 c,2-5 |

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
  dar ay ay ay |

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
