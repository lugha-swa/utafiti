# Utafiti wa lugha-swa

Ripoti za kiufundi za kazi ya [lugha-swa](https://github.com/lugha-swa): kila kazi kubwa inapata ripoti yake, kwa Kiswahili (asili) na Kiingereza.

| Na. | Ripoti | Kazi |
|---|---|---|
| 1 | [Swa: lugha ya mifumo yenye sintaksia ya Kiswahili, inayojijenga kutoka baiti 393 za mkono](ripoti/01-swa/) | [lugha-swa/swa](https://github.com/lugha-swa/swa) v0.0.1 |

Kila saraka ya `ripoti/` ina `ripoti.tex` (Kiswahili), `report.tex` (English), `vipimo.tex` (namba zote zinazotajwa) na `pima.sh` (hati iliyozipima). Hakuna namba inayoandikwa kwa mkono kwenye maandishi: zinatoka `vipimo.tex`, na `vipimo.tex` hutoka kwa `pima.sh` kwenye commit iliyotajwa.

## Kujenga

```sh
cd ripoti/01-swa
tectonic ripoti.tex    # ripoti.pdf
tectonic report.tex    # report.pdf
```

CI hujenga PDF zote kwa kila PR; lebo `ripoti-*` huunda toleo lenye PDF.

## Leseni

Maandishi: MIT au Apache-2.0, upendavyo.
