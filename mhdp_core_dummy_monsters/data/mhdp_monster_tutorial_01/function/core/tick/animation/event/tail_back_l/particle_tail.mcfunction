#> mhdp_monster_dino:core/tick/animation/event/tail_side_r/particle_tail
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick


# 演出
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/m.particle_tail with entity @s data.locators.pos_tail_1
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/m.particle_tail with entity @s data.locators.pos_tail_2
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/m.particle_tail with entity @s data.locators.pos_tail_3
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/m.particle_tail with entity @s data.locators.pos_tail_4
