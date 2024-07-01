#> mhdp_monster_ranposu:core/tick/animation/event/bite/main
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ・弱め
    # execute if score @s aj.frame matches 1 run function mhdp_monster_ranposu:core/tick/animation/event/bite/turn_start
    # execute if score @s aj.frame matches 1..8 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.frame matches 9..13 unless entity @n[tag=Mns.Target.Ranposu,distance=..5] at @s run tp @s ^ ^ ^0.3

# 効果音
    execute if score @s aj.frame matches 1 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 32 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 13 run playsound entity.wither.break_block master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.7

# 攻撃
    execute if score @s aj.frame matches 13 run function mhdp_monster_ranposu:core/tick/animation/event/bite/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.frame matches 44 run function mhdp_monster_ranposu:core/tick/animation/event/bite/end
