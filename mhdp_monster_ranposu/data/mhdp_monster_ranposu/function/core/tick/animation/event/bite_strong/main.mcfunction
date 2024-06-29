#> mhdp_monster_ranposu:core/tick/animation/event/bite_strong/main
#
# アニメーションイベントハンドラ 強嚙みつき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.frame matches 1 run function mhdp_monster_ranposu:core/tick/animation/event/bite_strong/turn_start
    execute if score @s aj.frame matches 11 run function mhdp_monster_ranposu:core/tick/animation/event/bite_strong/turn_start
    execute if score @s aj.frame matches 1..20 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.frame matches 1..5 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.frame matches 6..9 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.frame matches 18..20 unless entity @n[tag=Mns.Target.Ranposu,distance=..5] at @s run tp @s ^ ^ ^0.7
    execute if score @s aj.frame matches 21..24 unless entity @n[tag=Mns.Target.Ranposu,distance=..5] at @s run tp @s ^ ^ ^0.5

# 効果音
    execute if score @s aj.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 18 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 24 run playsound entity.wither.break_block master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.7

# 攻撃
    execute if score @s aj.frame matches 24 run function mhdp_monster_ranposu:core/tick/animation/event/bite_strong/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.frame matches 53 run function mhdp_monster_ranposu:core/tick/animation/event/bite_strong/end
