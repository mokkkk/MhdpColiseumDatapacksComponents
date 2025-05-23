#> mhdp_items:weapons/bow/type_tec/5_shot_power/main
#
# 剛射 メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"剛射"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 5 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 5 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.AnimationTimer matches 5 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 5 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.AnimationTimer matches 5 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_tec/5_shot_power/animation_0
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_tec/5_shot_power/animation_1
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/bow/type_tec/5_shot_power/animation_2
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/bow/type_tec/5_shot_power/animation_3

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 5 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_tec/5_shot_power/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.25
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 5..6 run tp @s ~ ~ ~ ~ ~-0.7
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 7..8 run tp @s ~ ~ ~ ~ ~0.5

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 1000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function delta:api/launch_looking

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 2

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartJump] if score @s Wpn.GeneralTimer matches 10..21 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.UsedEnderEye.Long] if score @s Wpn.GeneralTimer matches 1.. run function mhdp_items:core/buffering/b

# 遷移
    # ジャンプ：チャージステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 16..21 if score @s Ply.Stats.Stamina matches 100.. run function mhdp_items:weapons/bow/type_tec/5_shot_power/change_to_chargestep
    # スニーク+右クリック長押し：竜の一矢に移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/bow/type_tec/5_shot_power/change_to_shot_pierce

# 終了
    execute if entity @s[tag=Wpn.Bw.Tec.Shot.Power,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 23..35 run function mhdp_items:weapons/bow/type_tec/5_shot_power/end
    execute if entity @s[tag=Wpn.Bw.Tec.Shot.Power] if score @s Wpn.GeneralTimer matches 23..36 run function mhdp_items:weapons/bow/type_tec/5_shot_power/end
