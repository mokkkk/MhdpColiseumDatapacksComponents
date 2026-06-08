#> mhdp_monster_ranposu:core/tick/animation/event/bite/main
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.bite.frame matches 9..13 unless entity @n[tag=Mns.Target.Ranposu,distance=..5] at @s run tp @s ^ ^ ^0.3

# 効果音
    execute if score @s aj.bite.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite.frame matches 32 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite.frame matches 13 run playsound entity.wither.break_block master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.7

# 攻撃
    execute if score @s aj.bite.frame matches 13 run function mhdp_monster_ranposu:core/tick/animation/event/bite/attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.bite.frame matches 44 run function mhdp_monster_ranposu:core/tick/animation/event/bite/end
