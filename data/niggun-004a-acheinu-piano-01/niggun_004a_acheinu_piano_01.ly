\version "2.24.4"


\header {
  title = "Niggun 004 - Acheinu (Piano 01)"
  subtitle = "Jewish Folk Song"
%   subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration Style: Modern Israeli"
%   subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Sivan 5785 / June 2025 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

\markup {
  \vspace #1
  \fill-line {
  \line { Arranged by Amichai Rosenbaum Sivan 5785 / June 2025 | v03 | BS''D }
}
}


upperAOne = \relative c' {
  \mark \markup { "A1" }
  a4-1 e'-5 e-5 c-3 d8-4 d-4 e-5 d-4 c4-3 b4-2
}

upperATwo = \relative c' {
  \mark \markup { "A2" }
  a4-1 e'-5 e-5 c-3 d8-4 a-1 d-2 e-3 f4.-4
}

upperBOne = \relative c' {
  \mark \markup { "B1" }
  d16-2 e-3 | f4-4 g8.-5 f16-4 e-3( d-2) c8-1~ 8. c16-1 d8-2 d-2 e-3 d-2 c16-1( d-2) e8-3~ 8.
}

passingToBTwo = \relative c' {
  a16-1 |
}

upperBTwoX = \relative c' {
  \mark \markup { "B2" }
  d8-4 d-4 e-5 d-4 c-3 a-1 d-4 c-3 | b-2 g-1 c-3 b-2 a2-1
}

upperBTwoY = \relative c' {
  \mark \markup { "B2'" }
  d8-2 d-2 e-3 d-2 c-1 a'-3 d-5 c-4 | b-3 g-1 c-4 b-3 a4..-2
}

passingToC = \relative c' {
  e16-1
}


upperCOne = \relative c' {
  \mark \markup { "C1" }
  e8-1 a-2 a8.-2 a16-2 a8-2 g-1 g8.-1 g16-1 g8-1 b-3 b8.-3 b16-3 b8-3 a-2 c-4 b16-3
}

upperCTwo = \relative c'' {
  \mark \markup { "C2" }
  b16-3 a8-2 a-2 a8.-2 b16-3 a8-2 g-1 g4-1 a-2 b-3 c-4 d-5
}

  % u- mei- a- fei- lah l'- o- rah u- mi- shi- bud li- g'- u- lah
upperDOne = \relative c'' {
  \mark \markup { "C1'" }
  a8-2 a16-2 a16-2 a8-2 a16-2 a16-2 a8-2 g-1 g8-1 g16-1 g-1 g8-1 b4.-3 b8-3 a-2 c-4 b8-3
}

  % hash- ta ba- 'a- ga- la u- vi- zman ka- riv
upperDTwo = \relative c'' {
  \mark \markup { "C3" }
  a8^^-2 a8^^-2 r8 a16-2 b-3 a8-2 g-1 a-2 b-3 c4-4 b-3
}

endingOne = \relative c'' {
  a4..-2 e16-1
}

endingTwo = \relative c'' {
  a2-2
}

upper = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  \tempo 4 = 70

  \repeat volta 2 {
  \upperAOne
  \upperATwo
  \upperBOne
  \passingToBTwo

  \alternative {
    \upperBTwoX
    \upperBTwoY
    }
  }

  \passingToC
  \repeat volta 2 {
  \upperCOne
  \upperCTwo

  \upperDOne
  \upperDTwo

  \alternative {
    \endingOne
    \endingTwo
    }
  }
}

lowerNames = \chordmode {
	% Acheinu 1
	a,,2:m a,,:m
	| \invertChords 2 d,,:m a,,:m
	% Acheinu 2
	| a,,2:m a,,:m
	| \invertChords 2 d,,:m \invertChords 2 d,,:m
	% ha n'sunim
	| \invertChords 2 d,,:m a,,:m
	| \invertChords 2 d,,:m a,,:m
	% ha omdim
	| \invertChords 2 d,,:m a,,:m
	| g,,2 a,,:m
	% ha omdim 2nd time
	| \invertChords 2 d,,:m a,,:m
	| g,,2 a,,:m
	% hamokom
	| a,,2:m g,,2
	| \invertChords 1 e,,2:m a,,2:m
	% v'yotzieim
	| a,,2:m g,,2
	| \invertChords 1 { d,,4:m e,,:m } f,, g,,
	% u'meiafeila
	| a,,2:m g,,2
	| \invertChords 1 e,,2:m a,,2:m
	% hashta
	| a,,8:m a,,8:m r4 g,,2
	| f,,4 g,,4 a,,2:m
	% end of repeat
	| a,,2:m
}

CupperAOne = \chordmode {
	% Acheinu 1
	a,,2:m a,,:m
	| \invertChords 2 d,,:m a,,:m
}

CupperATwo = \chordmode {
	% Acheinu 2
	| a,,2:m a,,:m
	| \invertChords 2 d,,:m \invertChords 2 d,,:m
}
CupperBOne = \chordmode {
	% ha n'sunim
	| \invertChords 2 d,,:m a,,:m
	| \invertChords 2 d,,:m a,,:m
}

CupperBTwoX = \chordmode {
	% ha omdim
	| \invertChords 2 d,,:m a,,:m
	| g,,2 a,,:m
}

CupperBTwoY = \chordmode {
	% ha omdim 2nd time
	| \invertChords 2 d,,:m a,,:m
	| g,,2 a,,:m
}

CupperCOne = \chordmode {
	% hamokom
	| a,,2:m g,,2
	| \invertChords 1 e,,2:m a,,2:m
}

CupperCTwo = \chordmode {
	% v'yotzieim
	| a,,2:m g,,2
	| \invertChords 1 { d,,4:m e,,:m } f,, g,,
}

CupperDOne = \chordmode {
	% u'meiafeila
	| a,,2:m g,,2
	| \invertChords 1 e,,2:m a,,2:m
}

CupperDTwo = \chordmode {
	% hashta
	| a,,8:m a,,8:m r4 g,,2
	| f,,4 g,,4
}

CendingOne = \chordmode {
	a,,2:m
}

CendingTwo = \chordmode {
	a,,2:m
}

lower = {
    \clef bass
    \key a \minor
	
  \repeat volta 2 {
  \CupperAOne
  \CupperATwo
  \CupperBOne

  \alternative {
    \CupperBTwoX
    \CupperBTwoY
    }
  }

  \repeat volta 2 {
  \CupperCOne
  \CupperCTwo

  \CupperDOne
  \CupperDTwo

  \alternative {
    \CendingOne
    \CendingTwo
    }
  }
}

textAOne = \lyricmode {
  A- __ _ chei- nu ko̞l Beis Yis- ro̞- eil __ _
}
textAOneMI = \lyricmode {
  A- __ _ chei- nu kol Beit Yis- ra- 'el __ _
}
textAOneAA = \lyricmode {
  A- __ _ chay- nu kol Bays Yis- ro- ayl __ _
}


textATwo = \lyricmode {
  A- __ _ chei- nu ko̞l Beis Yis- ro̞- eil
}
textATwoMI = \lyricmode {
  A- __ _ chei- nu kol Beit Yis- ra- 'el
}
textATwoAA = \lyricmode {
  A- __ _ chay- nu kol Bays Yis- ro- ayl
}


textBOne = \lyricmode {
  ha- n'- su- nim b'- tzo̞- ro̞ b'- tzo̞- ro̞ u- va- shiv- yo̞
}
textBOneMI = \lyricmode {
  ha- ne- tu- nim be- tza- rah be- tza- rah u- va- shiv- yah
}
textBOneAA = \lyricmode {
  ha- n’- su- nim b’- tzo- ro b’- tzo- ro u- va- shiv- yo
}


textBConnector = \lyricmode {
  ho̞-
}
textBConnectorMI = \lyricmode {
  ha-
}
textBConnectorAA = \lyricmode {
  ho-
}


textBTwo = \lyricmode {
  om'- dim bein ba- yo̞m u- vein ba- ya- __ _ bo̞- __ _ sho̞
}
textBTwoMI = \lyricmode {
  'om- dim bein ba- yam u- vein ba- ya- __ _ ba- __ _ shah
}
textBTwoAA = \lyricmode {
  ōm’- dim bayn ba- yom u- vayn ba- ya- __ _ bo- __ _ sho
}


textCOne = \lyricmode {
  Ha- Mo̞- __ _ kom y'- ra- __ _ cheim y'- ra- __ _ cheim a- lei- __ _ hem __ _
}
textCOneMI = \lyricmode {
  Ha- Ma- __ _ kom ye- ra- __ _ chem ye- ra- __ _ chem a- lei- __ _ hem __ _
}
textCOneAA = \lyricmode {
  Ha- Mo- __ _ kōm y’- ra- __ _ chaym y’- ra- __ _ chaym a- lay- __ _ hem __ _
}


textCTwo = \lyricmode {
  v'- yo- tzi- eim mi- tzo̞- __ _ ro̞ lir- __ _ vo̞- cho̞
}
textCTwoMI = \lyricmode {
  ve- yo- tzi- 'em mi- tza- __ _ rah lir- __ _ va- chah
}
textCTwoAA = \lyricmode {
  v’- yō- tzi- aym mi- tzo- __ _ ro lir- __ _ vo- cho
}


textDOne = \lyricmode {
  u- mei- a- fei- lo̞ l'- o- __ _ ro̞ u- mi- shi- bud li- g'- u- lo̞
}
textDOneMI = \lyricmode {
  u- me- 'a- fe- lah le- 'o- __ _ rah u- mi- shi'- bud li- ge- 'u- lah
}
textDOneAA = \lyricmode {
  u- may- a- fay- lo l’- ō- __ _ ro u- mi- shi- bud li- g’- u- lo
}


textCIntoRepeat = \lyricmode {
  Ha-
}
textCIntoRepeatMI = \lyricmode {
  Ha-
}
textCIntoRepeatAA = \lyricmode {
  Ha-
}


textDTwo = \lyricmode {
  hash- to̞ ba- a- go̞- lo̞ u- vi- zman ko̞- riv
}
textDTwoMI = \lyricmode {
  hash- ta ba- 'a- ga- la u- vi- zman ka- riv
}
textDTwoAA = \lyricmode {
  hash- to ba- a- go- lo u- vi- zman ko- riv
}


textLastWord = \lyricmode {
  riv
}
textLastWordMI = \lyricmode {
  riv
}
textLastWordAA = \lyricmode {
  riv
}


textAll = {
  \textAOne
  \textATwo
  \textBOne
  \textBConnector
  \textBTwo
  \textBTwo
  \textCOne
  \textCTwo
  \textDOne
  \textDTwo
  \textCIntoRepeat
  \textLastWord
}

textAllMI = {
  \textAOneMI
  \textATwoMI
  \textBOneMI
  \textBConnectorMI
  \textBTwoMI
  \textBTwoMI
  \textCOneMI
  \textCTwoMI
  \textDOneMI
  \textDTwoMI
  \textCIntoRepeatMI
  \textLastWordMI
}

textAllAA = {
  \textAOneAA
  \textATwoAA
  \textBOneAA
  \textBConnectorAA
  \textBTwoAA
  \textBTwoAA
  \textCOneAA
  \textCTwoAA
  \textDOneAA
  \textDTwoAA
  \textCIntoRepeatAA
  \textLastWordAA
}

% ====== %
% Staves %
% ====== %

upperStaff = \new Staff = upper { \set Staff.midiInstrument = #"acoustic grand" \new Voice = "singer" \upper }

finalLyrics = \new Lyrics \lyricsto "singer" {
      \textAll
      % \textAllMI
%       \textAllAA
    }
	
chordNamesStaff = \new ChordNames { \set noChordSymbol = "" \lowerNames }

lowerStaff = \new Staff = lower { \set Staff.midiInstrument = #"acoustic grand" \lower }

% ======= %
% Compile %
% ======= %

theScore = {
  \new PianoStaff <<
	  \upperStaff
	  \finalLyrics
	  \chordNamesStaff
	  \lowerStaff 
  >>
}

theScoreForMidi = {
  \new PianoStaff <<
	  \upperStaff
	  \lowerStaff
  >>
}

\score {
	{

    \theScore
}
  \layout {
    \context {
      \Lyrics
      \override LyricText.font-name = #"Garamond"
    }
 }
  % \midi { \context { \Score midiRepeatTypes #onlyRepeats } }
}

\score {
\unfoldRepeats {
  \theScoreForMidi
}
  \midi { }
}

\markup {
  \fill-line {
    \column {
      \line { Our brethren, the entire Jewish People }
      \vspace #0.6
      \line { who are delivered into confinement and captivity }
      \vspace #0.6
      \line { whether they be on the sea or dry land }
      \vspace #0.6
      \line { May the Omnipresent have mercy on them }
      \line { and remove them from distress to relief }
      \vspace #0.6
      \line { and from darkness to light }
      \vspace #0.6
      \line { and from subjugation to redemption }
      \vspace #0.6
      \line { now, speedily, and close at hand }
    }
    % \hspace #0
    \hspace #0.1
    \column  {
      \right-align {
      \fontsize #1.5 {
      \line { יִשְׂרָאֵל בֵּית כָּל אַחֵינוּ }
      \vspace #0.6
      \line { וּבַשִּׁבְיָה בְּצָרָה הַנְּתוּנִים }
      \vspace #0.6
      \line { בַּיַּבָּשָׁה וּבֵין בַּיָּם בֵּין הָעוֹמְדִים }
      \vspace #0.6
      \line { עֲלֵיהֶם יְרַחֵם הַמָּקוֹם }
      \line { לִרְוָחָה מִצָּרָה וְיוֹצִיאֵם }
      \vspace #0.6
      \line { לְאוֹרָה וּמֵאֲפֵלָה }
      \vspace #0.6
      \line { לִגְאֻלָּה וּמִשִּׁעְבּוּד }
      \vspace #0.6
      \line { קָרִיב וּבִזְמַן בַּעֲגָלָא הַשְׁתָּא }
      %  {
    }
    }
    }
    \hspace #8
  }
}


\markup {
  \vspace #3
  \fill-line {
  \abs-fontsize #10
  \center-column {
  \line { Hebrew Source: Zemirot Database https://zemirotdatabase.org/view_song.php?id=19 }
  \line { English Translation: Aish https://aish.com/a_prayer_of_the_jewish_people/ }
}
}
}
