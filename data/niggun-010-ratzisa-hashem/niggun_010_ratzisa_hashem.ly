\version "2.24.4"


\header {
  title = "Niggun 010 - Ratzisa Hashem"
  subtitle = "Jewish Folk Song (Tehillim 85: Chabad-Lubavitch melody)"
%   subsubtitle = "Transliteration Style: Tehillat Hashem English"
  % subsubtitle = "Transliteration Style: Modern Israeli"
  % subsubtitle = "Transliteration Style: ArtScroll Ashkenazi"
  copyright = "© August 2025 / Elul 5785 by Amichai Rosenbaum, All Rights Reserved | v02 | BS''D"
}

% \markup {
%   \vspace #1
%   \fill-line {
%   \line { Arranged by Amichai Rosenbaum Elul 5785 / August 2025 | v01 | BS''D }
% }
% }



upperAOne = \relative c' {
  \mark \markup { "A1" }
  \partial 8 d8
  | a8 d4 d8 d2
  | cis8( d) e( f) d2
  | d4 f e( d)
  | a'8( f) a( f) e4.
}

upperATwo = \relative c' {
  \mark \markup { "A2" }
  e8
  | a,8 e'4 e8 e2
  | g4 f8( e) e2
}

upperAEndX = \relative c'' {
  | a4 a g8( f) e8 g
  | f2..
}

upperAEndY = \relative c'' {
  | a4 a g8( f) e8 f
  | d2..
}

% a- ha a- ha ha- lo- a- to̞ to̞- shuv t'- cha- yei- nu v'- am'- cho̞ yis- m'- chu- vo̞ch.
upperBOne = \relative c' {
  \mark \markup { "B" }
  d8
  | f4. g8 f4. g8
  | f( g) f( g) f2
  % to̞- shuv t'-
  | f4( d) d4. f8
  | a8( g) g4 g4. f8
}

upperBOneEndX = \relative c'' {
  | a8( g) g( f) f e d( g)
  | f2..
}

upperBOneEndY = \relative c'' {
  | a8( g) g( f) f e d( e)
  | d2..
}


upperBTwoPickup = \relative c'' {
  \mark \markup { "C" }
  gis8
}

upperBTwoSplitFirstTime = \relative c'' {
  a4._\markup { "(1st time)" } gis8 a4. gis8
}

upperBTwoSplitSecondTime = \relative c'' {
  a2^\markup { "(2nd time)" } d4.^\markup { "hey!" } gis,8
}

upperBTwoSplitJoint = \relative c'' {
  \oneVoice
  <<
    \new Voice = "two" {
      \voiceTwo
      \override Stem.direction = #UP
      \tiny
      \upperBTwoSplitSecondTime
      \normalsize
      \revert Stem.direction
    }
%     \new Voice = "two" {
    {
      \voiceOne
      \override Stem.direction = #DOWN
      \upperBTwoSplitFirstTime
      \revert Stem.direction
    }
  >>
  \oneVoice
}

upperBTwoCommon = \relative c'' {
  | a8( gis) a( gis) a2
  % to̞- shuv
  | a8( c b a a4) a
  | a8( c b) a a4 a
  | a8( c b a a4 gis8) f
  % t'- cha- yei- nu v'
  | f( a gis) f e( f) d8. d16
}


upperBTwoEndX = \relative c' {
  | f4 a gis8 a b( gis)
  | a2..
}

upperBTwoEndY = \relative c' {
  | f4 a gis8 f e( f)
  | d2..
}

%   har- ei- nu ha- shem chas- de- cho̞ v'- yesh- a- cho̞ ti- ten- lo̞- nu.
% ach ko̞- rov li- rei- o̞v yish- o lish- kon ko̞- vod b'- ar- tzei- nu.
upperCOne = \relative c' {
  \mark \markup { "D1" }
  d8
  | g8 g4 g8 g4 f8 e
  | f4 e8 d f2
  | r8 g4 g8 g a16 g f8 e f f e d a'4.
}

upperCOneP = \relative c' {
  \mark \markup { "D2" }
  d8
  | g8 g4 g8 g4 a4
  | f4 e4 d2
  | f8 f e d a'2 gis8 f e f d4.
}

% ======== %
% Sections %
% ======== %

sectionUpperA = {
  \repeat volta 2 {

    \upperAOne
    \upperATwo

    \alternative {
      \upperAEndX
      \upperAEndY
    }
  
  }
}

sectionUpperBOne = {
  \repeat volta 2 {
    \upperBOne
    
    \alternative {
      \upperBOneEndX
      \upperBOneEndY
    }
  }
}

% a- ha a- ha ha- lo- a- to̞ to̞- shuv t'- cha- yei- nu v'- am'- cho̞ yis- m'- chu- vo̞ch.
sectionUpperBTwoScore = {
  \repeat volta 2 {
    \upperBTwoPickup
    \upperBTwoSplitJoint
    \upperBTwoCommon
    \alternative {
      \upperBTwoEndX
      \upperBTwoEndY
    }
  }
}

sectionUpperBTwoMidi = {
  \upperBTwoPickup
  \upperBTwoSplitFirstTime
  \upperBTwoCommon
  \upperBTwoEndX
  
  \upperBTwoPickup
  \upperBTwoSplitSecondTime
  \upperBTwoCommon
  \upperBTwoEndY
}

sectionUpperC = {
  \repeat volta 2 {
    \upperCOne
    \upperCOneP
  }
}

% ===== %
% Parts %
% ===== %


upper = {
  \clef treble
  \key d \minor
  \time 4/4
  \tempo 4 = 100
  
  \sectionUpperA
  
  \sectionUpperBOne
  
  \sectionUpperBTwoScore

  \break
}

upperMidi = {
  \clef treble
  \key d \minor
  \time 4/4
  \tempo 4 = 100
  
  \sectionUpperA
  
  \sectionUpperBOne
  
  \sectionUpperBTwoMidi
  
  \sectionUpperC

}

% ==== %
% Text %
% ==== %

textAOne = \lyricmode {
  ro̞- tzi- so̞ ha- shem ar- tze- cho̞ shav- to̞ sh'vis ya- a- kov.
}

textATwo = \textAOne

textAEndY = \lyricmode {
  shav- to̞ sh'vis ya- a- kov.
}

textBOne = \lyricmode {
  a- ha a- ha ha- lo- a- to̞ to̞- shuv t'- cha- yei- nu v'- am'- cho̞ yis- m'- chu- vo̞ch.
}

textBTwo = \lyricmode {
  a- ha a- ha ha- lo- a- to̞ to̞- shuv t'- cha- yei- nu to̞- shuv t'- cha- yei- nu v'- am'- cho̞ yis- m'- chu- vo̞ch.
}

textBTwoEndY = \lyricmode {
  am'- cho̞ yis- m'- chu- vo̞ch.
}

% textBTwoP = \lyricmode {
%   a- ha hei ha- lo- a- to̞ to̞- shuv t'- cha- yei- nu to̞- shuv t'- cha- yei- nu v'- am'- cho̞ yis- m'- chu- vo̞ch.
% }

textBOneEndY = \lyricmode {
  am'- cho̞ yis- m'- chu- vo̞ch.
}

textCOne = \lyricmode {
  har- ei- nu ha- shem __ _ _ chas- de- __ _ cho̞ v'- yesh- a- __ _ _ _ cho̞ ti- ten- lo̞- __ _ nu.
}

textCOneP = \lyricmode {
  har- ei- nu ha- shem __ _ chas- de- cho̞ v'- yesh- a- __ _ cho̞ ti- ten- lo̞- __ _ nu.
}

textCTwo = \lyricmode {
  ach ko̞- rov li- rei- __ _ o̞v yish- __ _ _ o lish- kon ko̞- __ _ _ _ vod b'- ar- tzei- __ _ nu.
}

textCTwoP = \lyricmode {
  ach ko̞- rov li- rei- o̞v yish- __ _ o lish- kon ko̞- __ _ vod b'- ar- tzei- __ _ nu.
}


textAll = {
  \textAOne
  \textATwo
  \textAEndY
  \textBOne
  \textBOneEndY
  \textBTwo
  \textBTwoEndY
}

% ====== %
% Staves %
% ====== %

bodyVoice = \new Voice = "body" \upper

endingVoice = \new Voice = "ending" \sectionUpperC

staffUpper = \new Staff = upper {
  \set Staff.midiInstrument = #"tuba" \bodyVoice \endingVoice
}

staffUpperMidi = \new Staff = upperMidi { \set Staff.midiInstrument = #"tuba" \new Voice = "singer" \upperMidi }

staffLyrics = \new Lyrics \with {
  alignBelowContext = "upper"
  \override VerticalAxisGroup.remove-empty = ##t
} \lyricsto "body" { \textAll }

endLyricsOne = \new Lyrics \with {
  alignBelowContext = "upper"
  \override VerticalAxisGroup.remove-empty = ##t
} \lyricsto "ending" { \textCOne \textCOneP }

endLyricsTwo = \new Lyrics \with {
  alignBelowContext = "upper"
  \override VerticalAxisGroup.remove-empty = ##t
} \lyricsto "ending" { \textCTwo \textCTwoP }

theScore = {
  \new PianoStaff <<
    \staffUpper
    \staffLyrics
    \endLyricsTwo
    \endLyricsOne
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
  \vspace #2
}

\markup {
  \line {
    \hspace #15
    \column {
      \line { 2) O Lord, You have appeased Your land; }
      \vspace #0.2
      \line { You have returned the Captivity of Jacob. }
      \vspace #0.2
      \line {  }
      \vspace #0.2
      \line { 7) Will You not return and revive us }
      \vspace #0.2
      \line { so that Your people will rejoice with You? }
      \vspace #0.2
      \line {  }
      \vspace #0.2
      \line { 8) Show us, O Lord, Your kindness, }
      \vspace #0.2
      \line { and Your salvation You shall give to us. }
      \vspace #0.2
      \line {  }
      \vspace #0.2
      \line { 10) Truly, His salvation is near those who fear Him, }
      \vspace #0.2
      \line { so that His glory dwell in our land. }
      \vspace #0.2
    }
    \hspace #2
    \column {
      \right-align {
        \fontsize #1.5 {
          \line { אַרְצֶךָ יי רָצִיתָ }
          \vspace #0.2
          \line { יַעֲקֹב׃ שְׁבִית שַׁבְתָּ }
          \vspace #0.2
          \line {  }
          \vspace #0.2
          \line { תְּחַיֵּנוּ תָּשׁוּב הֲלֹא־אַתָּה }
          \vspace #0.2
          \line { יִשְׂמְחוּ־בָךְ׃ וְעַמְּךָ }
          \vspace #0.2
          \line {  }
          \vspace #0.2
          \line { חַסְדֶּךָ יי הַרְאֵנוּ }
          \vspace #0.2
          \line { תִּתֶּן־לָנוּ׃ וְיֶשְׁעֲךָ }
          \vspace #0.2
          \line {  }
          \vspace #0.2
          \line { יִשְׁעוֹ לִירֵאָיו קָרוֹב אַךְ }
          \vspace #0.2
          \line { בְּאַרְצֵנוּ׃ כָּבוֹד לִשְׁכֹּן }
          \vspace #0.2
        }
      }
    }
  }
}


\markup {
  \vspace #2
  \fill-line {
	\line { \small "Hebrew text: https://www.sefaria.org/Psalms.85" }
}
}

\markup {
%   \vspace #1
  \fill-line {
	\line { \small "Setting: Rabbi Uziel Weinstein @ Morristown, NJ - July 2025 / Tammuz 5785" }
}
}

\markup {
%   \vspace #1
  \fill-line {
	\line { \small "Translation: https://www.chabad.org/library/bible_cdo/aid/16306/jewish/Chapter-85.htm" }
}
}
