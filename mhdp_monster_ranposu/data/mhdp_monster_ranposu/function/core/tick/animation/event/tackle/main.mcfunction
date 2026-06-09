#> mhdp_monster_ranposu:core/tick/animation/event/tackle/main
#
# アニメーションイベントハンドラ タックル
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.tackle.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:10,MaxRotation:90}
    execute if score @s aj.tackle.frame matches 6 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:10,MaxRotation:90}
    execute if score @s aj.tackle.frame matches 2..10 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.tackle.frame matches 1..5 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.tackle.frame matches 6..10 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.tackle.frame matches 24..26 at @s run tp @s ^ ^ ^1
    execute if score @s aj.tackle.frame matches 27..30 at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.tackle.frame matches 31..40 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.tackle.frame matches 41..47 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.tackle.frame matches 1..3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tackle.frame matches 20 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.tackle.frame matches 21..23 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.tackle.frame matches 18..23 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tackle.frame matches 38 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.tackle.frame matches 38 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.tackle.frame matches 23 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks[{Name:"Tackle"}]
    execute if score @s aj.tackle.frame matches 24..34 run function mhdp_monster_ranposu:core/tick/animation/event/tackle/attack
    execute if score @s aj.tackle.frame matches 35 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.tackle.frame matches 69.. run function mhdp_monster_ranposu:core/tick/animation/event/tackle/end
