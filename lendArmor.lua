require "base/internal/ui/reflexcore"

lendArmor =
{
};
registerWidget("lendArmor");

function lendArmor:draw()

    -- exits
    if not shouldShowHUD() then return end;
    if not getPlayer() then return end;
    if isRaceMode() then return end;

    -- armor
    local armor = getPlayer().armor
    local armorType = getPlayer().armorProtection

    -- font
    nvgFontSize(200);
    nvgFontFace("Solomon Heavy");
    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);

    -- colors
    local zeroArmorColor = Color(227, 227, 227, 255);
    local redArmorColor = Color(255, 70, 40, 255);
    local yellowArmorColor = Color(250, 250, 50, 255);
    local greenArmorColor = Color(20, 255, 90, 255);

    local buffedArmorColor = Color(0, 185, 225, 100);
    local lowArmorColor = Color(255, 70, 40, 100);

    -- draw glow
    local x = 400;
    local y = -200;
    nvgFontBlur(5);
    if (armor > 100) then
        nvgBeginPath();
        nvgRect(x-200, y-110, 400, 180);
        nvgFillColor(buffedArmorColor);
        nvgFill();
    elseif (armor < 30) then
        nvgBeginPath();
        nvgRect(x-200, y-110, 400, 180);
        nvgFillColor(lowArmorColor);
        nvgFill();
    end

    -- draw armor
    nvgFontBlur(0);
    if (armor == 0) then
        nvgFillColor(zeroArmorColor);
    elseif (armorType == 0) then
        nvgFillColor(greenArmorColor);
    elseif (armorType == 1) then
        nvgFillColor(yellowArmorColor);
    elseif (armorType == 2) then
        nvgFillColor(redArmorColor);
    else
        nvgFillColor(zeroArmorColor);
    end
    nvgText(x, y, armor);

end
