#> mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/main
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 2 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/turn_start
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 10 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/turn_start
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 1..18 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 42..58 run tag @n[tag=Mns.Target.Dino] add Temp.Rotate.Target
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 42..58 run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 16..25 unless entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 81..87 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 42..53 unless entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 42..53 at @s run tp @s ^-0.9 ^ ^0.25

# 効果音
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 16 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 26 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 26 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 42 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 42 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 53 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 53 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30

# 攻撃
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 21..27 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/attack_tail
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 26 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# フェーズ
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.tail_attack_r_to_step_r.frame matches 26 run function mhdp_monster_dino:core/util/phase/tail_heat

# 終了
    execute if score @s aj.tail_attack_r_to_step_r.frame matches 61 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/end
