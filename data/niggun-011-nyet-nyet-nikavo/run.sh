#!/usr/bin/env bash
set -euo pipefail

n="niggun_011_nyet_nyet_nikavo"
sf="~/src/personal/lilypond/soundfont/GeneralUser-GS/GeneralUser-GS.sf2"

# 1) compile MIDI
lilypond "$n.ly"

if [[ "${1-}" == "q" ]]; then
    exit 0
fi

# 2) render WAV (hotter gain; disable reverb/chorus for cleaner loudness)
raw_wav="$(mktemp -t "${n}.XXXXXX").wav"
fluidsynth -ni -F "$raw_wav" -T wav -r 44100 \
  -o synth.gain=2.0 \
  -o synth.reverb.active=0 -o synth.chorus.active=0 \
  "$sf" "$n.midi"

# 3) normalize to -14 LUFS (raise/lower I= as you like)
norm_wav="${raw_wav%.wav}_norm.wav"
ffmpeg -y -i "$raw_wav" -af "loudnorm=I=-14:TP=-1.0:LRA=11" "$norm_wav"

# 4) encode MP3
lame -V2 "$norm_wav" "$n.mp3"

# 5) clean up
rm -f "$raw_wav" "$norm_wav"
echo "Done: $n.mp3 (normalized to ~-14 LUFS)"

