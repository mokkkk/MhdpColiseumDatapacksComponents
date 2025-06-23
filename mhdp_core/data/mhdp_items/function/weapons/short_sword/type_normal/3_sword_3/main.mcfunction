#> mhdp_items:weapons/short_sword/type_normal/3_sword_3/main
#
# 剣コンボ3 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"剣コンボ・３"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# キー入力時、移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function api:weapon_operation/vector_move_before.m {Strength:4000}

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/animation_3
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/particle
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/particle
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..4 run tp @s ~ ~ ~ ~-0.8 ~1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 1..8 run function mhdp_items:core/buffering/c

# 遷移
    # 右クリック：剣コンボ4に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_normal/4_sword_4/start
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_normal/4_sword_4/start
    
# 終了
    execute if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/end
