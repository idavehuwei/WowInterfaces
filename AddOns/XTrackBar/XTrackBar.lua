--This is the internal name of the mod.
local XBARMOD="XTrackBar";
local dbver="4";

local ForceTexture;

--Default settings and other info about the mod
XBarCore.ModData[XBARMOD]={
    ----REQUIRED VALUES----
    ["nbuttons"]=0,
    ["dbver"]=dbver,
    ["dhorizontal"]=true,
    ["dhidebar"]=false,
    ["dorder"]="az",
    ["dscale"]=1,
    ["dtooltips"]=true,
    ["enabled"]=true,
    ["nchecks"]=0,
    ["wrappable"]=false,
    ["sortable"]=false,
    ["ftexint"]=XBARMOD.."_Texture", --< Have to have a custom Texture Interrupt
    ["fbuttonid"]="XBar_StdButtonID",
    ["foptioncb"]="XBar_StdOptionCB",
};

function XTrackBar_OnLoad()
    --Each bar must catch its own event notifications
    this:RegisterEvent("SPELLS_CHANGED");
    this:RegisterEvent("SPELL_UPDATE_COOLDOWN");
    this:RegisterEvent("PLAYER_ENTERING_WORLD");
    this:RegisterEvent("UNIT_AURA");
    this:RegisterEvent("ACTIONBAR_UPDATE_USABLE");
end

function XTrackBar_OnEvent(event,arg1)
    local n,i,s,_,c;

    ForceTexture=nil;
    -- Need to do some special stuff here
    if (event=="UNIT_AURA") and (arg1=="player") then
        -- Catch the event so we know which one to put up there.
        local icon = GetTrackingTexture();
        if (icon) then
            ForceTexture=icon;
            XBarCore.Update(XBARMOD);
        else
            ForceTexture="";
        end
    elseif (event=="PLAYER_ENTERING_WORLD") then

        n=GetNumTrackingTypes();
        XTrackBarSpells = {};
        for i=1,n do
            s,_,_,c=GetTrackingInfo(i);
            if c=="other" then
                c="@";
                s=tostring(i);
            else
                c="";
            end
            tinsert(XTrackBarSpells,c..s);
        end
        XBar_StdEventHandler(XBARMOD,event,arg1);
    else
        XBar_StdEventHandler(XBARMOD,event,arg1);
    end
end

function XTrackBar_Texture(mod,texture, spellname)
    local t=texture;

    if XBarData[XBarCore.XBarOptionSet].mods and
       XBarData[XBarCore.XBarOptionSet].mods[mod] and
       XBarData[XBarCore.XBarOptionSet].mods[mod].nohighlight then
--		return t;
    end
    -- Will highlight any tracking textures the player has
    if (ForceTexture==texture) then
        t = "Interface\\Icons\\Spell_Nature_WispSplodeGreen";
    elseif ((ForceTexture==nil) and (GetTrackingTexture()==texture)) then
        -- We have not caught an aura-update event yet
        t = "Interface\\Icons\\Spell_Nature_WispSplodeGreen";
    end

    return t;
end

-- Our magic and trickery to force a texture update on tracking spells won't work for non-spell types.  Lets hook the function to see it.
function XTrackBar_TrackHook(id)
    ForceTexture=nil;
    XBarCore.UpdateCooldowns(XBARMOD);
end
hooksecurefunc("SetTracking",XTrackBar_TrackHook);
