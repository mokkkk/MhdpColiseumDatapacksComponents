#> mhdp_items:weapons/bow/type_normal/10_flying_shot/main
#
# 飛翔睨み撃ち メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# タイマー増加
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches ..4 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 5 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GeneralTimer matches 6.. run scoreboard players add @s Wpn.GeneralTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.GeneralTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.GeneralTimer matches 3..4 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.GeneralTimer matches 3..4 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/bow/type_normal/10_flying_shot/animation_0
    execute if score @s Wpn.GeneralTimer matches 2 run function mhdp_items:weapons/bow/type_normal/10_flying_shot/animation_1
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/bow/type_normal/10_flying_shot/animation_2
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/bow/type_normal/10_flying_shot/animation_3
    execute if score @s Wpn.GeneralTimer matches 7 run function mhdp_items:weapons/bow/type_normal/10_flying_shot/animation_4
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/bow/type_normal/10_flying_shot/animation_5
    execute if score @s Wpn.GeneralTimer matches 9 run function mhdp_items:weapons/bow/type_normal/10_flying_shot/animation_6
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/bow/type_normal/10_flying_shot/animation_7

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 7 if score @s Wpn.Bw.FlyingShot.Count matches ..2 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_normal/10_flying_shot/attack

# 再度溜める
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.Bw.FlyingShot.Count matches ..2 if score @s Wpn.GeneralTimer matches 7.. run scoreboard players set @s Wpn.GeneralTimer 0

# 終了
    execute if entity @s[tag=!Ply.Ope.IsAir] run function mhdp_items:weapons/bow/type_normal/10_flying_shot/end
