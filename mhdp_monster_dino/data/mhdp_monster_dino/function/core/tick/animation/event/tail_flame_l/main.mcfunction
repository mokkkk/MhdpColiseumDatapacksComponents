#> mhdp_monster_dino:core/tick/animation/event/tail_flame_l/main
#
# アニメーションイベントハンドラ 火炎
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.tail_flame_l.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/turn_start
    execute if score @s aj.tail_flame_l.frame matches 10 run function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/turn_start
    execute if score @s aj.tail_flame_l.frame matches 1..18 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.tail_flame_l.frame matches 1..12 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.tail_flame_l.frame matches 26..40 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.tail_flame_l.frame matches 41..50 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.tail_flame_l.frame matches 59..67 at @s run tp @s ^ ^ ^-0.15
    execute if score @s aj.tail_flame_l.frame matches 68..84 at @s run tp @s ^ ^ ^-0.05

# 効果音
    execute if score @s aj.tail_flame_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_flame_l.frame matches 12 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_flame_l.frame matches 12 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.tail_flame_l.frame matches 12 run particle block{block_state:"minecraft:sand"} ^3 ^0.1 ^-7 1.2 0.1 1.2 0 10
    execute if score @s aj.tail_flame_l.frame matches 12 run particle block{block_state:"minecraft:sand"} ^4 ^0.1 ^-8 1.2 0.1 1.2 0 10
    execute if score @s aj.tail_flame_l.frame matches 26..40 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.tail_flame_l.frame matches 26..40 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.tail_flame_l.frame matches 50 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.tail_flame_l.frame matches 67..73 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_flame_l.frame matches 67..73 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.tail_flame_l.frame matches 67..68 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_flame_l.frame matches 67..68 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4

# 攻撃
    execute if score @s aj.tail_flame_l.frame matches 26..40 run function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/attack_tail
    execute if score @s aj.tail_flame_l.frame matches 33 positioned as @n[tag=Mns.Target.Dino] run summon area_effect_cloud ~ ~0.5 ~ {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Dino"]}
    execute if score @s aj.tail_flame_l.frame matches 41 positioned ^3 ^ ^5 rotated ~3 ~ run function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/attack
    execute if score @s aj.tail_flame_l.frame matches 42..47 run function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/attack_tail_no_particle

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.tail_flame_l.frame matches 96 run function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/end
