# Kabouterveld

Trainingsplanner voor een O6-voetbalteam (4–5 jaar, ±20 kinderen) dat tijdelijk door ouders getraind wordt. Ouders kiezen spellen of laten een training van 60 minuten samenstellen, en gebruiken de pagina op hun telefoon langs het veld.

## Uitgangspunten voor de spellen
Doelgroep is 4 en max. 5 jaar. Eerste versie was te hoog gegrepen (passen, 3v3/4v4, regels met kleur plus lichaamsdeel); herzien na onderzoek (oktober 2026).
- KNVB O6: plezier en spelenderwijs leren staan voorop. 2-tegen-2 in partijtjes van 4 min, teams husselen, geen competitie. Doel O6/O7: beheersen van de bal. https://knvb.h5mag.com/dutch_youth_football/u6-recommendation
- België (KBVB): 5–7 jaar is de verkenningsfase; voetbal is een dribbel- en schietspel (2v2). Alleen dribbelen en scoren zijn leerbaar. Geen passen.
- U.S. Soccer U5/U6: 1v1, 2v1, 2v2; geen tactiek of vaste posities; basisbewegingen (rennen, huppelen, springen, gooien, vangen); korte uitleg; veel korte pauzes. https://www.ussoccer.com/us-way/player-development/environment/age-group-guide/u5
- DFB Bambini / Fußballkindergarten: thema-verhalen, tikspellen herhaald aan het begin, bal ook in de handen (Ridders en Schild, Zauberer Zwieback, Storch, Taxifahrer). Alleen via zoeksamenvattingen gelezen; de pdf's waren onleesbaar.
- Onderzoek peuters/kleuters (Noordwest-Engeland): lage bewegingsvaardigheid, loopvaardigheid beter dan balvaardigheid. Dus eerst bewegen, dan bal.
- Eigen huisregels:
  - Elk kind zoveel mogelijk een eigen bal; geen rijtjes of wachten.
  - Geen afvalspellen: wie getikt is of de bal kwijt is, doet na een kleine opdracht weer mee.
  - Uitleg kort houden (≤30 sec) en voordoen; maximaal één of twee regels per spel; elk spel heeft een verhaal.
  - Blokken van 5–8 minuten (alleen de stations 6, partijtjes 3 × 4 min), drinkpauze halverwege.
  - Geen passen als doel. Rollen, gooien en schieten op een goal mag.
- Spelteksten zijn zelf geschreven, niet overgenomen uit bronnen.

## Trainingsopbouw (60 min)
Binnenkomst 5 · tikspel 5 (allemaal samen, zonder bal) · bewegen 5 (allemaal samen, springen, bal in de handen) · stations-carrousel 4 × 6 min (4 groepjes met elk een ouder, wissel 1 min, drinkpauze 3 min na ronde 2) · naar partijtjes 1 · partijtjes 12 (3 × 4 min 2v2) · afsluiter 3.
Groep g staat in ronde r bij station (g + r) mod 4.
De generator vult 8 slots: tikspel, bewegen, station A–D (dribbelen, schieten, met de handen, balgevoel), partijtje, afsluiter. Spelcatalogus: 37 spellen.

## Techniek
- Alles staat in `index.html`: inline CSS en vanilla JS, geen libraries. Het bestand is zelfstandig te openen (ook via `file://`). De regels met `<!--local-->` vormen het documentskelet; `./make-artifact.sh` haalt ze weg en schrijft `dist/artifact.html`, dat je publiceert als Claude Artifact (dat voegt zelf doctype, charset en viewport toe). Haal je die markers weg, dan toont de browser lokaal een leeg vlak met kapotte tekens.
- Spellen staan in de `GAMES`-array. Een spel heeft: `id` (kort, alleen a-z0-9, onderdeel van de deelcode), `naam`, `type` (`warmup` = tikspel, `beweeg`, `station`, `partij`, `afsluiter`), `skill` (`tik|beweeg|dribbelen|schieten|handen|balgevoel|wedstrijd|samen`), `duur`, `groep`, `materiaal[]`, `opzet`, `verhaal`, `verloop[]`, `makkelijker`, `moeilijker`, `tip`, `schets[]`.
- `schets` is een lijst tekenopdrachten op een veld van 200 × 120: `['k',x,y,team]` kind, `['kb',x,y,team]` kind met bal, `['p',x,y]` ouder, `['b',x,y]` bal, `['c',x,y,kleur]` pion (`o|y|b|r`), `['cl',x1,y1,x2,y2,n]` rij pionnen, `['gt',x,y]` poortje, `['g',x,y,dir]`/`['G',x,y,dir]` klein/groot goal (dir = kant van de opening: `l|r|t|b`), `['z',x,y,w,h,label]` vak, `['w',x,y,w,h]` water, `['ln',x1,y1,x2,y2]` krijtlijn, `['a',x1,y1,...]` dribbel/looproute, `['s',x1,y1,...]` pass/schot, `['t',x,y,tekst]` label.
- Delen gaat via een tekstcode (`id` × 8 met punten ertussen) in een WhatsApp-tekst. Een Artifact-link geeft geen `#key=value` of querystring door, dus geen state in de URL.
- `localStorage` (sleutels `kv.*`) alleen voor gemak per toestel: huidige training, favorieten, bewaarde trainingen. Altijd in try/catch.
- `window.print()` werkt niet binnen een Artifact; de printknop verschijnt alleen als de pagina niet in een frame draait.

## Publiceren
- Openbaar op GitHub Pages: https://dartoum.github.io/kabouterveld/ (repo https://github.com/dartoum/kabouterveld, openbaar, Pages vanaf `main` map `/`). Pages serveert `index.html` rechtstreeks; een push naar `main` is een update. Alleen pushen na expliciete vraag van de eigenaar.
- Daarnaast een privé Claude Artifact (https://claude.ai/artifact/UeoGJUnfBaonpECzCtiPVF), bijgewerkt met `./make-artifact.sh` en publiceren van `dist/artifact.html` naar die URL. De twee kunnen uit de pas lopen: werk na een wijziging zo nodig beide bij.
- `localStorage` (favorieten, bewaarde trainingen) hoort per domein: op de Pages-site is het dus apart van het Artifact.
