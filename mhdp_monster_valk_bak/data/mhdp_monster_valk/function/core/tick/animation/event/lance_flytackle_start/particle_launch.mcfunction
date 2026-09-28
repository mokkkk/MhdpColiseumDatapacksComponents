#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/particle_launch
#
# アニメーションイベントハンドラ 滑空突進開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/m.particle_launch with entity @s data.locators.pos_muzzle_r_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/m.particle_launch with entity @s data.locators.pos_muzzle_r_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/m.particle_launch with entity @s data.locators.pos_muzzle_r_2
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/m.particle_launch with entity @s data.locators.pos_muzzle_l_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/m.particle_launch with entity @s data.locators.pos_muzzle_l_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/m.particle_launch with entity @s data.locators.pos_muzzle_l_2
