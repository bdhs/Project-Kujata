-----------------------------------
-- Ability: Aspir Samba
-- Inflicts the next target you strike with Aspir daze, allowing all those engaged in battle with it to drain its MP.
-- Obtained: Dancer Level 25
-- TP Required: 100
-- Recast Time: 0:01:00
-- Duration: 0:02:00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if player:hasStatusEffect(tpz.effect.FAN_DANCE) then
        return tpz.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif player:hasStatusEffect(tpz.effect.TRANCE) then
        return 0, 0
    elseif player:getTP() < 100 then
        return tpz.msg.basic.NOT_ENOUGH_TP, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(tpz.effect.TRANCE) then
        player:delTP(100)
    end

    local duration = 120 + player:getMod(tpz.mod.SAMBA_DURATION)
    duration = duration * ((100 + player:getMod(tpz.mod.SAMBA_PDURATION)) / 100)
    player:delStatusEffect(tpz.effect.HASTE_SAMBA)
    player:delStatusEffect(tpz.effect.DRAIN_SAMBA)
    player:addStatusEffect(tpz.effect.ASPIR_SAMBA, 1, 0, duration)
end
