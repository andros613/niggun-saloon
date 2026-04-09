#!/usr/bin/env bash
set -euo pipefail

n="niggun_018_keli_ata"
# n="test2"
#sf="/Users/amiros/src/personal/lilypond/soundfont/GeneralUser-GS/GeneralUser-GS.sf2"
sf="/Users/amiros/src/personal/lilypond/soundfont/MuseScore/MuseScore_General.sf3"

# 1) compile MIDI
lilypond "$n.ly"
if [[ "${1-}" == "q" ]]; then
    exit 0
fi

# 2) render WAV with FluidSynth respecting dynamics
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

echo "Done: $n.mp3 (dynamics preserved)"
