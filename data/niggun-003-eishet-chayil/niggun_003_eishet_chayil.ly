\version "2.24.4"

\header {
  title = "Niggun 003 - Eishet Chayil"
  subtitle = "Jewish Folk Song (based on Mayer Davis version)"
  subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration style: Modern Israeli"
  arranger = "Arranged by Amichai Andy Rosenbaum | Iyar 5785 / May 2025 | v04 | B''H"
  copyright = "Licensed under CC BY-NC-SA 4.0"
}

\markup{
  \vspace #1
  \hspace #15
  \abs-fontsize #10
  \center-column {
  \line { Hebrew text from https://www.sefaria.org.il/sheets/49238.1 }
  \line { Translation from https://aish.com/eishet-chayil }
}
}

upperAleph = \relative c' {
  \mark \markup { "A1" }
  d8\( d fis fis16 fis a8 g8~ 8. g16 |
  fis8 fis ees ees fis4 ees16( d) c8\) |
}

upperBet = \relative c' {
  \mark \markup { "A2" }
  d8\( d fis fis a8 g8~ 8. g16 |
  fis8 fis ees16( d) ees( c) d4~ 8.\)
}

upperGimel = \relative c' {
  d16\( |
  \mark \markup { "A1" }
  d8 d fis8. fis16 a8 g4. |
  fis8 fis ees4 fis ees16( d) c8\) |
}

upperDaled = \relative c' {
  \mark \markup { "A2" }
  d8\( d fis fis16 fis a8 g8~ 8. g16 |
  fis8 fis16 fis ees16 d ees c d2\) |
}

upperHei = \relative c'' {
  \mark \markup { "B1" }
  bes8\( bes16 bes bes8 bes bes16( c) a8~ 8. d,16 |
  a'8 a a a a16( bes) g8~ 8.\)
}

upperVav = \relative c'' {
  g16\( |
  \mark \markup { "B2" }
  g8 g16 16 a8.( g16) g8 fis8. fis16 fis fis |
  fis8 d16 d e8 fis16 fis g g fis fis g8 a8\) |
}

upperZayin = \relative c'' {
  \mark \markup { "B1" }
  bes16\( bes bes bes bes bes bes bes bes16( c) a8~ 8. d,16 |
  a'8 a a16 a a a a16( bes) g4.\) |
}

upperChet = \relative c'' {
  \mark \markup { "B3" }
  g8\([ g16 16] a8.[ g16] g8 fis8~ 8. fis16 |
  fis8 d ees16( d) ees( c) d2\) |
}

upperTet = \relative c' {
  \mark \markup { "A1" }
  d8\( d fis fis a8 g4. |
  fis8 fis ees8. ees16 fis8 fis ees16( d) c16\)
}

upperYud = \relative c' {
  c16\( |
  \mark \markup { "A2" }
  d8 d fis fis16 fis a8 g4 g16 g |
  fis8 fis ees16 d ees( c) d2\) |
}

upperKaf = \relative c' {
  \mark \markup { "A1" }
  d8\( d fis8 fis16 fis a8 g4. |
  fis8 fis ees ees fis fis16 fis ees16( d) c16\)
}

upperLamed = \relative c' {
  c16\( |
  \mark \markup { "A2" }
  d8 d16 d fis8 fis16 fis a8 g4 g16 g |
  fis8 fis ees16 d ees( c) d4.\)
}

upperMem = \relative c' {
  d8\( |
  \mark \markup { "B1" }
  bes'8 bes bes bes bes16( c a4.) |
  a8 a16 a a8 a16 a a( bes) g4.\) |
}

upperNun = \relative c'' {
  \mark \markup { "B2" }
  g8\( g16 16 a8. g16 g8 fis4 fis8 |
  fis8( d) e8 fis g fis g a\) |
}

upperSamech = \relative c'' {
  \mark \markup { "B1" }
  bes8\( bes bes bes16 bes bes16( c) a8~ 8. d,16 |
  a'8 a a a16 a a( bes) g4.\)
}

upperAyin = \relative c'' {
  \mark \markup { "B3" }
  g8\([ g16 16] a8.[ g16] g8 fis4 fis8 |
  fis8 d16 d ees16( d) ees c d2\) |
}

upperPeh = \relative c' {
  \mark \markup { "A1" }
  d8\( d fis fis16 fis a8 g8~ 8. g16 |
  fis8 fis ees ees fis fis ees16( d) c16\)
}

upperTzadi = \relative c' {
  c16\( |
  \mark \markup { "A2" }
  d8 d16 d fis8 fis a8 g4 g8 |
  fis16 fis fis fis  ees16( d) ees( c) d2\)
}

upperKuf = \relative c' {
  \mark \markup { "A1" }
  d8\( d16 d fis fis fis fis a8 g4. |
  fis4 ees fis8 fis ees16 d c8\) |
}

upperResh = \relative c' {
  \mark \markup { "A2" }
  d8\( d fis16 fis fis fis a8
    \once \omit Score.MetronomeMark
    % Invisible tempo marking to lengthen fermata in MIDI
    \tempo 4 = 30 
    g8~\fermata
    16
    \tempo 4 = 45
    g g g |
    d'2\fermata
    r4
    \)
    d,8\( d |
    bes'( a)
    \mark \markup { "Improvise, b'simcha!" }
    g( fis ees d \tuplet 3/2 { g fis a } ) \) |
}

upperShin = \relative c'' {
  \mark \markup { "B1 - Slow, Big Finish!" }
  bes4\( bes8. bes16 bes16( c a8~ 8.) d,16 |
  a'4 a8. a16 a( bes) g8~ 8.\)

  g16\(
  \mark \markup { "B2" }
  g8. g16 a8. g16 g8 fis4. |
  fis8( d e8 fis) g fis g( a)\) |
}

upperTaf = \relative c'' {
  \mark \markup { "B1" }
  bes4\( bes4 bes16( c a8~ 8.) d,16 |
  a'4 a4 a16( bes) g4.\)

  \mark \markup { "B3" }
  g4\( a8. g16 g8
    \once \omit Score.MetronomeMark
    % Invisible tempo marking to lengthen fermata in MIDI
    \tempo 4 = 30 
    fis4\fermata

  \tempo 4 = 30
  fis16 fis |
  fis8 d8
  \mark \markup { "Very Slow" }
  ees16 d ees( c)
  d2\fermata\) |
}




upper = \relative c' {
  \clef treble
  \key g \minor
  \time 4/4
  \tempo 4 = 60

  \upperAleph
  \upperBet
  \upperGimel
  \upperDaled
  \upperHei
  \upperVav
  \upperZayin
  \upperChet
  \upperTet
  \upperYud
  \upperKaf
  \upperLamed
  \upperMem
  \upperNun
  \upperSamech
  \upperAyin
  \upperPeh
  \upperTzadi
  \upperKuf
  \upperResh
  \upperShin
  \upperTaf

}



textAlephMI = \lyricmode {
  \markup \bold { א Ei- } shet cha- yil  mi yim- tza, v'- ra- chok mi- p'ni- nim mich- rah.
}
textAleph = \lyricmode {
  \markup \bold { א Ei- } shes cha- yil mi yim- tzo̞, v'- ro̞- chok mi- p'ni- nim mich- ro̞h.
}

textBetMI = \lyricmode {
  \markup \bold { ב Ba- } tach bah leiv ba- lah v'- sha- lal lo yech- sar.
}
textBet = \lyricmode {
  \markup \bold { ב Bo̞- } tach bo̞h leiv ba- lo̞h, v'- sho̞- lo̞l lo yech- so̞r.
}

textGimelMI = \lyricmode {
  \markup \bold { ג G'ma- } lat'- hu tov v'- lo ra kol y'- mei cha- ye- ha.
}
textGimel = \lyricmode {
  \markup \bold { ג G'mo̞- } las- hu tov v'- lo ro̞, kol y'- mei cha- yei- ho̞.
}

textDaledMI = \lyricmode {
  \markup \bold { ד Dar'- } sha tze- mer u- fish- tim va- ta- as b'- chei- fetz ka- pe- ha.
}
textDaled = \lyricmode {
  \markup \bold { ד Do̞r'- } sho̞ tze- mer u- fish- tim, va- ta- as b'- chei- fetz ka- pei- ho̞.
}

textHeiMI = \lyricmode {
  \markup \bold { ה Hay'- } ta ka'a- ni- yot so- cheir mi- mer- chak ta- vi lach- mah.
}
textHei = \lyricmode {
  \markup \bold { ה Ho̞y'- } so̞ ko̞'o̞- ni- yos so- cheir, mi- mer- cho̞k to̞- vi lach- mo̞h.
}

textVavMI = \lyricmode {
  \markup \bold { ו Va- } ta- kam b'- od lay- lah va- ti- tein te- ref l'- vei- tah v'- chok l'- na'a- ro- te- ha.
}
textVav = \lyricmode {
  \markup \bold { ו Va- } to̞- ko̞m b'- od lay'- lo̞, va- ti- tein te- ref l'- vei- so̞h v'- chok l'- na'a- ro- sei- ho̞.
}

textZayinMI = \lyricmode {
  \markup \bold { ז Za- } m'- mah sa- deh va- ti- ka- chei- hu mi- p'ri cha- pe- ha nat'- ah ka- rem.
}
textZayin = \lyricmode {
  \markup \bold { ז Zo̞- } m'- mo̞ so̞- de va- ti- ko̞- chei- hu, mi- p'ri cha- pei- ho̞ no̞t'- o̞ ko̞- rem.
}

textChetMI = \lyricmode {
  \markup \bold { ח Chog'- } ra b'- oz mat'- ne- ha va- t'a- meitz z'ro'o- te- ha.
}
textChet = \lyricmode {
  \markup \bold { ח Cho̞g'- } ro̞ b'- oz mo̞s'- nei- ho̞, va- t'a- meitz z'ro'o- sei- ho̞.
}

textTetMI = \lyricmode {
  \markup \bold { ט Ta'a- } ma ki tov sach- rah lo yich- beh ba- lay- lah nei- rah.
}
textTet = \lyricmode {
  \markup \bold { ט To̞'a- } mo̞ ki tov sach- ro̞h, lo yich- be ba- lei- lo̞ nei- ro̞h.
}

textYudMI = \lyricmode {
  \markup \bold { י Ya- } de- ha shil'- cha va- ki- shor v'- cha- pe- ha tam'- chu fa- lech.
}
textYud = \lyricmode {
  \markup \bold { י Yo̞- } dei- ho̞ shil'- cho̞ va- ki- shor, v'- cha- pei- ho̞ to̞m'- chu fo̞- lech.
}

textKafMI = \lyricmode {
  \markup \bold { כ Ka- } pah par'- sah le- a- ni v'- ya- de- ha shil'- cha la- ev- yon.
}
textKaf = \lyricmode {
  \markup \bold { כ Ka- } po̞h po̞r'- so̞ le- o̞- ni, v'- yo̞- dei- ho̞ shil'- cho̞ lo̞- ev- yon.
}

textLamedMI = \lyricmode {
  \markup \bold { ל Lo } ti- ra l'- vei- tah mi- sha- leg ki chol bei- tah la- vush sha- nim.
}
textLamed = \lyricmode {
  \markup \bold { ל Lo } si- ro̞ l'- vei- so̞h mi- sho̞- leg, ki cho̞l- bei- so̞h lo̞- vush sho̞- nim.
}

textMemMI = \lyricmode {
  \markup \bold { מ Mar- } va- dim as'- tah lah sheish v'- ar- ga- man l'- vu- shah.
}
textMem = \lyricmode {
  \markup \bold { מ Mar- } va- dim o̞s'- so̞ lo̞h, sheish v'- ar- go̞- mo̞n l'- vu- sho̞h.
}

textNunMI = \lyricmode {
  \markup \bold { נ Ｎo- } da ba- sh'a- rim ba- lah b'- shiv- to im zik- nei a- retz.
}

textNun = \lyricmode {
  % TODO: I'm hacking a full-width capital N here to avoid a font subsitution bug.
  \markup \bold { נ Ｎo- } do̞ ba- sh'o̞- rim ba- lo̞h, b'- shiv- to im zik- nei- o̞- retz.
}

textSamechMI = \lyricmode {
  \markup \bold { ס Sa- } din as'- ta va- tim- kor va- cha- gor nat'- nah lak'- na'a- ni.
}
textSamech = \lyricmode {
  \markup \bold { ס So̞- } din o̞s'- so̞ va- tim- kor, va- cha- gor no̞s'- no̞ lak'- na'a- ni.
}

textAyinMI = \lyricmode {
  \markup \bold { ע Oz } v'- ha- dar l' vu- shah va- tis- chak l'- yom a- cha- ron.
}
textAyin = \lyricmode {
  \markup \bold { ע Oz } v'- ho̞- do̞r l'- vu- sho̞h, va- tis- chak l'- yom a- cha- ron.
}

textPehMI = \lyricmode {
  \markup \bold { פ Pi- } ha pat'- cha v'- choch- mah v'- to- rat che- sed al l'- sho- nah.
}
textPeh = \lyricmode {
  \markup \bold { פ Pi- } ho̞ po̞s'- cho̞ v'- cho̞ch- mo̞, v'- so- ras che- sed al l'- sho- no̞h:
}

textTzadiMI = \lyricmode {
  \markup \bold { צ Tzo- } fi- ha ha- li- chot bei- tah v'- le- chem atz- lut lo to- cheil.
}
textTzadi = \lyricmode {
  \markup \bold { צ Tzo- } fi- yo̞ ha- li- chos bei- so̞h, v'- le- chem atz- lus lo so- cheil:
}

textKufMI = \lyricmode {
  \markup \bold { ק Ka- } mu va- ne- ha va- yash'- ru- ha ba- lah va- y'- ha- l'- lah.
}
textKuf = \lyricmode {
  \markup \bold { ק Ko̞- } mu vo̞- nei- ho̞ va- y'ash'- ru- ho̞, ba- lo̞h va y'- ha- l'- lo̞h:
}

textReshMI = \lyricmode {
  \markup \bold { ר Ra- } bot ba- not a- su cha- yil v'- at a- lit al ku- la- nah.
}
textResh = \lyricmode {
  \markup \bold { ר Ra- } bos bo̞- nos o̞- su cho̞- yil, v'- at o̞- lis al ku- lo̞- no̞:
}

textShinMI = \lyricmode {
  \markup \bold { ש She- } ker ha- chein v'- he- vel ha- yo- fi i- shah yi- rat A- do- nai hi tit- ha- lal.
}
textShin = \lyricmode {
  \markup \bold { ש She- } ker ha- chein v'- he- vel ha- yo- fi, i- sho̞ yir- as a- do- no̞y hi sis- ha- lo̞l:
}

textTafMI = \lyricmode {
  \markup \bold { ת T'- } nu lah mi- p'ri ya- de- ha vi- ha- l'- lu- ha ba- sh'- a- rim ma- a- se- ha.
}
textTaf = \lyricmode {
  \markup \bold { ת T'- } nu lo̞h mi- p'ri yo̞- dei- ho̞, vi- ha- l'- lu- ho̞ ba- sh'- o̞- rim ma- a- s'- ho̞:
}


textAll = {
  \textAleph
  \textBet
  \textGimel
  \textDaled
  \textHei
  \textVav
  \textZayin
  \textChet
  \textTet
  \textYud
  \textKaf
  \textLamed
  \textMem
  \textNun
  \textSamech
  \textAyin
  \textPeh
  \textTzadi
  \textKuf
  \textResh
  \textShin
  \textTaf
}

textAllMI = {
  \textAlephMI
  \textBetMI
  \textGimelMI
  \textDaledMI
  \textHeiMI
  \textVavMI
  \textZayinMI
  \textChetMI
  \textTetMI
  \textYudMI
  \textKafMI
  \textLamedMI
  \textMemMI
  \textNunMI
  \textSamechMI
  \textAyinMI
  \textPehMI
  \textTzadiMI
  \textKufMI
  \textReshMI
  \textShinMI
  \textTafMI
}


theScore = {
  \new PianoStaff <<
    \new Staff = upper { \set Staff.midiInstrument = #"alto sax" \new Voice = "singer" \upper }
    % \new Staff = lower { \lower }
    \new Lyrics \lyricsto "singer"  {
      \textAll
%       \textAllMI
    }
  >>
}

\score {
  \theScore
  \layout { 
      \context {
        \Lyrics
        \override LyricText.font-name = #"Garamond,"
%        \override LyricText.font-name = #"Times New Roman,"
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
    \override #'(direction . -1)
  \fill-line {
    \hspace #4
    \column {
      \vspace #0.3
      \line { \bold { א } A Woman of Valor, who can find? } 
      \line { She is more precious than corals. }
      \vspace #0.3
      \line { \bold { ב } Her husband places his trust in her }
      \line { and profits only thereby. }
      \vspace #0.3
      \line { \bold { ג } She brings him good, not harm, }
      \line {  all the days of her life. }
      \vspace #0.3
      \line { \bold { ד } She seeks out wool and flax }
      \line { and cheerfully does the work of her hands. }
      \vspace #0.3
      \line { \bold { ה } She is like the trading ships, }
      \line { bringing food from afar. }
      \vspace #0.3
      \line { \bold { ו } She gets up while it is still night }
      \line { to provide food for her household, }
      \line { and a fair share for her staff. }
      \vspace #0.3
      \line { \bold { ז } She considers a field and purchases it, }
      \line { and plants a vineyard with the fruit of her labors. }
      \vspace #0.3
      \line { \bold { ח } She invests herself with strength }
      \line { and makes her arms powerful. }
      \vspace #0.3
      \line { \bold { ט } She senses that her trade is profitable; }
      \line { her light does not go out at night. }
      \vspace #0.3
      \line { \bold { י } She stretches out her hands to the distaff }
      \line { and her palms hold the spindle. }
      \vspace #0.3
      \line { \bold { כ } She opens her hands to the poor }
      \line { and reaches out her hands to the needy. }
      \vspace #0.3
      \line { \bold { ל } She has no fear of the snow for her household, }
      \line { for all her household is dressed in fine clothing. }
      \vspace #0.3
      \line { \bold { מ } She makes her own bedspreads; }
      \line { her clothing is of fine linen and luxurious cloth. }
      \vspace #0.3
      \line { \bold { נ } Her husband is known at the gates, }
      \line { where he sits with the elders of the land. }
      \vspace #0.3
      \line { \bold { ס } She makes and sells linens; }
      \line { she supplies the merchants with sashes. }
      \vspace #0.3
      \line { \bold { ע } She is robed in strength and dignity, }
      \line { and she smiles at the future. }
      \vspace #0.3
      \line { \bold { פ } She opens her mouth with wisdom }
      \line { and a lesson of kindness is on her tongue. }
      \vspace #0.3
      \line { \bold { צ } She looks after the conduct of her household }
      \line { and never tastes the bread of laziness. }
      \vspace #0.3
      \line { \bold { ק } Her children rise up and make her happy; }
      \line { her husband praises her: }
      \vspace #0.3
      \line { \bold { ר } "\"Many women have excelled," }
      \line { "but you excell them all!\"" }
      \vspace #0.3
      \line { \bold { ש } Grace is elusive and beauty is vain, }
      \line { but a woman who fears G-d -- she shall be praised. }
      \vspace #0.3
      \line { \bold { ת } Give her credit for the fruit of her labors, }
      \line { and let her achievements praise her at the gates. }
    }
    \column  {
      \vspace #0.3
      \line { יִמְצָא, מִי חַֽיִל אֵשֶׁת }
      \line { מִכְרָהּ. מִפְּנִינִים וְרָחֹק }
      \vspace #0.3
      \line { בַּעְלָהּ, לֵב בָּהּ בָּֽטַח }
      \line { יֶחְסָר. לֹא וְשָׁלָל } 
      \vspace #0.3
      \line { רָע, וְלֹא טוֹב גְּמָלַֽתְהוּ }
      \line { חַיֶּֽיהָ. יְמֵי כֹּל }
      \vspace #0.3
      \line { וּפִשְׁתִּים, צֶֽמֶר דָּרְשָֽׁה }
      \line { כַּפֶּֽיהָ. בְּחֵֽפֶץ וַתַּֽעַשׂ }
      \vspace #0.3
      \line { סוֹחֵר, כָׇּאֳנִיּוֹת הָיְתָה }
      \line { לַחְמָהּ. תָּבִיא מִמֶּרְחָק }
      \vspace #0.3
      \line { לַיְלָה, בְּעוֹד וַתָּֽקׇׇם }
      \line { לְבֵיתָהּ טֶֽרֶף וַתִּתֵּֽן }
      \line { לְנַֽעֲרֹתֶֽיהָ. וְחֹק }
      \vspace #0.3
      \line { וַתִּקָּחֵֽהוּ, שׂדֶה זָמְמָה }
      \line { כָּֽרֶם. נָטְעָה כַפֶּֽיהָ מִפְּרִי }
      \vspace #0.3
      \line { מׇתְנֶֽיהָ, בְּעוֹז חָגְרָה }
      \line { זְרוֹעֹתֶֽיהָ. וַתְּאַמֵּץ }
      \vspace #0.3
      \line { סַחְרָהּ, טוֹב כִּי טָֽעֲמָה }
      \line { נֵרָהּ. בַּלַּֽיְלָה יִכְבֶּה לֹא }
      \vspace #0.3
      \line { בַכִּישׁוֹר, שִׁלְּחָה יָדֶֽיהָ }
      \line { פָֽלֶךְ. תָּֽמְכוּ וְכַפֶּֽיהָ }
      \vspace #0.3
      \line { לֶעָנִי, פָּרְשָֹה כַּפָּהּ }
      \line { לָאֶבְיוֹן. שִׁלְּחָה וְיָדֶֽיהָ }
      \vspace #0.3
      \line { מִשָּֽׁלֶג, לְבֵיתָהּ תִירָא לֹא }
      \line { שָׁנִים. לָבֻשׁ כׇל־בֵּיתָהּ כִּי }
      \vspace #0.3
      \line { עָשׂתָה־לָּהּ, מַרְבַדִּים }
      \line { לְבוּשָׁהּ. וְאַרְגָּמָן שֵׁשׁ }
      \vspace #0.3
      \line { בַּעְלָהּ, בַּשְּׁעָרִים נוֹדָע }
      \line { זִקְנֵי־אָרֶץ. עִם בְּשִׁבְתּוֹ }
      \vspace #0.3
      \line { וַתִּמְכֹּר, עָשׂתָה סָדִין }
      \line { לַכְּנַעֲנִי. נָתְנָה וַחֲגוֹר }
      \vspace #0.3
      \line { לְבוּשָׁהּ, וְהָדָר עוֹז }
      \line { אַחֲרוֹן. לְיוֹם וַתִּשׂחַק }
      \vspace #0.3
      \line { בְחׇכְמָה, פָּתְחָה פִּֽיהָ }
      \line { לְשׁוֹנָהּ: עַל חֶֽסֶד וְתֽוֹרַת }
      \vspace #0.3
      \line { בֵּיתָהּ, הֲלִיכוֹת צוֹפִיָּה }
      \line { תֹאכֵל: לֹא עַצְלוּת וְלֶֽחֶם }
      \vspace #0.3
      \line { וַיְּאַשְּׁרֽוּהָ, בָנֶֽיהָ קָמוּ }
      \line { וַיְהַלְלָהּ: בַּעְלָהּ }
      \vspace #0.3
      \line { חָֽיִל, עָֽשׂוּ בָּנוֹת רַבּוֹת }
      \line { כֻּלָּנָה: עַל עָלִית וְאַתְּ }
      \vspace #0.3
      \line { הַיֹּֽפִי, וְהֶֽבֶל הַחֵן שֶֽׁקֶר }
      \line { תִתְהַלָּל: הִיא ה׳ יִרְאַת אִשָּׁה }
      \vspace #0.3
      \line { יָדֶֽיהָ, מִפְּרִי לָהּ תְּנוּ }
      \line { מַעֲשֽׂיהָ: בַּשְּׁעָרִים וִיהַלְלֽוּהָ }
    }
    \hspace #2
  }
}


