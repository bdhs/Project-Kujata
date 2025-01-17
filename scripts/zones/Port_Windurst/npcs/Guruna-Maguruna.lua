-----------------------------------
-- Area: Port Windurst
--  NPC: Guruna-Maguruna
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        13090,  4201, 1,    -- Beetle Gorget
        12601,  2776, 1,    -- Linen Robe
        12729,  1570, 1,    -- Linen Cuffs

        12608,  1260, 2,    -- Tunic
        12593, 12355, 2,    -- Cotton Doublet
        12696,   324, 2,    -- Leather Gloves
        12736,   589, 2,    -- Mitts
        12721,  6696, 2,    -- Cotton Gloves

        13085,   972, 3,    -- Hemp Gorget
        12592,  2470, 3,    -- Doublet
        12600,   216, 3,    -- Robe
        12568,   604, 3,    -- Leather Vest
        12720,  1363, 3,    -- Gloves
        12728,   118, 3,    -- Cuffs
    }

    player:showText(npc, ID.text.GURUNAMAGURUNA_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.WINDURST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
