--[[
  XBar for WoW (World of Warcraft)

  By Dr. Doom (Shalune on Kargath)
]]--

local XBarInitialized=false;
local ver="3.34"; -- Mod version
local dbver="5";  -- Data format version

XBarQ = {};

--Global variable so that other mod creators can test to see if XBAR is loaded.
XBAR_ENABLED = true;

-- Spacing constants
XBAR_SPBIG = 10;  -- Spacing for "spacers"
XBAR_SPSMALL = 1; -- Spacing between buttons

-- Type identifiers
XBAR_TTEXT = 0;
XBAR_TSPELL = 1;
XBAR_TMACRO = 2;
XBAR_TITEM = 3;
XBAR_TCOMPANION = 4;
XBAR_TEMOTE = 5;
XBAR_TCHAT = 6;
XBAR_TSPACER = 7;
XBAR_THEADER = 8;
XBAR_TOPTION = 9;
XBAR_TTRACKING = 10;
XBAR_TSPELLHAX = 11;

--Spacer types
XBAR_SWRAP = "W";
XBAR_SNOWRAP = " ";

--Global vars
XBarCore = {
    ["XBarPlayerName"] = nil,
    ["XBarOptionSet"] = "optionset-default",
    ["ModData"] = { },
    ["FrameDB"] = { },
    ["PosDB"] = { },
    ["InvCache"] = { },
    ["EqCache"] = { },
    ["Queue"] = { },
};

XBarLoader = {
    Notify={ },
};
XBarData = { }; -- Stores separately because it is saved
XBarConfigGUI = { };
XBarBindGUI = { };
XBarHelpGUI = { };

local LBF=nil;

if (LibStub) then
    LBF = LibStub("LibButtonFacade", true);
    if (LBF) then
        LBF:RegisterSkinCallback("XBar",XBarBF_SkinCB,self);
    end
end

local function XBarDataBuildDefault(mod)
    return {
        ["dbver"]=v1,
        ["x"]=150,
        ["y"]=-150,
        ["rp"]="TOPLEFT",
        ["pt"]="TOPLEFT",
        ["toggle"]=false,
        ["nohighlight"]=true,
        ["BFSkin"]="Caith",
        ["BFGloss"]=0,
        ["BFBackdrop"]=false,
        ["horizontal"]=XBarCore.ModData[mod].dhorizontal,
        ["hidebar"]=XBarCore.ModData[mod].dhidebar,
        ["order"]=XBarCore.ModData[mod].dorder,
        ["sortorder"]=XBarCore.ModData[mod].dsortorder,
        ["scale"]=XBarCore.ModData[mod].dscale,
        ["tooltips"]=XBarCore.ModData[mod].dtooltips,
        ["Bindings"]={ },
        ["Options"]={ },
    };
end

--==XBAR FUNCTIONS==--
SLASH_XBAR1 = "/xbar";

function XBar_StdButtonCB(button,spellname,index,mod)
    local x,a,fn,pfn;

    pfn=button:GetParent():GetName();
    fn=button:GetName();
    a=XBarCore.FrameDB[fn].XBarAction;
    a=XBarCore.ModData[pfn].ActionList[a];
    if a.ToolType==XBAR_TSPELL then
        if IsConsumableSpell(a.Tooltip) then
            x=GetSpellCount(a.Tooltip);
            if x==nil then
                x=0;
            end
        else
            x=0;
        end
        XBarCore.ShowCount(mod,index,x,0);
    elseif a.ToolType==XBAR_TITEM then
        if XBarCore.EqCache[a.Tooltip] then
            XBarCore.ShowText(mod,index,"E");
        else
            x=XBarCore.InvCache[a.Tooltip];
            if x==nil then
                x=0;
            end
            XBarCore.ShowCount(mod,index,x,0);
        end
    else
        XBarCore.ShowText(mod,index,"");
    end
end

function XBar_StdButtonID(id,spellname,mod)
    -- This function must be named directly in the global environment space to work as a callback
    local newid=id,v;

    if (not XBarCore.GetOption(mod,spellname)) then
        newid=nil;
    end

    return newid;
end

function XBar_StdEventHandler(mod,event,arg1)
    if (event == "PLAYER_ENTERING_WORLD") then
        XBar_StdEvents({mod,event,arg1});
    else
        XBarQ:CreateDelay("XBarStdEvent-"..mod.."-"..event,0.05,XBar_StdEvents,{mod,event,arg1},false,true,true);
    end
end

function XBar_StdEvents(values)
    local mod = values[1];
    local event = values[2];
    local arg1 = values[3];

    -- Standard event handler
    if (event == "ACTIONBAR_UPDATE_USABLE") then
        XBarCore.UpdateCooldowns(mod);
    elseif (event == "BAG_UPDATE" and XBarCore.XBarPlayerName) then
        -- Note that the BAG_UPDATE events are handled by the XBarLoader, but they are passed along here.
        if (not InCombatLockdown()) then
            -- If we're not in combat, re-generate the list for any item buttons
            XBarCore.GenerateDB(mod);
        end
        -- Updating on bag update because of the reagents required
        XBarCore.Update(mod);
    elseif (event == "COMPANION_UPDATE") then
        -- Called when anyone around you does ANYTHING with a companion.
        -- Mounts are handled with player aura updates
        if arg1 ~= "MOUNT" then
            XBarQ:CreateDelay("XBarCompanionUpdate-"..mod,1,XBarCore.UpdateCooldowns,mod,false,true,true);
        end
    elseif (event == "PLAYER_ENTERING_WORLD") then
        -- Let the main module know the addon is here so it can set up our data
        XBarCore.BuildPlayerName();
        XBarCore.RegisterAddon(mod,true);
        XBarCore.Update(mod);
        getfenv()[mod]:UnregisterEvent("PLAYER_ENTERING_WORLD");
    elseif (event == "SPELL_UPDATE_COOLDOWN") and (XBarCore.XBarPlayerName) then
        XBarCore.UpdateCooldowns(mod);
    elseif (event == "SPELLS_CHANGED") then
        XBarCore.GenerateDB(mod);
        XBarCore.ResetSpacers(mod);
        XBarCore.Scale(mod);
        XBarCore.Update(mod);
    elseif (event == "UPDATE_MACROS") then
        XBarCore.GenerateDB(mod);
        XBarCore.ResetSpacers(mod);
        XBarCore.Scale(mod);
        XBarCore.Update(mod);
    elseif (event == "UNIT_AURA") and (arg1=="player") then
        XBarCore.Update(mod);
    end
end

function XBar_StdOptionCB(option,value,mod,forceupdate)
    -- This function must be named directly in the global environment space to work as a callback
    XBarCore.ResetSpacers(mod); -- Eliminates the "sliding buttons" effect
    XBarCore.Update(mod,forceupdate);
end

function XBar_StdTexture(mod,texture,spellname)
    -- This function must be named directly in the global environment space to work as a callback
    local t = texture;
    local b,i,_,m;

    if XBarData[XBarCore.XBarOptionSet].mods and
       XBarData[XBarCore.XBarOptionSet].mods[mod] and
       XBarData[XBarCore.XBarOptionSet].mods[mod].nohighlight then
        return t;
    end
    -- Will highlight the aspect the player has
    for i = 1, 50 do
        b,_,_,_,_,_,_,m,_=UnitBuff("player",i);

        if (b==nil) then
            break;
        elseif (b==spellname) then
            t = "Interface\\Icons\\Spell_Nature_WispSplode";
            if m=="player" or m=="pet" or m=="vehicle" then
                -- Highlight the user's buffs in GREEN
                t = "Interface\\Icons\\Spell_Nature_WispSplodeGreen";
            end
        end
    end

    return t;
end

local XBarAutoCastUpdating = false;

function XBarAutoCastUpdate(btn)
    if not XBarInitialized then
        return;
    end

    LibQueue:Put(XBarCore.Queue,{"A"});
end

hooksecurefunc("AutoCastShine_AutoCastStart",XBarAutoCastUpdate);
hooksecurefunc("AutoCastShine_AutoCastStop",XBarAutoCastUpdate);

function XBarBF_SkinCB(arg, SkinID, Gloss, Backdrop, Group, Button, Colors)
    if not LBF then
        return;
    end

    if Group=="XBar" or not Group then
        return;
    end

    -- Save settings here
    XBarData[XBarCore.XBarOptionSet].mods[Group].BFSkin=SkinID;
    XBarData[XBarCore.XBarOptionSet].mods[Group].BFGloss=Gloss;
    XBarData[XBarCore.XBarOptionSet].mods[Group].BFBackdrop=Backdrop;
end

function XBarBF_Skin(mod,btn)
    if not LBF then
        return;
    end

    if InCombatLockdown() then
        return;
    end

    local s=XBarData[XBarCore.XBarOptionSet].mods[mod].BFSkin;
    local g=XBarData[XBarCore.XBarOptionSet].mods[mod].BFGloss;
    local b=XBarData[XBarCore.XBarOptionSet].mods[mod].BFBackdrop;
    local group = LBF:Group("XBar",mod);

    local btndata = { -- These are Frame Pointers, should only need to specify if not a normal field
        --["Icon"]=false,
        ["Border"]=false,
        ["Flash"]=false,
        --["Cooldown"]=false,
        --["AutoCast"]=false,
        --["AutoCastable"]=false,
        --["Normal"]=false,
        --["Pushed"]=false,
        ["Disabled"]=false,
        ["Checked"]=false,
        --["Highlight"]=false,
        --["HotKey"]=false,
        --["Count"]=false,
        ["Name"]=false,
    };

    -- Set up the skins
    group:AddButton(btn,btndata);
    group:Skin(s,g,b);
end

function XBarCore.BuildPlayerName()
    -- We must setup the player's name and server to save data.
    if (UnitName("player") ~= UNKNOWNBEING and UnitName("player") ~= UNKNOWNOBJECT and UnitName("player") and not XBarCore.XBarPlayerName) then
        XBarCore.XBarPlayerName = UnitName("player").." of "..GetCVar("realmName");
    end
end

function XBarCore.ClickHandler()
    local bn=this:GetName();
    local pfn=this:GetParent():GetName();
    local v,d,i,t,c,_;

    if XBarCore.FrameDB[bn]==nil then
        XBarCore.FrameDB[bn]={};
    end

    if (XBarCore.FrameDB[pfn].IgnoreClicks) then
        -- This is a PostClick event, so we have to unset this ourselves after a move instead of in the OnMouseUp event
        XBarCore.FrameDB[pfn].IgnoreClicks=false;
        return;
    end

    local a=XBarCore.FrameDB[bn].XBarAction;

    if (a) then
        v=XBarCore.ModData[pfn].ActionList[a];
        i=v.Data[1].ID;
        d=v.Data[1].Data;
        t=v.Data[1].AuxData;
        if v.Type==XBAR_TCOMPANION then
            _,_,_,_,a=GetCompanionInfo("MOUNT",i);
            if not (a) then
                CallCompanion(t,i);
            else
                DismissCompanion(t);
            end
        elseif v.Type==XBAR_TEMOTE then
            DoEmote(d);
        elseif v.Type==XBAR_TCHAT then
            i=strfind(d,":");
            c=t;
            if not i then
                t=nil;
            else
                t=strsub(d,1,i-1);
                d=strsub(d,i+1);
            end
            if c=="CHANNEL" then
                t=GetChannelName(t);
            end
            if c=="CHANNEL" or c=="WHISPER" then
                if (i) and i>0 then
                    SendChatMessage(d,c,nil,t);
                end
            else
                SendChatMessage(d,c,nil,t);
            end
        elseif v.Type==XBAR_TTRACKING then
            SetTracking(i);
        elseif v.Type==XBAR_TSPELLHAX then
            CastSpell(i,t);
        end
    end
end

function XBarCore.CountSpells(mod)
    local rbuttons=0;
    local rchecks=0;
    local i,v,c;

    -- This function performs the common task of enumerating the number of
    -- Buttons and checkboxes in a mod (assuming 1 checkbox per spell).
    for i,v in pairs(XBarCore.ModData[mod].ActionList) do
        if v.Type==XBAR_TSPACER then
            rbuttons=rbuttons+1;
        elseif v.Type==XBAR_THEADER then
            rchecks=rchecks+1;
        else
            -- Whatever this is, we want to include it in the list
            rchecks=rchecks+1;
            rbuttons=rbuttons+1;
        end
    end

    return rbuttons,rchecks;
end

function XBarCore.ExeQueue ()
    local i,v,cmd;

    cmd = XBarQ:Get(XBarCore.Queue);
    if (cmd==nil) or (cmd=="") then
        -- do nothing
    elseif cmd[1]=="A" then
        if not XBarAutoCastUpdating then
            XBarAutoCastUpdating = true;
            for i,v in pairs(XBarCore.LoadedMods) do
                XBarCore.UpdateCooldowns(v);
            end
            XBarAutoCastUpdating = false;
        end
    elseif cmd[1]=="U" then
        XBarCore.UpdateBar(cmd[2],cmd[3]);
    end
end

function XBarCore.ExtractMacro(macrotext)
    -- Workaround to parse the macros to determine what we're looking for
    -- Returns the name of the spell or item to look at for texturing, cooldowns, and other stuff
    local p1,p2;
    local s=nil;
    local rc=nil;
    local i=nil;

    -- #Showtooltip
    p1=strfind(macrotext,"#showtooltip ",1,true);
    if (p1) then
        s=strsub(macrotext,p1+13);
        if (s) then
            p2=strfind(s,strchar(10),1,true);
            if (p2) then
                rc=strsub(s,1,p2-1);
            end
        end
    else
        -- #Show
        p1=strfind(macrotext,"#show ",1,true);
        if (p1) then
            s=strsub(macrotext,p1+6);
            if (s) then
                p2=strfind(s,strchar(10),1,true);
                if (p2) then
                    rc=strsub(s,1,p2-1);
                end
            end
        else
            -- /cast /castsequence or /use
            p1=strfind(macrotext,"/castsequence",1,true);
            p2=14;
            if (not p1) then
                p1=strfind(macrotext,"/cast",1,true);
                p2=6;
            end
            if (not p1) then
                p1=strfind(macrotext,"/use",1,true);
                p2=5;
                i=true;
            end
            if (p1) then
                s=strsub(macrotext,p1+p2);
                if (s) then
                    -- Lets strip out this line ahead of time so we can ignore any following lines
                    p2=strfind(s,strchar(10),1,true);
                    if (p2) then
                        s=strsub(s,1,p2-1);
                    end
                    -- Could be multiple '[...]' or a 'reset=...' before spell
                    while true do
                        p2=strfind(s,"[",1,true);
                        if (p2) then
                            p2=strfind(s,"]",1,true);
                            if not p2 then
                                -- malformed
                                s="";
                                break;
                            else
                                -- get rid of the [...]
                                s=strsub(s,p2+1);
                            end
                        else
                            p2=strfind(s,"reset=",1,true);
                            if (p2) then
                                -- If we found a reset, the spell will follow the next space
                                p2=strfind(s," ",1,true);
                                if not p2 then
                                    -- malformed
                                    s="";
                                    break;
                                else
                                    s=strsub(s,p2+1);
                                    break;  -- If we see reset, there can't be a [...] after
                                end
                            elseif strsub(s,1,1)==" " then
                                -- Trim up excess spaces
                                s=strsub(s,2);
                            else
                                -- No [...] or reset= or leading spaces left
                                break;
                            end
                        end
                    end

                    -- Spell ender could be a ';' ',' or LF after spell
                    -- LF was stripped out previously, so if we don't find a ; or , then we already have the name
                    p2=strfind(s,";",1,true);
                    if (not p2) then
                        p2=strfind(s,",",1,true);
                    end
                    if (p2) then
                        s=strsub(s,1,p2-1);
                    end
                    rc=s;
                end
            end
        end
    end

    if i then
        i = XBAR_TITEM;
    else
        i = XBAR_TSPELL;
    end

    return rc, i;
end

function XBarCore.FixMenu(level)
    -- This was added since the dropdown frame menus appear to spontaneously change frame level to behind the backdrop.
    local i,fs1,fs2;

    if (level == nil) then
        return;
    end
    for i=1,UIDROPDOWNMENU_MAXBUTTONS do
        fs1 = getglobal("DropDownList"..tostring(level).."Backdrop"):GetFrameLevel();
        fs2 = getglobal("DropDownList"..tostring(level).."Button"..tostring(i)):GetFrameLevel();
        if fs2 < fs1 then
            getglobal("DropDownList"..tostring(level).."Button"..tostring(i)):SetFrameLevel(fs1+1);
        end
    end
end

function XBarCore.GenerateButtons(mod)
    local i,n,b,f,g;

    n=XBarCore.ModData[mod].nbuttons;
    if (n==0) then
        print(mod.." failed to load");
        return;
    end

    if XBarCore.ModData[mod].loaded then
        -- Don't need to make buttons every time we zone
        return;
    end

    b=getfenv()[mod];
    f=CreateFrame("CheckButton",mod.."ButtonToggle",UIParent,"XBarButtonBaseTemplate,SecureHandlerClickTemplate"); --SecureHandlerEnterLeaveTemplate
    f:SetPoint("TOPLEFT",b,"TOPLEFT",10,0);
    f:SetWidth("16");
    f:SetHeight("16");
    if (XBarCore.FrameDB[mod.."ButtonToggle"] == nil) then
        XBarCore.FrameDB[mod.."ButtonToggle"] = {};
    end
    XBarCore.FrameDB[mod.."ButtonToggle"].XBarToggle=mod;
    f:SetScript("PostClick",XBarCore.Toggle);

    f:SetFrameRef("BarFrame",b);
    f:SetAttribute("_onclick",[[
        local r=self:GetFrameRef("BarFrame");
        if not r:GetAttribute("statehidden") then
            r:Hide();
        else
            r:Show();
        end
    ]]);
--	f:SetAttribute("_onenter",[[
--		local r=self:GetFrameRef("BarFrame");
--		local a=r:GetAttribute("XBarSlideOut");
--		if a then
--			r:SetAttribute("XBarSlided",true);
--			r:Show();
--		end
--	]]);

    if not XBarCore.FrameDB[mod] then
        XBarCore.FrameDB[mod]={};
    end
    if not XBarCore.FrameDB[mod.."ButtonToggle"] then
        XBarCore.FrameDB[mod.."ButtonToggle"]={};
    end

    for i=1,n do
        f=CreateFrame("CheckButton",mod.."Button"..tostring(i),b,"XBarButtonTemplate");
        if (XBarCore.FrameDB[mod.."Button"..tostring(i)] == nil) then
            XBarCore.FrameDB[mod.."Button"..tostring(i)]={};
        end
        XBarCore.FrameDB[mod.."Button"..tostring(i)].XBarToggle=nil;
        if (i==1) then
            f:SetPoint("LEFT",mod.."ButtonToggle","RIGHT",1,0);
        else
            f:SetPoint("LEFT",mod.."Button"..(i-1),"RIGHT",1,0);
        end
        if not XBarCore.FrameDB[mod.."Button"..tostring(i)] then
            XBarCore.FrameDB[mod.."Button"..tostring(i)]={};
        end
    end
end

function XBarCore.GenerateDB(mod)
    -- This function generates the rest of the data in the internal DB that a plugin did not/cannot provide.
    local a,i,d,v,sn,tex,x,r,s,si;

    -- This only updates the default sort order, the actual sort order will be saved elsewhere
    XBarCore.ModData[mod].dsortorder={};
    if (not XBarCore.ModData[mod].ActionList) then
        return;
    end

    for a,v in pairs(XBarCore.ModData[mod].ActionList) do
        for i,d in pairs(v.Data) do
            if v.Type == XBAR_TSPELL or v.Type == XBAR_TSPELLHAX then
                sn=d.Data; -- Spell name
                x=strfind(sn,"(",1,true);
                r=nil;
                if (x) then
                    r=strsub(sn,x+1);
                    sn=strtrim(strsub(sn,1,x-1));
                    x=strfind(r,")",1,true);
                    if (x) then
                        r=strsub(r,1,x-1);
                    end
                end
                d.ID=XBarCore.GetSpellID(sn,d.AuxData,r);
            elseif v.Type == XBAR_TCOMPANION then
                x,_,d.ID,s=XBarCore.GetCompanionInfo(d.AuxData,d.Data);
                if i==1 then
                    if s then
                        -- Saving a hyperlink to the spell in the tooltip, so we can display it later
                        si="spell:"..tostring(s);
                    end
                    r=x;
                end
            elseif v.Type == XBAR_TMACRO then
                -- This is handled down below
            elseif v.Type == XBAR_TTRACKING then
                -- This is handled down below
            else
                d.ID=1;
            end
            if i==1 then -- All information about this button will be retrieved from the first action
                -- By default, use the data given as type and tooltip data
                v.Tooltip=d.Data;
                v.ToolType=v.Type;
                -- Set up the texture as a '?' in case it has no idea
                tex="Interface\\Icons\\INV_Misc_QuestionMark";
                if v.Type == XBAR_TSPELL or v.Type == XBAR_TSPELLHAX then
                    if d.ID then
                        v.ToolType=XBAR_TSPELL;
                        tex = GetSpellTexture(d.ID, d.AuxData);
                        if (not tex) and XBarCore.ModData[mod].ActionList[a].Texture then
                            -- If we unlearn a spell while in combat, check to see if we saved it (this only happens for pets that die and the body disappears).
                            tex=XBarCore.ModData[mod].ActionList[a].Texture;
                        end
                        if tex==nil or tex=="" then
                            -- If our texture is still nill, go ahead and disable the button;
                            d.ID=nil;
                        end
                    end
                elseif v.Type == XBAR_TMACRO then
                    x=GetMacroIndexByName(d.Data);
                    if (x ~=0) then
                        _,tex,sn = GetMacroInfo(x);
                        si,x = XBarCore.ExtractMacro(sn);
                        if si then
                            XBarCore.ModData[mod].ActionList[a].Tooltip=si;
                            XBarCore.ModData[mod].ActionList[a].ToolType=x;
                            if x==XBAR_TSPELL then
                                d.ID=XBarCore.GetSpellID(si,d.AuxData);
                            elseif x==XBAR_TITEM then
                                d.ID=1;
                            end
                        else
                            -- Cannot determine what is in the macro, so just display the text of the name
                            XBarCore.ModData[mod].ActionList[a].ToolType=XBAR_TTEXT;
                            d.ID=1;
                        end
                    else
                        d.ID=nil;
                        XBarCore.ModData[mod].ActionList[a].Tooltip="";
                        XBarCore.ModData[mod].ActionList[a].ToolType=XBAR_TTEXT;
                    end
                elseif v.Type == XBAR_TITEM then
                    tex = GetItemIcon(d.Data);
                    if (not tex) and XBarCore.ModData[mod].ActionList[a].Texture then
                        -- If we run out of an item, save the texture around
                        tex=XBarCore.ModData[mod].ActionList[a].Texture;
                    end
                    if tex==nil or tex=="" then
                        -- If our texture is still nill, go ahead and disable the button;
                        d.ID=nil;
                    end
                elseif v.Type == XBAR_TCOMPANION then
                    tex=r; -- Texture was retrieved up above
                    XBarCore.ModData[mod].ActionList[a].Tooltip=si; -- Spell ID for linking was retrieved from above;
                    XBarCore.ModData[mod].ActionList[a].ToolType=XBAR_TCOMPANION;
                elseif v.Type == XBAR_TEMOTE then
                    tex = v.Texture; -- This is defined externally by the Mod
                    XBarCore.ModData[mod].ActionList[a].ToolType=XBAR_TTEXT;
                elseif v.Type == XBAR_TCHAT then
                    tex = v.Texture; -- This is defined externally by the Mod
                    XBarCore.ModData[mod].ActionList[a].ToolType=XBAR_TTEXT;
                elseif v.Type == XBAR_TSPACER then
                    tex = "";
                elseif v.Type == XBAR_THEADER then
                    tex = "";
                elseif v.Type == XBAR_TTRACKING then
                    if d.ID==nil then
                        d.ID=d.Data;
                    end
                    d.Data,tex = GetTrackingInfo(d.ID); -- Save texture for later.
                    XBarCore.ModData[mod].ActionList[a].Tooltip = d.Data;
                    XBarCore.ModData[mod].ActionList[a].ToolType = XBAR_TTEXT;
                end
                if tex==nil then
                    tex = "";
                end
                XBarCore.ModData[mod].ActionList[a].Texture=tex;
                if XBarData[XBarCore.XBarOptionSet] and
                    XBarData[XBarCore.XBarOptionSet].mods and
                    XBarData[XBarCore.XBarOptionSet].mods[mod] and
                    XBarData[XBarCore.XBarOptionSet].mods[mod].Bindings then
                    XBarCore.ModData[mod].ActionList[a].Binding=XBarData[XBarCore.XBarOptionSet].mods[mod].Bindings[d.Data];
                end;
            end
        end
        XBarCore.ModData[mod].dsortorder[a] = a;
    end
end

function XBarCore.GetCompanionInfo(t,petname)
    local r1=nil;
    local r2=nil;
    local r3=nil;
    local r4=nil;
    local n,_,name,icon,summoned,i,s;

    -- Looking for the mounts/pets
    if t=="MOUNT" or t=="CRITTER" then
        n=GetNumCompanions(t);
        -- If we have any companions of that type, iterate through and find the pet info we need.
        if (n ~= nil) and (n>0) then
            for i=1,n do
                _,name,s,icon,summoned=GetCompanionInfo(t,i);
                if petname==name then
                    -- Found it
                    r1=icon;
                    r2=summoned;
                    r3=i;
                    r4=s;
                    break;
                end
            end
        end
    end
    return r1,r2,r3,r4;
end

function XBarCore.GetOptionSet()
    return strsub(XBarCore.XBarOptionSet,11);
end

function XBarCore.GetOption(mod,spellname)
    local v1,v2,i,n;
    if not XBarData[XBarCore.XBarOptionSet].mods[mod].Options then
        XBarData[XBarCore.XBarOptionSet].mods[mod].Options={};
    end
    if XBarData[XBarCore.XBarOptionSet].mods[mod].Options[spellname]==nil then
        -- If the option is nil, it might not have been imported from the higher level list, or it might not exist
        if XBarData[XBarCore.XBarOptionSet].mods[mod][spellname]~=nil then
            -- Old options value, import it.
            XBarData[XBarCore.XBarOptionSet].mods[mod].Options[spellname]=XBarData[XBarCore.XBarOptionSet].mods[mod][spellname];
            XBarData[XBarCore.XBarOptionSet].mods[mod][spellname]=nil;
        else
            -- Flat doesn't exist, lets look it up and create it.
            n=XBarCore.ModData[mod].nchecks;
            if (n~=nil) and (n>0) then
                for i=1,n do
                    v1=XBarCore.ModData[mod]["check"..i];
                    if (v1 and v1==spellname) then
                        v2=XBarCore.ModData[mod]["dcheck"..i];
                        XBarData[XBarCore.XBarOptionSet].mods[mod].Options[v1]=v2;
                        break;
                    end
                end
            end
            n=XBarCore.ModData[mod].nsliders;
            if (n~=nil) and (n>0) then
                for i=1,n do
                    v1=XBarCore.ModData[mod]["slider"..i];
                    if (v1 and v1==spellname) then
                        v2=XBarCore.ModData[mod]["dslider"..i];
                        XBarData[XBarCore.XBarOptionSet].mods[mod].Options[v1]=v2;
                        break;
                    end
                end
            end
            --If we still didn't find it defined in the check or slider list, its just gonna have to be nil
        end
    end
    return XBarData[XBarCore.XBarOptionSet].mods[mod].Options[spellname];
end

function XBarCore.GetSpellID(spell,book,rank)
    local i = 0;
    local curRank=nil;
    local highestRank=nil;
    local spellName, spellRank;

    repeat
        i = i + 1;
        spellName, spellRank = GetSpellName(i, book);
        if (spellName == spell) then
            curRank = spellRank;
            if (rank ~= nil) then
                if (curRank==rank) then
                    i=i+1;
                    break;
                end
            end
        elseif (curRank) then
            break; -- break if we passed all the spells
        end
    until (spellName==nil);

    if (curRank==nil) then
        i=nil; -- didn't find it
    else
        i=i-1; -- found it, correct i.
    end

    return i,curRank;
end

function XBarCore.GetVersion()
    return tonumber(ver),tonumber(dbver);
end

function XBarCore.ImportList(mod,list)
    local i,v,t;

    XBarCore.ModData[mod].ActionList = { };
    for i,v in pairs(list) do
        if not XBarCore.ModData[mod].ActionList[i] then
            XBarCore.ModData[mod].ActionList[i] = {};
        end
        XBarCore.ModData[mod].ActionList[i].Data={[1]={}};
        XBarCore.ModData[mod].ActionList[i].Data[1].Data=v;
        if (v==XBAR_SNOWRAP) or (v==XBAR_SWRAP) then
            XBarCore.ModData[mod].ActionList[i].Type=XBAR_TSPACER;
        elseif (strsub(v,1,1)=="#") then
            v=strsub(v,2);
            XBarCore.ModData[mod].ActionList[i].Data[1].Data=v;
            XBarCore.ModData[mod].ActionList[i].Type=XBAR_THEADER;
        elseif (strsub(v,1,1)=="*") then
            v=strsub(v,2);
            XBarCore.ModData[mod].ActionList[i].Data[1].Data=v;
            XBarCore.ModData[mod].ActionList[i].Type=XBAR_TOPTION;
        elseif (strsub(v,1,1)=="@") then
            v=strsub(v,2);
            XBarCore.ModData[mod].ActionList[i].Data[1].Data=v;
            XBarCore.ModData[mod].ActionList[i].Type=XBAR_TTRACKING;
        elseif (strsub(v,1,1)=="!") then
            t=strsub(v,2,2);
            v=strsub(v,3);
            if (t=="C") then
                t="CRITTER";
            elseif (t=="M") then
                t="MOUNT";
            end
            XBarCore.ModData[mod].ActionList[i].Data[1].Data=v;
            XBarCore.ModData[mod].ActionList[i].Data[1].AuxData=t;
            XBarCore.ModData[mod].ActionList[i].Type=XBAR_TCOMPANION;
        elseif (strsub(v,1,1)=="&") then
            v=strsub(v,2);
            v=GetItemInfo(tonumber(v));
            XBarCore.ModData[mod].ActionList[i].Data[1].Data=v;
            XBarCore.ModData[mod].ActionList[i].Type=XBAR_TITEM;
        elseif (strsub(v,1,1)=="%") then
            v=strsub(v,2);
            XBarCore.ModData[mod].ActionList[i].Data[1].Data=v;
            XBarCore.ModData[mod].ActionList[i].Data[1].AuxData=BOOKTYPE_SPELL;
            XBarCore.ModData[mod].ActionList[i].Type=XBAR_TSPELLHAX;
        elseif v~=nil then
            XBarCore.ModData[mod].ActionList[i].Data[1].AuxData=BOOKTYPE_SPELL;
            XBarCore.ModData[mod].ActionList[i].Type=XBAR_TSPELL;
        end
    end
    while (getn(list) > 0) do
        tremove(list); -- Clean up
    end
end

function XBarCore.Localize(spelllist)
    local i,v;

    for i,v in pairs(spelllist) do
        if strsub(v,1,1)=="^" then
            v=strsub(v,2);
            spelllist[i]=GetSpellInfo(v);
            if spelllist[i]==nil then
                print("XBar: No spell info found for "..v..".");
                spelllist[i]="Unknown";
            end
        elseif strsub(v,1,1)=="%" then
            v=strsub(v,2);
            if strsub(v,1,1)=="^" then
                v=strsub(v,2);
                spelllist[i]="%"..GetSpellInfo(v);
                if spelllist[i]==nil then
                    print("XBar: No spell info found for "..v..".");
                    spelllist[i]="Unknown";
                end
            end
        elseif strsub(v,1,1)=="#" then
            v=strsub(v,2);
            if strsub(v,1,1)=="^" then
                v=strsub(v,2);
                spelllist[i]="#"..GetSpellInfo(v);
                if spelllist[i]==nil then
                    print("XBar: No spell info found for "..v..".");
                    spelllist[i]="Unknown";
                end
            end
        end
    end
end

function XBarCore.OnMouseDown()
    local pfn=this:GetParent():GetName();
    if ((arg1 == "RightButton") and (IsControlKeyDown())) then
        local bn=this:GetName();
        local m=XBarCore.FrameDB[bn].XBarToggle;
        if not XBarCore.FrameDB[bn] then
            XBarCore.FrameDB[bn] = {};
        end
        if XBarCore.FrameDB[pfn]==nil then
            XBarCore.FrameDB[pfn]={};
        end
        XBarCore.FrameDB[pfn].IsMoving=true;
        if ((m==nil) or (m=="-")) then
            this:GetParent():StartMoving();
            if this:GetObjectType()=="Button" then
                XBarCore.FrameDB[pfn].IgnoreClicks=true;
                this:RegisterForClicks();
            end
        else
            if getfenv()[m] then
                if not XBarCore.FrameDB[m] then
                    XBarCore.FrameDB[m]={};
                end
                XBarCore.FrameDB[m].IgnoreClicks=true;
                getfenv()[m]:StartMoving();
            end
        end
    end
end

function XBarCore.OnMouseUp()
    local pfn=this:GetParent():GetName();
    if (arg1 == "RightButton" and XBarCore.FrameDB[pfn] and XBarCore.FrameDB[pfn].IsMoving) then
        local bn=this:GetName();
        local m=XBarCore.FrameDB[bn].XBarToggle;
        if ((m==nil) or (m=="-")) then
            this:GetParent():StopMovingOrSizing();
            XBarCore.SaveLoc(this:GetParent());
            if this:GetObjectType()=="Button" then
                this:RegisterForClicks("AnyUp");
            end
        else
            getfenv()[m]:StopMovingOrSizing();
            XBarCore.SaveLoc(getfenv()[m]);
        end
        if XBarCore.FrameDB[pfn]==nil then
            XBarCore.FrameDB[pfn]={};
        end
        XBarCore.FrameDB[pfn].IsMoving=nil;
    end
end

function XBarCore.Orient(mod)
    local button,orientrow,orientindex,action,i;

    if (not XBarCore.ModData[mod].enabled) then
        return;
    end

    local n=XBarCore.ModData[mod].nbuttons;
    local d1, d2, h, o, s, r, sp, a;
    local pt,an,ap,xd,yd,mag;

    if (n==nil) then
        return;
    end

    -- This function cannot be performed in combat.
    if ((InCombatLockdown() == nil) and (XBarData[XBarCore.XBarOptionSet])) then
        h=XBarData[XBarCore.XBarOptionSet].mods[mod].horizontal;
        o=XBarData[XBarCore.XBarOptionSet].mods[mod].order;
        r= (o == "za");
        if ((not h) and (not r)) then
            d1="TOP";
            d2="BOTTOM";
        elseif ((not h) and r) then
            d1="BOTTOM";
            d2="TOP";
        elseif (h and (not r)) then
            d1="LEFT";
            d2="RIGHT";
        elseif (h and r) then
            d1="RIGHT";
            d2="LEFT";
        else -- Default is horizontal without reversal
            d1="LEFT";
            d2="RIGHT";
            h=true;
            r=false;
        end

        -- Insert spacing
        if (h) then
            h=1;
        else
            h=0;
        end
        if ((h and not r) or (not h and r)) then
            s=1;
        else
            s=-1;
        end
        h=h * s;
        s=(abs(h)-1) * s;

        local fo=getfenv()[XBarCore.ModData[mod].forientcb];

        for i = 1,n do
            action=XBarCore.FrameDB[mod.."Button"..i].XBarAction;
            if action then
                action=XBarCore.ModData[mod].ActionList[action];
            end
            button = getfenv()[mod.."Button"..i];
            if (button~=nil) then
                button:ClearAllPoints();
                if (i==1) then
                    a=mod.."ButtonToggle";
                    orientrow=1;
                    orientindex=1;
                else
                    a=mod.."Button"..(i-1);
                end
                if (XBarCore.FrameDB[mod.."Button"..i].XBarSpacer) then
                    sp=XBAR_SPBIG;
                    if action and XBarCore.FrameDB[mod.."Button"..i].XBarWrap==XBAR_SWRAP and orientrow > 0 then
                        -- This is a new spacer that we can wrap on
                        orientrow=(orientrow+1) * -1;
                    end
                else
                    sp=XBAR_SPSMALL;
                end

                pt=d1;
                an=a;
                ap=d2;
                xd=h;
                yd=s;
                mag=sp;
                if (XBarData[XBarCore.XBarOptionSet].mods[mod].wrapbar) then
                    if (orientrow < 1) then
                        -- Last button was a spacer, need to wrap
                        orientrow=orientrow*-1;
                        an=mod.."Button"..tostring(orientindex);
                        orientindex=i;
                        if (xd ~= 0) and (yd==0) then
                            -- All horizontal bars will expand downwards
                            pt="TOP";
                            ap="BOTTOM";
                            xd=0;
                            yd=-1;
                            mag=XBAR_SPSMALL;
                        elseif (xd==0) and (yd ~= 0) then
                            -- All vertical bars will expand to the right
                            pt="LEFT";
                            ap="RIGHT";
                            xd=1;
                            yd=0;
                            mag=XBAR_SPSMALL;
                        else
                            -- If we encounter some wierd combination, we will cancel the row increment
                            orientrow=orientrow-1;
                        end
                    end
                end

                if (fo) then
                    pt,an,ap,xd,yd,mag=fo(i,pt,an,ap,xd,yd,mag);
                end
                button:SetPoint(pt, an, ap, xd*mag, yd*mag);
            end
        end
    end
end

function XBarCore.RangeTimer(mod,elapsed)
    if XBarCore.FrameDB[mod] == nil then
        XBarCore.FrameDB[mod]={ };
    end
    if XBarCore.FrameDB[mod].RT == nil then
        XBarCore.FrameDB[mod].RT=elapsed;
    else
        XBarCore.FrameDB[mod].RT=XBarCore.FrameDB[mod].RT+elapsed
        if XBarCore.FrameDB[mod].RT >= 0.2 then
            XBarCore.UpdateCooldowns(mod);
            XBarCore.FrameDB[mod].RT=0;
        end
    end
end

function XBarCore.RegisterAddon(mod,autocheck,skipimport)
    -- This function is used by plugins to let us know they are present and loaded.
    local n,v1,v2,i;
    local dbcache={ };

    if not XBarInitialized then
        -- Error message
        print(mod..XBAR_MSG5);
        return;
    end

    if autocheck==nil then
        -- Error message (this will happen for pre-3.0 bars if they try to load with 3.0 or later)
        print(mod..XBAR_MSG5);
        return;
    end

    if (not XBarCore.ModData[mod]) then
        -- Error message
        print(mod..XBAR_MSG5);
        return;
    end

    -- Build the database for the bar
    if not skipimport then
        XBarCore.ImportList(mod,getfenv()[mod.."Spells"]);
    end

    -- Finish filling out the mod's ModData DB.
    XBarCore.GenerateDB(mod);

    XBarCore.ModData[mod].enabled=true;
    XBarCore.ModData[mod].nbuttons,XBarCore.ModData[mod].nchecks=XBarCore.CountSpells(mod);

    -- Set up checkboxes
    if autocheck then
        n=1;
        for i,v1 in pairs(XBarCore.ModData[mod].ActionList) do
            if v1.Type ~= XBAR_TSPACER and v1.Type ~= XBAR_THEADER then
                XBarCore.ModData[mod]["check"..n]=v1.Data[1].Data;
                XBarCore.ModData[mod]["dcheck"..n]=true;
                XBarCore.ModData[mod].nchecks=n;
                n=n+1;
            elseif v1.Type == XBAR_THEADER then
                --Menu header
                v2=v1.Data[1].Data;
                XBarCore.ModData[mod]["mcheck"..n]=v2;
                XBarCore.ModData[mod]["check"..n]="";
                XBarCore.ModData[mod]["dcheck"..n]=nil;
                XBarCore.ModData[mod].nchecks=n;
                n=n+1;
            end
        end
    end

    if not XBarCore.LoadedMods then
        XBarCore.LoadedMods={};
    end

    -- Validate that the mod has loaded default settings
    if (XBarCore.ModData[mod].enabled) then
        n=XBarData[XBarCore.XBarOptionSet].nmods;
        -- Scan to see if it's in there already
        v1=XBarCore.ValidateModName(mod);
        if (v1=="") then
            --not found, add it to the list
            i=n+1;
            XBarData[XBarCore.XBarOptionSet].nmods=i;
            XBarData[XBarCore.XBarOptionSet]["mod"..i]=mod;
            XBarData[XBarCore.XBarOptionSet].mods[mod]={};
        end
        i=false;
        v1=XBarCore.ModData[mod].dbver;
        if (XBarData[XBarCore.XBarOptionSet].mods[mod]==nil) then
            i=true; -- No database at all
            print(mod..XBAR_MSG2);
        elseif (XBarData[XBarCore.XBarOptionSet].mods[mod].dbver~=v1) then
            i=true; -- Database version incorrect
            print(mod..XBAR_MSG3);
            -- Save the known data
            if XBarData[XBarCore.XBarOptionSet].mods[mod].horizontal~=nil then
                dbcache.horizontal=XBarData[XBarCore.XBarOptionSet].mods[mod].horizontal;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].order~=nil then
                dbcache.order=XBarData[XBarCore.XBarOptionSet].mods[mod].order;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar~=nil then
                dbcache.hidebar=XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].toggle~=nil then
                dbcache.toggle=XBarData[XBarCore.XBarOptionSet].mods[mod].toggle;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].x~=nil then
                dbcache.x=XBarData[XBarCore.XBarOptionSet].mods[mod].x;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].y~=nil then
                dbcache.y=XBarData[XBarCore.XBarOptionSet].mods[mod].y;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].rp~=nil then
                dbcache.rp=XBarData[XBarCore.XBarOptionSet].mods[mod].rp;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].pt~=nil then
                dbcache.pt=XBarData[XBarCore.XBarOptionSet].mods[mod].pt;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].scale~=nil then
                dbcache.scale=XBarData[XBarCore.XBarOptionSet].mods[mod].scale;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].tooltips~=nil then
                dbcache.tooltips=XBarData[XBarCore.XBarOptionSet].mods[mod].tooltips;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].wrapbar~=nil then
                dbcache.wrapbar=XBarData[XBarCore.XBarOptionSet].mods[mod].wrapbar;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].Bindings~=nil then
                dbcache.Bindings=XBarData[XBarCore.XBarOptionSet].mods[mod].Bindings;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].Options~=nil then
                dbcache.Options=XBarData[XBarCore.XBarOptionSet].mods[mod].Options;
            end
            if XBarData[XBarCore.XBarOptionSet].mods[mod].nohighlight~=nil then
                dbcache.Options=XBarData[XBarCore.XBarOptionSet].mods[mod].nohighlight;
            end
        end
        -- Create user-space variables to store settings
        if (i) then
            XBarData[XBarCore.XBarOptionSet].mods[mod] = XBarDataBuildDefault(mod);

            -- Put in any saved info we had from earlier
            for i,n in pairs(dbcache) do
                XBarData[XBarCore.XBarOptionSet].mods[mod][i]=n;
            end
            -- Add in space to save the user checkboxes
            n=XBarCore.ModData[mod].nchecks;
            if (n==nil) then
                n=0;
                XBarCore.ModData[mod].nchecks=0;
            else
                if not XBarData[XBarCore.XBarOptionSet].mods[mod].Options then
                    XBarData[XBarCore.XBarOptionSet].mods[mod].Options={ };
                end
                for i=1,n do
                    v1=XBarCore.ModData[mod]["check"..i];
                    v2=XBarCore.ModData[mod]["dcheck"..i];
                    if (v1 and (XBarData[XBarCore.XBarOptionSet].mods[mod].Options[v1]==nil)) then
                        XBarData[XBarCore.XBarOptionSet].mods[mod].Options[v1]=v2;
                    end
                end
            end
            -- Add in space to save the user sliders
            n=XBarCore.ModData[mod].nsliders;
            if (n==nil) then
                n=0;
                XBarCore.ModData[mod].nsliders=0;
            else
                if not XBarData[XBarCore.XBarOptionSet].mods[mod].Options then
                    XBarData[XBarCore.XBarOptionSet].mods[mod].Options={ };
                end
                for i=1,n do
                    v1=XBarCore.ModData[mod]["slider"..i];
                    v2=XBarCore.ModData[mod]["dslider"..i];
                    if (v1 and (XBarData[XBarCore.XBarOptionSet].mods[mod].Options[v1]==nil)) then
                        XBarData[XBarCore.XBarOptionSet].mods[mod].Options[v1]=v2;
                    end
                end
            end
        end
        if not XBarCore.ModData[mod].sortable then
            -- if the mod is not sortable, we have to overwrite this value to default every time.
            XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder=XBarCore.ModData[mod].dsortorder;
        end
        XBarCore.SetPos(mod); -- Set the mod to the last known coordinates just in case
        XBarCore.GenerateButtons(mod);
        XBarCore.ModData[mod].loaded=true; -- mark the mod as loaded
        tinsert(XBarCore.LoadedMods,mod);
    else
        XBarCore.ModData[mod].loaded=false; -- mark the mod as unloaded
    end
end

function XBarCore.ResetPos(mod)
    if (not XBarCore.ModData[mod]) then
        return;
    end

    local bar=getfenv()[mod];
    bar:ClearAllPoints();
    bar:SetPoint("BOTTOM",nil,"CENTER");
    XBarCore.SaveLoc(bar);
end

function XBarCore.ResetSpacers(mod)
    local i,n;

    n=XBarCore.ModData[mod].nbuttons;
    for i=1,n do
        if (XBarCore.FrameDB[mod.."Button"..i]==nil) then
            XBarCore.FrameDB[mod.."Button"..i]={};
        end
        XBarCore.FrameDB[mod.."Button"..i].XBarSpacer=false;
    end
end

function XBarCore.SaveLoc(bar)
    local mod;

    mod=bar:GetName();
    if (mod) then
        if (not XBarCore.ModData[mod].loaded) then
            return;
        end

        local p,rt,rp,x,y=bar:GetPoint();
        XBarData[XBarCore.XBarOptionSet].mods[mod].x = x;
        XBarData[XBarCore.XBarOptionSet].mods[mod].y = y;
        XBarData[XBarCore.XBarOptionSet].mods[mod].rp = rp;
        XBarData[XBarCore.XBarOptionSet].mods[mod].pt = p;
    end
end

function XBarCore.SetPos(mod)
    if (not XBarCore.ModData[mod]) then
        return;
    end

    local bar=getfenv()[mod];
    local x = XBarData[XBarCore.XBarOptionSet].mods[mod].x;
    local y = XBarData[XBarCore.XBarOptionSet].mods[mod].y;
    local rp = XBarData[XBarCore.XBarOptionSet].mods[mod].rp;
    local p = XBarData[XBarCore.XBarOptionSet].mods[mod].pt;

    bar:ClearAllPoints();
    bar:SetPoint(p,nil,rp,x,y);
end

function XBarCore.SetTooltip()
    local bn=this:GetName();
    local pfn=this:GetParent():GetName();
    local a,v,id,t,d,r;

    if XBarCore.FrameDB[bn] == nil then
        XBarCore.FrameDB[bn] = {};
    end

    local toggle=XBarCore.FrameDB[bn].XBarToggle;
    if not toggle then
        a=XBarCore.FrameDB[bn].XBarAction;
        if XBarCore.ModData[pfn] and XBarCore.ModData[pfn].ActionList[a] then
            v=XBarCore.ModData[pfn].ActionList[a];
            id=v.Data[1].ID;
            t=v.ToolType;
            d=v.Tooltip;
            r=XBarData[XBarCore.XBarOptionSet].mods[pfn].tooltips;
        else
            r=nil;
        end
    else
        t=XBAR_TTEXT;
        d="\124cffff7f7fXBar:\124r \124cffffffff"..toggle.."\124r\n"..XBAR_TOGGLETEXT;
        r=XBarData[XBarCore.XBarOptionSet].mods[toggle].tooltips;
    end

    if not r then
        return;
    end

    if (t == XBAR_TTEXT) then
        GameTooltip_SetDefaultAnchor(GameTooltip, this);
        GameTooltip:SetText(d);
        GameTooltip:Show();
    elseif (t == XBAR_TSPELL) then
        if id~=nil then
            -- Do nothing if the spell does not exist (a pet died in combat and the body disappeared is the only time this should happen)
            GameTooltip_SetDefaultAnchor(GameTooltip, this);
            GameTooltip:SetSpell(id, v.Data[1].AuxData);
            GameTooltip:Show();
        end
    elseif (t == XBAR_TITEM) then
        GameTooltip_SetDefaultAnchor(GameTooltip, this);
        GameTooltip:SetText(d);
        GameTooltip:Show();
    elseif (t == XBAR_TCOMPANION) then
        GameTooltip_SetDefaultAnchor(GameTooltip, this);
        GameTooltip:SetHyperlink(d);
        GameTooltip:Show();
    end
end

function XBarCore.Scale(mod)
    local i,n,button;

    if (not XBarCore.ModData[mod].loaded) then
        return;
    end

    if InCombatLockdown() then
        return;
    end

    n=XBarCore.ModData[mod].nbuttons;
    if (n==nil) then
        return;
    end

    for i = 1,n do
        button = getfenv()[mod.."Button"..i];
        button:SetScale(XBarData[XBarCore.XBarOptionSet].mods[mod].scale);
    end
end

function XBarCore.ShowCount(mod,index,count,hidelow)
    local b=getfenv()[mod.."Button"..tostring(index).."Count"];
    local v=count;

    if (v>999) then
        v="*"
    elseif (v==hidelow) then
        v="";
    else
        v=tostring(v);
    end
    b:SetText(v);
end

function XBarCore.ShowHide(mod,state)
    local frame,frameheader;
    -- state=0: Toggle
    -- state=1: Hide
    -- state=2: Show
    if (not XBarCore.ModData[mod]) then
        return;
    end
    if (not XBarCore.ModData[mod].loaded) then
        return;
    end

    -- This function cannot be performed in combat.
    if (InCombatLockdown() == nil) then
        frame = getfenv()[mod];
        if (frame) then
            if(frame:IsVisible()) then
                if (state ~= 2) then
                    XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar=true;
                    frame:Hide(); --***
                end
            else
                if (state ~= 1) then
                    XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar=false;
                    frame:Show(); --***
                end
            end
        end
    end
end

function XBarCore.ShowText(mod,index,text)
    local b=getfenv()[mod.."Button"..tostring(index).."Count"];
    local t=text,l,s,p;

    l=strlen(t);
    -- Sizing chart
    if (l>2) then
        s=XBarData[XBarCore.XBarOptionSet].mods[mod].scale;
        if (s > 2.4) then
            if (s > 3.15) then
                -- 3.20 - 4.0 = 5
                p=5;
            else
                -- 2.45 - 3.15 = 4
                p=4;
            end
        else
            -- 0.5 - 2.4 = 3
            p=3;
        end
        t=strsub(n,1,p);
    end
    b:SetText(t);
end

function XBarCore.SlashHandler(msg)
    if (strfind(msg, "config")) then
        InterfaceOptionsFrame_OpenToCategory(XBarConfig);
    elseif (strfind(msg, "showhide")) then
        msg=strsub(msg,10);
        msg=XBarCore.ValidateModName(msg);
        if (msg ~= "") then
            --print(msg..XBAR_MSG1)
            XBarCore.ShowHide(msg,0);
        end
    elseif (strfind(msg, "show")) then
        msg=strsub(msg,6);
        msg=XBarCore.ValidateModName(msg);
        if (msg ~= "") then
            --print(msg..XBAR_MSG1)
            XBarCore.ShowHide(msg,2);
        end
    elseif (strfind(msg, "hide")) then
        msg=strsub(msg,6);
        msg=XBarCore.ValidateModName(msg);
        if (msg ~= "") then
            --print(msg..XBAR_MSG1)
            XBarCore.ShowHide(msg,1);
        end
    elseif (strfind(msg, "resetpos")) then
        msg=strsub(msg,10);
        msg=XBarCore.ValidateModName(msg);
        if (msg ~= "") then
            print(msg..XBAR_MSG6);
            XBarCore.ResetPos(msg);
        end
    elseif (strfind(msg, "resetmod")) then
        msg=strsub(msg,10);
        msg=XBarCore.ValidateModName(msg);
        if (msg ~= "") then
            XBarCore.ModData[msg].dbver = "reset";
            ReloadUI();
        end
    elseif (strfind(msg, "stopmoving")) then
        msg=strsub(msg,12);
        msg=XBarCore.ValidateModName(msg);
        if (msg ~= "") then
            print(msg..XBAR_MSG11)
            getfenv()[msg]:StopMovingOrSizing();
            if getfenv()[msg]:GetObjectType()=="Button" then
                getfenv()[msg]:RegisterForClicks("AnyUp");
            end
        end
    elseif (strfind(msg, "toggle")) then
        msg=strsub(msg,8);
        msg=XBarCore.ValidateModName(msg);
        if (msg ~= "") then
            if (XBarData[XBarCore.XBarOptionSet].mods[msg].toggle) then
                XBarData[XBarCore.XBarOptionSet].mods[msg].toggle=false;
            else
                XBarData[XBarCore.XBarOptionSet].mods[msg].toggle=true;
            end
            XBarCore.UpdateToggle(msg);
        end
    elseif (strfind(msg, "profile")) then
        msg=strsub(msg,9);
        if (msg=="") then
            InterfaceOptionsFrame_OpenToCategory(XBarOptionsProfiles);
        elseif (strfind(msg,"view")) then
            local i;
            local n=tonumber(XBarData.noptionsets);

            print("XBar Profiles:");
            for i=1,n do
                msg=tostring(i)..") ";
                if (XBarData[XBarCore.XBarPlayerName]==tostring(i)) then
                    msg=msg.."*";
                end
                msg=msg..XBarData["optionset"..tostring(i)];
                print(msg);
            end
        elseif (strfind(msg,"reset")) then
            local i;
            local e=false;
            local n=XBarData.noptionsets;

            msg=strsub(msg,7);
            i=tonumber(msg);
            if (i==nil) then
                e=true;
            elseif ((i<1) or (i>n)) then
                e=true;
            else
                -- Valid number, perform action
                msg=XBarData["optionset"..tostring(i)];
                if (msg ~= nil) and (msg ~= "") then
                    XBarData["optionset-"..msg]={
                        ["nmods"]=0,
                        ["mods"]={ },
                    };
                    ReloadUI();
                end
            end
            if (e) then
                print(XBAR_MSG7.."'"..msg.."'");
            end
        elseif (strfind(msg,"set")) then
            local i;
            local e=false;
            local n=XBarData.noptionsets;

            msg=strsub(msg,5);
            i=tonumber(msg);
            if (i==nil) then
                e=true;
            elseif ((i<1) or (i>n)) then
                e=true;
            else
                -- Valid number, perform action
                XBarData[XBarCore.XBarPlayerName]=tostring(i);
                ReloadUI();
            end
            if (e) then
                print(XBAR_MSG7.."'"..msg.."'");
            end
        elseif (strfind(msg,"delete")) then
            local i,t;
            local e=false;
            local n=tonumber(XBarData.noptionsets);

            msg=strsub(msg,8);
            i=tonumber(msg);
            msg=tostring(i);
            if (i==nil) then
                e=true;
            elseif ((i<2) or (i>n)) then
                e=true;
            elseif (XBarData[XBarCore.XBarPlayerName]==msg) then
                -- Can't delete our current set
                e=true;
            else
                t=XBarData["optionset"..i];
                XBarData["optionset-"..t]=nil;
                XBarData["optionset"..msg]=XBarData["optionset"..tostring(n)];
                XBarData["optionset"..tostring(n)]=nil;
                -- Valid number, perform action
                -- Whether last or not, players who are using it must use default now
                for x,v in pairs(XBarData) do
                    if ((x~="dbver") and (strsub(x,1,9)~="optionset") and (type(v)=="string")) then
                        -- By process of elimination, this has to be a player's option set
                        if (XBarData[x]==msg) then
                            XBarData[x]="1"; -- Found one that was set to this option set
                        end
                    end
                end

                -- If not the last one, overwrite
                if (i<n) then
                    -- Deleted and repointed, now clean up.
                    for x,v in pairs(XBarData) do
                        if ((x~="dbver") and (strsub(x,1,9)~="optionset") and (type(v)=="string")) then
                            -- By process of elimination, this has to be a player's option set
                            if (XBarData[x]==tostring(n)) then
                                XBarData[x]=msg; -- Found one that was set to this option set
                            end
                        end
                    end
                end

                XBarData.noptionsets=n-1;
            end
            if (e) then
                print(XBAR_MSG7.."'"..msg.."'");
            else
                print(XBAR_MSG10.."'"..t.."'");
            end
        elseif (strfind(msg,"new")) then
            msg=strtrim(strsub(msg,5));
            local i;
            local n=tonumber(XBarData.noptionsets);
            local f=false;

            -- make sure its not in there first
            for i=1,n do
                if (XBarData["optionset"..tostring(i)]==msg) then
                    print(XBAR_MSG7..msg);
                    f=true;
                end
            end
            if (msg=="") then
                f=true;
            end
            if (not f) then
                n=n+1;
                XBarData.noptionsets=n;
                XBarData["optionset"..tostring(n)]=msg;
                XBarData["optionset-"..msg]={
                    ["nmods"]=0,
                    ["mods"]={ },
                };
                print(XBAR_MSG8..msg..XBAR_MSG9..tostring(n));
            end
        end
    else
        InterfaceOptionsFrame_OpenToCategory(XBarOptionsParent);
    end
end

function XBarCore.Start()
    local resetdb=false;
    local i,n,m,on,os;

    if (XBarInitialized) then
        return; -- Only do this if we haven't done it yet
    end

    if (not XBarData) then
        resetdb=true;
    elseif (not XBarData[XBarCore.XBarOptionSet]) then
        resetdb=true;
    elseif (XBarData.dbver ~= dbver) then
        resetdb=true;
    end

    if (resetdb) then
        --Data structure not initialized for this player, so set one up
        XBarData={
            ["dbver"]=dbver;
            ["optionset-default"] = {};
            ["noptionsets"] = 1;
            ["optionset1"] = "default";
            [XBarCore.XBarPlayerName] = "1";
        };
        XBarData[XBarCore.XBarOptionSet]={
            ["nmods"]=0,     ---# of mods registered, names will be values of mod1, mod2, etc...
            ["mods"]={},     ---Collection of mod values
        };
    end

    -- Find the option set the player wants to use.
    on=XBarData[XBarCore.XBarPlayerName];
    if (on==nil) then
        XBarData[XBarCore.XBarPlayerName]="1";
        os="optionset-default";
    else
        -- Lets validate that option set
        n=XBarData.noptionsets;
        if ((tonumber(on)>n) or (tonumber(on)<1)) then
            print(XBAR_MSG7..tostring(on));
            on=1; -- reset to defaults
        end
        os="optionset-"..XBarData["optionset"..on];
    end

    XBarCore.XBarOptionSet=os;
    print(XBAR_MSG4..XBarCore.GetOptionSet());

    -- Initialize all saved mods to "not loaded"
    n=XBarData[XBarCore.XBarOptionSet].nmods;
    if (n>0) then
        for i=1,n do
            m=XBarData[XBarCore.XBarOptionSet]["mod"..i];
            if (XBarCore.ModData[m] ~= nil) then
                XBarCore.ModData[m].loaded=false;
            end
        end
    end
    XBarInitialized=true;
end

function XBarCore.Toggle()
    if not IsControlKeyDown() then
        local mod=this:GetName();
        local fi=getfenv()[mod.."Icon"];
        local f;

        if (fi:GetTexture()~=nil) then
            mod=strsub(mod,-1*strlen(mod),-13); -- cut off the appendix to find the corresponding bar
            f=getfenv()[mod];
            if f:IsVisible() then
                XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar=false;
            else
                XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar=true;
            end
        end
        XBarCore.UpdateToggle(mod);
    end
end

function XBarCore.Update(mod,forceupdate)
    XBarQ:Put(XBarCore.Queue,{"U",mod,forceupdate});
end

function XBarCore.UpdateBar(mod,forceupdate)
    local i,button,id,key,value,texture,n,action,skip,b,b1,b2;
    local bar=getfenv()[mod];
    local update=forceupdate; -- Flag to state whether the button's metadata needs to be updated (when the bars change)

    -- Exit this function if the buttons haven't been initialized yet.
    if (getfenv()[mod.."Button1"]==nil) then
        return;
    end
    if (XBarData[XBarCore.XBarOptionSet]) then
        -- This function cannot be performed in combat.
        if (InCombatLockdown() == nil) then
            i=XBarCore.ModData[mod].nbuttons;

            -- Initially hide all the buttons, just in case
            if (i~=nil) then
                for key=1,i do
                    button=getfenv()[mod.."Button"..key];
                    button:Hide();
                end
            end
            getfenv()[mod.."ButtonToggle"]:Show();
            XBarCore.UpdateToggle(mod);
            if (XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar) then
                bar:Hide();
            else
                bar:Show();
            end
        end

        -- Look for callback functions
        local f1=getfenv()[XBarCore.ModData[mod].ftexint];
        local f2=getfenv()[XBarCore.ModData[mod].fbuttoncb];
        local f3=getfenv()[XBarCore.ModData[mod].fbuttonid];
        local f4=getfenv()[XBarCore.ModData[mod].fattributecb];

        -- Keep track of which Button frame we are using
        i=0;
        for n,key in pairs(XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder) do
            -- Associate the Action with the button
            action=XBarCore.ModData[mod].ActionList[key]
            -- If we didn't show it last time and we're not in combat, lets update the list
            if action==nil then
                print("nil action: ",key);
            end
            if (not action.Shown) then
                update=true;
            end
            if (XBarCore.FrameDB[mod.."Button"..i+1]==nil) then
                XBarCore.FrameDB[mod.."Button"..i+1]={};
            end

            XBarCore.FrameDB[mod.."Button"..i+1].XBarAction = key;
            if ((action.Type==XBAR_TSPACER) and (i>0)) then
                -- Spacer
                XBarCore.FrameDB[mod.."Button"..i+1].XBarSpacer = true;
                XBarCore.FrameDB[mod.."Button"..i+1].XBarWrap = action.Data[1].Data;
            elseif (action.Type==XBAR_THEADER) then
                -- Menu header, just ignore
            elseif (action.Type==XBAR_TOPTION) then
                -- Menu option, just ignore
            elseif (action.Type ~= nil) then
                id = nil;
                if action.Data[1] then
                    -- Pull ID and Value from the first action for processing
                    id = action.Data[1].ID;
                    value = action.Data[1].Data;
                end

                -- Spell ID Callback
                if (f3~=nil) then
                    id=f3(id,value,mod);
                end

                -- Special case for items, cannot show/hide the button in combat, so we have to retain the last state
                -- Notice we're only doing this for ITEM type buttons, not MACRO type buttons with items in them
                if action.Type==XBAR_TITEM then
                    -- First, test the quantity
                    if not (XBarCore.EqCache[value] or XBarCore.InvCache[value]) then
                        -- We have none of it if we are here, so we need to hide it when we can
                        if action.Shown and not InCombatLockdown() then
                            -- If we showed it and are not in combat, lets get rid of it
                            id=nil;
                        elseif not action.Shown then
                            -- Hide it every time if it was hidden last time
                            id=nil;
                        end
                    else
                        -- It is here
                        if InCombatLockdown() and not action.Shown then
                            -- If it was hidden last time, lets keep it that way until the end of battle
                            id=nil;
                        end
                    end
                end

                if (id) then
                    i = i + 1;
                    button = getfenv()[mod.."Button"..i];

                    -- If this or a previous button had to be updated, lets do all the others
                    if (update and not InCombatLockdown()) then
                        button:SetAttribute("button*",nil);
                        button:SetAttribute("button1",nil);
                        button:SetAttribute("button2",nil);
                        button:SetAttribute("button3",nil);
                        button:SetAttribute("button4",nil);
                        button:SetAttribute("button5",nil);
                        button:SetAttribute("*unit*",nil);
                        button:SetAttribute("type", nil);
                        button:SetScript("PostClick",nil);

                        skip=false;
                        if (f4 ~= nil) then
                            -- If the user is handling the attributes themselves, then go for it.
                            skip=f4(mod,i,button,action);
                        end

                        -- Handle Bindings
                        b1=action.Binding;
                        if b1 then
                            getfenv()[mod.."Button"..i.."HotKey"]:SetText(action.Binding);
                            b=SetBindingClick(b1,mod.."Button"..i);
                        else
                            getfenv()[mod.."Button"..i.."HotKey"]:SetText("");
                        end

                        if (action.Type==XBAR_TSPELL) and (not skip)then
                            -- All buttons will use the same type
                            for b=1,#(action.Data) do
                                b1,b2=GetSpellAutocast(value,action.Data[b].AuxData);
                                if b1 then
                                    if b==1 then
                                        -- On buttons with auto-cast, override button handling, only handle 1st action
                                        button:SetAttribute("button1","type1");
                                        button:SetAttribute("type1","spell");
                                        button:SetAttribute("spell1",action.Data[b].Data);
                                        button:SetAttribute("button2","type2");
                                        button:SetAttribute("type2","macro");
                                        button:SetAttribute("macrotext2","/petautocasttoggle "..action.Data[b].Data);
                                    end
                                else
                                    if not action.Data[b].Buttons or (action.Data[b].Buttons=="0") then
                                        action.Data[b].Buttons="*";
                                    end

                                    b2=action.Data[b].Modifier;
                                    b1="";
                                    if b2 then
                                        if (strsub(b2,3,3)=="+") then
                                            b1=b1.."alt-";
                                        elseif (strsub(b2,3,3)=="*") then
                                            b1=b1.."lalt-";
                                        elseif (strsub(b2,3,3)=="%") then
                                            b1=b1.."ralt-";
                                        end
                                        if (strsub(b2,2,2)=="+") then
                                            b1=b1.."ctrl-";
                                        elseif (strsub(b2,2,2)=="*") then
                                            b1=b1.."lctrl-";
                                        elseif (strsub(b2,2,2)=="%") then
                                            b1=b1.."rctrl-";
                                        end
                                        if (strsub(b2,1,1)=="+") then
                                            b1=b1.."shift-";
                                        elseif (strsub(b2,1,1)=="*") then
                                            b1=b1.."lshift-";
                                        elseif (strsub(b2,1,1)=="%") then
                                            b1=b1.."rshift-";
                                        end
                                    end

                                    if not action.Data[b].IFF then
                                        action.Data[b].IFF="";
                                    elseif action.Data[b].IFF=="0" then
                                        action.Data[b].IFF="";
                                    elseif action.Data[b].IFF=="1" then
                                        action.Data[b].IFF="help";
                                    elseif action.Data[b].IFF=="2" then
                                        action.Data[b].IFF="harm";
                                    end

                                    if action.Data[b].IFF~="" then
                                        button:SetAttribute("*unit*","target");  -- Need to specify a unit for this to work.
                                        button:SetAttribute("*"..action.Data[b].IFF.."button"..action.Data[b].Buttons,action.Data[b].IFF.."ability"..action.Data[b].Buttons);
                                        button:SetAttribute("*type-"..action.Data[b].IFF.."ability"..action.Data[b].Buttons, "spell");
                                        button:SetAttribute(b1.."spell-"..action.Data[b].IFF.."ability"..action.Data[b].Buttons,action.Data[b].Data);
                                    else
                                        button:SetAttribute("button"..action.Data[b].Buttons,"type"..action.Data[b].Buttons);
                                        button:SetAttribute("type"..action.Data[b].Buttons, "spell");
                                        button:SetAttribute(b1.."spell"..action.Data[b].Buttons,action.Data[b].Data);
                                    end
                                end
                                button:SetAttribute("ctrl-spell2", ATTRIBUTE_NOOP);
                            end
                        elseif (action.Type==XBAR_TMACRO) then
                            button:SetAttribute("button*","type");
                            button:SetAttribute("type", "macro");
                            button:SetAttribute("macro*", value);
                            button:SetAttribute("ctrl-spell*", ATTRIBUTE_NOOP);
                        elseif (action.Type==XBAR_TITEM) then
                            button:SetAttribute("button*","type");
                            button:SetAttribute("type", "item");
                            button:SetAttribute("item*", value);
                            button:SetAttribute("ctrl-item*", ATTRIBUTE_NOOP);
                        elseif (action.Type==XBAR_TCOMPANION
                             or action.Type==XBAR_TEMOTE
                             or action.Type==XBAR_TCHAT
                             or action.Type==XBAR_TTRACKING
                             or action.Type==XBAR_TSPELLHAX
                            ) and (not skip) then
                            button:SetScript("PostClick",XBarCore.ClickHandler);
                            button:SetAttribute("spell*", nil);
                            button:SetAttribute("ctrl-spell*", nil);
                        end
                    end

                    texture = action.Texture;

                    -- Texture Callback
                    if (f1~=nil) then
                        texture=f1(mod,texture,value);
                    end
                    getfenv()[mod.."Button"..i.."Icon"]:SetTexture(texture);

                    -- These functions cannot be performed in combat.
                    if not InCombatLockdown() then
                        button:Show();
                        b1,b2=GetSpellAutocast(value,action.Data[1].AuxData);
                        if b1 then
                            getfenv()[mod.."Button"..i.."AutoCastable"]:Show();
                            XBarAutoCastUpdating=true;
                            if b2 then
                                AutoCastShine_AutoCastStart(getfenv()[mod.."Button"..i.."AutoCast"]);
                            else
                                AutoCastShine_AutoCastStop(getfenv()[mod.."Button"..i.."AutoCast"]);
                            end
                            XBarAutoCastUpdating=false;
                        else
                            getfenv()[mod.."Button"..i.."AutoCastable"]:Hide();
                        end
                        action.Shown=true;
                    end

                    -- Button Callback
                    if (f2~=nil) then
                        f2(button,value,i,mod);
                    end

                    if not InCombatLockdown() then
                        button:SetScale(XBarData[XBarCore.XBarOptionSet].mods[mod].scale);
                    end
                    XBarBF_Skin(mod,button); -- Initialize the ButtonFacade skins
                else
                    -- Not showing the action, lets mark it as such
                    action.Shown = false;
                end
            end
        end
        XBarCore.Orient(mod);
        XBarCore.UpdateCooldowns(mod);

        -- This function cannot be performed in combat.
        if ((i == 0) and (InCombatLockdown() == nil)) then
            bar:Hide();
            getfenv()[mod.."ButtonToggle"]:Hide();
        end
        if not (InCombatLockdown() or XBarData[XBarCore.XBarOptionSet].mods[mod].toggle) then
            getfenv()[mod.."ButtonToggle"]:Hide();
        end
    end
end

function XBarCore.UpdateInventory()
    local nslots,b,s,n,c,r,_,i,p;

    XBarCore.InvCache={}; -- Clear it out
    XBarCore.EqCache={}; -- Clear it out

    for b=0,4 do
        nslots=GetContainerNumSlots(b);
        for s=1,nslots do
            _,c=GetContainerItemInfo(b,s);
            n=GetContainerItemLink(b,s);
            if (n) then
                p=strfind(n,"[",1,true);
                if (p) then
                    itemname=strsub(n,p+1,-6)
                    r=XBarCore.InvCache[itemname];
                    if (r==nil) then
                        r=0;
                    end
                    XBarCore.InvCache[itemname]=r+c;
                end
            end
        end
    end

    -- Now check to see if they're wearing it
    for b=0,23 do
        n=GetInventoryItemLink("player",b);
        if (n) then
            p=strfind(n,"[",1,true);
            if (p) then
                itemname=strsub(n,p+1,-6)
                r=XBarCore.InvCache[itemname];
                if (r==nil) then
                    r=0;
                end
                XBarCore.InvCache[itemname]=r+1;
                XBarCore.EqCache[itemname]=true;
            end
        end
    end
end

function XBarCore.UpdateToggle(mod)
    local i,b,t;

    if (XBarCore.ModData[mod]) then
        if XBarCore.ModData[mod].loaded then
            i=getfenv()[mod.."ButtonToggleIcon"];
            b=getfenv()[mod];
            if b:IsVisible() then
                t="Interface\\AddOns\\XBar\\xbarminus";
            else
                t="Interface\\AddOns\\XBar\\xbarplus";
            end
            if (XBarData[XBarCore.XBarOptionSet].mods[mod].toggle) then
                if not InCombatLockdown() then
                    getfenv()[mod.."ButtonToggle"]:Show();
                end
            else
                if not InCombatLockdown() then
                    getfenv()[mod.."ButtonToggle"]:Hide();
                end
                t="";
            end
            i:SetTexture(t);
        end
    end
end

function XBarCore.UpdateCooldowns(mod)
    local i,bi,a,v,id,cd,f1,f2,cooldown,start,duration,enable,texture,bnt;

    if (not XBarCore.ModData[mod].loaded) then
        return;
    end

    local n=XBarCore.ModData[mod].nbuttons;
    if (n==nil) then
        return;
    end

    for i = 1, n do
        bi=getfenv()[mod.."Button"..i.."Icon"];
        bnt=getfenv()[mod.."Button"..i.."NormalTexture"];
        a=XBarCore.FrameDB[mod.."Button"..i].XBarAction;
        if (not XBarCore.ModData[mod].ActionList[a]) then
            break;
        end

        v=XBarCore.ModData[mod].ActionList[a];
        if (v.ToolType==XBAR_TSPELL) then
            -- Pulling the cooldown info from the tooltip, since that's what we want to show anyway
            id=v.Data[1].ID;
            texture = v.Texture;
            a=v;
            v=v.Tooltip;
            if (v) then
                f2=getfenv()[XBarCore.ModData[mod].fbuttoncb];
                if (f2~=nil) then
                    f2(getfenv()[mod.."Button"..i],v,i,mod);
                end

                -- Notice we only call the texture interceptor if its a spell
                f1=getfenv()[XBarCore.ModData[mod].ftexint];
                -- Call texture interceptor if it is there
                if (f1~=nil) then
                    texture=f1(mod,texture,v,i);
                end

                -- Range check
                cd="playertarget";
                if not (UnitExists(cd) and UnitIsVisible(cd)) then
                    cd="player";
                end

                bi:SetTexture(texture);
                start,duration=IsUsableSpell(v)

                if start and SpellHasRange(v) then
                    -- If it has a range, it can be cast on a unit.
                    cooldown=IsSpellInRange(v,cd);
                    if cooldown ~= nil then
                        start=cooldown;
                    end
                end
                if start==0 then
                    start=nil;
                end
                if (start) then
                    bi:SetVertexColor(1.0, 1.0, 1.0);
                    bnt:SetVertexColor(1.0, 1.0, 1.0);
                elseif (duration) then
                    bi:SetVertexColor(0.5, 0.5, 1.0);
                    bnt:SetVertexColor(0.5, 0.5, 1.0);
                else
                    bi:SetVertexColor(0.4, 0.4, 0.4);
                    bnt:SetVertexColor(1.0, 1.0, 1.0);
                end

                start,duration=GetSpellAutocast(a.Data[1].Data,a.Data[1].AuxData);
                if start then
                    getfenv()[mod.."Button"..i.."AutoCastable"]:Show();
                    XBarAutoCastUpdating=true;
                    if duration then
                        AutoCastShine_AutoCastStart(getfenv()[mod.."Button"..i.."AutoCast"]);
                    else
                        AutoCastShine_AutoCastStop(getfenv()[mod.."Button"..i.."AutoCast"]);
                    end
                    XBarAutoCastUpdating=false;
                else
                    getfenv()[mod.."Button"..i.."AutoCastable"]:Hide();
                end
            end
            cd="S";
            id=tostring(id);
        elseif (v.ToolType==XBAR_TCOMPANION) then
            --/script print(XBarCore.GetCompanionInfo("MOUNT","Swift Stormsaber"));
            -- Companions are like spells, but with less things to check
            id=v.Data[1].ID;
            texture = v.Texture;
            a=v;
            v=v.Tooltip;
            if (v) and type(v)=="string" and strsub(v,1,6)=="spell:" then
                v=a.Data[1].Data;
                id=tonumber(strsub(a.Tooltip,7));
            else
                v=nil;
            end
            cd=nil;
            if (v) then
                f2=getfenv()[XBarCore.ModData[mod].fbuttoncb];
                if (f2~=nil) then
                    f2(getfenv()[mod.."Button"..i],v,i,mod);
                end

                f1=getfenv()[XBarCore.ModData[mod].ftexint];
                -- Call texture interceptor if it is there
                if (f1~=nil) then
                    texture=f1(mod,texture,v,i);
                end

                bi:SetTexture(texture);
                cd="S";
            end
        elseif (v.ToolType==XBAR_TITEM) then
            f2=getfenv()[XBarCore.ModData[mod].fbuttoncb];
            if (f2~=nil) then
                f2(getfenv()[mod.."Button"..i],v,i,mod);
            end
            v=v.Data[1].Data;
            cd="I";
        elseif (v.Type==XBAR_TTRACKING) then
            texture = v.Texture;

            f1=getfenv()[XBarCore.ModData[mod].ftexint];
            if (f1~=nil) then
                texture=f1(mod,texture,value);
            end
            bi:SetTexture(texture);
            cd=nil;
        else
            cd=nil;
        end

        if cd then
            -- Make sure we have a cooldown on this frame.
            start=0;
            duration=0;
            enable=1;
            if cd=="I" then
                start, duration, enable = GetItemCooldown(v);
            elseif cd == "S" then
                start, duration, enable = GetSpellCooldown(v);
            end
            cooldown = getfenv()[mod.."Button"..i.."Cooldown"];
            if (start ~= nil) and (duration ~= nil) and (enable ~= nil) and
               (start > 0) and (duration > 0) then
                -- Save the start time so we don't trigger this more than once
                if (not XBarCore.FrameDB[mod.."Button"..i]) then
                    XBarCore.FrameDB[mod.."Button"..i] = {};
                end
                if not XBarCore.FrameDB[mod.."Button"..i].StartCD then
                    XBarCore.FrameDB[mod.."Button"..i].StartCD=start;
                else
                    if XBarCore.FrameDB[mod.."Button"..i].StartCD == start then
                        -- Don't show this more than once.
                        start=nil;
                    else
                        XBarCore.FrameDB[mod.."Button"..i].StartCD = start;
                    end
                end
                if start and start>0 then
                    CooldownFrame_SetTimer(cooldown, start, duration, enable);
                end
            end
        end
    end
end

function XBarCore.ValidateModName(mod)
    local n=XBarData[XBarCore.XBarOptionSet].nmods;
    local v=false;
    local s1=strlower(strtrim(mod));
    local s2;

    for i=1,n do
        s2=XBarData[XBarCore.XBarOptionSet]["mod"..i];
        if (strlower(s2)==s1) then
            return s2;
        end
    end
    return "";
end

--==XBAR LOADER FUNCTIONS==--

local XBarLoaderFirstTime = true;

function XBarLoader.OnEvent()
    local i,v,f;

    if XBarQ==nil then
        return
    end

    if (event == "PLAYER_ENTERING_WORLD") then
        if XBarLoaderFirstTime then
            -- Find the player name and save it
            XBarCore.BuildPlayerName();
            -- Clean up the list we used for localization (frees up a lot of memory)
            XBarCore.UpdateInventory();
            XBarCore.Start();
            XBarLoaderFirstTime=false;
        else
            XBarQ:CreateDelay("XBarBagUp",0.5,XBarLoader.BagUpdate,nil,false,true,true);
        end
    elseif (event == "BAG_UPDATE") then
        XBarQ:CreateDelay("XBarBagUp",0.5,XBarLoader.BagUpdate,nil,false,true,true);
    end
end

function XBarLoader.BagUpdate()
    local i,v,f;
    -- We're updating in this frame to reduce calls to the inventory update function
    XBarCore.UpdateInventory();
    for i,v in pairs(XBarLoader.Notify) do
        f=getfenv()[v];
        if f~=nil then
            f(i,"BAG_UPDATE",arg1);
        end
    end
end

function XBarLoader.OnLoad()
    if (LibStub == nil) or (LibQueue == nil) then
        print(XBAR_MSG12);
    else
        XBarQ = LibStub("LibQueue-1.0", true);
        if (XBarQ and XBarQ:CreateQueue(XBarCore.Queue,50,false,false,false)) then
            this:RegisterEvent("PLAYER_ENTERING_WORLD");
            this:RegisterEvent("BAG_UPDATE");

            XBarQ:CreateTimer("XBarExe",0.1,XBarCore.ExeQueue,nil,false,true);
            SlashCmdList.XBAR = function(msg)
                XBarCore.SlashHandler(string.lower(msg));
            end
        else
            print(XBAR_MSG13);
        end
    end
end

function XBarLoader.NotifyBagUpdates(mod,func)
    XBarLoader.Notify[mod]=func;
end

--==XBAR CONFIG FUNCTIONS==--

function XBarBindGUI.BtnBind_OnClick()
    local a=XBarBindGUI.Action;
    local mod=XBarConfigCurMod:GetText();
    local v;

    if (XBarBindGUI.Action == nil) or (XBarBindGUI.IsBinding) then
        return;
    end

    if (a~=nil) then
        a=XBarCore.ModData[mod].ActionList[a];
        if a==nil then
            return;
        end
    end

    XBarBindBtnBind:EnableKeyboard(true)
    XBarBindGUI.IsBinding=true;
    XBarBindKey:SetText(XBAR_BINDWAIT);
end

function XBarBindGUI.BtnBind_OnMouseDown(this,button)
    if button == "LeftButton" or button == "RightButton" then
        return;
    elseif button == "MiddleButton" then
        button = "BUTTON3";
    elseif button == "Button4" then
        button = "BUTTON4";
    elseif button == "Button5" then
        button = "BUTTON5";
    end
    XBarBindGUI.SetBinding(button);
end

function XBarBindGUI.BtnBind_OnKeyDown(this,key)
    if (key=="LSHIFT" or key=="RSHIFT" or
        key=="LCTRL" or key=="RCTRL" or
        key=="LALT" or key=="RALT") then
        return;
    else
        XBarBindGUI.SetBinding(key);
    end
end

function XBarBindGUI.BtnClose_OnClick()
    XBarBindBtnBind:EnableKeyboard(false)
    XBarBindGUI.IsBinding=false;
    if not InCombatLockdown() then
        XBarBind:Hide();
    end
end

function XBarBindGUI.Catenate(...)
    local k,n,i,v;

    n=select("#",...);
    k={};
    for i=1,n do
        v=select(i, ...);
        tinsert(k,v);
    end

    return k;
end

function XBarBindGUI.OnShow()
    local a=XBarBindGUI.Action;
    local mod=XBarConfigCurMod:GetText();

    XBarBindGUI.IsBinding = false;
    if (a~=nil) then
        a=XBarCore.ModData[mod].ActionList[a];
        if a==nil then
            return;
        end
        if a.Binding==nil then
            XBarBindKey:SetText(NOT_BOUND);
        else
            XBarBindKey:SetText(a.Binding);
        end
        XBarBindBtnBind:EnableKeyboard(false)
    end
end

function XBarBindGUI.SetBinding(key)
    local a=XBarBindGUI.Action;
    local mod=XBarConfigCurMod:GetText();
    local v,n,b,c,kn,ki;

    if (XBarBindGUI.Action == nil) or (not XBarBindGUI.IsBinding) then
        return;
    end

    if (a~=nil) then
        a=XBarCore.ModData[mod].ActionList[a];
        if a==nil then
            return;
        end
    end

    if XBarData[XBarCore.XBarOptionSet].mods[mod].Bindings == nil then
        XBarData[XBarCore.XBarOptionSet].mods[mod].Bindings = { };
    end

    if key=="ESCAPE" then
        XBarData[XBarCore.XBarOptionSet].mods[mod].Bindings[a.Data[1].Data]=nil;
        a.Binding=nil;
        XBarBindKey:SetText(NOT_BOUND);
    else
        v=key;
        if IsShiftKeyDown() then
            v="SHIFT-"..v;
        end
        if IsControlKeyDown() then
            v="CTRL-"..v;
        end
        if IsAltKeyDown() then
            v="ALT-"..v;
        end
        n=GetNumBindings();
        if n and n>0 then
            for b=1,n do
                c=XBarBindGUI.Catenate(GetBinding(b));
                kn=#(c);
                for ki=2,kn do
                    if c[ki]==v then
                        --Exists, abort
                        print(XBAR_BINDERR..c[1]);
                        return;
                    end
                end
                c={}; -- Extra cleanup
            end
        end
        XBarData[XBarCore.XBarOptionSet].mods[mod].Bindings[a.Data[1].Data]=v;
        a.Binding=v;
        XBarBindKey:SetText(v);
    end
    XBarBindBtnBind:EnableKeyboard(false)
    XBarBindGUI.IsBinding=false;
    XBarCore.Update(mod,true);
end

function XBarConfigGUI.BtnHelp_OnClick(context)
    if context==nil then
        context=XBarConfigCurMod:GetText();
        if (not context) or (not XBarData[XBarCore.XBarOptionSet]) or (not XBarData[XBarCore.XBarOptionSet].mods[context]) then
            context="CONFIG";
        end
    end
    if not InCombatLockdown() then
        if XBarHelp:IsVisible() and XBarHelpGUI.Context==context then
            XBarHelp:Hide();
        else
            if type(context)=="string" then
                XBarHelpGUI.Context=context;
                XBarHelp:Show();
            end
        end
    end
end

function XBarConfigGUI.CheckButtonH_OnClick()
    local mod=XBarConfigCurMod:GetText();

    if (this:GetChecked()) then
        XBarData[XBarCore.XBarOptionSet].mods[mod].horizontal = true;
    else
        XBarData[XBarCore.XBarOptionSet].mods[mod].horizontal = false;
    end
    XBarCore.Orient(mod);
end

function XBarConfigGUI.CheckButtonL_OnClick()
    local mod=XBarConfigCurMod:GetText();

    if (this:GetChecked()) then
        XBarData[XBarCore.XBarOptionSet].mods[mod].nohighlight = false;
    else
        XBarData[XBarCore.XBarOptionSet].mods[mod].nohighlight = true;
    end
    XBarCore.Update(mod);
end

function XBarConfigGUI.CheckButtonO_OnClick()
    local mod=XBarConfigCurMod:GetText();

    if (this:GetChecked()) then
        XBarData[XBarCore.XBarOptionSet].mods[mod].order = "za";
    else
        XBarData[XBarCore.XBarOptionSet].mods[mod].order = "az";
    end
    XBarCore.Orient(mod);
end

function XBarConfigGUI.CheckButtonTG_OnClick(mod)
    local mod=XBarConfigCurMod:GetText();

    if (this:GetChecked()) then
        XBarData[XBarCore.XBarOptionSet].mods[mod].toggle = true;
    else
        XBarData[XBarCore.XBarOptionSet].mods[mod].toggle = false;
    end
    XBarCore.UpdateToggle(mod);
end

function XBarConfigGUI.CheckButtonTT_OnClick(mod)
    local mod=XBarConfigCurMod:GetText();

    if (this:GetChecked()) then
        XBarData[XBarCore.XBarOptionSet].mods[mod].tooltips = true;
    else
        XBarData[XBarCore.XBarOptionSet].mods[mod].tooltips = false;
    end
end

function XBarConfigGUI.CheckButtonV_OnClick()
    local mod=XBarConfigCurMod:GetText();
    local bar=getfenv()[mod];

    if not InCombatLockdown() then
        if (this:GetChecked()) then
            XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar=false;
            XBarCore.ShowHide(mod,2);
        else
            XBarData[XBarCore.XBarOptionSet].mods[mod].hidebar=true;
            XBarCore.ShowHide(mod,1);
        end
    end
end

function XBarConfigGUI.CheckButtonW_OnClick(mod)
    local mod=XBarConfigCurMod:GetText();

    if (this:GetChecked()) then
        XBarData[XBarCore.XBarOptionSet].mods[mod].wrapbar = true;
    else
        XBarData[XBarCore.XBarOptionSet].mods[mod].wrapbar = false;
    end
    XBarCore.Orient(mod);
end

function XBarConfigGUI.CheckMenu_OnClick()
    UIDropDownMenu_Initialize(XBarConfigCheckMenuFrame, XBarConfigGUI.CheckMenuFrame_OnLoad);
    ToggleDropDownMenu(1, nil, XBarConfigCheckMenuFrame, XBarConfigCheckMenu, 0, 0);
end

function XBarConfigGUI.CheckMenu_Select()
    local mod=XBarConfigCurMod:GetText();
    local v;
    local c=XBarCore.ModData[mod]["check"..this.value];

    if XBarData[XBarCore.XBarOptionSet]["mods"][mod].Options==nil then
        XBarData[XBarCore.XBarOptionSet]["mods"][mod].Options={ };
    end

    if (this.checked) then
        v=false;
    else
        v=true;
    end

    XBarData[XBarCore.XBarOptionSet].mods[mod].Options[c]=v;
    local f=getfenv()[XBarCore.ModData[mod].foptioncb];

    if (f~=nil) then
        f(c,v,mod);
    end
end

function XBarConfigGUI.CheckMenuFrame_OnLoad(menuframe,level)
    -- Loading off the click event from the button itself so we can make sure the data is there.
    -- Reinitializes every time we click the button.
    local info = UIDropDownMenu_CreateInfo();
    local n,i,mod;
    local menukey=nil;

    mod=XBarConfigCurMod:GetText();

    n=XBarCore.ModData[mod].nchecks;
    for i=1,n do
        info.text = XBarCore.ModData[mod]["check"..i];
        info.func = XBarConfigGUI.CheckMenu_Select;
        info.owner = this:GetParent();
        info.hasArrow=false;
        info.notCheckable=false;
        info.disabled=false;
        if (info.text == "") then
            -- Its probably a menu
            info.func=nil;
            info.text = XBarCore.ModData[mod]["mcheck"..i];
            info.value = info.text;
            if (info.text ~= nil) then
                menukey=info.text;
                info.hasArrow=true;
                info.notCheckable=true;
                info.checked=false;
                if (level==1) then
                    -- Always add the menu if it's the first one.
                    UIDropDownMenu_AddButton(info,1);
                end
            end
        elseif (info.text ~= nil) then
            -- Only put something here if we need.
            info.value = i;
            info.checked=XBarData[XBarCore.XBarOptionSet].mods[mod].Options[info.text];
            if ((level==2) and (menukey==UIDROPDOWNMENU_MENU_VALUE)) then
                UIDropDownMenu_AddButton(info,2);
            elseif ((level==1) and (menukey==nil)) then
                --haven't encountered any dropdown menus yet
                UIDropDownMenu_AddButton(info,1);
            end
        end
    end
    XBarCore.FixMenu(level);
end

function XBarConfigGUI.ModMenu_OnClick()
    UIDropDownMenu_Initialize(XBarConfigModMenuFrame, XBarConfigGUI.ModMenuFrame_OnLoad);
    ToggleDropDownMenu(1, nil, XBarConfigModMenuFrame, XBarConfigModMenu, 0, 0);
end

function XBarConfigGUI.ModMenu_Select()
    local mod=this.value;
    XBarConfigCurMod:SetText(mod);

    if (InCombatLockdown()) then
        return; -- can't do this in combat
    end

    XBarConfigCheckButtonH:Show();
    XBarConfigCheckButtonH:SetChecked(XBarData[XBarCore.XBarOptionSet].mods[mod].horizontal);

    XBarConfigCheckButtonO:Show();
    XBarConfigCheckButtonO:SetChecked(XBarData[XBarCore.XBarOptionSet].mods[mod].order=="za");

    XBarConfigCheckButtonV:Show();
    XBarConfigCheckButtonV:SetChecked(getfenv()[mod]:IsVisible());

    XBarConfigCheckButtonTG:Show();
    XBarConfigCheckButtonTG:SetChecked(getfenv()[mod.."ButtonToggleIcon"]:GetTexture()~=nil);

    XBarConfigCheckButtonL:Show();
    XBarConfigCheckButtonL:SetChecked(not XBarData[XBarCore.XBarOptionSet].mods[mod].nohighlight);

    -- Only show if the author did not disable tooltips in the addon
    if (XBarCore.ModData[mod].dtooltips) then
        XBarConfigCheckButtonTT:Show();
        XBarConfigCheckButtonTT:SetChecked(XBarData[XBarCore.XBarOptionSet].mods[mod].tooltips);
    else
        XBarConfigCheckButtonTT:Hide();
    end

    -- Only show if the author did not disable wrapping in the addon
    if (XBarCore.ModData[mod].wrappable) then
        XBarConfigCheckButtonW:Show();
        XBarConfigCheckButtonW:SetChecked(XBarData[XBarCore.XBarOptionSet].mods[mod].wrapbar);
    else
        XBarConfigCheckButtonW:Hide();
    end

    XBarConfigSliderScale:Show();
    XBarConfigSliderScale:SetValue(XBarData[XBarCore.XBarOptionSet].mods[mod].scale);

    -- Show custom checkbox options
    if (XBarCore.ModData[mod].nchecks>0) then
        XBarConfigCurCheck:Show();
        XBarConfigCheckMenu:Show();
        XBarConfigCurCheck:SetText(XBAR_SELOPTION);
    else
        XBarConfigCurCheck:Hide();
        XBarConfigCheckMenu:Hide();
    end

    -- Only show if the author did not disable sorting in the addon
    if (XBarCore.ModData[mod].sortable) then
        XBarConfigSortUp:Show();
        XBarConfigSortDown:Show();
        XBarConfigScrollOrder:Show();
        XBarConfigNoSort:Hide();
        XBarCore.FrameDB.XBarConfigScrollOrder.XBarCur=nil;
        XBarConfigGUI_ScrollOrder_OnScroll()
    else
        XBarConfigNoSort:Show();
        XBarConfigNoSort:SetWidth(150);
        XBarConfigNoSort:SetHeight(100);
        XBarConfigNoSort:SetText(XBAR_SORTDISABLE);
        XBarConfigSortUp:Hide();
        XBarConfigSortDown:Hide();
        XBarConfigScrollOrder:Hide();
    end

    if not XBarCore.ModData[mod]["nsliders"] then
        XBarCore.ModData[mod]["nsliders"]=0;
    end
    if (XBarCore.ModData[mod]["nsliders"]>0) then
        XBarConfigCurSlider:Show();
        XBarConfigSliderMenu:Show();
        XBarConfigCurSlider:SetText(XBAR_SELOPTION);
    else
        XBarConfigCurSlider:Hide();
        XBarConfigSliderMenu:Hide();
        XBarConfigSliderMulti:Hide()
    end
    XBarConfigBtnHelp:SetText(mod.." "..XBAR_HELP_TITLE);
end

function XBarConfigGUI.ModMenuFrame_OnLoad(menuframe,level)
    -- Loading off the click event from the button itself so we can make sure the data is there.
    -- Reinitializes every time we click the button.
    local info = UIDropDownMenu_CreateInfo();
    local n,i,mod,t,v;

    t=XBarCore.FrameDB.XBarConfig.ModList;
    n=#(t);
    for i=1,n do
        v=t[i];
        mod=XBarData[XBarCore.XBarOptionSet]["mod"..v];
        info.text = mod;
        info.notCheckable=true;
        info.value = mod;
        info.func = XBarConfigGUI.ModMenu_Select;
        info.owner = this:GetParent();
        UIDropDownMenu_AddButton(info);
    end
end

function XBarConfigGUI.OnLoad()
    XBarOptionsParent.name="XBar";
    XBarOptionsParent.parent=nil;
    XBarOptionsParent.okay=nil;
    XBarOptionsParent.cancel=nil;
    XBarOptionsParent.defaults=nil;
    InterfaceOptions_AddCategory(XBarOptionsParent);

    XBarCmdLineOptions.name="Commands";
    XBarCmdLineOptions.parent="XBar";
    XBarCmdLineOptions.okay=nil;
    XBarCmdLineOptions.cancel=nil;
    XBarCmdLineOptions.defaults=nil;
    InterfaceOptions_AddCategory(XBarCmdLineOptions);

    XBarConfig.name="Bar Settings";
    XBarConfig.parent="XBar";
    XBarConfig.okay=nil;
    XBarConfig.cancel=nil;
    XBarConfig.defaults=nil;
    InterfaceOptions_AddCategory(XBarConfig);

    XBarOptionsProfiles.name="Profiles";
    XBarOptionsProfiles.parent="XBar";
    XBarOptionsProfiles.okay=nil;
    XBarOptionsProfiles.cancel=nil;
    XBarOptionsProfiles.defaults=nil;
    InterfaceOptions_AddCategory(XBarOptionsProfiles);

    XBarOptionsParentSubText:SetHeight(350);
end

function XBarConfigGUI.OnShow()
    local i,n,mod,t,v;

    if (not XBarData) then
        this:Hide();
        return;
    end
    if (not XBarData[XBarCore.XBarOptionSet]) then
        this:Hide();
        return;
    end

    n=XBarData[XBarCore.XBarOptionSet].nmods;
    if (n==nil) then
        this:Hide();
        return;
    end

    XBarConfigGUI.ScrollOrder_Initialize();

    -- Initialize select fields to nothing
    if XBarCore.FrameDB.XBarConfig == nil then
        XBarCore.FrameDB.XBarConfig = {};
    end

    -- Start with all fields hidden
    XBarConfigCheckButtonH:Hide();
    XBarConfigCheckButtonL:Hide();
    XBarConfigCheckButtonO:Hide();
    XBarConfigCheckButtonV:Hide();
    XBarConfigCheckButtonTT:Hide();
    XBarConfigCheckButtonTG:Hide();
    XBarConfigSliderScale:Hide();
    XBarConfigCurCheck:Hide();
    XBarConfigCheckMenu:Hide();
    XBarConfigCheckButtonW:Hide();
    XBarConfigScrollOrder:Hide();
    XBarConfigSortUp:Hide();
    XBarConfigSortDown:Hide();
    XBarConfigNoSort:Hide();
    XBarConfigSetBinding:Hide();
    XBarConfigCurSlider:Hide();
    XBarConfigSliderMenu:Hide();
    XBarConfigSliderMulti:Hide();

    -- Search for loaded mods and sort the list
    t={};
    for i=1,n do
        mod=XBarData[XBarCore.XBarOptionSet]["mod"..i];
        if (XBarCore.ModData[mod]) and (XBarCore.ModData[mod].loaded) then
            t[i]=mod..","..tostring(i);
        else
            t[i]=" "; -- Space is alphabetically before any valid character the mods can start with
        end
    end
    sort(t);
    if not (XBarCore.FrameDB.XBarConfig) then
        XBarCore.FrameDB.XBarConfig={};
    end
    XBarCore.FrameDB.XBarConfig.ModList={};
    for i=1,n do
        if t[i]~=" " then
            v=strfind(t[i],",");
            if (v) then
                v=strsub(t[i],v+1);
                tinsert(XBarCore.FrameDB.XBarConfig.ModList,v);
            end
        end
    end

    --Tell user whether we have anything installed or not.
    if #(XBarCore.FrameDB.XBarConfig.ModList) == 0 then
        -- No data, display an error message
        XBarConfigCurMod:SetText(XBAR_NOMOD);
        XBarConfigModMenu:Hide();
    else
        XBarConfigCurMod:SetText(XBAR_SELMOD);
        XBarConfigModMenu:Show();
    end

    -- Reset the action index
    XBarBindGUI.Action = nil;
    XBarConfigBtnHelp:SetText(XBAR_HELP_TITLE);
end

-- I don't feel like re-writing the slash command handlers into functions, so I'm just gonna call it from the window
function XBarConfigGUI.ProfileBtnDel_OnClick()
    local p=XBarCore.FrameDB.XBarOptionsProfilesCurProfile;

    XBarCore.SlashHandler("profiles delete "..tostring(p))
    -- Reset the GUI window
    XBarConfigGUI.ProfileShow();
end

function XBarConfigGUI.ProfileBtnNew_OnClick()
    local t=XBarOptionsProfilesNewProfile:GetText();
    t=gsub(t,"[^%w]","");
    XBarOptionsProfilesNewProfile:SetText(t);

    XBarCore.SlashHandler("profiles new "..t)
end

function XBarConfigGUI.ProfileBtnUse_OnClick()
    local p=XBarCore.FrameDB.XBarOptionsProfilesCurProfile;

    XBarCore.SlashHandler("profiles set "..tostring(p))
end

function XBarConfigGUI.ProfileShow()
    local c=tostring(XBarData[XBarCore.XBarPlayerName]);
    local p=XBarData["optionset"..c];
    XBarOptionsProfilesCurProfile:SetText(p);
    XBarCore.FrameDB.XBarOptionsProfilesCurProfile = c;
    -- Del will be disabled regardless, you can't delete your own or default
    XBarOptionsProfilesBtnDel:Disable();
end

function XBarConfigGUI.ProfileMenu_OnClick()
    UIDropDownMenu_Initialize(XBarOptionsProfilesProfileMenuFrame, XBarConfigGUI.ProfileMenuFrame_OnLoad);
    ToggleDropDownMenu(1, nil, XBarOptionsProfilesProfileMenuFrame, XBarOptionsProfilesProfileMenu, 0, 0);
end

function XBarConfigGUI.ProfileMenu_Select()
    local p=tostring(this.value);
    local v=XBarData["optionset"..p];
    XBarOptionsProfilesCurProfile:SetText(v);
    XBarCore.FrameDB.XBarOptionsProfilesCurProfile = p;

    if (v=="default") or (p==XBarData[XBarCore.XBarPlayerName]) then
        XBarOptionsProfilesBtnDel:Disable();
    else
        XBarOptionsProfilesBtnDel:Enable();
    end
end

function XBarConfigGUI.ProfileMenuFrame_OnLoad(menuframe,level)
    -- Loading off the click event from the button itself so we can make sure the data is there.
    -- Reinitializes every time we click the button.
    local info = UIDropDownMenu_CreateInfo();
    local t,i,v;
    local n=tonumber(XBarData.noptionsets);

    for i=1,n do
        t=XBarData["optionset"..tostring(i)];
        if t~=nil then
            info.text = t;
            info.notCheckable=true;
            info.value = i;
            info.func = XBarConfigGUI.ProfileMenu_Select;
            info.owner = this:GetParent();
            UIDropDownMenu_AddButton(info);
        end
    end
end

function XBarConfigGUI.SetBinding_OnClick()
    if (not InCombatLockdown()) and (XBarBindGUI.Action ~= nil) then
        XBarBind:Show();
    end
end

function XBarConfigGUI.ScrollOrder_Initialize()
    if XBarCore.FrameDB.XBarConfigScrollOrder == nil then
        XBarCore.FrameDB.XBarConfigScrollOrder = {};
    end
    XBarCore.FrameDB.XBarConfigScrollOrder.XBarOnScroll="XBarConfigGUI_ScrollOrder_OnScroll";
    XBarCore.FrameDB.XBarConfigScrollOrder.XBarOnClick="XBarConfigGUI_ScrollOrder_OnClick";
end

function XBarConfigGUI_ScrollOrder_OnClick(iButton)
    local v,a,mod;

    -- Update highlights
    XBarScrollFrame_ClearHighlights("XBarConfigScrollOrder");
    XBarScrollFrame_Highlight("XBarConfigScrollOrder",iButton);

    -- Bar selected, update window to reflect.
    v=XBarCore.FrameDB["XBarConfigScrollOrderLine"..tostring(iButton)].XBarValue;
    XBarCore.FrameDB.XBarConfigScrollOrder.XBarCur=v;

    mod=XBarConfigCurMod:GetText();
    if not mod then
        return;
    end

    a=XBarCore.ModData[mod].ActionList[v];
    if not a then
        return;
    end

    if not XBarBind:IsVisible() then
        -- Change the BindGUI's action index if it is not open
        XBarBindGUI.Action = v;
    end

    if not InCombatLockdown() then
        if not (a.Type==XBAR_TSPACER or
                a.Type==XBAR_THEADER or
                a.Type==XBAR_TOPTION) then
            XBarConfigSetBinding:Show();
        else
            XBarConfigSetBinding:Hide();
        end
    end
end

function XBarConfigGUI_ScrollOrder_OnScroll()
    local i,o,v,mod,b,b2,a,s,t,n;

    if InCombatLockdown() then
        return;
    end

    mod=XBarConfigCurMod:GetText();
    if (not mod) or (not XBarData[XBarCore.XBarOptionSet]) or (not XBarData[XBarCore.XBarOptionSet].mods[mod]) then
        return;
    end

    o=FauxScrollFrame_GetOffset(XBarConfigScrollOrderScrollFrame);
    n=#(XBarCore.ModData[mod].ActionList);
    for i=1,10 do
        v=i+o;
        b=getfenv()["XBarConfigScrollOrderLine"..tostring(i)];
        b2=getfenv()["XBarConfigScrollOrderLine"..tostring(i).."TextName"];
        if XBarCore.FrameDB["XBarConfigScrollOrderLine"..tostring(i)] == nil then
            XBarCore.FrameDB["XBarConfigScrollOrderLine"..tostring(i)] = {};
        end
        s=XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v];
        if not s then
            a=nil;
            if v<=n then
                --print(mod..": ERROR - Button "..v.." does not exist in sort order.");
            end
        else
            a=XBarCore.ModData[mod].ActionList[s];
        end
        if (not a) then
            b2:SetText("");
            XBarCore.FrameDB["XBarConfigScrollOrderLine"..tostring(i)].XBarValue=nil;
            b:Hide();
        else
            if a.Type==XBAR_TSPELL or a.Type==XBAR_TSPELLHAX then
                t=a.Data[1].Data;
            elseif a.Type==XBAR_TMACRO then
                t=a.Data[1].Data;
            elseif a.Type==XBAR_TITEM then
                t=a.Data[1].Data;
            elseif a.Type==XBAR_TCOMPANION then
                t=a.Data[1].Data;
            elseif a.Type==XBAR_TEMOTE then
                t=a.Data[1].Data;
            elseif a.Type==XBAR_TCHAT then
                t=a.Data[1].Data;
            elseif a.Type==XBAR_TSPACER then
                t="-----"..XBAR_SPACER.."-----";
            elseif a.Type==XBAR_THEADER then
                t="-----"..XBAR_HEADER.."-----";
            elseif a.Type==XBAR_TOPTION then
                t="-----"..XBAR_OPTION.."-----";
            else
                t="UNKNOWN";
            end
            if strlen(t)>16 then
                t=strsub(t,1,16).."...";
            end
            b2:SetText(t);
            XBarCore.FrameDB["XBarConfigScrollOrderLine"..tostring(i)].XBarValue=v;
            b:Show();
        end
    end
    if (n <= 10) then
        -- Extra stuff, lets hide our glider textures
        XBarConfigScrollOrderGliderBar1:Hide();
        XBarConfigScrollOrderGliderBar2:Hide();
        XBarConfigScrollOrderGliderBar3:Hide();
    else
        XBarConfigScrollOrderGliderBar1:Show();
        XBarConfigScrollOrderGliderBar2:Show();
        XBarConfigScrollOrderGliderBar3:Show();
    end

    -- Update highlights
    t=XBarCore.FrameDB.XBarConfigScrollOrder.XBarCur;
    XBarScrollFrame_ClearHighlights("XBarConfigScrollOrder");
    if (t) then
        XBarScrollFrame_Highlight("XBarConfigScrollOrder",t-o);
    end

    FauxScrollFrame_Update(XBarConfigScrollOrderScrollFrame,n,10,16);
end

function XBarConfigGUI.SliderScale_OnChange()
    local mod=XBarConfigCurMod:GetText();

    local v=this:GetValue();
    XBarData[XBarCore.XBarOptionSet].mods[mod].scale = v;
    XBarConfigSliderScaleVal:SetText(format("%.2f", v));
    XBarCore.Scale(mod);
end

function XBarConfigGUI.SliderMenu_OnClick()
    UIDropDownMenu_Initialize(XBarConfigSliderMenuFrame, XBarConfigGUI.SliderMenuFrame_OnLoad);
    ToggleDropDownMenu(1, nil, XBarConfigSliderMenuFrame, XBarConfigSliderMenu, 0, 0);
end

function XBarConfigGUI.SliderMenu_Select()
    local mod=XBarConfigCurMod:GetText();
    local v=this.value;
    local c=XBarCore.ModData[mod]["slider"..v];
    local min=XBarCore.ModData[mod]["slider"..v.."min"];
    local max=XBarCore.ModData[mod]["slider"..v.."max"];
    local fmt=XBarCore.ModData[mod]["slider"..v.."format"];
    local v2=XBarData[XBarCore.XBarOptionSet]["mods"][mod]["Options"][c];

    XBarCore.FrameDB.XBarConfig.sliderindex=v;
    XBarConfigSliderMultiText:SetText(c);
    XBarConfigSliderMulti:SetMinMaxValues(min,max);
    XBarConfigSliderMulti:SetValueStep(XBarCore.ModData[mod]["slider"..v.."step"]);
    XBarConfigSliderMulti:SetValue(v2);
    XBarConfigSliderMultiHigh:SetText(tostring(max));
    XBarConfigSliderMultiLow:SetText(tostring(min));
    XBarConfigSliderMultiVal:SetText(format(fmt, v2));
    XBarConfigSliderMulti:Show();
end

function XBarConfigGUI.SliderMenuFrame_OnLoad(menuframe,level)
    -- Loading off the click event from the button itself so we can make sure the data is there.
    -- Reinitializes every time we click the button.
    local info = UIDropDownMenu_CreateInfo();
    local n,i,mod;
    local menukey=nil;

    mod=XBarConfigCurMod:GetText();

    n=XBarCore.ModData[mod].nsliders;
    for i=1,n do
        info.text = XBarCore.ModData[mod]["slider"..i];
        info.func = XBarConfigGUI.SliderMenu_Select;
        info.owner = this:GetParent();
        info.hasArrow=false;
        info.notCheckable=true;
        if (info.text == "") then
            -- Its probably a menu
            info.func=nil;
            info.text = XBarCore.ModData[mod]["mslider"..i];
            info.value = info.text;
            if (info.text ~= nil) then
                menukey=info.text;
                info.hasArrow=true;
                if (level==1) then
                    -- Always add the menu if it's the first one.
                    UIDropDownMenu_AddButton(info,1);
                end
            end
        elseif (info.text ~= nil) then
            -- Only put something here if we need.
            info.value = i;
            if ((level==2) and (menukey==UIDROPDOWNMENU_MENU_VALUE)) then
                UIDropDownMenu_AddButton(info,2);
            elseif ((level==1) and (menukey==nil)) then
                --haven't encountered any dropdown menus yet
                UIDropDownMenu_AddButton(info,1);
            end
        end
    end
end

function XBarConfigGUI.SliderMulti_OnChanged()
    -- Don't update the value unless it's visible
    if (not this:IsVisible()) then
        return;
    end

    local mod=XBarConfigCurMod:GetText();
    if XBarData[XBarCore.XBarOptionSet]["mods"][mod].Options==nil then
        XBarData[XBarCore.XBarOptionSet]["mods"][mod].Options={};
    end

    local c=XBarConfigSliderMultiText:GetText();
    local v=this:GetValue();
    local i=XBarCore.FrameDB.XBarConfig.sliderindex;
    local fmt=XBarCore.ModData[mod]["slider"..i.."format"];

    XBarConfigSliderMultiVal:SetText(format(fmt, v));
    XBarData[XBarCore.XBarOptionSet]["mods"][mod].Options[c]=v;
    local f=getfenv()[XBarCore.ModData[mod]["foptioncb"]];

    if (f~=nil) then
        f(c,v,mod,true);
    end
end

function XBarConfigGUI.SortDown_OnClick()
    local v=XBarCore.FrameDB.XBarConfigScrollOrder.XBarCur;
    local mod=XBarConfigCurMod:GetText();
    local n=#(XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder);
    local t;

    if not v then
        return;
    end

    if (XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v+1]==nil) then
        -- early end-of-list detection
        n=v;
    end
    if v<n then
        t=XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v];
        XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v]=XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v+1];
        XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v+1]=t;
        XBarCore.FrameDB.XBarConfigScrollOrder.XBarCur=v+1;
        XBarConfigGUI_ScrollOrder_OnScroll();
        XBarCore.Update(mod);
    end
end

function XBarConfigGUI.SortUp_OnClick()
    local v=XBarCore.FrameDB.XBarConfigScrollOrder.XBarCur;
    local mod=XBarConfigCurMod:GetText();
    local n=#(XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder);
    local t;

    if not v then
        return;
    end

    if v>1 then
        t=XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v];
        XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v]=XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v-1];
        XBarData[XBarCore.XBarOptionSet].mods[mod].sortorder[v-1]=t;
        XBarCore.FrameDB.XBarConfigScrollOrder.XBarCur=v-1;
        XBarConfigGUI_ScrollOrder_OnScroll();
        XBarCore.Update(mod);
    end
end

function XBarHelpGUI.BtnClose_OnClick()
    if not InCombatLockdown() then
        XBarHelp:Hide();
    end
end

function XBarHelpGUI.ContextHeader(mod)
    return XBAR_HELP_STDOPS.."\n\n\124cffffd200"..tostring(mod)..":\124r\n";
end

function XBarHelpGUI.OnLoad()
    local c,t;

    c=XBarHelpGUI.Context;
    c="XBAR_HELP_CONTEXT_"..tostring(c);
    t=getfenv()[c];
    if t==nil then
        t=XBAR_HELP_CONTEXT_nil.."\nContext = "..tostring(c);
    end
    XBarHelp:SetHeight(1000);
    XBarHelpText:SetHeight(1000);
    XBarHelpText:SetText(t);
    -- Need to adjust the frame height.
    XBarHelpText:SetHeight(XBarHelpText:GetStringHeight());
    XBarHelp:SetHeight(XBarHelpText:GetStringHeight()+60);
    XBarHelp:SetFrameStrata("TOOLTIP");
end

function XBarScrollFrame_ClearHighlights(sFrame)
    local x,f;

    for x=1,10 do
        getfenv()[sFrame.."Line"..tostring(x)]:UnlockHighlight();
    end
end

function XBarScrollFrame_Highlight(sFrame,index)
    if (index>=1) and (index<=10) then
        getfenv()[sFrame.."Line"..tostring(index)]:LockHighlight();
    end
end

function XBarScrollFrameTemplate_OnScroll()
    local fn = this:GetParent():GetName();
    local f=XBarCore.FrameDB[fn].XBarOnScroll;

    if (f) then
        -- Pass the function call along
        getfenv()[f]();
    end
end

function XBarScrollFrameTemplate_OnClick(i)
    local fn = this:GetParent():GetName();
    local f=XBarCore.FrameDB[fn].XBarOnClick;

    if (f) then
        -- Pass the function call along
        getfenv()[f](i);
    end
end
