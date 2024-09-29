#> mhdp_items:weapons/bow/type_tec/2_shot_normal/main
#
# 射撃 メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_tec/2_shot_normal/animation_1
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/bow/type_tec/2_shot_normal/animation_2
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/bow/type_tec/2_shot_normal/animation_3
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_tec/2_shot_normal/animation_0

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_tec/2_shot_normal/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.25

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 1000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function delta:api/launch_looking

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartJump] if score @s Wpn.GeneralTimer matches 1..15 run function mhdp_items:core/buffering/a

# 遷移
    # 右クリック押し続け：溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 8.. run function mhdp_items:weapons/bow/type_tec/2_shot_normal/change_to_charge
    # ジャンプ：チャージステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/bow/type_tec/2_shot_normal/change_to_chargestep

# 終了
    execute if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/bow/type_tec/2_shot_normal/end
