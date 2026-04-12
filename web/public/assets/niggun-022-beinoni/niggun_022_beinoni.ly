\version "2.24.4"


\header {
  title = "Niggun 022 - Beinoni"
  subtitle = "Jewish Folk Song - Chabad-Lubavitch Melody"
  arranger = "Arranged by Amichai Andy Rosenbaum | Adar 5786 / March 2026 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

upperA = \relative c' {
  \mark \markup { "A1" }
  | c8. c16 g'4 g g
  | g16 aes8. g16 aes8. b4
    aes8 g8
  | f8. g16 aes16 g8. g8 b aes g
  | c4 c c c
  \break
  \mark \markup { "A2" }
  | f,8. f16 g4 g g
  | g16 aes8. g16 aes8. b4 aes16 g8.
  | f8 ees' d c b c b aes
  | aes4 g2.
}

upperB = \relative c' {
  \break
  \mark \markup { "B1" }
  | g'8. g16 c4. b8 c16 b aes8
  | c4 aes g f
  | g8. g16 c4. ees8 d c
  | ees4 c c c
  \break
  \mark \markup { "B2" }
  | f,8. aes16 c4. b8 c16 b aes8
  | c4 aes g f
  | f8 aes g f f c' b aes
   \time 3/4
  | aes4 g2
}

upperC = \relative c' {
  \break
  \mark \markup { "C1" }
  \time 3/4
  | c'16 c8. c16 c8. c16 c8.
  \time 4/4
  | ees4 c4. bes16 c bes8 aes
  \time 5/4
  | g4 ees' c4. bes16 c bes8 aes
  \time 4/4
  | g4 c f,2
  | f8 aes g f f ees' d c
  \break
  \mark \markup { "C2" }
  \time 3/4
  | c16 c8. c16 c8. c16 c8.
  \time 4/4
  | ees4 c4. bes16 c bes8 aes
  \time 5/4
  | g4 ees' c4. bes16 c bes8 aes
  \time 4/4
  | g4 c f,2
  | f8 aes g f f c' b aes
   \time 3/4
  | aes4 g2
}

% ======== %
% Sections %
% ======== %

sectionUpperA = {
%   \repeat volta 2 {
    \upperA
%   }
%   \repeat volta 2 {
    \upperB
%   }
%   \repeat volta 2 {
    \upperC
%   }
\fine
}

% ===== %
% Parts %
% ===== %

myTempo = \tempo 4 = 60

upper = {
  \clef treble
  \key c \minor
  \time 4/4
  \myTempo

  \sectionUpperA
  
}

upperMidi = \upper

% ==== %
% Text %
% ==== %

textA = \lyricmode {
  ra- cha- mo̞- no̞ d'- o̞- nei
  d'- o̞- nei la- a- ni- yei
  o̞y vei, a- nei- no̞
}

textB = \lyricmode {
  ra- cha- mo̞- no̞
  d'- o̞- nei
  lis- vi- rei
  li- bo̞
  o̞y a- nei- no̞
  o̞y a- nei- no̞
}

textC = \lyricmode {
  ra- cha- mo̞- no̞
  d'- o̞- nei
  lis- vi- rei
  li- bo̞
  o̞y a- nei- no̞
  o̞y a- nei- no̞
}

% TODO: MI version

textAll = {
  \textA
  \textB
  \textC
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
%     \staffLyrics
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
    ragged-last = ##t
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
  \vspace #10
}

\markup {
  \vspace #2
  \fill-line {
    \line { \small "Melody ft. Eli Marcus: https://www.youtube.com/watch?v=d7awxGWmIV0" }
  }
}


\markup {
  \vspace #2
  \fill-line {
    \line { \small "Melody (Eli Lipsker and Velvel Pasternak): https://www.chabad.org/multimedia/music_cdo/aid/140814/jewish/Beinoni.htm" }
  }
}
\markup {
  \vspace #2
  \fill-line {
    \line { \small "Melody (Yacov Young): https://www.chabad.org/multimedia/music_cdo/aid/1415368/jewish/Singing-the-Beinoni.htm" }
  }
}
