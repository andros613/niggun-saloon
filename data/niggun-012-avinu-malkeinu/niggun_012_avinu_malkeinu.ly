\version "2.24.4"


\header {
  title = "Niggun 012 - Avinu Malkeinu"
  subtitle = "Jewish Folk Song (Chabad-Lubavitch melody)"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Tishrei 5786 / October 2025 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}



upperAOne = \relative c' {
  \mark \markup { "A1" }
  | e8. gis16 gis8. f16 f16 e8.
  | e16 e8. e4 e
  | f8. e16 d8[ cis] d[ f]
  | e16 e8. e4 cis8 a
}

upperATwo = \relative c' {
  \mark \markup { "A2" }
  | e8. gis16 gis8. f16 f16 e8.
  | e16 e8. e4 e
  \time 4/4
  | f8. e16 d8[ cis] d[ a'] gis[ f]
}

upperAX = \relative c' {
  \time 3/4
  | f4 e2
}

upperAY = \relative c' {
  \time 3/4
  | f4 e4. e8
}

upperBOne = \relative c'' {
  \mark \markup { "B1" }
  | a4 a a
  | a gis2
  | a4 c4( b8) a
  | a4 gis4. e8
}

upperBTwoEarly = \relative c'' {
  \mark \markup { "B2" }
  | a4 a a
}

upperBTwoSplitFirstTime = \relative c'' {
  a4
}

upperBTwoSplitSecondTime = \relative c'' {
  \parenthesize e4
}

upperBTwoSplitJoint = \relative c'' {
  \oneVoice
  <<
    \new Voice = "two" {
      \voiceTwo
      \override Stem.direction = #UP
      \tiny
      \upperBTwoSplitSecondTime
      \mark \markup { \tiny "(2nd Time)" }
      \normalsize
      \revert Stem.direction
    }
%     \new Voice = "two" {
    {
      \voiceOne
      \override Stem.direction = #DOWN
      \upperBTwoSplitFirstTime
      \revert Stem.direction
    }
  >>
  \oneVoice
}

upperBTwoLate = \relative c' {
  d4. d8
  | e[ f] gis[ a] gis[ f]
}

upperBTwoScore = {
  \upperBTwoEarly
  \upperBTwoSplitJoint
  \upperBTwoLate
}

upperBX = \relative c'' {
  | a4 gis4. e8
}

upperBY = \relative c' {
  | f4 e2
}

upperCOne = \relative c' {
  \mark \markup { "C1" }
  | d4 e f
  | gis8. f16 gis2
  \time 4/4
  | f16 e8. d4 e4 f4 
  \time 3/4
  | e16 e8. e4 cis8 a
}

upperCTwo = \relative c' {
  \mark \markup { "C2" }
  | d4 e f
  | gis8. f16 gis2
  \time 4/4
  | f16 e8. d4 a'4 gis8 f 
  \time 3/4
  | f4 e2
}

% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \repeat volta 2 {
    \upperAOne
    \upperATwo
    
    \alternative {
      \upperAX
      \upperAY
    }
  }
}

sectionUpperBScore = {
  \repeat volta 2 {
    \upperBOne
    \upperBTwoScore
    
    \alternative {
      \upperBX
      \upperBY
    }
  }
}

sectionUpperBMidi = {
    \upperBOne
    \upperBTwoEarly
    \upperBTwoSplitFirstTime
    \upperBTwoLate
    \upperBX
    
    \upperBOne
    \upperBTwoEarly
    \upperBTwoSplitSecondTime
    \upperBTwoLate
    \upperBY
}

sectionUpperC = {
  \upperCOne
  \upperCTwo
}

% ===== %
% Parts %
% ===== %

upperScore = {
  \clef treble
  \key a \minor
  \time 3/4
  \tempo 4 = 60

  \sectionUpperA
  \sectionUpperBScore
  \sectionUpperC
  
}

upperMidi = {
  \clef treble
  \key a \minor
  \time 3/4
  \tempo 4 = 60

  \sectionUpperA
  \sectionUpperBMidi
  \sectionUpperC  

}

% ==== %
% Text %
% ==== %

textAOne = \lyricmode {
  Ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma-
}

textATwo = \lyricmode {
  Ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma- ma-
}

textBOne = \lyricmode {
  o̞- vi- nu mal- kei- nu o̞- vi- nu o̞- to̞
}

textBTwo = \lyricmode {
  o̞- vi- nu mal- kei- nu ein lo̞- nu- me- lech e- lo̞
}

textBX = \lyricmode {
  o̞- to̞ o̞-
}

textBY = \lyricmode {
  o̞- to̞
}

textCOne = \lyricmode {
  Ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay
}

textCTwo = \lyricmode {
  Ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay- ay
}

textAll = {
  \textAOne
  \textATwo
  \textBOne
  \textBTwo
  \textBX
  \textBY
  \textCOne
  \textCTwo
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upperScore

bodyVoiceMidi = \new Voice = "body" \upperMidi

staffUpper = \new Staff = upper {
  \bodyVoice
}

staffUpperMidi = \new Staff = upper {
  \set Staff.midiInstrument = #"cello" \bodyVoiceMidi
}

staffLyrics = \new Lyrics \with {
  alignBelowContext = "upper"
  \override VerticalAxisGroup.remove-empty = ##t
} \lyricsto "body" { \textAll }

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
      \Score
      \override TimeSignature.style = #'numbered
    }
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
      \line { Our Father, our King, }
      \vspace #0.5
      \line { You are our Father. }
      \vspace #0.5
      \line { Our Father, our King, }
      \vspace #0.5
      \line { we have no King other than You. }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { מַלְכֵּנוּ אָבִינוּ }
          \vspace #0.5
          \line { אָתָּה אָבִינוּ }
          \vspace #0.5
          \line { מַלְכֵּנוּ אָבִינוּ }
          \vspace #0.5
          \line { אָתָּה אֶלָּא מֶלֶךְ לָנוּ אֵין }
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
	\line { \small "Melody: https://www.chabad.org/multimedia/music_cdo/aid/140681/jewish/Ovinu-Malkeinu.htm" }
}
}

\markup {
%   \vspace #1
  \fill-line {
	\line { \small "Text: https://www.chabad.org/torah-texts/1627771/Online-Siddur-with-Commentary/Viduy-And-Tachnun/Avinu-Malkeinu" }
}
}
