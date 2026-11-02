#!/bin/bash
# pima.sh -- vipimo vya mnyororo wa ujenzi wa Swa v0.0.1 (mara 3, median)
set -eu
T="$1"; cd "$2"
ms() { python3 -I -c 'import sys,time;print(int(time.time()*1000))'; }
med() { printf '%s\n' "$@" | sort -n | sed -n 2p; }
a=(); b=(); c=(); d=(); e=()
for r in 1 2 3; do
  t0=$(ms); bash gharama/jenga-kwanza.sh > /dev/null; t1=$(ms)
  MBEGU=/tmp/mbegu2.bin
  cat msingi/maktaba/kumbukumbu.swa msingi/maktaba/mfuatano.swa msingi/maktaba/faili.swa gharama/msuluhishi.swa > "$T/msu.swa"
  "$MBEGU" --exe "$T/msu.swa" > "$T/msuluhishi"; chmod +x "$T/msuluhishi"
  "$T/msuluhishi" msingi/mkusanyaji/stage1.swa > "$T/zima.swa"
  t2=$(ms); "$MBEGU" --exe "$T/zima.swa" > "$T/stage1"; t3=$(ms); chmod +x "$T/stage1"
  "$T/stage1" --exe "$T/zima.swa" > "$T/stage2"; t4=$(ms); chmod +x "$T/stage2"
  "$T/stage2" --exe "$T/zima.swa" > "$T/stage3"; t5=$(ms)
  a+=($((t1-t0))); b+=($((t3-t2))); c+=($((t4-t3))); d+=($((t5-t4)))
done
echo "muda_kwanza_hadi_mbegu_ms $(med "${a[@]}")"
echo "muda_mbegu_kukusanya_stage1_ms $(med "${b[@]}")"
echo "muda_stage1_kukusanya_stage2_ms $(med "${c[@]}")"
echo "muda_stage2_kukusanya_stage3_ms $(med "${d[@]}")"
echo "zima_mistari $(wc -l < "$T/zima.swa") baiti $(stat -c%s "$T/zima.swa")"
echo "stage1_baiti $(stat -c%s "$T/stage1")"
echo "stage2_baiti $(stat -c%s "$T/stage2")"
echo "stage3_baiti $(stat -c%s "$T/stage3")"
echo "sha_stage2 $(sha256sum < "$T/stage2" | cut -c1-16)"
echo "sha_stage3 $(sha256sum < "$T/stage3" | cut -c1-16)"
cmp -s "$T/stage2" "$T/stage3" && echo "fixpoint SAWA" || echo "fixpoint TOFAUTI"
echo "mbegu2_baiti $(stat -c%s /tmp/mbegu2.bin) sawa_na_mbegu.bin $(cmp -s /tmp/mbegu2.bin msingi/mbegu.bin && echo ndiyo || echo hapana)"
