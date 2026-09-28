#> mhdp_monster_valk:core/util/phase/charge_end
#
# 汎用処理 龍気吸引終了時の肉質変化（胴・両腕を通常部位へ復元）
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_charge_end/main

# 肉質変化
    execute as @e[type=slime,tag=Mns.HitBox.Valk.Body0] run scoreboard players set @s Mns.Hitbox.PartId 1
    execute as @e[type=slime,tag=Mns.HitBox.Valk.ArmR] run scoreboard players set @s Mns.Hitbox.PartId 3
    execute as @e[type=slime,tag=Mns.HitBox.Valk.ArmL] run scoreboard players set @s Mns.Hitbox.PartId 4
