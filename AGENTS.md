# Kabouterveld

Trainingsplanner voor een O6-voetbalteam (4–5 jaar, ±20 kinderen) dat tijdelijk door ouders getraind wordt. Ouders kiezen spellen of laten een training van 60 minuten samenstellen, en gebruiken de pagina op hun telefoon langs het veld.

## Uitgangspunten voor de spellen
- KNVB O6: plezier en spelenderwijs leren staan voorop. Advies is 2-tegen-2 (eventueel 4-tegen-4): veel balcontact, vaak scoren, teams husselen. Bronnen: https://www.knvb.nl/node/45567, https://www.knvb.nl/node/45495
- Eigen huisregels, afgeleid van het KNVB-uitgangspunt "leren voetballen door te voetballen":
  - Elk kind zoveel mogelijk een eigen bal; geen rijtjes of wachten.
  - Geen afvalspellen: wie de bal kwijt is, doet na een kleine opdracht weer mee.
  - Uitleg kort houden (≤30 sec) en voordoen; elk spel heeft een verhaal (piraten, haaien, monster).
  - Blokken van 3–12 minuten, drinkpauze halverwege.
- Spelteksten zijn zelf geschreven, niet overgenomen uit KNVB-materiaal.

## Trainingsopbouw (60 min)
Binnenkomst 5 · warming-up 10 · stations-carrousel 4 × 6 min (4 groepjes met elk een ouder, wissel 1 min, drinkpauze 3 min na ronde 2) · naar partijtjes 1 · partijtjes 12 · afsluiter 3.
Groep g staat in ronde r bij station (g + r) mod 4.
De generator vult 7 slots: warming-up, station A–D (voorkeur dribbelen, schieten, passen, balgevoel), partijtje, afsluiter.

## Techniek
- Alles staat in `index.html`: inline CSS en vanilla JS, geen libraries of build. Het bestand bevat geen `<!doctype>`/`<html>`/`<body>`: het wordt gepubliceerd als Claude Artifact, dat het skelet zelf toevoegt.
- Spellen staan in de `GAMES`-array. Een spel heeft: `id` (kort, alleen a-z0-9, onderdeel van de deelcode), `naam`, `type` (`warmup|station|partij|afsluiter`), `skill`, `duur`, `groep`, `materiaal[]`, `opzet`, `verhaal`, `verloop[]`, `makkelijker`, `moeilijker`, `tip`, `schets[]`.
- `schets` is een lijst tekenopdrachten op een veld van 200 × 120: `['k',x,y,team]` kind, `['kb',x,y,team]` kind met bal, `['p',x,y]` ouder, `['b',x,y]` bal, `['c',x,y,kleur]` pion (`o|y|b|r`), `['cl',x1,y1,x2,y2,n]` rij pionnen, `['gt',x,y]` poortje, `['g',x,y,dir]`/`['G',x,y,dir]` klein/groot goal (dir = kant van de opening: `l|r|t|b`), `['z',x,y,w,h,label]` vak, `['w',x,y,w,h]` water, `['ln',x1,y1,x2,y2]` krijtlijn, `['a',x1,y1,...]` dribbel/looproute, `['s',x1,y1,...]` pass/schot, `['t',x,y,tekst]` label.
- Delen gaat via een tekstcode (`id.id.id.id.id.id.id`) in een WhatsApp-tekst. Een Artifact-link geeft geen `#key=value` of querystring door, dus geen state in de URL.
- `localStorage` (sleutels `kv.*`) alleen voor gemak per toestel: huidige training, favorieten, bewaarde trainingen. Altijd in try/catch.
- `window.print()` werkt niet binnen een Artifact; de printknop verschijnt alleen als de pagina niet in een frame draait.
