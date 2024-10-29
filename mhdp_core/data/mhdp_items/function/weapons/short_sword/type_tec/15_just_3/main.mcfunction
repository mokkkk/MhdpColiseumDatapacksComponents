#> mhdp_items:weapons/short_sword/type_tec/15_just_3/main
#
# ジャストラッシュ3 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ジャストラッシュ・３"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/15_just_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/short_sword/type_tec/15_just_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 3..7 run function mhdp_items:weapons/short_sword/type_tec/15_just_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/15_just_3/animation_3

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/15_just_3/attack

# 効果音・パーティクル
    execute if score @s Wpn.AnimationTimer matches 2 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 2 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/15_just_3/particle_1
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_tec/15_just_3/particle_1

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 at @s run tp @s ~ ~ ~ ~0.5 ~-1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 4..8 at @s run tp @s ~ ~ ~ ~0.5 ~1
    execute if score @s Wpn.AnimationTimer matches 8 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 11 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 11..19 positioned ~ ~1.65 ~ run particle crit ^ ^ ^1 0 0 0 0.5 1
    execute if score @s Wpn.GeneralTimer matches 20 run playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 20 positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.5 0 0 0 0 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 2 6 true

# 遷移
    # 右クリック短押し：通常コンボ2に移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/short_sword/type_tec/15_just_3/change_to_just_4

# 終了
    execute if score @s Wpn.GeneralTimer matches 40.. run function mhdp_items:weapons/short_sword/type_tec/15_just_3/end
