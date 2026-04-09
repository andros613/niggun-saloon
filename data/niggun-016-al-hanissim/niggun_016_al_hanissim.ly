\version "2.24.4"


\header {
  title = "Niggun 016 - Al Hanissim"
  subtitle = "Jewish Folk Song (part of Chanukah davening)"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Tevet 5786 / December 2025 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}


upperA = \relative c' {
%   \mark \markup { "A" }
  | d4 e f d
  | g8 g4 f8 e4 c
  | c8 c4 d8 e( d) c4
  | d8 d4 e8 f( e) d a
  | d8 d d e f4 d8 d
  | g8 g g f e4 c4
  | c8 c c c c d e c
  | d1
}


% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \repeat volta 2 {
    \upperA 
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

textAOne = \lyricmode {
  (v')al ha- ni- sim
  v'- al ha- pur- ko̞n
  v'- al ha- g'vu- ros
  v'- al ha- t'shu- os
  v'- al ha- nif- lo̞- os
  she- o̞- si- so̞ la'a- vo- sei- nu
  ba- yo̞- mim ho̞- heim biz- man ha- ze
}

textAOneMI = \lyricmode {
  (ve-)'al ha- nis- sim
  ve- 'al ha- pur- kan
  ve- 'al ha- g'vu- rot
  ve- 'al ha- te-shu- 'ot
  ve- 'al ha- nif- la- 'ot
  she- 'a- si- ta la'a- vo- tei- nu
  ba- ya- mim ha- hem biz- man ha- zeh
  
}

textAll = {
  \textAOne
}

textAllMI = {
  \textAOneMI
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upper

bodyVoiceMidi = \new Voice = "body" \upperMidi

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"trumpet" \bodyVoice
}

staffUpperMidi = \new Staff = upper {
  \set Staff.midiInstrument = #"trumpet" \bodyVoiceMidi
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
      \line { [We thank You G‑d] For the miracles, }
      \vspace #0.5
      \line { the redemption, }
      \vspace #0.5
      \line { the mighty acts, }
      \vspace #0.5
      \line { the saving acts, }
      \vspace #0.5
      \line { and for the wonders }
      \vspace #0.5
      \line { that You have done for our fathers, }
      \vspace #0.5
      \line { in those days at this time. }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { הַנִסִּים וְעַל }
          \vspace #0.5
          \line { הַפֻּרְקָן וְעַל }
          \vspace #0.5
          \line { הַגְבוּרוֹת וְעַל }
          \vspace #0.5
          \line { הַתְּשׁוּעוֹת וְעַל }
          \vspace #0.5
          \line { הַנִפְלָאוֹת וְעַל }
          \vspace #0.5
          \line { לַאֲבוֹתֵינוּ שֶׁעָשִׂיתָ }
          \vspace #0.5
          \line { הַזֶה בִּזְמַן הָהֵם בַּיָמִים }
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
    \line { \small "Hebrew text and translation: https://www.chabad.org/multimedia/music_cdo/aid/797126/jewish/Al-Hanissim.htm" }
  }
}


