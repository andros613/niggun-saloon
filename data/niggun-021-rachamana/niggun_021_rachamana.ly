\version "2.24.4"


\header {
  title = "Niggun 020 - Rachamana"
  subtitle = "Jewish Folk Song (from Selichot davening) - Chabad-Lubavitch Melody"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  copyright = "Arrangement © March 2026 / Adar 5786 by Amichai Rosenbaum, All Rights Reserved | v01 | BS''D"
}

upperATwoLines = \relative c' {
  | d8 ees fis ees d( ees) c ees
  | d8( ees) fis ees d ees c d

}

upperALineThree = \relative c'' {
  | g4 fis ees8( d) ees( c)
}

upperA = \relative c' {
  \mark \markup { "A" }
  \upperATwoLines
  \upperALineThree
}

endAOne = \relative c' {
  d2( fis)
}

endATwo = \relative c' {
  d1
}

upperB = \relative c' {
  \mark \markup { "B" }
  | d8. d16 fis8( g) a2
  | bes8.( a16 bes8. a16) bes8 a4 g8
  | a8.( g16) a8.( g16) g8 fis4.
  | fis8( d bes') a g a4.
  | fis8( d g) fis ees d4.
}

upperC = \relative c' {
  \mark \markup { "C" }
  | a'4 d, f4 e8 d
  | cis8 e4 e8 f e d4
}

% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \repeat volta 2 {
    \upperA
    \alternative {
      { \endAOne }
      { \endATwo }
    }
  }
}

sectionUpperB = {
  \repeat volta 2 {
    \upperB
  }
}

% ===== %
% Parts %
% ===== %

myTempo = \tempo 4 = 60 - 120

myTempoOne = \tempo 4 = 60
myTempoTwo = \tempo 4 = 80
myTempoThree = \tempo 4 = 100
myTempoFour = \tempo 4 = 120

upper = {
  \clef treble
  \key g \minor
  \time 4/4
  \myTempo

  \sectionUpperA
  \sectionUpperB
  
}

upperMidi = {
  \myTempoOne
  \sectionUpperA
  \sectionUpperB
  
  \myTempoTwo
  \sectionUpperA
  \sectionUpperB

  \myTempoThree
  \sectionUpperA
  \sectionUpperB

  \myTempoFour
  \upperATwoLines
  \myTempoOne
  \upperALineThree
  \endATwo
}

% ==== %
% Text %
% ==== %

textA = \lyricmode {
  ra- cha- mo̞- no̞ d'- o̞- nei
  d'- o̞- nei la- a- ni- yei
  o̞y vei, a- nei- no̞
}

textAEndTwo = \lyricmode {
  no̞
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
  \textAEndTwo
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
  \set Staff.midiInstrument = #"clarinet" \bodyVoice
}

staffUpperMidi = \new Staff = upper {
  \set Staff.midiInstrument = #"clarinet" \bodyVoiceMidi
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
      \line { May the Merciful One }
      \vspace #0.5
      \line { Who answers the poor, }
      \vspace #0.5
      \line { answer us. }
      \vspace #0.5
      \line { May the Merciful One }
      \vspace #0.5
      \line { Who answers the broken-hearted, }
      \vspace #0.5
      \line { answer us. }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { רַחֲמָנָא }
          \vspace #0.5
          \line { לַעֲנִיֵי דְעָנֵי }
          \vspace #0.5
          \line { עֲנֵינָא }
          \vspace #0.5
          \line { רַחֲמָנָא }
          \vspace #0.5
          \line { לִבָּא לִתְבִירֵי דְעָנֵי }
          \vspace #0.5
          \line { עֲנֵינָא }
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
  \fill-line {
    \line { \small "Melody: https://www.chabad.org/multimedia/music_cdo/aid/140676/jewish/Rachamono.htm" }
  }
}
\markup {
  \vspace #2
  \fill-line {
    \line { \small "Melody: https://www.chabad.org/therebbe/livingtorah/player_cdo/aid/1264771/jewish/Niggun-Rachamana.htm" }
  }
}
\markup {
  \vspace #2
  \fill-line {
    \line { \small "Melody: https://www.chabad.org/multimedia/music_cdo/aid/3514695/jewish/Singing-Rachamana.htm" }
  }
}

