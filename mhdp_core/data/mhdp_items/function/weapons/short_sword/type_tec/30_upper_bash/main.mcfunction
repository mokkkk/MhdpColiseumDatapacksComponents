#> mhdp_items:weapons/short_sword/type_tec/30_upper_bash/main
#
# 滅・昇竜撃 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"滅・昇竜撃"}

# タイマー増加
    execute if score @s Wpn.GeneralTimer matches ..4 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 5 run scoreboard players remove @s Ply.Stats.Stamina 20
    execute if score @s Ply.Stats.Stamina matches ..0 if score @s Wpn.GeneralTimer matches 5 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 5 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GeneralTimer matches 6.. run scoreboard players add @s Wpn.GeneralTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/animation_0
    execute if score @s Wpn.GeneralTimer matches 9 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/animation_1
    execute if score @s Wpn.GeneralTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/animation_2
    execute if score @s Wpn.GeneralTimer matches 13 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/animation_3
    execute if score @s Wpn.GeneralTimer matches 15 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/animation_4
    execute if score @s Wpn.GeneralTimer matches 18 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/animation_5

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 9 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/attack
    execute if entity @s[tag=Ply.Flag.Hit,tag=Ply.Flag.Ss.UpperBashCounter] if score @s Wpn.GeneralTimer matches 18 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/attack_pursuit
    execute if entity @s[tag=Ply.Flag.Hit,tag=Ply.Flag.Ss.UpperBashCounter] if score @s Wpn.GeneralTimer matches 21 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/attack_pursuit
    execute if entity @s[tag=Ply.Flag.Hit,tag=Ply.Flag.Ss.UpperBashCounter] if score @s Wpn.GeneralTimer matches 24 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/attack_pursuit
    execute if score @s Wpn.GeneralTimer matches 25 run tag @s remove Ply.Flag.Hit
    execute if score @s Wpn.GeneralTimer matches 25 run tag @s remove Ply.Flag.Ss.UpperBashCounter

# 効果音・パーティクル
    execute if score @s Wpn.GeneralTimer matches 6 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.GeneralTimer matches 8..15 run particle crit ~ ~1 ~ 0.1 0.1 0.1 0.05 8
    execute if score @s Wpn.GeneralTimer matches 8..15 run particle crit ~ ~1 ~ 0.3 0.3 0.3 0.1 5

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 at @s run tp @s ~ ~ ~ ~0.5 ~-1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 8..11 at @s run tp @s ~ ~ ~ ~0.5 ~1
    execute if score @s Wpn.GeneralTimer matches 8 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.GeneralTimer matches 8 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 8 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 8 run scoreboard players set $strength player_motion.api.launch 14000
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~ -90 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 10 run tag @s add Ply.Ope.IsAir

# ガード判定
    execute if score @s Wpn.GeneralTimer matches 7 run tag @s add Ply.Weapon.Guard
    execute if score @s Wpn.GeneralTimer matches 7 run tag @s add Ply.Weapon.Armor.Hyper
    execute if score @s Wpn.GeneralTimer matches 11 run tag @s remove Ply.Weapon.Guard
    execute if score @s Wpn.GeneralTimer matches 11 run tag @s remove Ply.Weapon.Armor.Hyper

# 遷移
    # 右クリック：強フォールバッシュに移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Flag.Ss.UpperBashCounter] if score @s Wpn.GeneralTimer matches 20..34 run function mhdp_items:weapons/short_sword/type_tec/18_fall_high/start
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Flag.Ss.UpperBashCounter] if score @s Wpn.GeneralTimer matches 25..34 run function mhdp_items:weapons/short_sword/type_tec/18_fall_high/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 35.. run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/end
