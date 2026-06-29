\version "2.24.4"



\header {
  title = "Niggun 027 - Yedid Nefesh"
  subtitle = "Jewish Folk Song for Kabbalat Shabbat"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Tammuz 5786 / June 2026 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

upperOne = \relative c' {
  \mark \markup { "A1" }
  %  y'- did ne- fesh
  %  o̞v ho̞- ra- cha- mo̞n.
  %  m'- shoch av- d'- cho̞
  %  el r'- tzo- ne- cho̞.
  \partial 8
  b8
  | e4( b8) e4( b8)
  | e2.
  | g4 e8 g4 e8
  | g4. ~ 4 e8
  \break
  | a4( g8 a4) b8
  | a4( g8) g4.
  | fis8( e) fis g4 fis8
  | e2.
  \break
  \mark \markup { "B1" }
  %  yo̞- rutz av- d'- cho̞
  %  k'- mo a- yo̞l
  %  yish- ta- cha- ve
  %  el mul ha- do̞- re- cho̞.
  | b'4( a8) b4 c8
  | b4( a8) a4 a8
  | a4( e8) c'4( b8)
  | a2.
  \break
  | a4( g8) a4 b8
  | a4.( g4) g8
  | g4 d8 d'4 c8
  | b2.
  \break
  \mark \markup { "C1" }
  %  ye- e- rav lo
  %  y'- di- do- sei- cho̞.
  %  mi- no- fes tzuf
  %  v'- cho̞l to̞- am:
  | g4. a4 b8
  | a4. ~ 4 g8
  | b4 a8 g4( fis8)
  | e4( fis8 g4) e8
  \break
  | g4( e8) g4( e8)
  | a4.( g4.)
  | fis8( e fis) g4 fis8
  | e4. ~ 4
}

upperTwo = \relative c' {
  %  ho̞- dur no̞- e
  %  ziv ho̞- o- lo̞m.
  %  naf- shi cho- las
  %  a- ha- vo̞- se- cho̞.
  b8
  \break
  \mark \markup { "A2" }
  | e4( b8) e4( b8)
  | e4.( \parenthesize d8 \parenthesize e \parenthesize fis)
  | g4( a8) b4 a8
  | g2.
  \break
  | a4( g8 a4) b8
  | a4( g8) g4.
  | fis8 e fis g4( fis8)
  | e4.( \parenthesize d4.)
  \break
  \mark \markup { "B2" }
  %  o̞- no̞ Ei-l no̞
  %  r'- fo̞ no̞ lo̞h.
  %  b'- har- os lo̞h
  %  no- am zi- ve- cho̞.
  | b'4( a8) b4( c8)
  | b4( a8) a4 a8
  | a4( e8) c'4( b8)
  | a2.
  \break
  | a4( g8) a4 b8
  | a4.( g4.)
  | g4 d8 d'4 c8
  | b2.
  \break
  \mark \markup { "C2" }
  %  o̞z tis- cha- zeik
  %  v'- sis- ra- pei.
  %  v'- ho̞y'- so̞ lo̞h
  %  sim- chas o- lo̞m:
  | g4. a4 b8
  | a4. ~ 4 g8
  | b4( a8) g4( fis8)
  | e4( fis8 g4) e8
  \break
  | g4( e8 g4) b8
  | a4.( g4.)
  | fis8( e fis) g4 fis8
  | e4. ~ 4
}

upperThree = \relative c' {
  %  vo̞- sik ye- he- mu
  %  ra- cha- mei- cho̞
  %  v'- chu- so̞ no̞
  %  al bein a- hu- ve- cho̞.
  b8
  \break
  \mark \markup { "A3" }
  | e4( fis8) g4 fis8
  | e4.( \parenthesize d8 \parenthesize e \parenthesize fis)
  | g4 a8 b4( a8)
  | g4.( \parenthesize e8 \parenthesize fis) g
  \break
  | a4( g8 a4) b8
  | a4( \parenthesize b16 \parenthesize a g4.)
  | fis8 e fis g4 fis8
  | e4( \parenthesize fis16 \parenthesize e \parenthesize d4.)
  \break
  \mark \markup { "B3" }
  %  ki ze ka- mo̞
  %  nich- sof nich- saf- ti
  %  lir- os b'- sif- e- res
  %  u- ze- cho̞. 
  | b'4( a8) b4( c8)
  | b4( a8) a4 a8
  | a4 e8 c'4( b8)
  | a4( \parenthesize g8 \parenthesize fis4.)
  \break
  | a4( g8) a8 a b
  | a4( g8) g4.
  | g4( d8) d'4( c8)
  | b8.( \parenthesize a16 \parenthesize g \parenthesize a \parenthesize b4.)
  \break
  \mark \markup { "C3" }
  %  ei- le cho̞m'- do̞
  %  cho̞m'- do̞ li- bi
  %  v'- chu- so̞ no̞
  %  v'- al tis- a- lo̞m:
  | g4. a4 b8
  | a2.
  | b4 a8 g4( fis8)
  | e4( fis8 g4) e8
  \break
  | g4( e8 g4) b8
  | a4( \parenthesize b16 \parenthesize a g4.)
  | fis8( e) fis g4 fis8
  | e4. ~ 4
}

upperFour = \relative c' {
  %  hi- go̞- le no̞
  %  uf'- ros cha- vi- vi o̞- lai
  %  es su- kas
  %  sh'- lo- me- cho̞.
  b8
  \break
  \mark \markup { "A4" }
  | e4( b8) e4( b8)
  | e4.( \parenthesize d8 \parenthesize e \parenthesize) fis
  | g4 a8 b8 b a8
  | g2.
  \break
  | a4( g8 a4 b8)
  | a4( g8) g4.
  | fis8( e) fis g4( fis8)
  | e4.( \parenthesize d4.)
  \break
  \mark \markup { "B4" }
  %  to̞- ir e- retz
  %  mik'- vo- de- cho̞.
  %  no̞- gi- lo̞
  %  v'- nis- m'- cho̞ bo̞ch.
  | b'4( a8) b4( c8)
  | b4( a8) a4.
  | a4 e8 c'4( b8)
  | a4( \parenthesize g8 \parenthesize fis4.)
  \break
  | a4( g8 a4 b8)
  | a4( g8) g4 g8
  | g4 d8 d'4( c8)
  | b2.
  \break
  \mark \markup { "C4" }
  %  ma- heir o̞- huv
  %  ki vo̞ mo- eid
  %  v'- cho̞- nei- nu
  %  ki- mei o- lo̞m:
  | g4. a4 b8
  | a4. ~ 4 g8
  | b4( a8) g4( fis8)
  | e4( fis8 g4) e8
  \break
  | g4( e8 g4 e8)
  | a4. g4.
  | fis8( e fis) g4 fis8
  | e4. ~ 4
}

upperD = \relative c' {
  d16 d
  \break
  \mark \markup { "D1" }
  | e8 e d e4 d16 d
  | e8 e d e4 d16 d
  | g8 g fis d e fis
  | e e e g4 d16 d
  
  \break
  | e8 e d e4 d16 d
  | e8 e d e4 d16 d
  | g8 g fis d e fis
  | e e e g4 g16 a

  \break
  \mark \markup { "D2" }
  | b8 b a g4 fis16 g
  | a8 a fis e4 d16 d
  | g8 g fis d e fis
  | e8 e e g4 g16 a

  \break
  | b8 b a g4 fis16 g
  | a8 a fis e4 d16 d
  | g8 g fis g a fis
  | e4. ~ 4 g16 a
  
  \break
  \mark \markup { "D3" }
  | b8 b b c c d
  | b8 b b a4 g16 a
  | b8 b b c c d
  | b8 b b a4 g16 a
  
  \break
  | b8 b b c c c
  | d4. ~ 4 c16 c
  | d8 d c d d c
  | b4. ~ 4 g16 a
  
  \break
  \mark \markup { "D2" }
  | b8 b a g4 fis16 g
  | a8 a fis e4 d16 d
  | g8 g fis d e fis
  | e8 e e g4 g16 a
  
  \break
  | b8 b a g4 fis16 g
  | a8 a fis e4 d16 d
  | g8 g fis g a fis
  | e4. ~ 4
}

% ======== %
% Sections %
% ======== %

sectionUpper = {
  \upperOne
  \upperTwo
  \upperThree
  \upperFour
  \upperD
  \fine
}

% ===== %
% Parts %
% ===== %

myTempo = \tempo 4. = 50

upper = {
  \clef treble
  \key e \minor
  \time 6/8
  \myTempo

  \sectionUpper
}

upperMidi = \upper

% ==== %
% Text %
% ==== %


textOne = \lyricmode {
  y'- did ne- fesh
  o̞v ho̞- ra- cha- mo̞n.
  m'- shoch av- d'- cho̞
  el r'- tzo- ne- cho̞.
  
  yo̞- rutz av- d'- cho̞
  k'- mo a- yo̞l
  yish- ta- cha- ve
  el mul ha- do̞- re- cho̞.
  
  ye- e- rav lo
  y'- di- do- sei- cho̞.
  mi- no- fes tzuf
  v'- cho̞l to̞- am: 
}

textTwo = \lyricmode {
  ho̞- dur no̞- e
  ziv ho̞- o- lo̞m.
  naf- shi cho- las
  a- ha- vo̞- se- cho̞.
  
  o̞- no̞ Ei-l no̞
  r'- fo̞ no̞ lo̞h.
  b'- har- os lo̞h
  no- am zi- ve- cho̞.
  
  o̞z tis- cha- zeik
  v'- sis- ra- pei.
  v'- ho̞y'- so̞ lo̞h
  sim- chas o- lo̞m:
}

textThree = \lyricmode {
  vo̞- sik ye- he- mu
  ra- cha- mei- cho̞
  v'- chu- so̞ no̞
  al bein a- hu- ve- cho̞.
  
  ki ze ka- mo̞
  nich- sof nich- saf- ti
  lir- os b'- sif- e- res
  u- ze- cho̞. 
  
  ei- le cho̞m'- do̞
  cho̞m'- do̞ li- bi
  v'- chu- so̞ no̞
  v'- al tis- a- lo̞m:
}

textFour = \lyricmode {
  hi- go̞- le no̞
  uf'- ros cha- vi- vi o̞- lai
  es su- kas
  sh'- lo- me- cho̞.
  
  to̞- ir e- retz
  mik'- vo- de- cho̞.
  no̞- gi- lo̞
  v'- nis- m'- cho̞ bo̞ch.
  
  ma- heir o̞- huv
  ki vo̞ mo- eid
  v'- cho̞- nei- nu
  ki- mei o- lo̞m:
}

textD = \lyricmode {
  yai- dai- dai- dai- dai- dai-
  yai- dai- dai- dai- dai- dai-
  yai- dai-
  dia- dai- dai-
  (sim.)
}

% TODO: MI version

textAll = {
  \textOne
  \textTwo
  \textThree
  \textFour
  \textD
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

\markup { \vspace #-2 }

\score {
  \transpose e d {
    \theScore
  }
  \layout {
    ragged-last = ##f
    \context {
      \Lyrics
      \override LyricText.font-name = #"Garamond"
%       \override LyricText.font-name = #"Times New Roman,"
    }
 }
  % \midi { \context { \Score midiRepeatTypes #onlyRepeats } }
}


\paper {
  score-markup-spacing.basic-distance = #-3
  system-system-spacing.basic-distance = #10
  system-system-spacing.padding = #0.1
}

\score {
\unfoldRepeats {
  \transpose c' c  {
    \transpose e d {
      \theScoreMidi
    }
  }
}
  \midi {
  }
}

\markup {
  \line {
    \hspace #25
    \column {
      \line { Beloved of the soul, }
      \vspace #0.1
      \line { Compassionate Father, }
      \vspace #0.1
      \line { draw Your servant }
      \vspace #0.1
      \line { to Your will. }
      \vspace #0.1
      \line { Then Your servant will hurry }
      \vspace #0.1
      \line { like a hart }
      \vspace #0.1
      \line { to bow }
      \vspace #0.1
      \line { before Your majesty. }
      \vspace #0.1
      \line { To him will be sweeter - }
      \vspace #0.1
      \line { Your friendship - }
      \vspace #0.1
      \line { than the dripping of the honeycomb }
      \vspace #0.1
      \line { and all taste. }
      \vspace #0.1
      \line {  }
      \vspace #0.1
      \line { Majestic, beautiful, }
      \vspace #0.1
      \line { radiance of the universe }
      \vspace #0.1
      \line { my soul is sick }
      \vspace #0.1
      \line { for your love. }
      \vspace #0.1
      \line { Please O G‑d, }
      \vspace #0.1
      \line { heal her now }
      \vspace #0.1
      \line { by showing her }
      \vspace #0.1
      \line { the pleasantness of Your radiance. }
      \vspace #0.1
      \line { Then she will be strengthened }
      \vspace #0.1
      \line { and healed }
      \vspace #0.1
      \line { and hers will be }
      \vspace #0.1
      \line { eternal gladness. }
      \vspace #0.1
      \line {  }
      \vspace #0.1
      \line { All worthy One, may be aroused }
      \vspace #0.1
      \line { Your mercy }
      \vspace #0.1
      \line { and please take pity }
      \vspace #0.1
      \line { on the son of Your beloved, }
      \vspace #0.1
      \line { because it is so very long }
      \vspace #0.1
      \line { that I have yearned intensely }
      \vspace #0.1
      \line { to see the splendor }
      \vspace #0.1
      \line { of Your strength, }
      \vspace #0.1
      \line { only these, did desire }
      \vspace #0.1
      \line { my heart }
      \vspace #0.1
      \line { so please take pity }
      \vspace #0.1
      \line { and do not conceal Yourself. }
      \vspace #0.1
      \line {  }
      \vspace #0.1
      \line { Please be revealed }
      \vspace #0.1
      \line { and spread upon me, my Beloved, }
      \vspace #0.1
      \line { the shelter of }
      \vspace #0.1
      \line { Your peace. }
      \vspace #0.1
      \line { Illuminate the world }
      \vspace #0.1
      \line { with your glory }
      \vspace #0.1
      \line { that we may rejoice }
      \vspace #0.1
      \line { and be glad with You. }
      \vspace #0.1
      \line { Hasten, be loved, }
      \vspace #0.1
      \line { for the time has come, }
      \vspace #0.1
      \line { and show us grace }
      \vspace #0.1
      \line { as in days of old. }
      \vspace #0.1
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { נֶֽפֶשׁ יְדִיד }
          \vspace #0.1
          \line { הָרַחֲמָן. אָב }
          \vspace #0.1
          \line { עַבְדְּךָ מְשׁוֹךְ }
          \vspace #0.1
          \line { רְצוֹנֶֽךָ. אֶל }
          \vspace #0.1
          \line { עַבְדְּךָ יָרוּץ }
          \vspace #0.1
          \line { אַיָּל כְּמוֹ }
          \vspace #0.1
          \line { יִשְׁתַּחֲוֶה }
          \vspace #0.1
          \line { הֲדָרֶֽךָ. מוּל אֶל }
          \vspace #0.1
          \line { לוֹ יֶעֱרַב }
          \vspace #0.1
          \line { יְדִידוֹתֶֽיךָ. }
          \vspace #0.1
          \line { צוּף מִנֹּֽפֶת }
          \vspace #0.1
          \line { טָֽעַם: וְכָל }
          \vspace #0.1
          \line {  }
          \vspace #0.1
          \line { נָאֶה הָדוּר }
          \vspace #0.1
          \line { הָעוֹלָם. זִיו }
          \vspace #0.1
          \line { חוֹלַת נַפְשִׁי }
          \vspace #0.1
          \line { אַהֲבָתֶֽךָ. }
          \vspace #0.1
          \line { נָא אֵ-ל אָֽנָּא }
          \vspace #0.1
          \line { לָהּ. נָא רְפָא }
          \vspace #0.1
          \line { לָהּ בְּהַרְאוֹת }
          \vspace #0.1
          \line { זִיוֶֽךָ. נֹֽעַם }
          \vspace #0.1
          \line { תִּתְחַזֵּק אָז }
          \vspace #0.1
          \line { וְתִתְרַפֵּא. }
          \vspace #0.1
          \line { לָהּ וְהָיְתָה }
          \vspace #0.1
          \line { עוֹלָם: שִׂמְחַת }
          \vspace #0.1
          \line {  }
          \vspace #0.1
          \line { יֶהֱמוּ וָתִיק }
          \vspace #0.1
          \line { רַחֲמֶֽיךָ }
          \vspace #0.1
          \line { נָא וְחֽוּסָה }
          \vspace #0.1
          \line { אֲהוּבֶֽךָ. בֵּן עַל }
          \vspace #0.1
          \line { כַּמָּה זֶה כִּי }
          \vspace #0.1
          \line { נִכְסַפְתִּי נִכְסוֹף }
          \vspace #0.1
          \line { בְּתִפְאֶֽרֶת לִרְאוֹת }
          \vspace #0.1
          \line { עֻזֶּֽךָ. }
          \vspace #0.1
          \line { חָמְדָה אֵֽלֶּה }
          \vspace #0.1
          \line { לִבִּי }
          \vspace #0.1
          \line { נָא וְחֽוּסָה }
          \vspace #0.1
          \line { תִּתְעַלָם: וְאַל }
          \vspace #0.1
          \line {  }
          \vspace #0.1
          \line { נָּא הִגָּלֶה }
          \vspace #0.1
          \line { עָלַי חֲבִיבִי וּפְרוֹס }
          \vspace #0.1
          \line { סֻכַּת אֶת }
          \vspace #0.1
          \line { שְׁלוֹמֶֽךָ. }
          \vspace #0.1
          \line { אֶֽרֶץ תָּאִיר }
          \vspace #0.1
          \line { מִכְּבוֹדֶֽךָ. }
          \vspace #0.1
          \line { נָגִֽילָה }
          \vspace #0.1
          \line { בָּךְ. וְנִשְׂמְחָה }
          \vspace #0.1
          \line { אָהוּב מַהֵר }
          \vspace #0.1
          \line { מוֹעֵד בָא כִּי }
          \vspace #0.1
          \line { וְחָנֵּֽנוּ }
          \vspace #0.1
          \line { עוֹלָם: כִּימֵי }
          \vspace #0.1
        }
      }
    }
  }
}



\markup {
  \fill-line {
    \line { \tiny "Melody: https://www.chabad.org/multimedia/music_cdo/aid/692759/jewish/17-Shir-Hamalot-Song-3.htm" }
  }
}

\markup {
  \fill-line {
    \line { \tiny "Text: https://www.chabad.org/multimedia/media_cdo/aid/265805/jewish/Yedid-Nefesh.htm" }
  }
}


