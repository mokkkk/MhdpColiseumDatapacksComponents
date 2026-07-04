#> mhdp_monster_dino:core/tick/animation/event/jump_tail_l/attack_particle
#
# アニメーションイベントハンドラ 尻尾攻撃
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0.2 15 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5 normal
    particle explosion ~ ~0 ~ 0.5 0.5 0.5 0 2
    execute if entity @s[tag=Mns.Dino.State.TailHeat] run particle lava ~ ~0 ~ 0.5 0.5 0.5 0 4
    execute if entity @s[tag=Mns.Dino.State.TailHeat] run particle lava ~ ~0 ~ 0.5 0.5 0.5 0 4
    execute positioned ~ ~ ~ rotated ~ 0 run function api:object/summon.m {ObjectId:16}
