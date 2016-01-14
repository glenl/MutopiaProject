\version "2.19.32"

\header {
  title = "Sonate Brilliant"
  composer = "M. Giuliani"
  opus = "Op. 15"
  style = "Classical"
  source = "Vienna, S. A. Steiner & Co., Plate 933"
  date = "1808"
  mutopiacomposer = "GiulianiM"
  mutopiainstrument = "Guitar"
  license = "Creative Commons Attribution-ShareAlike 4.0"
  maintainer = "Glen Larsen"
  maintainerEmail = "glenl.glx at gmail.com"
}

\paper {
  % add space between composer/opus markup and first staff
  markup-system-spacing #'padding = #3
  % add a little space between composer and opus
  markup-markup-spacing #'padding = #1.2
  top-margin = #8
  bottom-margin = #12
}

\layout {
  \context {
    \Voice
    % spanners are used throughout for fret position
    \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
    \override TextSpanner.dash-fraction = #0.3
    \override TextSpanner.dash-period = #1
    \override TextSpanner.font-size = #-2

    \override Hairpin.to-barline = ##f
  }
}

% common dynamic and text markup
dolce = \markup{\italic "dolce"}
pf = #(make-dynamic-script "pf")
apiacere = \markup{\small\italic "a piacere"}
mbreak = {\break}

%{ 
\include "sonata.ly"
\score {
  <<
    \new Staff = "Sonata" \with {
      instrumentName = #"Sonata"
      midiInstrument = #"acoustic guitar (nylon)"
      \mergeDifferentlyDottedOn
      \mergeDifferentlyHeadedOn
    } <<
      \key c \major
      \time 4/4
      \clef "treble_8"
      \tempo \markup{\small "Allegro spirito"}
      \context Voice = "upperVoice" \upperVoice
      \context Voice = "lowerVoice" \lowerVoice
    >>
  >>
  \layout {}
  \midi { \tempo 4 = 94 }
}
%}

%showLastLength = R1*10
\include "adagio.ly"
\score {
  <<
    \new Staff = "Adagio" \with {
      instrumentName = \markup {
        \override #'(baseline-skip . 1.5)
        \center-column {
          \line{\smallCaps\raise #1 "ADAGIO"}
          "con grand"
          "espressione"
        }
      }
      midiInstrument = #"acoustic guitar (nylon)"
      \mergeDifferentlyDottedOn
      \mergeDifferentlyHeadedOn
    } <<
      \key g \major
      \time 2/4
      \clef "treble_8"
      \context Voice = "upperVoice" \upperVoice
      \context Voice = "lowerVoice" \lowerVoice
    >>
  >>
  \layout {
    indent = 3.0 \cm
  }
  \midi { \tempo 4 = 94 }
}
%{
\include "finale.ly"
%}
