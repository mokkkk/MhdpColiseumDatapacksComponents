#> mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/main
#
# 踏み込み気刃斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.sacred_slash"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.armor.equip_chain master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 4 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/animation_5
    execute if score @s Wpn.GeneralTimer matches 4 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -40 run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/particle
    execute if score @s Wpn.GeneralTimer matches 4 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^2.2 rotated ~80 -40 run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 1..3 run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/delay_counter
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 2 at @s rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:false, IsAdjust:false}

# 演出
    # execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~0.5 ~
    # execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 7..8 run tp @s ~ ~ ~ ~-0.7 ~
    # execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..10 run tp @s ~ ~ ~ ~-0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 12 run function api:weapon_operation/attribute_nojump
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 3..33 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..33 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..33 run function mhdp_items:core/buffering/arts_main

# アーマー
    execute if score @s Wpn.AnimationTimer matches 5 run tag @s remove Ply.Weapon.Armor.Hyper

# 遷移
    # カウンター成功時、気刃大回転斬り
        execute if entity @s[tag=Ply.Flag.CounterSuccess,tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_normal/7_spirit_spin/start
        execute if entity @s[tag=Ply.Flag.CounterSuccess,tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_normal/7_spirit_spin/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/util/move_jump

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_normal/26_sakura_slash/start

# 終了
    execute if entity @s[tag=Ply.Flag.CounterSuccess,tag=Wpn.Ls.Normal.SacredSlash] if score @s Wpn.GeneralTimer matches 34.. run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/end
    execute if entity @s[tag=!Ply.Flag.CounterSuccess,tag=Wpn.Ls.Normal.SacredSlash] if score @s Wpn.GeneralTimer matches 17.. run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/end

