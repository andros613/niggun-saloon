#!/usr/bin/env bash
# Usage: render.sh <stem> [q]
#   stem: base filename without extension (e.g. niggun_022_beinoni)
#   q:    if provided, compile LilyPond only and exit (skip audio render)
set -euo pipefail

n="${1:?Usage: render.sh <stem> [q]}"
sf="${NIGGUN_SF:-/Users/amiros/src/personal/lilypond/soundfont/MuseScore/MuseScore_General.sf3}"

# 1) compile MIDI + PDF
lilypond "$n.ly"
if [[ "${2-}" == "q" ]]; then
    exit 0
fi

# 2) render WAV with FluidSynth preserving dynamics
raw_wav="$(mktemp -t "${n}.XXXXXX").wav"
fluidsynth -ni -F "$raw_wav" -T wav -r 44100 \
  -o synth.gain=1.5 \
  -o synth.reverb.active=0 \
  -o synth.chorus.active=0 \
  "$sf" "$n.midi"

# 3) apply gentle volume boost without compressing dynamics
adjusted_wav="${raw_wav%.wav}_adjusted.wav"
ffmpeg -y -i "$raw_wav" -af "volume=3dB" "$adjusted_wav"

# 4) encode MP3
lame -V2 "$adjusted_wav" "$n.mp3"

# 5) clean up
rm -f "$raw_wav" "$adjusted_wav"

echo "Done: $n.mp3"
