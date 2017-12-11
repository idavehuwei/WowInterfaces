if GetLocale() ~= "deDE" then return end

local L

---------------
--  Shadron  --
---------------
L = DBM:GetModLocalization("Shadron")

L:SetGeneralLocalization({
   name = "Shadron"
})


---------------
--  Tenebron  --
---------------
L = DBM:GetModLocalization("Tenebron")

L:SetGeneralLocalization({
   name = "Tenebron"
})


---------------
--  Vesperon  --
---------------
L = DBM:GetModLocalization("Vesperon")

L:SetGeneralLocalization({
   name = "Vesperon"
})


---------------
--  Sartharion  --
---------------
L = DBM:GetModLocalization("Sartharion")

L:SetGeneralLocalization({
   name = "Sartharion"
})

L:SetWarningLocalization({
   WarningTenebron         = "Tenebron kommt",
   WarningShadron         = "Shadron kommt",
   WarningVesperon         = "Vesperon kommt",
   WarningFireWall         = "Feuerwand!",
   WarningVesperonPortal   = "Vesperon's Portal!",
   WarningTenebronPortal   = "Tenebron's Portal!",
   WarningShadronPortal   = "Shadron's Portal!",
})

L:SetTimerLocalization({
   TimerWall   = "Feuerwand cooldown",
   TimerTenebron   = "Tenebron kommt",
   TimerShadron   = "Shadron kommt",
   TimerVesperon   = "Vesperon kommt"
})

L:SetOptionLocalization({
   PlaySoundOnFireWall   = "Akkustische Warnung f�r \"Feuerwand\"",
   AnnounceFails      = "Verk�nde Spieler, welche bei Feuerwand und Zone der Leere  scheitern im Schlachtzugschat ( ben�tigt Assistent/Leiter Status und aktivierte Raidansage)",

   TimerWall      = "Zeit bis  \"Feuerwand\"",
   TimerTenebron      = "Zeigt die Zeit bis Tenebron",
   TimerShadron      = "Zeigt die Zeit bis  Shadron",
   TimerVesperon      = "Zeigt die Zeit bis  Vesperon",

   WarningFireWall      = "Zeige  spezielle Warnung f�r \"Feuerwand\"",
   WarningTenebron      = "Zeit bis Tenebron erscheint",
   WarningShadron      = "Zeit bis Shadron erscheint",
   WarningVesperon      = "Zeit bis Vesperon erscheint",

   WarningTenebronPortal   = "Zeige spezielle Warnung f�r Tenebron's Portale",
   WarningShadronPortal   = "Zeige spezielle Warnung f�r Shadron's Portale",
   WarningVesperonPortal   = "Zeige spezielle Warnung f�r Vesperon's Portale",
})

L:SetMiscLocalization({
   Wall         = "Die Lava um %s brodelt!",
   Portal         = "%s beginnt, ein Portal des Zwielichts zu �ffnen!",
   NameTenebron   = "Tenebron",
   NameShadron      = "Shadron",
   NameVesperon   = "Vesperon",
   FireWallOn      = "Feuerwand: %s",
   VoidZoneOn      = "Zone der Leere: %s",
   VoidZones      = "Versagen f�r Zone der Leere(dieser Versuch): %s",
   FireWalls      = "Versagen f�r Feuerwand (dieser Versuch: %s",
   --[[ not in use; don't translate.
   Vesperon   = "Vesperon, the clutch is in danger! Assist me!",
   Shadron      = "Shadron! Come to me! All is at risk!",
   Tenebron   = "Tenebron! The eggs are yours to protect as well!"
   --]]
})
