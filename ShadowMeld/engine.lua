if (GetLocale() == "deDE") then
	SM_PROWL = "Schleichen";
	SM_SHADOWMELD = "Schattenhaftigkeit";
elseif (GetLocale() == "frFR") then
	SM_PROWL = "Rôder";
	SM_SHADOWMELD = "Camouflage dans l'ombre";
elseif (GetLocale() == "esES") then
	SM_PROWL = "Acechar";
	SM_SHADOWMELD = "Fusión de las Sombras";
elseif (GetLocale() == "ruRU") then
	SM_PROWL = "Крадущийся зверь";
	SM_SHADOWMELD = "Уход в тень";
else
	SM_PROWL = "Prowl";
	SM_SHADOWMELD = "Shadowmeld";
end

local f = CreateFrame("Frame", nil, WorldFrame);

f:SetClampedToScreen(true);
f:SetFrameStrata("BACKGROUND");
f:SetAllPoints(UIParent);

local t = f:CreateTexture(nil,"BACKGROUND");
t:SetTexture("Interface\\AddOns\\ShadowMeld\\texture.tga");
t:SetAllPoints(f);

f.texture = t;

local function ShadowMeld_OnEvent(self, event, ...)
	if event == "PLAYER_AURAS_CHANGED" then
		if ( IsStealthed() or GetPlayerBuffTexture(SM_PROWL) or GetPlayerBuffTexture(SM_SHADOWMELD) ) then
			f:Show();
		else
			f:Hide();
		end
	end
end

local g = CreateFrame("Frame");
g:SetScript("OnEvent", ShadowMeld_OnEvent);
g:RegisterEvent("PLAYER_AURAS_CHANGED")
