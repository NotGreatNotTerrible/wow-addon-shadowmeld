function ShadowMeld_OnLoad(self)
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    self:RegisterEvent("UPDATE_STEALTH");
end

function ShadowMeld_OnEvent(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        if IsStealthed() then
            self:Show();
        end
    elseif event == "UPDATE_STEALTH" then
        if IsStealthed() then
            UIFrameFadeIn(self, 0.125, 0, 1);
        else
            UIFrameFadeOut(self, 0.1, 1, 0);
        end
    end
end
