#> mhdp_monster_dino:core/tick/animation/event/tail_attack_r/main
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.tail_attack_r.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/turn_start
    execute if score @s aj.tail_attack_r.frame matches 10 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/turn_start
    execute if score @s aj.tail_attack_r.frame matches 1..18 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.tail_attack_r.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.tail_attack_r.frame matches 16..25 unless entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.tail_attack_r.frame matches 81..87 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.tail_attack_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r.frame matches 16 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r.frame matches 26 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r.frame matches 26 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.tail_attack_r.frame matches 38..42 run playsound minecraft:entity.ravager.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.8 0.4
    execute if score @s aj.tail_attack_r.frame matches 38..42 run playsound minecraft:entity.hoglin.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.65 0.4
    execute if score @s aj.tail_attack_r.frame matches 38..39 run playsound minecraft:item.mace.smash_ground master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.8 0.4
    execute if score @s aj.tail_attack_r.frame matches 38..39 run playsound minecraft:item.mace.smash_ground master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.6 0.4
    execute if score @s aj.tail_attack_r.frame matches 81 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.tail_attack_r.frame matches 21..27 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack_tail
    execute if score @s aj.tail_attack_r.frame matches 26 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.tail_attack_r.frame matches 119 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/end
