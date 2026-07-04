#> mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_r/particle_tail
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.7 0.1 0.7 0 10
    execute if entity @s[tag=Mns.Dino.State.HeadHeat] run particle lava ~ ~0.1 ~ 0.7 0.1 0.7 0 1
