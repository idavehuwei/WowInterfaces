if GetLocale() ~= "deDE" then return end

local L

---------------
--  Malygos  --
---------------
L = DBM:GetModLocalization("Malygos")

L:SetGeneralLocalization({
   name = "Malygos"
})

L:SetWarningLocalization({
   WarningSpark      = "Energiefunke da!",
   WarningVortex      = "Vortex",
   WarningBreathSoon   = "Tiefer Atem bald",
   WarningBreath      = "Tiefer Atem!",
   WarningSurge      = "Kraftsog auf >%s<",
   WarningVortexSoon   = "Vortex bald",
   WarningSurgeYou      = "Kraftsog auf dir!"
})

L:SetTimerLocalization({
   TimerSpark      = "Energiefunke",
   TimerVortex      = "Vortex",
   TimerBreath      = "Tiefer Atem",
   TimerVortexCD   = "Vortex Cooldown"
})

L:SetOptionLocalization({
   WarningSpark      = "Warnung f�r Energiefunke anzeigen",
   WarningVortex      = "Warnung f�r Vortex anzeigen",
   WarningBreathSoon   = "Vorwarnung f�r Tiefen Atem anzeigen",
   WarningBreath      = "Warnung f�r Tiefen Atem anzeigen",
   WarningSurge      = "Warnung f�r Kraftsog anzeigen",
   TimerSpark         = "Timer f�r Energiefunke anzeigen",
   TimerVortex         = "Timer f�r Vortex anzeigen",
   TimerBreath         = "Timer f�r Tiefen Atem anzeigen",
   TimerVortexCD      = "Timer f�r Vortex Cooldown anzeigen (ungenau)",
   WarningVortexSoon   = "Vorwarnung f�r Vortex anzeigen (ungenau)",
   WarningSurgeYou      = "Spezial Warnung anzeigen, wenn du von Kraftsog betroffen bist"
})

L:SetMiscLocalization({
   YellPull      = "Meine Geduld ist am Ende. Ich werde mich eurer entledigen!",
   EmoteSpark      = "Ein Energiefunke bildet sich aus einem nahegelegenen Graben!",
   YellPhase2      = "Ich hatte gehofft, eure Leben schnell zu beenden, doch ihr zeigt euch... hartn�ckiger als erwartet.",
   EmoteBreath      = "%s holt tief Luft.",
   YellBreath      = "Solange ich atme, werdet ihr nicht obsiegen!",
   YellPhase3      = "Eure Wohlt�ter sind eingetroffen, doch sie kommen zu sp�t! Die hier gespeicherten Energien reichen aus, die Welt zehnmal zu zerst�ren. Was, denkt ihr, werden sie mit euch machen?"
})
