\version "2.24.4"


\header {
  title = "Niggun 015 - Rosh Chodesh Kislev"
  subtitle = "Jewish Folk Song (Chabad-Lubavitch melody)"
%   subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  copyright = "Arrangement © November 2025 / Cheshvan 5786 by Amichai Rosenbaum, All Rights Reserved | v01 | BS''D"
}


upperA = \relative c' {
  \mark \markup { "A" }
  | r8 f16 f f8 f f e d c
  | r8 f16 f f8 f f e d c
  | r8 g'16 g g8 g g4 bes

}

endingAOne = \relative c'' {
  | a4 g f2
}

endingATwo = \relative c'' {
  | a4 g f8 \parenthesize f8 \parenthesize g \parenthesize a
}


upperB = \relative c'' {
  \mark \markup { "B" }
  | \parenthesize bes8 bes16 bes bes8 bes bes2
  | bes4 a g2 \mark \markup { \small "Twice: endings 1 and 2; then continue to C. Third time: al Fine." }
  | \parenthesize a8 a16 a a8 a a2
  | a4 g f2
  | \parenthesize bes8 bes16 bes bes8 bes d2
  | bes4 a g4. d'8
  | c4. d8 c4. d8
}

endingBOne = \relative c'' {
  | c8 a bes d c c16 c16 c4
}

endingBTwo = \relative c'' {
  | c8 a bes g f f f a
}

endingBThree = \relative c'' {
  \once \override Score.VoltaBracket.text = \markup { \text \small "Fine" }
  | c8 a bes g f f16 f f4
}


upperC = \relative c'' {
  \mark \markup { "C" }
  | c2 c 
  | c4 c c c
  | r8 d16 d c8 bes a8. g16 f8 a
  | c4 c c c
  | r8 d16 d c8 bes a8. g16 f8 a
  | c4 c c c
  | r8 d16 d d8 d d2
  | bes8 d16 d d8 d d4. d16 d
  | d4 e f d

}

endingCOne = \relative c'' {
  | c8 r8 e8. d16 c8 bes a bes
}

endingCTwo = \relative c'' {
  | c8 r8 e8. d16 \mark \markup { \small "Go to B, al Fine" } c2
}


% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \repeat volta 2 {
    \upperA 
    \alternative {
      \endingAOne
      \endingATwo
    }
  }
}

sectionUpperB = {
  \repeat volta 3 {
    \upperB
    \alternative {
      \endingBOne
      \endingBTwo
      \endingBThree
    }
  }
}

sectionUpperBMidiFirst = {
  \repeat volta 2 {
    \upperB
    \alternative {
      \endingBOne
      \endingBTwo
    }
  }
}

sectionUpperBMidiLast = {
  \upperB
  \endingBThree
}

sectionUpperC = {
  \repeat volta 2 {
    \upperC
    \alternative {
      \endingCOne
      \endingCTwo
    }
  }
}

% ===== %
% Parts %
% ===== %

myTempo = \tempo 4 = 120

upper = {
  \clef treble
  \key f \major
  \time 4/4
  \myTempo

  \sectionUpperA
  \sectionUpperB
  \sectionUpperC
  
}

upperMidi = {
  \clef treble
  \key f \major
  \time 4/4
  \myTempo
  
  \sectionUpperA
  \sectionUpperBMidiFirst
  \sectionUpperC  
  \sectionUpperBMidiLast
}

% ==== %
% Text %
% ==== %

textAOne = \lyricmode {
%   yai- dai- dai- dai- 
% Lilypond is not tracking the amount of time, so the '4' doesn't mean anything
% it's just skipping the first 38 notes here.
%   yai- dai- dai- dai- \markup { "..." } \repeat unfold 33 { \skip 4 }
  \repeat unfold 38 { \skip 4 }
}

textBOne = \lyricmode {
  \repeat unfold 2 { v'- so̞- mach- to̞ b'- cha- ge- cho̞ v'- ho̞- yi- so̞ ach so̞- mei- ach }
}

textBOneMI = \lyricmode {
  \repeat unfold 2 { ve- sa- mach- ta be- chag- ge- cha ve- ha- yi- ta ach sa- me- ach }
}

textAll = {
  \textAOne
  \textBOne
}

textAllMI = {
  \textAOne
  \textBOneMI
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upper

bodyVoiceMidi = \new Voice = "body" \upperMidi

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"tuba" \bodyVoice
}

staffUpperMidi = \new Staff = upper {
  \set Staff.midiInstrument = #"tuba" \bodyVoiceMidi
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

% \markup {
%   \line {
%     \hspace #25
%     \column {
%       \line { And you shall rejoice in your festivals }
%       \vspace #0.5
%       \line { And you shall be altogether joyful }
%       \vspace #0.5
%     }
%     \hspace #2
%     \column {
%       \right-align {
%         \fontsize #1.5 {
%           \line { בְּחַגֶּךָ וְשָׂמַחְתָּ }
%           \vspace #0.5
%           \line { שָׂמֵחַ אַךְ וְהָיִיתָ }
%           \vspace #0.5
%         }
%       }
%     }
%   }
% }

\markup {
  \vspace #15
}


% \markup {
%   \vspace #2
%   \fill-line {
%     \line { "Words from" \italic "Devarim" "(Deuteronomy) 16:14, 15" }
%   }
% }

\markup {
  \vspace #2
  \fill-line {
    \line { \tiny "Melody: https://www.chabad.org/multimedia/music_cdo/aid/3848160/jewish/Singing-the-Rosh-Chodesh-Kislev-Nigun.htm" }
  }
}

\markup {
  \vspace #2
  \fill-line {
    \line { \tiny "Another version: https://anash.org/avraham-fried-sings-rosh-chodesh-kislev-nigun/" }
  }
}

 


