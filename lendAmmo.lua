require "base/internal/ui/reflexcore"

lendAmmo =
{
};
registerWidget("lendAmmo");

function lendAmmo:draw()

    -- exits
    if not shouldShowHUD() then return end;
    if not getPlayer() then return end;
    if isRaceMode() then return end;

    -- ammo
    local wep = getPlayer().weaponIndexSelected
    local ammo = getPlayer().weapons[wep].ammo
    local lowAmmo = getPlayer().weapons[wep].lowAmmoWarning

    -- font
    nvgFontSize(200);
    nvgFontFace("Solomon Heavy");
    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
    nvgFontBlur(0);

    -- colors
    local normalAmmoColor = Color(100, 250, 120, 255);
    local lowAmmoColor = Color(255, 70, 40, 255);

    -- draw ammo
    local x = 0;
    local y = -200;
    if (ammo <= lowAmmo) then
        nvgFillColor(lowAmmoColor);
    else
        nvgFillColor(normalAmmoColor);
    end
    nvgText(x, y, ammo);
end
