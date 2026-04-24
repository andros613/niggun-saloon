\version "2.24.4"


\header {
	title = "Niggun 025 - Eliyahu HaNavi"
  subtitle = "Jewish Folk Song for Pesach (Passover)"
  arranger = "Arranged by Amichai Andy Rosenbaum | Nissan 5786 / April 2026 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

sopChorus = \relative g' {
	| \tuplet 3/2 { bes4 a8 } g4 g
  | \tuplet 3/2 { fis4 d8 } g4 r
	| \tuplet 3/2 { bes4 a8 } g4 g
  | \tuplet 3/2 { bes4 c8 } d4 r
  \break
	| \tuplet 3/2 { d4 c8 } bes4 d
  | \tuplet 3/2 { c4 bes8 } a4 c4
  | \tuplet 3/2 { bes4 a8 } g8( ees') d c
	| \tuplet 3/2 { bes4 a8 } g4 r
}

sopVerse = \relative g' {
	% bim herah
	  | c8 c8 c4. bes8
    | a8 bes8 c2
    
    % ya-avo
    | d8( ees8) d4. c8
    | bes8( a8) g2

    \break
    
    % im mashiach 1
	  | c8 c8 c4. bes8
    | a8 bes8 c2
    
    % im mashiach 2
    | d8 ees8 d4. c8
    | bes8 a8 g2
}



sectionUpper = {
  \repeat volta 2 {
    \tempo 4 = 65
    \time 3/4
    \sopChorus
    \break
    \sopVerse
  }
\fine
}

% ===== %
% Parts %
% ===== %


upper = {
  \clef treble
  \key e \minor
  \time 6/8

  \transpose g e {
    \sectionUpper
  }
}

upperMidi = \upper

% ==== %
% Text %
% ==== %

textA = \lyricmode {
  | ei- li- yo̞- hu | ha- no̞- vi
  | ei- li- yo̞- hu | ha- tish- bi
  | ei- li- yo̞- hu | ei- li- yo̞- hu | ei- li- yo̞- hu ha- | gil- o̞- di
}

textB = \lyricmode {
  bim- hei- ro̞ b'- ya- mei- nu
  yo̞- vo ei- lei- nu
  im mo̞- shi- ach ben do̞- vid
  im mo̞- shi- ach ben do̞- vid
}


% TODO: MI version

textAll = {
  \textA
  \textB
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
    ragged-last = ##f
    \context {
      \Lyrics
      \override LyricText.font-name = #"Garamond"
    }
 }
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
      \line { Elijah the Prophet }
      \vspace #0.5
      \line { Elijah the Tishbite }
      \vspace #0.5
      \line { Elijah the Giladite }
      \vspace #0.5
      \line { may he soon in our days }
      \vspace #0.5
      \line { come to us }
      \vspace #0.5
      \line { with Mashiach the son of David. }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { הַנָבִיא אֵלִיָהוּ }
          \vspace #0.5
          \line { הַתִּשְׁבִּי אֵלִיָהוּ }
          \vspace #0.5
          \line { הַגִלְעָדִי אֵלִיָהוּ }
          \vspace #0.5
          \line { בְּיַמֵּנוּ בִּמְהֵרָה }
          \vspace #0.5
          \line { אֵלֵינוּ יָבוֹא }
          \vspace #0.5
          \line { דָוִד בֶּן מָשִׁיחַ עִם }
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
    \line { \small "Melody and words: https://www.zemirotdatabase.org/view_song.php?id=78" }
  }
}
