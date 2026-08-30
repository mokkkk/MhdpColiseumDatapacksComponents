#> mhdp_monster_reus:core/tick/effect_anger
#
# tick処理
#
# @within function mhdp_monster_valk:core/tick/tick_main

# 頭
    execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/m.effect_anger_head with entity @s data.locators.pos_head
# 翼
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/m.effect_anger_wing with entity @s data.locators.pos_muzzle_r_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/m.effect_anger_wing with entity @s data.locators.pos_muzzle_r_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/m.effect_anger_wing with entity @s data.locators.pos_muzzle_r_2
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/m.effect_anger_wing with entity @s data.locators.pos_muzzle_l_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/m.effect_anger_wing with entity @s data.locators.pos_muzzle_l_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/m.effect_anger_wing with entity @s data.locators.pos_muzzle_l_2
