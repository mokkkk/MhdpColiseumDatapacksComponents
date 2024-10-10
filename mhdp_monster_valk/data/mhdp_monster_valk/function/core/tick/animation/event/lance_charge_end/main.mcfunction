#> mhdp_monster_valk:core/tick/animation/event/lance_charge_end/main
#
# アニメーションイベントハンドラ 龍気吸引・終了
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_charge_end.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_charge_end.frame matches 10 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_charge_end.frame matches 10 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_charge_end.frame matches 10 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_charge_end.frame matches 2..20 run function mhdp_monster_valk:core/tick/animation/event/lance_charge_end/particle
    execute if score @s aj.lance_charge_end.frame matches 10 run particle explosion ~ ~3 ~ 4 4 4 0 30

# 演出
    execute if score @s aj.lance_charge_end.frame matches 10 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_charge_end/m.effect with entity @s data.locators.pos_muzzle_r_1
    execute if score @s aj.lance_charge_end.frame matches 10 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_charge_end/m.effect with entity @s data.locators.pos_muzzle_l_1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# モデル演出
    execute if score @s aj.lance_charge_end.frame matches 2 run function mhdp_monster_valk:core/util/models/chest_glow_end

# 肉質変化
    execute if score @s aj.lance_charge_end.frame matches 2 as @e[type=slime,tag=Mns.HitBox.Valk.Body0] run scoreboard players set @s Mns.Hitbox.PartId 1
    execute if score @s aj.lance_charge_end.frame matches 2 as @e[type=slime,tag=Mns.HitBox.Valk.ArmR] run scoreboard players set @s Mns.Hitbox.PartId 3
    execute if score @s aj.lance_charge_end.frame matches 2 as @e[type=slime,tag=Mns.HitBox.Valk.ArmL] run scoreboard players set @s Mns.Hitbox.PartId 4

# 終了
    execute if score @s aj.lance_charge_end.frame matches 34 run function mhdp_monster_valk:core/tick/animation/event/lance_charge_end/end
