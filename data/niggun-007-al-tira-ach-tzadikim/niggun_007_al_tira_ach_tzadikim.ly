\version "2.24.4"


\header {
  title = "Niggun 007 - Al Tira & Ach Tzadikim"
  subtitle = "Jewish Folk Song (popular in Chabad-Lubavitch after davening)"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Tammuz 5785 / July 2025 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}


upperAOne = \relative c' {
  \partial 4 r8 d8\( \mark \markup { "A1" }
  | f8 d4 d8 cis d e f 
%   | d2. c8 c
%   | d2( c4) c8 c
  | d2( c4) a'8 a
  | a f4 f8 e f g a
  | f1\)
}

upperBOne = \relative c' {
  \mark \markup { "B1" }
  d8\( g g g g4 f8 e
  | d f f f f f e d
  | r8 e4 e8 e d f e
  | d4 a' f d8\)
}

upperATwo = \relative c' {
  \mark \markup { "A2" }
  d8\( 
  | f d d d cis d e f 
  %   | d2. c8 c
%   | d2( c4) c8 c
  | d2( c4) a'8 a
  | a f4. e8 f g a
  | f1\)
}

upperBTwoSplitTop = {
 r8 \parenthesize a8^\markup{ We want Moshiach now! }  \parenthesize a \parenthesize a
  \parenthesize a \parenthesize a \parenthesize a4
}

upperBTwoSplitBottom = {
  d,1\)
}

upperBTwoSplitJoint = <<

  % top tiny parenthesized notes (stems up)
  \new Voice = "vTop" {
    \voiceOne
    \tiny
    \upperBTwoSplitTop
    \normalsize
  }

  % bottom sustained d (stems down)
  {
%     \voiceTwo
    \upperBTwoSplitBottom
  }
>>


upperBTwo = \relative c' {
  \mark \markup { "B2" }
  d8\( g4 g8 g4 f8 e
  | d f4 f8 f4 e8 d
  | cis8 e e e a a a a
  \upperBTwoSplitJoint
}

upperC = \relative c' {
  d4\(
  \mark \markup { "C (Key Change to Major!)" }
  d f8
  ees?4.
  | ees4 ees8 ees g f4.
  | f4 f8 f bes a4.
  | a8 f g a bes4\) \bar "|."
}

upper = \relative c' {
  \clef treble
  \key d \minor
  \time 4/4
  \tempo 4 = 110

  \upperAOne
  \upperBOne
  \upperATwo
  \upperBTwo
   
  \key bes \major
  
  \upperC
}


textAOne = \lyricmode {
  al ti- ro̞ mi- pa- chad pis- __ _ om, u- mi- sho- as r'- sho̞- im ki so̞- vo
}
textBOne = \lyricmode {
  u- tzu ei- tzo̞ v'- su- fo̞r, da- b'ru do̞- vo̞r v'- lo yo̞- kum, ki i- mo̞- __ _ _ nu eil. __ _ _ _
}
textATwo = \lyricmode {
  v'- ad __ _ zik- no̞ a- __ _ ni __ _ hu, v'- ad sei- vo̞ a- __ _ ni es- bol
}
textBTwo = \lyricmode {
  a- ni o̞- si- __ _ si va- a- ni e- __ _ so̞ va- a- ni es- bol va- a- ma- leit.
}
textC = \lyricmode {
	ach tza- di- kim yo- du lish- me- cho̞, yeish'- vu y'- sho̞- rim es po̞- nei- __ _ cho̞
}

textWWMN = \lyricmode {
  We Want Mo- shi- ach now
}


textAll = {
  \textAOne
  \textBOne
  \textATwo
  \textBTwo
%   \textWWMN
  \textC

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
  \midi { 
%       \context {
%         \Score
%         midiController = #'((64 . 0) (91 . 0) (93 . 0))
%         midiReverbLevel = 0.0  % Disables reverb
%         midiChorusLevel = 0.0
% 	    midiController = #'((64 . 0)) % Controller 64 (sustain) off
%       }
	}
}



\markup {
  % \fill-line {
    \hspace #10
    \column {
      \line { Do not fear sudden terror }
      \line { nor the ravaging disaster of the wicked should it come. }
      \vspace #0.6
      \line { They contrive a scheme, but it will be foiled; }
      \line { they talk of a plot, but it will not materialize, }
      \line { because G-D is with us. }
      \vspace #0.6
      \line { Until [your] old age, I am [with you], }
      \line { and until [your] hoary years, I will sustain [you]. }
      \vspace #0.6
      \line { I made [you], and I will carry [you], }
      \line { I will bear [you] and deliver [you]. }
      \vspace #0.6
      \line { Indeed, the righteous will thankfully acknowledge Your name; }
      \line { the upright will dwell in Your presence. }
    }
    \hspace #2
    \column  {
      \right-align {
      \fontsize #1.5 {
      \line { פִּתְאֹם, מִפַּחַד תִּירָא אַל }
      \line { תָבֹא׃ כִּי רְשָׁעִים וּמִשֹּׁאַת }
      \vspace #0.6
      \line { וְתֻפָר, עֵצָה עֻצוּ }
      \line { יָקוּם, וְלֹא דָבָר דַּבְּרוּ }
      \line { אֵל׃ עִמָּנוּ כִּי }
      \vspace #0.6
      \line { הוּא, אֲנִי זִקְנָה וְעַד }
      \line { אֶסְבֹּל; אֲנִי שֵׂיבָה וְעַד }
      \vspace #0.6
      \line { אֶשָּׂא וַאֲנִי עָשִׂיתִי אֲנִי }
      \line { וַאֲמַלֵּט׃ אֶסְבֹּל וַאֲנִי }
      \vspace #0.6
      \line { לִשְׁמֶךָ, יוֹדוּ צַדִּיקִים אַךְ }
      \line { פָּנֶיךָ׃ אֶת יְשָׁרִים יֵשְׁבוּ }
    }
    }
    }
}


\markup {
  \vspace #8
  \fill-line {
	\line { Hebrew text and translation: }
}
}

\markup {
  \vspace #1
  \fill-line {
	\line { https://www.chabad.org/torah-texts/1666781/Online-Siddur-with-Commentary/Conclusion-of-Shachrit/Al-Tira }
}
}

\markup {
  \vspace #1
  \fill-line {
	\line { Melody: https://www.chabad.org/multimedia/media_cdo/aid/265780/jewish/Al-Tiro-Ach-Tzadikim.htm }
}
}
