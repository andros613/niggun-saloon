\version "2.24.4"


\header {
  title = "Niggun 005 - Sheyibone Beis Hamikdosh"
  subtitle = "Jewish Folk Song, popular among Chabad-Lubavitch"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Sivan 5785 / June 2025 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}


upperAOne = \relative c' {
  \partial 8 b16\( b \mark \markup { "A1" }
  | b8 dis dis dis dis4 dis8. dis16
  | fis8 e e e e4 e8. e16
  | e8 dis e dis16 dis e8 g fis e
  | dis2..\)
}

upperATwoSplitTop = {
 r4 \parenthesize b'4^\markup{ (Ay }  \parenthesize b4^\markup { yay } \parenthesize b8^\markup { yay!) }
}

upperATwoSplitBottom = {
  b,2..\)
}

upperATwoSplitJoint = <<
  % top tiny parenthesized notes (stems up)
  \new Voice = "vTop" {
    \voiceOne
    \tiny
    \upperATwoSplitTop
    \normalsize
  }

  % bottom sustained d (stems down)
  {
%     \voiceTwo
    \upperATwoSplitBottom
  }
>>

upperATwo = \relative c' {
  \mark \markup { "A2" }
  \partial 8 b16\( b
  | b8 dis dis dis dis4 dis8. dis16
  | fis8 e e e e4 e8. e16
  | e8 a, b c16 c dis8 e dis c
  \upperATwoSplitJoint
}

upperBOne = \relative c'' {

  \partial 8 g16\( \mark \markup { "B1" } g
  | g8 b b b b4 b8. b16
  | a8 a a a a4 a8. a16
  | g8 fis g fis16 fis g8 b a g
  | fis2..\)
}

upperBTwo = \relative c'' {
  \mark \markup { "B2" }
  \partial 8 g16\( g
  | g8 b b b d4 b8. b16
  | a8 a a a c4 a8. a16
  | g8 fis g fis16 fis g8 b a g
  | fis2..\)
}

upperAOneP = \relative c' {
  fis16\( fis \mark \markup { "A1'" }
  | e8 e e e e4 e8. e16
  | fis8 e e e e4 e8. e16
  | e8 dis e dis16 dis e8 g fis e
  | dis2..\)
}

upperATwoP = \relative c' {
  \mark \markup { "A2'" }
  b16\( b
  | b8 dis dis dis dis4 dis8. dis16
  | fis8 e e e b'4 e,8. e16
  | e8 a, b c16 c dis8 e dis c
  b2..\)
}

upper = \relative c' {
  \clef treble
  \key e \minor
  \time 4/4
  \tempo 4 = 90


  \upperAOne
  \upperATwo
  \upperBOne
  \upperBTwo
  \upperAOneP
  \upperATwoP

}


textAOne = \lyricmode {
  she- yi- bo̞- ne beis ha- mik- do̞sh bim- hei- ro̞ v'- yo̞- mei- nu v'- sein chel- kei- nu b'- so- ro̞- se- __ _ cho̞
% 	she- yi- ba- neh beit ha- mik- dash bim- he- rah ve- ya- mei- nu, ve- ten chel- ke- nu be- to- ra- te- __ _ cha
}
textATwo = \textAOne
textBOne = \textAOne
textBTwo = \textAOne


textAll = {
  \textAOne
  \textATwo
  \textBOne
  \textBTwo
  \textAOne
  \textATwo
}

theScore = {
  \new PianoStaff <<
    \new Staff = upper { \set Staff.midiInstrument = #"trombone" \new Voice = "singer" \upper }
    % \new Staff = upper { \set Staff.midiInstrument = #"trumpet" \new Voice = "singer" \upper }
    % \new Staff = lower { \lower }
    \new Lyrics \lyricsto "singer"  {
      \textAll
    }
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
  \theScore
  }
}
  \midi { }
}

\markup {
  \vspace #2
}

\markup {
  \fill-line {
	  \hspace #2
    \column {
      \line { May the Holy Temple be rebuilt }
      \vspace #0.6
      \line { speedily in our days }
      \vspace #0.6
      \line { and grant us our portion in Your Torah }
    }
    % \hspace #0
    \hspace #0.1
    \column  {
      \right-align {
      \fontsize #3.0 {
	  \line { בֵּית שֶׁיִּבָּנֶההַמִּקְדָּשׁ בֵּית שֶׁיִּבָּנֶה }
      \vspace #0.6
	  \line { בְיָמֵֽינוּ בִּמְהֵרָה }
      \vspace #0.6
	  \line { בְּתוֹרָתֶֽךָ חֶלְקֵֽנוּ וְתֵן }
    }
    }
    }
    \hspace #8
  }
}


\markup {
  \vspace #5
  \fill-line {
  \abs-fontsize #10
  \center-column {
  \line { Source: https://www.chabad.org/multimedia/music_cdo/aid/476629/jewish/Sheyiboneh.htm }
}
}
}
