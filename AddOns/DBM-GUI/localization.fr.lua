if GetLocale() ~= "frFR" then return end

if not DBM_GUI_Translations then DBM_GUI_Translations = {} end
local L = DBM_GUI_Translations


L.MainFrame = "Deadly Boss Mods"

L.TabCategory_Options 	= "Options G�n�rales"
L.TabCategory_WOTLK 	= "Wrath of the Lich King"
L.TabCategory_BC 	= "The Burning Crusade"
L.TabCategory_CLASSIC 	= "WoW Classique"
L.TabCategory_OTHER     = "Autres Boss Mods"

L.BossModLoaded 	= "%s statistiques"
L.BossModLoad_now 	= [[Ce boss mod n'est pas charg�.
Il sera charg� quand vous entrerez dans l'instance. 
Vous pouvez aussi cliquer sur le bouton pour charg� le mod manuellement.]]

L.PosX = "Position X"
L.PosY = "Position Y"

L.MoveMe 		= "D�placez moi"
L.Button_OK 		= "OK"
L.Button_Cancel 	= "Annuler"
L.Button_LoadMod 	= "Charger l'AddOn"
L.Mod_Enabled		= "Activ� boss mod"
L.Mod_EnableAnnounce	= "Annoncer au raid"
L.Reset 		= "Reset"

L.Enable  		= "Activer"
L.Disable		= "D�sactiver"

L.NoSound		= "Pas de Son"

-- Tab: Boss Statistics
L.BossStatistics	= "Statistiques des boss"
L.Statistic_Kills	= "Tu�s:"
L.Statistic_Wipes	= "Wipes:"
L.Statistic_BestKill	= "Meilleur down:"
L.Statistic_Heroic	= "H�roique"

-- Tab: General Options
L.General 		= "Options G�n�rales DBM"
L.EnableDBM 		= "Activer DBM"
L.EnableStatus 		= "Envoie du 'status' au chuchotement"
L.AutoRespond 		= "Activer la r�ponse automatique pendant les combats"
L.EnableMiniMapIcon	= "Afficher le bouton sur minicarte "

L.Button_RangeFrame	= "Afficher/Cacher la fen�tre de port�e"
L.Button_TestBars	= "Lancer les barres de test"

L.PizzaTimer_Headline 	= 'Cr�er un "Pizza Timer"'
L.PizzaTimer_Title	= 'Nom (ex. "Pizza!")'
L.PizzaTimer_Hours 	= "Heures"
L.PizzaTimer_Mins 	= "Min"
L.PizzaTimer_Secs 	= "Sec"
L.PizzaTimer_ButtonStart = "Commencer le Timer"
L.PizzaTimer_BroadCast	= "Diffuser au Raid"

-- Tab: Raidwarning
L.Tab_RaidWarning 	= "Alertes raid"
L.RaidWarnColors 	= "Couleurs des alertes raid"
L.RaidWarnColor_1 	= "Couleur 1"
L.RaidWarnColor_2 	= "Couleur 2"
L.RaidWarnColor_3 	= "Couleur 3"
L.RaidWarnColor_4 	= "Couleur 4"
L.InfoRaidWarning	= [[Vous pouvez sp�cifier la position et la couleurs de l'affichage des Alertes Raid.
Cet affichage est utilis� pour des messages comme "Joueur X est affect� par Y"]]
L.ColorResetted 	= "La couleur de ce champs a �t� remise � z�ro."
L.ShowWarningsInChat 	= "Afficher les alertes dans la fen�tre de dialogue"
L.ShowFakedRaidWarnings = "Afficher les alertes comme de faux avertissements de raid"
L.WarningIconLeft 	= "Afficher l'icone � gauche"
L.WarningIconRight 	= "Afficher l'icone � droite"
L.RaidWarnMessage 	= "Merci d'utiliser Deadly Boss Mods"
L.BarWhileMove 		= "Alerte-raid d�placable"
L.RaidWarnSound		= "Jouer un son pour les alertes raid"
L.SpecialWarnSound	= "Jouer un son pour les alertes sp�ciales"

-- Tab: Barsetup
L.BarSetup   = "Style des barres"
L.BarTexture = "Texture des barres"
L.BarStartColor = "Couleur de d�part"
L.BarEndColor = "Couleur de fin"
L.ExpandUpwards		= "Nouvelles barres au-dessus"

L.Slider_BarOffSetX 	= "Position X: %d"
L.Slider_BarOffSetY 	= "Position Y: %d"
L.Slider_BarWidth 	= "Largeur: %d"
L.Slider_BarScale 	= "Echelle: %0.2f"
L.AreaTitle_BarSetup 	= "Options g�n�rales des barres"
L.AreaTitle_BarSetupSmall = "Options des petites barres"
L.AreaTitle_BarSetupHuge = "Options des grandes barres"
L.BarIconLeft 		= "Icone gauche"
L.BarIconRight 		= "Icone droit"
L.EnableHugeBar 	= "Activ� les grandes barres (Barre 2)"
L.FillUpBars		= "Remplir les barres"

-- Tab: Spam Filter
L.Panel_SpamFilter		= "Filtre anti-spam"
L.Area_SpamFilter		= "Options g�n�rales du filtre anti-spam"
L.HideBossEmoteFrame	= "Cacher la fen�tre des emotes de boss"
L.SpamBlockRaidWarning	= "Filtrer les annonces venant d'autre boss mods"
L.SpamBlockBossWhispers	= "Filtrer les alertes <DBM> chuchotement pendant les combats"
