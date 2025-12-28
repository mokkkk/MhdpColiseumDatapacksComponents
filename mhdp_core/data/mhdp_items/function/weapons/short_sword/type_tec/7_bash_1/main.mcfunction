#> mhdp_items:weapons/short_sword/type_tec/7_bash_1/main
#
# 盾攻撃 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"盾攻撃コンボ・１"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_3
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_4
    execute if score @s Wpn.AnimationTimer matches 4 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~-1 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 4..7 run tp @s ~ ~ ~ ~1.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 7 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    # execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength player_motion.api.launch 3000
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:true}
    
# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.NotSneak] if score @s Wpn.GeneralTimer matches 3..12 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint] if score @s Wpn.GeneralTimer matches 3..12 run function mhdp_items:core/buffering/jump
    execute if entity @s[tag=Ply.Ope.UsedSneakingEnderEye.Short] if score @s Wpn.GeneralTimer matches 3..12 run function mhdp_items:core/buffering/d
    execute if entity @s[tag=Ply.Ope.UsedSneakingEnderEye.Long] if score @s Wpn.GeneralTimer matches 3..12 run function mhdp_items:core/buffering/f
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeySprint] if score @s Wpn.GeneralTimer matches 3..12 run function mhdp_items:core/buffering/g
    execute if score @s Wpn.GeneralTimer matches 3..12 run function mhdp_items:core/buffering/arts_main

# 遷移
     # スニーク+ジャンプ時：バックステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.G] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/12_backstep/start
    # 右クリック：バックナックルに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/8_bash_2/start
    # 同時押し：回転斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.D] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/10_spin/start
    # 同時押し長押し：溜め斬り落としに移行
        execute if entity @s[tag=Ply.Ope.Buffering.F] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/util/move_jump

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 13.. run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/end
