#> mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/particle
#
# アニメーションイベントハンドラ 薙ぎ払い
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/m.particle with entity @s data.locators.pos_muzzle_r_0
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/m.particle with entity @s data.locators.pos_muzzle_r_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/m.particle with entity @s data.locators.pos_muzzle_r_2
