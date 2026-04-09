\version "2.24.4"


\header {
  title = "Niggun 004 - Acheinu"
  subtitle = "Jewish Folk Song"
  % subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration Style: Modern Israeli"
  subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  copyright = "© 2025 / 5785 by Amichai Rosenbaum, All Rights Reserved"
}

\markup {
  \vspace #1
  \fill-line {
  \line { Arranged by Amichai Rosenbaum Sivan 5785 / June 2025 | v03 | BS''D }
}
}


upperAOne = \relative c' {
  \mark \markup { "A1" }
  a4\( e' e c d8 d e d c4 b4\)
}

upperATwo = \relative c' {
  \mark \markup { "A2" }
  a4\( e' e c d8 a d e f4.\)
}

upperBOne = \relative c' {
  \mark \markup { "B1" }
  d16\( e | f4 g8. f16 e( d) c8~ 8. c16 d8 d e d c16( d) e8~ 8. \)
}

passingToBTwo = \relative c' {
  a16 |
}

upperBTwoX = \relative c' {
  \mark \markup { "B2" }
  d8\( d e d c a d c | b g c b a2 \)
}

upperBTwoY = \relative c' {
  \mark \markup { "B2'" }
  d8\( d e d c a' d c | b g c b a4..\)
}

passingToC = \relative c' {
  e16\(
}


upperCOne = \relative c' {
  \mark \markup { "C1" }
  e8 a a8. a16 a8 g g8. g16 g8 b b8. b16 b8 a c b16 \)
}

upperCTwo = \relative c'' {
  \mark \markup { "C2" }
  b16\( a8 a a8. b16 a8 g g4 a b c d \)
}

  % u- mei- a- fei- lah l'- o- rah u- mi- shi- bud li- g'- u- lah
upperDOne = \relative c'' {
  \mark \markup { "C1'" }
  a8\( a16 a16 a8 a16 a16 a8 g g8 g16 g g8 b4. b8 a c b8 \)
}

  % hash- ta ba- 'a- ga- la u- vi- zman ka- riv
upperDTwo = \relative c'' {
  \mark \markup { "C3" }
  a8^^\( a8^^ r8 a16 b a8 g a b c4 b
}

endingOne = \relative c'' {
  a4..\) e16
}

endingTwo = \relative c'' {
  a2
}



upper = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  \tempo 4 = 60

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


theScore = {
  \new PianoStaff <<
    \new Staff = upper { \set Staff.midiInstrument = #"trombone" \new Voice = "singer" \upper }
    % \new Staff = upper { \set Staff.midiInstrument = #"trumpet" \new Voice = "singer" \upper }
    % \new Staff = lower { \lower }
    \new Lyrics \lyricsto "singer"  {
      % \textAll
      % \textAllMI
      \textAllAA
    }
  >>
}

\score {
    \theScore
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
  \transpose c' c  {
  \theScore
  }
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
  \line { Transliteration based on: https://www.alittlehebrew.com/transliterate/ }
}
}
}
