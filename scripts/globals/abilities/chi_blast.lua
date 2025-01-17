-----------------------------------
-- Ability: Chi Blast
-- Releases Chi to attack an enemy.
-- Obtained: Monk Level 41
-- Recast Time: 0:03:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local MND = player:getStat(tpz.mod.MND)
    local rnd = 0.5 + (math.random() / 2) -- Between 0.5 and 1.0
    local boostCount = 0
    local boostEffect = 0

    local boost = player:getStatusEffect(tpz.effect.BOOST)

    if boost then
        boostCount = boost:getTier()
        boostEffect = boost:getPower() / 100
    end

    local dmg = math.floor(math.floor(MND * rnd) * (1 + (boostCount * boostEffect)))
    dmg = utils.stoneskin(target, dmg)

    target:takeDamage(dmg, player, tpz.attackType.SPECIAL, tpz.damageType.ELEMENTAL)
    target:updateEnmityFromDamage(player,dmg)
    target:updateClaim(player)
    player:delStatusEffect(tpz.effect.BOOST)

    return dmg
end
