# Projekt INC - UART

## První část projektu UART – Návrh obvodu
Navrhněte obvod pro příjem datových slov po asynchronní sériové lince (UART_RX).

- Vycházejte ze základních informací o fungování a zpracování asynchronní sériové
komunikace uvedených v následující kapitole.
- Uvažujte vstupní tok dat v pevném formátu: jeden START bit, 8 bitů dat, jeden STOP bit,
zasílaných rychlostí 9600 baudů za sekundu. Přijímací obvod bude pracovat na 16x vyšší
frekvenci (signál CLK) ve srovnání s přenosovou rychlostí jednotlivých datových bitů.
Vašim úkolem bude snímat datové bity uprostřed přenášeného intervalu (viz. obrázek 3).
- Obvod UART_RX bude přijímat jednotlivé bity na vstupním datovém portu DIN, provede
jejich de-serializaci a výsledné 8-bitové slovo zapíše na datový port DOUT. Platnost
datového slova na portu DOUT potvrďte nastavením příznaku DOUT_VLD na úroveň
logické 1 po dobu jednoho taktu hodinového signálu CLK. Příklad časového diagramu
ukazujícího očekávaný průběh signálů na vstupně/výstupních portech komponenty
UART_RX je znázorněn na obrázku 1.

- Jednotlivé části datové cesty obvodu bude potřeba ovládat skrze konečný automat (Finite
State Machine). Sestavte si nejprve graf přechodů tohoto automatu.
- Při návrhu nezapomeňte ošetřit asynchronní vstup do synchronní sítě obvodu UART_RX
pro redukci možných metastabilních stavů.

Volitelně vytvořte a odevzdejte technickou zprávu, která bude obsahovat:
- Jméno, příjmení a login.
- Schéma architektury navrženého obvodu UART_RX na úrovni RTL a její stručný popis.
- Nákres grafu přechodů konečného automatu a jeho stručný popis.

Ukázku formátu a obsahu výstupní zprávy naleznete v příloze. Rozsah vaší zprávy z první
části projektu by neměl překročit dvě strany formátu A4. Zprávu odevzdejte ve formátu PDF
jako soubor s názvem zprava.pdf skrze informační systém, termín pro první část projektu.

**Před odevzdáním do informačního systému se prosím ujistěte, že finální podoba zprávy
obsahuje všechny potřebné náležitosti. Zkontrolovanou verzi zprávy odevzdejte
prostřednictvím informačního systému nejpozději do data uvedeného v informačním
systému u termínu pro první část projektu. Pozdější odevzdání nebude bráno v úvahu.**

## Asynchronní sériová komunikace
Asynchronní sériová komunikace se stala základním způsobem přenosu dat mezi počítači a
periferními zařízeními. V současné době se používá zejména v oblasti vestavěných systémů.
Pro přenos dat mezi dvěma uzly stačí při sériové komunikaci jeden datový vodič, po kterém
jsou postupně zasílány jednotlivé datové bity. Asynchronnost komunikace pak znamená, že
přenášené bity nejsou synchronizovány žádným dodatečným signálem jako je např. hodinový
signál CLK. Přijímač je schopen rozpoznat příchozí bity a jejich synchronizaci na základě
použitého zakódování na datovém vodiči.

Komunikační linka (vodič) je vždy před začátkem přenosu libovolného vícebitového slova
(obvykle bajtu) nastavena na úroveň logické 1. Přenos vícebitového slova pak začíná tzv.
START bitem s hodnotou logické 0. Odvysílání START bitu, tedy přechod datové linky z
hodnoty logické 1 do 0, umožní přijímači spolehlivě identifikovat okamžik začátku přenosu.

Za START bitem jsou následně odvysílány jednotlivé bity datového slova od významově
nejnižšího bitu (LSB) po významově nejvyšší bit (MSB). Za posledním bitem datového slova
následuje jeden nebo více tzv. STOP bitů, které jsou vždy nastaveny na úroveň logické 1.

Za STOP bitem může začít přenos dalšího datového slova, začíná se opět START bitem.
Všimněte si, že STOP bit předchozího datového slova v kombinaci se START bitem dalšího
slova umožňují spolehlivou detekci začátku nového přenosu (přechod z log. 1 do 0).

Příklad přenosu 8-bitového datového slova s jedním STOP bitem je znázorněn na obrázku 1.
Obrázek 2. Příklad sériového přenosu 8-bitového datového slova s jedním STOP bitem

Pro spolehlivé rozpoznání jednotlivých bitů přenášeného datového slova na straně přijímače
je potřeba nejen identifikovat začátek přenosu (přechod z logické 1 do 0), ale také vědět na
jaké rychlosti komunikace probíhá. Vysílač i přijímač se proto musí nejprve nastavit na
stejnou přenosovou rychlost.

Přenosová rychlost se udává v počtu přenesených baudů za sekundu, přičemž jeden baud
odpovídá v tomto případě jednomu bitu. Základní a také nejčastěji používanou přenosovou
rychlostí je rychlost 9600 baudů za sekundu. Pokud uvažujeme přenos 8-bitových datových
slov ohraničených jedním START bitem a alespoň jedním STOP bitem (celkem 10 bitů),
potom jsme schopni na rychlosti 9600 baudů přenášet až 960 bajtů za sekundu (9600/10).

Aby přijímač spolehlivě identifikoval hodnoty (logické úrovně) přenášených datových bitů je
navíc doporučeno, aby tento obvod pracoval na 16x větší frekvenci, než je vybraná přenosová
rychlost. Každý datový bit by následně měl být snímán uprostřed časového intervalu pro
přenos bitů, jak je naznačeno na obrázku 2. Specifikace doporučuje při 16x větší vzorkovací
frekvenci snímat logickou úroveň vstupních dat v 7., 8. a 9. hodinovém cyklu a jako výsledný
bit použít majoritu z těchto tří hodnot. Pro jednoduchost se však zde spokojme s hodnotou
nasnímanou na konci 8. hodinového cyklu označenou jako MIDBIT.

Obrázek 3. Příklad vzorkování datového bitu uprostřed1
