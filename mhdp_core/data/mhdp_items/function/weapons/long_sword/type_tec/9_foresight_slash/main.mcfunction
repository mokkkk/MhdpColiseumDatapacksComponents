#> mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/main
#
# 見切り斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.foresight"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 1..5 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 1..7 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.3 0.1 0.3 0 3
    execute if score @s Wpn.GeneralTimer matches 17 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 15 run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 19 run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/animation_5
    execute if score @s Wpn.GeneralTimer matches 17 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 30 run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 17 run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 3 at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 5 at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 11 at @s rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 13 at @s rotated ~0 0 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 15 at @s rotated ~0 0 run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~0.5 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 7..8 run tp @s ~ ~ ~ ~-0.7 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..10 run tp @s ~ ~ ~ ~-0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 18 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/d
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/e
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/arts_main

# 無敵時間
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set @s Ply.Timer.Avoid 5

# 遷移
    # # 左クリック：斬り上げ(コンボ用)に移行
    #     execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/3_normal_3/start_in_spirit
    # # 右クリック：気刃斬り3に移行
    #     execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 13.. if score @s Wpn.Ls.SpiritGauge matches 200.. run function mhdp_items:weapons/long_sword/type_tec/6_spirit_slash_3/start
    # # スニーク左クリック：移動斬りに移行
    #     execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/8_move_slash/start
    # # スニーク右クリック：見切り斬りに移行
    #     execute if entity @s[tag=Ply.Ope.Buffering.D] if score @s Wpn.GeneralTimer matches 13.. if score @s Wpn.Ls.SpiritGauge matches 1.. run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/start
    # スニーク右クリック同時：気刃突きに移行
        execute if entity @s[tag=Ply.Ope.Buffering.E] if score @s Wpn.GeneralTimer matches 23.. if score @s Wpn.Ls.SpiritGauge matches 1.. run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/start
    # # ジャンプ回避
    #     execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 13.. run function mhdp_items:weapons/long_sword/util/move_jump

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/22_guard_rage/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/24_screw_thrust/start
# 終了
    execute if score @s Wpn.GeneralTimer matches 26.. run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/end
