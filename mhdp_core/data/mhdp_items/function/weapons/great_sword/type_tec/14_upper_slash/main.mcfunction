#> mhdp_items:weapons/great_sword/type_tec/14_upper_slash/main
#
# 相殺斬り上げ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_5
    execute if score @s Wpn.AnimationTimer matches 1 positioned ^ ^ ^1 rotated ~ ~-10 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ^ ^2 ^0.3 rotated ~ ~-40 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/particle
    execute if score @s Wpn.AnimationTimer matches 3 positioned ^ ^ ^0.3 rotated ~ ~-80 positioned ^ ^ ^1.3 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/attack

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true

# 演出
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..4 run tp @s ~ ~ ~ ~ ~-1

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 9000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 3 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength delta.api.launch 6000
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 7 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 7 run scoreboard players set $strength delta.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 7 rotated ~0 0 run function delta:api/launch_looking

# 遷移
    # 右クリックを離した場合、溜めに移行
        # execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/change_to_charge

# 終了
    execute if score @s Wpn.GeneralTimer matches 40.. run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/end
