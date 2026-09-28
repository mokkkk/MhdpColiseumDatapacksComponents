#> mhdp_monster_valk:core/util/phase/charge_start
#
# 汎用処理 龍気吸引開始時の肉質変化（胴・両腕を胸(吸引中)扱いへ）
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_charge_start/main

# 肉質変化
    execute as @e[type=slime,tag=Mns.HitBox.Valk.Body0] run scoreboard players set @s Mns.Hitbox.PartId 9
    execute as @e[type=slime,tag=Mns.HitBox.Valk.ArmR] run scoreboard players set @s Mns.Hitbox.PartId 9
    execute as @e[type=slime,tag=Mns.HitBox.Valk.ArmL] run scoreboard players set @s Mns.Hitbox.PartId 9
