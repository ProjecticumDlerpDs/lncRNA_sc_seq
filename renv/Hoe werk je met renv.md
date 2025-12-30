
### Hoe werk je met `renv` 

Een `renv`-omgeving helpt je project reproduceerbaar te maken. Bij een project gebruik je vaak meerdere R-packages, bijvoorbeeld voor het maken van grafieken, data-analyse of statistische tests. Als iemand anders jouw project van GitHub haalt, wil je dat diegene exact dezelfde packages en versies gebruikt als toen het script werd geschreven.

`renv` is een tool die dit mogelijk maakt. Het kan automatisch alle benodigde packages installeren en activeren, zodat jouw project op elke computer hetzelfde werkt. 

Om `renv` toe te voegen aan een bestaand project gebruik je de volgende code: `renv::init()`

Dit zorgt ervoor dat er drie nieuwe bestanden worden aangemaakt in je projectomgeving:

•	Je project library: dit bestand heeft een overzicht van alle libraries die momenteel geladen zijn.

•	Een lockfile: Dit bestand bevat de metadata die ervoor zorgt dat de packages later opnieuw kunnen worden geïnstalleerd, ook wanneer het project door een ander persoon op een andere computer wordt uitgevoerd.

•	Een project profiel: dit zorgt ervoor dat `renv` automatisch actief blijft in je R-project en de packages geactiveerd blijven.

De functie `renv::snapshot()` update de libraries die momenteel gebruikt worden in de lockfile. Deze data kan door iemand anders opgehaald worden met de functie `renv::restore()`.

`renv` zorgt er ook voor dat iedereen dezelfde versies van de packages gebruikt. Deze versies blijven vaststaan zolang je `renv` blijft gebruiken.

Een nadeel is dat updates in packages niet automatisch worden meegenomen. Periodiek moet je zelf controleren of de code nog functioneel is met de nieuwe package-updates. Dit kan gedaan worden met `renv::update()` en hierna `renv:snapshot()` gebruiken. Wanneer je project niet meer goed werkt, kan je de oude packages terughalen met `renv::restore()`.

### Gebruik van `renv` in een werkomgeving na het clonen uit GitHub:

1.	Zorg er voor dat je `renv` hebt geinstallerd: install.packages("`renv`"). 
Deze stap hoef je maar een keer uit te voeren wanneer je nog geen gebruik hebt gemaakt van `renv`.

2.	Zorg dat je in het juiste project zit wat je uit GitHub hebt gehaald.

3.	Activeer de `renv` omgeving: `renv::restore()`
