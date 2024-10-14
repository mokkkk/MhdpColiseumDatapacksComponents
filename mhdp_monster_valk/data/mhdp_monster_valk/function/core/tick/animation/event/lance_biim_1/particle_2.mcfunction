#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/particle_2
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 演出
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.particle_2 with entity @s data.locators.pos_muzzle_r_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.particle_2 with entity @s data.locators.pos_muzzle_r_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.particle_2 with entity @s data.locators.pos_muzzle_r_2
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.particle_2 with entity @s data.locators.pos_muzzle_l_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.particle_2 with entity @s data.locators.pos_muzzle_l_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.particle_2 with entity @s data.locators.pos_muzzle_l_2
    execute positioned ^ ^2 ^8 run particle dust{color:[1.000,0.100,0.252],scale:4} ^ ^ ^1 0.4 0.4 0.4 0.15 2