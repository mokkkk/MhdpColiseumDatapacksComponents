#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/particle
#
# アニメーションイベントハンドラ 滑空突進終了
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/m.particle with entity @s data.locators.pos_muzzle_r_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/m.particle with entity @s data.locators.pos_muzzle_r_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/m.particle with entity @s data.locators.pos_muzzle_r_2
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/m.particle with entity @s data.locators.pos_muzzle_l_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/m.particle with entity @s data.locators.pos_muzzle_l_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/m.particle with entity @s data.locators.pos_muzzle_l_2
