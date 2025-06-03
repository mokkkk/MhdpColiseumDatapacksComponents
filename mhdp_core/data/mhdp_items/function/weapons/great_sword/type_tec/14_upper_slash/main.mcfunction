#> mhdp_items:weapons/great_sword/type_tec/14_upper_slash/main
#
# 相殺斬り上げ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"相殺斬り上げ"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_5
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_6
    execute if entity @s[tag=Ply.Flag.CounterSuccess] if score @s Wpn.AnimationTimer matches 18 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if entity @s[tag=Ply.Flag.CounterSuccess] if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/animation_7
    execute if score @s Wpn.AnimationTimer matches 2 positioned ^ ^ ^1 rotated ~ ~-10 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/particle
    execute if score @s Wpn.AnimationTimer matches 3 positioned ^ ^2 ^0.3 rotated ~ ~-40 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/particle
    execute if score @s Wpn.AnimationTimer matches 4 positioned ^ ^ ^0.3 rotated ~ ~-80 positioned ^ ^ ^1.3 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/attack
    execute if entity @s[tag=Ply.Flag.CounterSuccess] if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/attack_pursuit

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 8 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..7 run tp @s ~ ~ ~ ~-0.2 ~-1
    execute if entity @s[tag=Ply.Weapon.HisStop,tag=Ply.Flag.CounterSuccess,tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 4 at @s run tp @s ~ ~ ~ ~-1 ~
    execute if entity @s[tag=Ply.Weapon.HisStop,tag=Ply.Flag.CounterSuccess,tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 5 at @s run tp @s ~ ~ ~ ~2 ~
    execute if entity @s[tag=Ply.Weapon.HisStop,tag=Ply.Flag.CounterSuccess,tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 6 at @s run tp @s ~ ~ ~ ~-1 ~
    execute if entity @s[tag=Ply.Weapon.HisStop,tag=Ply.Flag.CounterSuccess,tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 7 at @s run tp @s ~ ~ ~ ~1 ~

# アーマー
    execute if score @s Wpn.GeneralTimer matches 3 run tag @s add Ply.Weapon.Armod.Hyper
    execute if entity @s[tag=!Ply.Flag.CounterSuccess] if score @s Wpn.GeneralTimer matches 4 run tag @s remove Ply.Weapon.Armod.Hyper
    execute if score @s Wpn.GeneralTimer matches 15 run tag @s remove Ply.Weapon.Armod.Hyper

# 移動
    execute if score @s Wpn.AnimationTimer matches 1 run tp @s @s
    execute if score @s Wpn.AnimationTimer matches 1 run scoreboard players set $strength player_motion.api.launch 12000
    execute if score @s Wpn.AnimationTimer matches 1 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.AnimationTimer matches 3 run tp @s @s
    execute if score @s Wpn.AnimationTimer matches 3 run scoreboard players set $strength player_motion.api.launch 8000
    execute if score @s Wpn.AnimationTimer matches 3 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.AnimationTimer matches 6 run tp @s @s
    execute if entity @s[tag=!Ply.Flag.CounterSuccess] if score @s Wpn.AnimationTimer matches 6 run scoreboard players set $strength player_motion.api.launch 4000
    execute if entity @s[tag=Ply.Flag.CounterSuccess] if score @s Wpn.AnimationTimer matches 6 run scoreboard players set $strength player_motion.api.launch 9000
    execute if entity @s[tag=!Ply.Flag.CounterSuccess] if score @s Wpn.AnimationTimer matches 6 rotated ~ -60 run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Flag.CounterSuccess] if score @s Wpn.AnimationTimer matches 6 rotated ~180 -10 run function player_motion:api/launch_looking

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartDoubleJump] if score @s Wpn.GeneralTimer matches 1..39 run function mhdp_items:core/buffering/jump

# 遷移
    # カウンター成功後、右クリック長押し：十字斬り・移動に移行
        execute if entity @s[tag=Ply.Flag.CounterSuccess,tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/great_sword/type_tec/16_cross_move/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/util/move_jump

# 終了
    execute if score @s Wpn.GeneralTimer matches 40.. run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/end
