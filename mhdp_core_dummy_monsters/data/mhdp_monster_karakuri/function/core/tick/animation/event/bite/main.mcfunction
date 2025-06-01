#> mhdp_monster_karakuri:core/tick/animation/event/bite/main
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_karakuri:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.bite.frame matches 3 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_0
    execute if score @s aj.bite.frame matches 20 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_1
    execute if score @s aj.bite.frame matches 30 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_0
    execute if score @s aj.bite.frame matches 60 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_0
    execute if score @s aj.bite.frame matches 79 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_1
    execute if score @s aj.bite.frame matches 46 run playsound entity.wither.break_block master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2

# 攻撃
    execute if score @s aj.bite.frame matches 41 run tag @s add Mns.Karakuri.Attack.Head
    execute if score @s aj.bite.frame matches 45 run function mhdp_monster_karakuri:core/tick/animation/event/bite/attack
    execute if score @s aj.bite.frame matches 46 run tag @s remove Mns.Karakuri.Attack.Head

# 終了
    execute if score @s aj.bite.frame matches 86 run function mhdp_monster_karakuri:core/tick/animation/event/bite/end
