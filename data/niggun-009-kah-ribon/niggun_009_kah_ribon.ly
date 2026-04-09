\version "2.24.4"


\header {
  title = "Niggun 009 - Kah Ribon"
  subtitle = "Jewish Folk Song for Shabbat"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Menachem Av 5785 / August 2025 | v02 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}


upperAOne = \relative c' {
  \mark \markup { "A1" }
%   \mf
  a8\( e'8. e16 e8 d4
  | c8. d16 c b a8 b c
  | d8 f8. f16 f8 c4
  | d16 d f8 d16 g g8 e g\)
  \mark \markup { "A2" }
  | a8\( e8. e16 e8 d4
  | c8. d16 c b a8 b c
  | d8 f8. f16 f8 c4
  | d8 f d16 g g8 e g\)
}

upperChorus = \relative c'' {
  \mark \markup { "Chorus" }
  \repeat volta 2 {
    % kah ribon
    a4\( a8 e c' a
    |
    <<
      { \voiceOne g2. }
      { s8 \voiceTwo {
  %       \parenthesize \p
      \parenthesize g \parenthesize a \parenthesize b \parenthesize a \parenthesize g } }
    >>
    \oneVoice
    | b4 b8 g d' b
    <<
      { \voiceOne a2.\) }
      { s8 \voiceTwo {
  %       \parenthesize \p
      \parenthesize e \parenthesize a \parenthesize c \parenthesize b \parenthesize a } }
    >>
    \oneVoice
  
    % ant hu malko
    a4\( a8 e c' a
    |
    <<
      { \voiceOne g2. }
      { s8 \voiceTwo {
  %       \parenthesize \p
      \parenthesize g \parenthesize a \parenthesize b \parenthesize a \parenthesize g } }
    >>
    \oneVoice
    | b4 b8 g d' b
    a2.\)
%     <<
%       { \voiceOne a2.\) }
%       { s8 \voiceTwo {
%   %       \parenthesize \p
%       \parenthesize e \parenthesize a \parenthesize c \parenthesize b \parenthesize a } }
%     >>
%     \oneVoice
  }
}
  

upperATwo = \relative c'' {
  \mark \markup { "A2" }
  g8.\( fis16 e8 g8. fis16 e8
  | fis4. d
  | fis8 e d fis g fis
  | e2.\)
}

upperBOne = \relative c'' {
  \mark \markup { "B1" }
  b8.\( a16 g8 b8. a16 g a
  | a4. fis
  | a8 g fis a b a
  | g4. e\)
}

upperBTwo = \relative c'' {
  \mark \markup { "B2" }
  b8.\( a16 g8 b8. a16 g a
  | a4. fis4~ 16 fis
  | a8 g fis a g fis %16 g
  | e2.\)
}

upper = \relative c' {
  \clef treble
  \key a \minor
  \time 6/8
  \tempo 4. = 40
  
  \upperAOne
  \upperChorus
%   \upperATwo
%   \upperBOne
%   \upperBTwo
  

}


textAOne = \lyricmode {
  \set stanza = "1."
  ko̞h ri- bon o̞- lam v'- o̞l'- ma- __ _ yo̞, __ _ _
  ant __ _ hu mal- ko̞ me- lech mal- cha- __ _ yo̞, __ _ _
  o- vad g'- vur'- teich v'- sim- ha- __ _ yo̞, __ _ _
  sh'- far ko̞- do̞- mo̞ch l'- ha- cha- vo̞- yo̞. __ _ _
}

textATwo = \lyricmode {
  \set stanza = "2."
  sh'vo̞- chin a- sa- deir tzaf- ro̞ v'- ram- sho̞, __ _
  lo̞ch | e-lo̞- ko̞ ka- di- sho̞ div'- ro̞ ko̞l naf- __ _ sho̞, __ _ _
  i- rin ka- di- shin uv'- nei e- no̞- sho̞, __ _ _
  chei- vas bo̞- ro̞ __ _ v'o- fei sh'- ma- yo̞. __ _ _
}

textAThree = \lyricmode {
  \set stanza = "3."
  rav- r'- vin ov'- deich v'- sa- ki- __ _ fin, __ _ _
  mo̞- chich r'- ma- \markup { yo̞ v'- } za- __ _ kif k'- fi- fin, __ _ _
  lu yich- ye g'- var sh'- nin al- __ _ fin, __ _ _
  lo̞ yei-ol g'- vur'- teich b'- chush- b'- na- yo̞. __ _ _
}

textAFour = \lyricmode {
  \set stanza = "4."
  e-lo̞- ko̞ di leih __ y'- kar u- r'- vu- so̞, __ _ _
  p'- rok yas o̞- no̞ch mi- pum ar- y'- vo̞- so̞, __ _ _
  v'a- peik yas a- meich mi- go go̞- lu- so̞, __ _ _
  a- meich "di v'-" chart __ _ mi- ko̞l u- ma- yo̞. __ _ _
}

textAFive = \lyricmode {
  \set stanza = "5."
  l'- mik- do̞- sheich tuv ul'- ko- desh kud- shin, __ _ _
  a- "sar di" veih ye-che- dun ru- __ _ chin v'- naf- shin, __ _
  vi- zam'- run lo̞ch shi- rin v'- ra- cha- __ _ shin, __ _
  bi- ru- sh'- leim kar- to̞ d'- shu- f'- ra- yo̞. __ _ _
}

textChorus = \lyricmode {
  ko̞h ri- bon __ _ o̞- lam (ko̞h ri- bon o̞- lam) v'- o̞l'- ma- __ _ _ yo̞, (v'- o̞l'- ma- __ _ yo̞)
  ant hu mal- __ _ _ ko̞ (ant hu mal- __ _ ko̞) me- lech mal- __ _ cha- yo̞ (me- lech mal- cha- yo̞),
}



% ====== %
% Staves %
% ====== %

upperStaff = \new Staff = upper { \set Staff.midiInstrument = #"orchestral harp" \new Voice = "singer" \upper }

verseOneAndChorus = \new Lyrics \lyricsto "singer" { \textAOne \textChorus }
verseTwo = \new Lyrics \lyricsto "singer" { \textATwo }
verseThree = \new Lyrics \lyricsto "singer" { \textAThree }
verseFour = \new Lyrics \lyricsto "singer" { \textAFour }
verseFive = \new Lyrics \lyricsto "singer" { \textAFive }

theScore = {
  \new PianoStaff <<
	\upperStaff
  \verseOneAndChorus
  \verseTwo
  \verseThree
  \verseFour
  \verseFive
  >>
}

theScoreForMidi = {
  \new PianoStaff <<
	  \upperStaff
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
  \theScoreForMidi
  }
}
  \midi { 
	}
}


\markup {
  \vspace #6
}

\markup {
  \line {
    \hspace #10
    \column {
      \line { G-D, Sovereign of all the Worlds }
      \vspace #0.5
      \line { You are the King, above all kings. }
      \vspace #0.5
      \line { Your mighty deeds and wonders, }
      \vspace #0.5
      \line { it is beautiful to declare before You. }
      \vspace #0.5
      \line {  }
      \vspace #0.5
      \line { I speak your praises both morning and evening, }
      \vspace #0.5
      \line { to You, Holy G-D, who created all life: }
      \vspace #0.5
      \line { holy angels and human beings, }
      \vspace #0.5
      \line { beasts of the field and birds of the sky. }
      \vspace #0.5
      \line {  }
      \vspace #0.5
      \line { Great and mighty are Your deeds, }
      \vspace #0.5
      \line { humbling the proud and raising the humble. }
      \vspace #0.5
      \line { Even if one were to live a thousand years, }
      \vspace #0.5
      \line { these would not suffice to fathom Your might. }
      \vspace #0.5
      \line {  }
      \vspace #0.5
      \line { O G-D, to whom glory and greatness belong, }
      \vspace #0.5
      \line { save Your flock from the lions' jaws. }
      \vspace #0.5
      \line { Bring Your people out of exile, }
      \vspace #0.5
      \line { the people which You chose from among all nations. }
      \vspace #0.5
      \line {  }
      \vspace #0.5
      \line { Return to Your Temple and to the Holy of Holies, }
      \vspace #0.5
      \line { the place where spirits and souls can rejoice. }
      \vspace #0.5
      \line { They will sing to You songs and melodies }
      \vspace #0.5
      \line { in Jerusalem, city of beauty. }
      \vspace #0.5
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { וְעָלְמַיָּא, עָלַם רִבּוֹן יָהּ }
          \vspace #0.5
          \line { מַלְכַיָּא, מֶֽלֶךְ מַלְכָּא הוּא אַנְתְּ }
          \vspace #0.5
          \line { וְתִמְהַיָּא, גְּבוּרְתֵּךְ עוֹבַד }
          \vspace #0.5
          \line { לְהַחֲוָיָּא. קֳדָמָךְ שְׁפַר }
          \vspace #0.5
          \line {  }
          \vspace #0.5
          \line { וְרַמְשָׁא, צַפְרָא אֲסַדֵּר שְׁבָחִין }
          \vspace #0.5
          \line { נַפְשָׁא, כָּל בְרָא דִּי קַדִּישָׁא אֱלָהָא לָךְ }
          \vspace #0.5
          \line { אֱנָשָׁא, וּבְנֵי קַדִּישִׁין עִירִין }
          \vspace #0.5
          \line { שְׁמַיָּא. וְעוֹפֵי בָּרָא חֵיוַת }
          \vspace #0.5
          \line {  }
          \vspace #0.5
          \line { וְתַקִּיפִין, עוֹבְדֵיךְ רַבְרְבִין }
          \vspace #0.5
          \line { כְּפִיפִין, וְזַקִּיף רְמַיָּא מָכִיךְ }
          \vspace #0.5
          \line { אַלְפִין, שְׁנִין גְבַר יִחְיֶה לוּ }
          \vspace #0.5
          \line { בְּחֻשְׁבְּנַיָּא. גְּבוּרְתֵּךְ יֵעוֹל לָא }
          \vspace #0.5
          \line {  }
          \vspace #0.5
          \line { וּרְבוּתָא, יְקַר לֵהּ דִּי אֱלָהָא }
          \vspace #0.5
          \line { אַרְיְוָתָא, מִפּוּם עָנָךְ יַת פְּרוֹק }
          \vspace #0.5
          \line { גָלוּתָא, מִגּוֹ עַמֵּךְ יַת וְאַפֵּיק }
          \vspace #0.5
          \line { אֻמַּיָּא. מִכָּל בְחַרְתְּ דִּי עַמֵּךְ }
          \vspace #0.5
          \line {  }
          \vspace #0.5
          \line { קֻדְשִׁין, וּלְקֹֽדֶשׁ תּוּב לְמִקְדָּשֵׁךְ }
          \vspace #0.5
          \line { וְנַפְשִׁין, רוּחִין יֶחֱדוּן בֵהּ דִּי אֲתַר }
          \vspace #0.5
          \line { וְרַחֲשִׁין, שִׁירִין לָךְ וִיזַמְּרוּן }
          \vspace #0.5
          \line { דְשׁוּפְרַיָּא. קַרְתָּא בִּירוּשְׁלֵם }
          \vspace #0.5
        }
      }
    }
  }
}


\markup {
  \vspace #12
  \fill-line {
	\line { Hebrew text and approximate translation: }
}
}

\markup {
  \vspace #1
  \fill-line {
	\line { "https://www.zemirotdatabase.org/view_song.php?id=56#rec" }
}
}

\markup {
  \vspace #1
  \fill-line {
	\line { "Melody setting by Ari Goldwag: https://www.youtube.com/watch?v=L16bkB7BDYQ" }
}
}
