Team-ID: 00349
Team: MCG 10CT
Bearbeiter dieser Aufgabe: Kjell Groenigk

___
>0 [[#Vorwort]]
>
>1 [[#Lösungsidee]]
>
>2 [[#Umsetzung]]
>
>3 [[#Installation]]
>>3.1 [[#Linux]] 
>>>2.1.1[[#Ubuntu/Debian]]
>>>
>>>3.1.2[[#Arch]]
>>>
>>>3.1.3[[#Alpine]]
>>
>>3.2[[#Windows]]
>
>4 [[#Nutzen des Plugin]]

----------------------

# Vorwort
---
Das Programm/Plugin wurde auf Linux entwickelt und optimiert, was bedeutet, dass die Installation auf Linux sehr viel einfacher und unkomplizierter ist. Somit empfehle ich das nutzen eines solchen OS für das Testen meines Plugins. Trotzdessen ist das Plugin mit Windows kompatibel und würde auch dort auf Bugs etc. getestet. 
___

# Lösungsidee
___
Man müsste zuerst das Spiel programmieren und dann testen, ob sich die Springer überlappen und so an der gleichen Stelle den Text verlassen. Hierbei würde man einfach alle Zeichen ignorieren, die keine Buchstaben sind.
Hierfür würde ich die Position, von welcher gesprungen wird in eine Liste (in diesen Fall ein Lua Table) packen und dann beim zweiten Springer überprüfen, ob sich diese Positionen überlappen. 
Dieser Weg hat den Vorteil, dass man immer heraufinden kann, welcher Buchstabe and welcher Position geändert werden muss, um einen Hopsittext möglich zu machen. 
Wenn man dieses Programm nun als Plugin verpackt und auf eine bestimmte Tastenfolge legt könnte man ohne den Texteditor zu verlassen, sein Programm testen und Verbesserungsvorschläge erhalten.
___
# Umsetzung
___

___

# Installation

## Linux

### Ubuntu
---
Diese Sektion beinhaltet alle Distros die auf Ubuntu basieren wie Mint etc. 
Es funktioniert nicht auf Debianm, da der Package Manager nicht Neovim v10 oder höher 
unterstützt. 

#### Schritt 1: Neovim etc. installieren

Öffnen sie das Terminal und führen sie diese Befehle aus:

Git:
> sudo apt install git

gcc:
> sudo apt install gcc

Neovim:
> sudo apt install Neovim

#### Schritt 2: Das Plugin installieren

Gehen sie in ihre "Home Directory" indem sie "cd" als Befehl in das Terminal eintippen.

Dort führen sie diese Befehle aus

> git clone https://github.com/WeissNurDerHopper/LazyHopNeo.git ./.config/nvim

Falls sie eigene Plugins hinzufügen wollen:
> rm -rf ./.config/nvim/.git

___ 

## Windows
___
Ich rate nicht windows zu nutzen um dieses projekt zu testen, da es weit aus mehr Arbeit erfordert es auf diesem OS zu installieren.

#### Schritt 1: Winget
Zuerst drücken sie  "Win" + "R" und tippen in das Fenster nun cmd ein um Windows Powershell zu öffnen. Dort führen sie den Befehl 
"winget"
aus, um zu testen ob sie diese funktion möglicherweise schon besitzen.

Falls nicht nutzen sie diesen link um sich den App Installer im Microsoft Store herunterzuladen, welcher winget enthält.
>https://www.microsoft.com/store/productId/9NBLGGH4NNS1?ocid=pdpshare

#### Schritt 2: Neovim
Danach führen sie bitte diesen befehl aus um Neovim zu installieren
>winget install Neovim.Neovim

#### Schritt 3: Das Plugin (+ mein Neovim Setup)
Darauffolgend nutzen sie diesen Befehl um das plugin und ein paar QOL (Quality of Life ) Plugins herunterzuladen. Diese sind nur dazu da um Neovim nutzbar zu machen und sind nicht für das funktionieren des Plugins notwendig.
>git clone https://github.com/WeissNurDerHopper/LazyHopNeo.git AppData\\Local\\nvim

Falls sie gegen die QOL plugins sind können sie unter  
"C:\\Users\\%UsernameHere%\\AppData\\Local\\nvim\\lua\\plugins" 
alle Dateien ausser "NeoHop.lua" löschen, sodass nur mein Plugin über bleibt. 

Sollten sie in diese Datei hereinschauen fällt einem auf das diese nur auf ein github repository verweisst welches mein geschriebenes Plugin enthält. Dort können sie sich die Datei einzeln herunterladen und anschauen.
>https://github.com/WeissNurDerHopper/NeoHopsit.nvim/blob/40412e062200cb7ef645205ba6e4fe2831eecc51/NeoHopsit.lua

#### Schritt 4: Neovim finden und starten
Dieser Befehl startet Neovim:
>start "C:\\Program Files\\Neovim\\bin\\nvim.exe"

Nachdem Neovim gestartet ist, gehen sie auf das neu geöffnete Fenster und drücken "ESC" und danach ":"
Danach tippen sie:
>cd "C:\\Users\\%UsernameHere%\\Documents"

dann drücken sie nochmal ":" und tippen

>e Test.txt

Dies erstellt eine .txt Datei in ihrem "Documents" Ordner (Die Sprache muss möglicherweise angepasst werden), in welche sie nun mithilfe des Plugins einen Hopsittext schreiben können.
Wie man das Plugin nutzt finden sie hier:
>[[#Nutzen des Plugins]]

___

# Nutzen des Plugin
## Aktivieren des Plugin
___

___

## Weitere Shortcuts
___

___
