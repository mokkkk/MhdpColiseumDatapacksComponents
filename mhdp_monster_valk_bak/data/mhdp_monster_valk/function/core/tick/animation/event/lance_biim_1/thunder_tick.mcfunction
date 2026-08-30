#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_tick
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 演出移動
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.thunder_tick with entity @s data.locators.pos_muzzle_r_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.thunder_tick with entity @s data.locators.pos_muzzle_r_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.thunder_tick with entity @s data.locators.pos_muzzle_r_2
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.thunder_tick with entity @s data.locators.pos_muzzle_l_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.thunder_tick with entity @s data.locators.pos_muzzle_l_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.thunder_tick with entity @s data.locators.pos_muzzle_l_2
    tag @e[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long] remove Temp.IsTp
