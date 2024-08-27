#> mhdp_monster_dino:core/tick/animation/event/voice/particle_tail
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/voice/m.particle_tail with entity @s data.locators.pos_tail_4
