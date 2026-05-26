\version "2.24.4"



\header {
  title = "Niggun 026 - Shir HaMalot (Psalm 126)"
  subtitle = "Jewish Folk Song, for Birkat Hamazon (Grace After Meals) on Shabbat and Festivals"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Sivan 5786 / May 2026 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

upperA = \relative c' {
  \mark \markup { "A1" }
  | d8( e f) e d4 d8 d
  | g8( a bes) a g4 g
  | f4 a8 a e4 a8 a
  | a8( g) f e d d a4
  \break
  \mark \markup { "A2" }
  | d8( e f) e d4 d
  | g8( a bes a) g4 g
  | f4 a e a
  | a8( g f e) d2
}

upperB = \relative c' {
  \break
  \mark \markup { "B1" }
  | a'2 a4 a
  | a8( g f g) a4 a
  | d4 a8 a a4 a
  | a8 g f g a( f g) a
  \break
  \mark \markup { "B2" }
  | r8 bes8 bes a g4 g
  | g8 f a g f( e) d4
  | d'4( a) c8( bes a) g
  | f4 e4 d2
}

upperC = \relative c' {
  \break
  \mark \markup { "C1" }
  %   shu- vo̞ A- do- no̞y es- sh'- vi- sei- nu
  %   ka- a- fi- kim ba- ne- gev.

  | d8( e) f e d4 d4
  | g8( a) bes a g4 g
  | f4 a e a
  | a8( g f e) d4 a
  \break
  \mark \markup { "C2" }
  %   ha- zo- r'im b'- dim- o̞
  %   b'- ri- no̞ yik- tzo- ru.
  | d8( e f e) d4 d
  | g8( a bes a) g4 g
  | f4( a) e a
  | a8( g) f( e) d2
}

upperD = \relative c' {
  \break
  \mark \markup { "D1" }
  %   ho̞- loch yei- leich u- vo̞- cho
  %   no- sei me- shech- ha- zo̞- ra
  | a'4 a a a
  | a8( g) f( g) a2
  | d4 a a a
  | a8( g) f( g) a( f g a)
  \break
  \mark \markup { "D2" }
  %   bo- yo̞- vo v'- ri- no̞
  %   no- sei a- lu- mo- so̞v.
  | r8 bes4( a8) g4 g
  | g8( f a g) f( e) d4
  | d'4( a) c8( bes a) g
  | f4 e4 d2
}


% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \upperA
  \upperB
  \upperC
  \upperD
  \fine
}

% ===== %
% Parts %
% ===== %

myTempo = \tempo 4 = 100

upper = {
  \clef treble
  \key d \minor
  \time 4/4
  \myTempo

  \sectionUpperA
}

upperMidi = \upper

% ==== %
% Text %
% ==== %



textA = \lyricmode {
  shir ha- ma'a- los b'- shuv A- do- no̞y
  es- shi- vas tzi- yon ho̞- yi- nu k'- cho- l'- mim.
  o̞z yi- mo̞- lei s'chok pi- nu
  ul'- sho- nei- nu ri- no̞.
}

textB = \lyricmode {
  o̞z yom- ru va- go- yim
  hig- dil A- do- no̞y la- a- sos im- ei- le.
  hig- dil A- do- no̞y la- a- sos i- mo̞- nu
  ho̞- yi- nu s'- mei- chim.
}

textC = \lyricmode {
  shu- vo̞ A- do- no̞y es- sh'- vi- sei- nu
  ka- a- fi- kim ba- ne- gev.
  ha- zo- r'im b'- dim- o̞
  b'- ri- no̞ yik- tzo- ru.
}

textD = \lyricmode {
  ho̞- loch yei- leich u- vo̞- cho
  no- sei me- shech- ha- zo̞- ra
  bo- yo̞- vo v'- ri- no̞
  no- sei a- lu- mo- so̞v.
}

% TODO: MI version

textAll = {
  \textA
  \textB
  \textC
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
    \theScore
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
  system-system-spacing.padding = #1
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
  \line {
    \hspace #15
    \column {
      \line { A song of ascents. When Hashem will return }
      \vspace #-0.05
      \line { the exiles of Zion, we will have been like dreamers. }
      \vspace #-0.05
      \line { Then our mouth will be filled with laughter, }
      \vspace #-0.05
      \line { and our tongue with songs of joy; }
      \vspace #-0.05
      \line { then will they say among the nations, }
      \vspace #-0.05
      \line { 'Hashem has done great things for these.' }
      \vspace #-0.05
      \line { Hashem has done great things for us; }
      \vspace #-0.05
      \line { we were joyful. }
      \vspace #-0.05
      \line { Hashem, return our exiles }
      \vspace #-0.05
      \line { as streams to arid soil. }
      \vspace #-0.05
      \line { Those who sow in tears }
      \vspace #-0.05
      \line { will reap with songs of joy. }
      \vspace #-0.05
      \line { He goes along weeping, }
      \vspace #-0.05
      \line { carrying the bag of seed; }
      \vspace #-0.05
      \line { he will surely return with songs of joy, }
      \vspace #-0.05
      \line { carrying his sheaves. }
      \vspace #-0.05
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { יי בְּשׁוּב הַמַּעֲלוֹת שִׁיר }
          \vspace #-0.05
          \line { כְּחֹלְמִים׃ הָיִינוּ צִיּוֹן אֶת־שִׁיבַת }
          \vspace #-0.05
          \line { פִּינוּ שְׂחוֹק יִמָּלֵא אָז }
          \vspace #-0.05
          \line { רִנָּה וּלְשׁוֹנֵנוּ }
          \vspace #-0.05
          \line { בַגּוֹיִם יֹאמְרוּ אָז }
          \vspace #-0.05
          \line { עִם־אֵלֶּה׃ לַעֲשׂוֹת יי הִגְדִּיל }
          \vspace #-0.05
          \line { עִמָּנוּ לַעֲשׂוֹת יי הִגְדִּיל }
          \vspace #-0.05
          \line { שְׂמֵחִים׃ הָיִינוּ }
          \vspace #-0.05
          \line { אֶת־שְׁבִיתֵנוּ יי שׁוּבָה }
          \vspace #-0.05
          \line { בַּנֶּגֶב׃ כַּאֲפִיקִים }
          \vspace #-0.05
          \line { בְּדִמְעָה הַזֹּרְעִים }
          \vspace #-0.05
          \line { יִקְצֹרוּ׃ בְּרִנָּה }
          \vspace #-0.05
          \line { וּבָכֹה יֵלֵךְ הָלוֹךְ }
          \vspace #-0.05
          \line { מֶשֶׁךְ־הַזָּרַע נֹשֵׂא }
          \vspace #-0.05
          \line { בְרִנָּה בֹּא־יָבֹא }
          \vspace #-0.05
          \line { אֲלֻמֹּתָיו׃ נֹשֵׂא }
          \vspace #-0.05
        }
      }
    }
  }
}



% \markup {
%   \fill-line {
%     \line { \tiny "Melody: https://www.chabad.org/multimedia/music_cdo/aid/692744/jewish/2-Shir-Hamalot.htm" }
%   }
% }
