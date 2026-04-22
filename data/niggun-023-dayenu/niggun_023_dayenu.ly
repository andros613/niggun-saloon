\version "2.24.4"


\header {
	title = "Niggun 023 - Dayenu"
  subtitle = "Jewish Folk Song for Pesach (Passover)"
  arranger = "Arranged by Amichai Andy Rosenbaum | Nissan 5780 / April 2020 | v03 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

upperA = \relative d' {
  \mark \markup { "A" }
	| fis8^\mf a a a | a b a g 
	| fis  a a a | a b a g 
	| fis  a e g | fis a e g 
}

upperAEndOne = \relative d' {
  | fis4 g | a2 |
}

upperAEndTwo = \relative d' {
  | fis4 e | d8  r8 r4 |
}


upperB = \relative c' {
  \break
	| fis4^\f fis
	| a8 g4( \parenthesize e8 )
	| g4 g
	| b8 a4( \parenthesize fis8)
	| a4 a
	| d8 cis4 cis8
	| cis a b cis |
}

upperBEndOne = \relative d'' {
	| d8 a fis d |
}

upperBEndTwo = \relative d'' {
	| d4 r4 |
}


% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \repeat volta 2 {
    \upperA
    \alternative {
      \upperAEndOne
      \upperAEndTwo
    }
  }
}

sectionUpperB = {
  \repeat volta 2 {
    \upperB
    \alternative {
      \upperBEndOne
      \upperBEndTwo
    }
  }
}

sectionUpper = {
  \repeat volta 2 {
    \sectionUpperA
    \sectionUpperB
  }
\fine
}

% ===== %
% Parts %
% ===== %

myTempo = \tempo 4 = 100

upper = {
  \clef treble
  \key d \major
  \time 2/4
  \myTempo

  \sectionUpper
  
}

upperMidi = \upper

% ==== %
% Text %
% ==== %

textA = \lyricmode {
	| i- lu i- lu | ho- tzi- a- nu 
	| ho- tzi- a- nu | mi- mitz- ra- yim 
	| ho- tzi- a- nu | mi- mitz- ra- yim 
}

textAEndOne = \lyricmode {
  | day- e- nu |
}

textAEndTwo = \lyricmode {
  | day- e- nu |
}

textB = \lyricmode {
	| day- da- | ye- nu 
	| day- da- | ye- nu
	| day- da- | ye- nu da- 
	| ye- nu da- ye-
}

textBEndOne = \lyricmode {
  nu da- ye- nu
}

textBEndTwo = \lyricmode {
  nu
}


% TODO: MI version

textAll = {
  \textA
  \textAEndOne
  \textAEndTwo
  \textB
  \textBEndOne
  \textBEndTwo
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
  \set Staff.midiInstrument = #"marimba" \bodyVoice
}

staffUpperMidi = \new Staff = upper {
  \set Staff.midiInstrument = #"marimba" \bodyVoiceMidi
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
  \vspace #5
}

\markup {
  \line {
    \hspace #15
    \column {
      \line { If Hashem had brought us out from Egypt }
      \vspace #0.5
      \line { (and had not carried out judgments against them) }
      \vspace #0.5
      \line { it would have sufficed us }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { מִמִּצְרַיִם הוֹצִיאָנוּ אִלּוּ }
          \vspace #0.5
          \line { שְׁפָטִים) בָהֶם עָשָׂה (וְלֹא }
          \vspace #0.5
          \line { דַּיֵּנוּ }
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
    \line { \small "Melody and words: https://www.chabad.org/multimedia/media_cdo/aid/255530/jewish/Dayenu.htm" }
  }
}
