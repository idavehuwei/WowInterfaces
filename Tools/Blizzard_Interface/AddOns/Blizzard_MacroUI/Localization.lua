-- This file is executed at the end of addon load

-- Adjust Macro text
MacroFrameCharLimitText:SetPoint("BOTTOM", "MacroFrame", "BOTTOM", -15, 104);
MacroFrameCharLimitText:SetFontObject(SpellFont_Small);
-- Adjust Macro Name Input Box's Texture Width
MacroPopupNameMiddle:SetWidth(190);