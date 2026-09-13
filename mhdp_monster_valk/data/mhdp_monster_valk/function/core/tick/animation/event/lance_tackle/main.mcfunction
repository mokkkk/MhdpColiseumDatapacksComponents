#> mhdp_monster_valk:core/tick/animation/event/lance_tackle/main
#
# アニメーションイベントハンドラ 蛇行突進
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_tackle.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:360}
    execute if score @s aj.lance_tackle.frame matches 7 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:360}
    execute if score @s aj.lance_tackle.frame matches 2..17 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.lance_tackle.frame matches 2..8 at @s run tp @s ^ ^ ^ ~1 ~
    execute if score @s aj.lance_tackle.frame matches 23..26 at @s run tp @s ^-0.08 ^ ^1
    execute if score @s aj.lance_tackle.frame matches 27..31 at @s run tp @s ^-0.08 ^ ^0.6
    execute if score @s aj.lance_tackle.frame matches 32..38 at @s run tp @s ^ ^ ^0.1 ~-2 ~
    execute if score @s aj.lance_tackle.frame matches 39..42 at @s run tp @s ^0.25 ^ ^1
    execute if score @s aj.lance_tackle.frame matches 43..47 at @s run tp @s ^0.1 ^ ^0.6
    execute if score @s aj.lance_tackle.frame matches 48..53 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.lance_tackle.frame matches 74..97 at @s run tp @s ^ ^ ^-0.05

# 効果音
    execute if score @s aj.lance_tackle.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_tackle.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.9 0.4
    execute if score @s aj.lance_tackle.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.4 0.4
    execute if score @s aj.lance_tackle.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_tackle.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4

    execute if score @s aj.lance_tackle.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_tackle.frame matches 23 run function mhdp_monster_valk:core/tick/animation/event/lance_tackle/sound
    execute if score @s aj.lance_tackle.frame matches 39 run function mhdp_monster_valk:core/tick/animation/event/lance_tackle/sound
    execute if score @s aj.lance_tackle.frame matches 23..26 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_tackle.frame matches 23..26 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10
    execute if score @s aj.lance_tackle.frame matches 39..42 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_tackle.frame matches 39..42 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10
    execute if score @s aj.lance_tackle.frame matches 74 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_tackle.frame matches 79 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.lance_tackle.frame matches 25 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Tackle"}]
    execute if score @s aj.lance_tackle.frame matches 25..29 run function mhdp_monster_valk:core/tick/animation/event/lance_tackle/attack
    execute if score @s aj.lance_tackle.frame matches 29 run function mhdp_monsters:core/util/tick/event/end_attack
    execute if score @s aj.lance_tackle.frame matches 41 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Tackle"}]
    execute if score @s aj.lance_tackle.frame matches 41..45 run function mhdp_monster_valk:core/tick/animation/event/lance_tackle/attack
    execute if score @s aj.lance_tackle.frame matches 45 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_tackle.frame matches 97 run function mhdp_monster_valk:core/tick/animation/event/lance_tackle/end
