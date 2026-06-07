\version "2.24.4"



\header {
  title = "Niggun 026b - Shir HaMalot (Psalm 126) - Melody 3"
  subtitle = "Jewish Folk Song, for Birkat Hamazon (Grace After Meals) on Shabbat and Festivals"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
%   subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  arranger = "Arranged by Amichai Andy Rosenbaum | Sivan 5786 / June 2026 | v01 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

upperA = \relative c' {
  \mark \markup { "A1" }
  % shir ha- ma'a- los b'- shuv A- do- no̞y
  % es- shi- vas tzi- yon ho̞- yi- nu k'- chol'- mim.
  | d8( c d) e f4 f8. f16
  | f8( e f) g f( e) d4
  | d8( c) d e f4 f8. f16
  | f8 f e f g2
  \break
  \mark \markup { "A2" }
  % o̞z yi- mo̞- lei s'chok pi- nu
  % ul'- sho- nei- nu ri- no̞.
  | d8( g4) g8 g4 g
  | g8( a16 g f8 g) a( g) f4
  | d8( f4) f8 f4 g
  | f4( e) d4( c)
}

upperB = \relative c' {
  \break
  \mark \markup { "B1" }
  % o̞z yom- ru va- go- yim
  % hig- dil A- do- no̞y la- a- sos im- ei- le.
  | f8( c f g) a4 a
  | g4( a) g8 f4. 
  | f8( c) f g a4 a
  | g8 g c bes a4 a
  \break
  \mark \markup { "B2" }
  % hig- dil A- do- no̞y la- a- sos i- mo̞- nu
  % ho̞- yi- nu s'- mei- chim.
  | f8( c) f g a4 a
  | g8 g a8. a16 g8 f4.
  | f8( g4 f8) a8( g) g4
  | f4 e d2
}

upperC = \relative c' {
  \break
  \mark \markup { "C1" }
  %   shu- vo̞ A- do- no̞y es- sh'- vi- sei- nu
  %   ka- a- fi- kim ba- ne- gev.
  | d8( c) d e f4 f4
  | f8( e) f g f( e) d4
  | d8( c) d( e) f4 f4
  | f4 e8( f) g2
  \break
  \mark \markup { "C2" }
  %   ha- zo- r'im b'- dim- o̞
  %   b'- ri- no̞ yik- tzo- ru.
  | d8( g4.) g4 g
  | g8( a16 g f8 g) a( g) f4
  | d8( f4.) f4 g
  | f4 e d4( c)
}

upperD = \relative c' {
  \break
  \mark \markup { "D1" }
  %   ho̞- loch yei- leich u- vo̞- cho
  %   no- sei me- shech- ha- zo̞- ra
  | f8( c f) g a4 a
  | g4( a) g8 f4. 
  | r8 c'4 bes8 a4 a
  | g4 c8( bes) a2
  \break
  \mark \markup { "D2" }
  %   bo- yo̞- vo v'- ri- no̞
  %   no- sei a- lu- mo- so̞v.
  | f8( c f g) a4 a
  | g4( a) g8 f4.
  | f8( g4 f8) a4( g8) g8
  | f4 e d2
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
  es- shi- vas tzi- yon ho̞- yi- nu k'- chol'- mim.
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
%   \transpose d b, {
    \theScore
%   }
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
  system-system-spacing.padding = #0.5
}

\score {
\unfoldRepeats {
  \transpose c' c  {
%     \transpose d b, {
      \theScoreMidi
%     }
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
%     \line { \tiny "Melody: https://www.chabad.org/multimedia/music_cdo/aid/692759/jewish/17-Shir-Hamalot-Song-3.htm" }
%   }
% }
