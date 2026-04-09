\version "2.24.4"


\header {
  title = "Niggun 017 - Halelu et Hashem"
  subtitle = "Tehillim (Psalms) 117: melody from Hallel davening"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Tevet 5786 / December 2025 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}


upperA = \relative c' {
  \mark \markup { "A" }
  | c8 c c16( d e8) c8 c c16( d e8)
  | c8 c e f g4 g
  | a8 a f16( e) d8 g8 g e16( d) c8 
}

upperAEndOne = \relative c' {
  | d8 e f d c b a g
}

upperAEndTwo = \relative c' {
  | d8( e f) d c4 c
}

upperBOne = \relative c' {
  \mark \markup { "B1" }
  \bar ".|:"     % Repeat-start bar
  | r8 e4. e8( d) c4
  | r8 f4. f8( e) d4
  | r8 g4( a8) g( f e) f
  | g4( e8 f g4) e4
}

upperBTwo = \relative c' {
  \mark \markup { "B2" }
  | r8 e4. e8( d) c4
  | r8 f4. f8( e d4)
  | r8 g4( a8) g( f e) d
}

upperBTwoEndOne = \relative c' {
  % Manually create volta bracket
  \set Score.repeatCommands = #'((volta "1."))
  | e8 e d4 c4.
  % pickupC, adding it here for score to display it inside the overbar
  e8
  \set Score.repeatCommands = #'((volta #f))  % End bracket
}

fine = \relative c' {
  % Manually create volta bracket
  \set Score.repeatCommands = #'((volta "2."))
  | e8   \mark \markup \small { "Fine" } e d4 c2
  \bar "|."
  \set Score.repeatCommands = #'((volta #f))  % End bracket
}

upperCOne = \relative c' {
  \mark \markup { "C1" }
  | g'4. e8 g4. e8
  | g8( e g e g2)
  | e4 f g a8. a16
  | g8 f e( f) d4. d8
}

upperCTwo = \relative c' {
  \mark \markup { "C2" }
  | f4. d8 f4. d8
  | f8( d f d f2)
  | d4 e f g
  | f8 e d( g) e4. e8
}

upperCOneR = \relative c' {
  \mark \markup { "C1" }
  | g'2 c2
  | g4 g g g
  | e4 f g a8. a16
  | g8 f e( f) d4. d8
}

upperCTwoR = \relative c' {
  \mark \markup { "C2" }
  | f4. d8 f4. d8
  | f8( d f d f2)
  | d4 e f g
  | f8 e d( \mark \markup { \small "Go to B1, al Fine" } g) e2
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
  \upperBOne
  \upperBTwo
}

sectionUpperC = {
  \upperCOne
  \upperCTwo
  \upperCOneR
  \upperCTwoR
}

% ===== %
% Parts %
% ===== %

myClef = \clef treble
myKey = \key c \major
myTime = \time 4/4
myTempo = \tempo 4 = 120

upper = {
  \myClef
  \myKey
  \myTime
  \myTempo

  \sectionUpperA
  \sectionUpperB
  \upperBTwoEndOne
  \bar "||"
  \fine
  \sectionUpperC
  \bar ":|."     % Repeat-end bar
}

upperMidi = {
  \myClef
  \myKey
  \myTime
  \myTempo
  
  \sectionUpperA
  \sectionUpperB
  \upperBTwoEndOne
  \sectionUpperC

  % For the midi, return to B then go to fine
  \sectionUpperB
  \fine
}

% ==== %
% Text %
% ==== %

textA = \lyricmode {
  | ha- l'- lu ha- l'- lu
  | es ha- shem ko̞l- go- yim
  | sha- b'- chu- hu sha- b'- chu- hu
}

textAMI = \lyricmode {
  | ha- le- lu ha- le- lu
  | et ha- shem kol- go- yim
  | sha- be- chu- hu sha- be- chu- hu
}

textAEndOne = \lyricmode {
  | sha- b'- chu- hu ko̞l- ho̞- u- mim
}

textAEndOneMI = \lyricmode {
  | sha- be- chu- hu kol- ha- 'u- mim
}

textAEndTwo = \lyricmode {
  | ko̞l- ho̞- u- mim
}

textAEndTwoMI = \lyricmode {
  | kol- ha- 'u- mim
}

textBOne = \lyricmode {
  | ki go̞- var
  | o̞- lei- nu
  | o̞- lei- nu
  | chas- do
}

textBOneMI = \lyricmode {
  | ki ga- var
  | a- lei- nu
  | a- lei- nu
  | chas- do
}

textBTwo = \lyricmode {
  | ve- e- mes-
  | ha- shem
  | l'- o- lo̞m
  | ha- l'- lu- ko̞h
}

textBTwoMI = \lyricmode {
  | ve- 'e- met
  | ha- shem
  | le- 'o- lam
  | ha- le- lu- kah
}

textPickupC = \lyricmode {
  a-
}

textPickupCMI = \lyricmode {
  a-
}

textFine = \lyricmode {
  | "|| ha-" l'- lu- ko̞h
}

textFineMI = \lyricmode {
  | "|| ha-" le- lu- kah
}

textCOne = \lyricmode {
  | ha a- ha a-
  | ha
  | ha- l'- lu es ha- 
  | shem ko̞l- go- yim a-
}

textCOneMI = \lyricmode {
  | ha a- ha a-
  | ha
  | ha- le- lu et ha-
  | shem kol- go- yim a-
}

textCTwo = \lyricmode {
  | ha a- ha a-
  | ha
  | sha- b'- chu- hu
  | ko̞l- ho̞- u- mim
}

textCTwoMI = \lyricmode {
  | ha a- ha a-
  | ha
  | sha- be- chu- hu
  | kol- ha- 'u- mim
}

textCOneR = \lyricmode {
  | ha hey!
  | ay- ay- ay- ay
  | ha- l'- lu es ha- 
  | shem ko̞l- go- yim a-
}

textCOneRMI = \lyricmode {
  | ha hey!
  | ay- ay- ay- ay
  | ha- le- lu et ha-
  | shem kol- go- yim a-
}

textCTwoR = \textCTwo

textCTwoRMI = \textCTwoMI

textAll = {
  \textA
  \textAEndOne
  \textAEndTwo
  \textBOne
  \textBTwo
  \textPickupC
  \textFine
  \textCOne
  \textCTwo
  \textPickupC
  \textCOneR
  \textCTwoR
}

textAllMI = {
  \textAMI
  \textAEndOneMI
  \textAEndTwoMI
  \textBOneMI
  \textBTwoMI
  \textPickupCMI
  \textFineMI
  \textCOneMI
  \textCTwoMI
  \textPickupCMI
  \textCOneRMI
  \textCTwoRMI
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upper

bodyVoiceMidi = \new Voice = "body" \upperMidi

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"banjo" \bodyVoice
}

staffUpperMidi = \new Staff = upper {
  \set Staff.midiInstrument = #"banjo" \bodyVoiceMidi
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
  \vspace #3
}

\markup {
  \line {
    \hspace #15
    \column {
      \line { Praise Hashem all you nations, }
      \vspace #0.5
      \line { Laud Him all you peoples, }
      \vspace #0.5
      \line { for His kindness has abundantly been bestowed upon us, }
      \vspace #0.5
      \line { And Hashem's truth endures forever, }
      \vspace #0.5
      \line { praise Hashem }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { כָּל-גּוֹיִם ה' אֶת הַלְלוּ }
          \vspace #0.5
          \line { כָּל-הָאֻמִּים שַׁבְּחוּהוּ }
          \vspace #0.5
          \line { חַסְדּוֹ עָלֵינוּ גָבַר כִּי }
          \vspace #0.5
          \line { לְעוֹלָם וֶאֱמֶת-ה' }
          \vspace #0.5
          \line { הַלְלוּ-קָהּ }
          \vspace #0.5
        }
      }
    }
  }
}



\markup {
  \vspace #5
}

\markup {
  \vspace #2
  \fill-line {
    \line { \small "Hebrew text: https://www.zemirotdatabase.org/view_song.php?id=867" }
  }
}

\markup {
  \vspace #2
  \fill-line {
    \line { \small "Melody and English translation: https://www.chabad.org/multimedia/music_cdo/aid/140774/jewish/Halelu.htm" }
  }
}


