\version "2.24.4"


\header {
  title = "Niggun 019 - Vayehi Bimei Achashveirosh"
  subtitle = "Jewish Folk Song (for Purim) - Chabad-Lubavitch Melody"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Adar 5786 / February 2026 | v02 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

pickupA = \relative c' {
  \partial 8
  d8
}

upperA = \relative c' {
  \mark \markup { "A" }
  | a8 d d4 f8 f e d
  | cis8( e4) e8 f[ e]
}

endAOne = \relative c' {
  d8[ d8]
}

endATwo = \relative c' {
  \partial 4
  d4 
  \break
}

upperB = \relative c' {
  \mark \markup { "B" }
  | f2 a4 g8( f)
  | e8 g4 g8 a g f4
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
  \pickupA
  \repeat volta 2 {
    \upperA
    \alternative {
      { \endAOne }
      { \endATwo }
    }
  }
  \repeat volta 2 {
    \upperB
  }
  \repeat volta 2 {
    \upperC
  }
}

% ===== %
% Parts %
% ===== %

myTempo = \tempo 4 = 120

upper = {
  \clef treble
  \key d \minor
  \time 4/4
  \myTempo

  \sectionUpperA
  
}

upperMidi = \upper

% ==== %
% Text %
% ==== %

textA = \lyricmode {
  vaye- hi bi- mei a- chash- vei- rosh hu a- chash- vei- rosh vaye- rosh 
}

textB = \lyricmode {
  ha- mo- leich mei- ho- du v'- ad- kush
}

textC = \lyricmode {
  she- va v'- es- rim u- mei- o̞ m'- di- no̞
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
    \hspace #10
    \column {
      \line { And it came to pass in the days of Achashveirsoh }
      \vspace #0.5
      \line { - the same Achashveirsoh who ruled from Hodu to Kush, }
      \vspace #0.5
      \line { one hundred and twenty-seven provinces. }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { אֲחַשְׁוֵרוֹשׁ הוּא אֲחַשְׁוֵרוֹשׁ בִּימֵי וַיְהִי }
          \vspace #0.5
          \line { וְעַד־כּוּשׁ מֵהֹדּוּ הַמֹּלֵךְ אֲחַשְׁוֵרוֹשׁ הוּא }
          \vspace #0.5
          \line { מְדִינָה וּמֵאָה וְעֶשְׂרִים שֶׁבַע }
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
    \line { \small "Hebrew text (Esther 1:1): https://www.sefaria.org/Esther.1.1" }
  }
  \fill-line {
    \line { \small "Melody: https://www.chabad.org/multimedia/media_cdo/aid/1518/jewish/Vayehi-Bimei-Achashveirosh.htm" }
  }
}

\markup {
  \vspace #2
  \fill-line {
    \line { \small "Melody: https://www.chabad.org/multimedia/media_cdo/aid/1518/jewish/Vayehi-Bimei-Achashveirosh.htm" }
  }
}


