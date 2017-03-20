require "base/internal/ui/reflexcore"

lendHealth =
{
};
registerWidget("lendHealth");

function lendHealth:draw()

    -- exits
    if not shouldShowHUD() then return end;
    if not getPlayer() then return end;
    if isRaceMode() then return end;

    -- health
    local health = getPlayer().health

    -- font
    nvgFontSize(200);
    nvgFontFace("Solomon Heavy");
    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
    nvgFontBlur(0);

    -- colors
    local normalHealthColor = Color(227, 227, 227, 255);
    local buffedHealthColor = Color(0, 185, 225, 255);
    local lowHealthColor = Color(255, 70, 40, 255);

    -- draw health
    local x = -400;
    local y = -200;
    if (health > 100) then
        nvgFillColor(buffedHealthColor);
    elseif (health < 50) then
        nvgFillColor(lowHealthColor);
    else
        nvgFillColor(normalHealthColor);
    end
    nvgText(x, y, health);
end
