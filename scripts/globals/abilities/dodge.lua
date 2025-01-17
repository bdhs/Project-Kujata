-----------------------------------
-- Ability: Dodge
-- Enhances user's evasion.
-- Obtained: Monk Level 15
-- Recast Time: 0:05:00
-- Duration: 0:02:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local power = 20 + player:getMod(tpz.mod.DODGE_EFFECT)

    player:addStatusEffect(tpz.effect.DODGE, power, 0, 120)
end
