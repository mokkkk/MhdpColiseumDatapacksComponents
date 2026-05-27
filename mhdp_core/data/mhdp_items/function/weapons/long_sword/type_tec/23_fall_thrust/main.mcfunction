#> mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/main
#
# 落下突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.falling_thrust"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 6 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/animation_0
    execute if score @s Wpn.GeneralTimer matches 6 run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/animation_1
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/animation_2
    execute if score @s Wpn.GeneralTimer matches 101 run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/animation_1
    execute if score @s Wpn.GeneralTimer matches 102 run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/animation_2

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 7..99 unless score @s Wpn.HitCount matches 1.. run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/attack
    execute if score @s Wpn.GeneralTimer matches 100 run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -60 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 6 rotated ~ 90 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 103 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 着地判定
    execute if score @s Wpn.GeneralTimer matches 3 run tag @s add Ply.Ope.IsAir
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 8..98 run scoreboard players set @s Wpn.GeneralTimer 99
    execute if score @s Wpn.GeneralTimer matches 99 run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/effect_on_ground

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..119 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..119 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..119 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..119 run function mhdp_items:core/buffering/d
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..119 run function mhdp_items:core/buffering/e
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..119 run function mhdp_items:core/buffering/f
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..119 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..119 run function mhdp_items:core/buffering/arts_main

# 遷移
    # 左クリック：斬り上げに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_tec/3_normal_3/start
    # 右クリック：気刃斬り1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_tec/4_spirit_slash_1/start
    # スニーク左クリック：移動斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_tec/8_move_slash/start
    # スニーク右クリック：見切り斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.D] if score @s Wpn.GeneralTimer matches 105.. if score @s Wpn.Ls.SpiritGauge matches 1.. run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/start
    # スニーク右クリック同時：気刃突きに移行
        execute if entity @s[tag=Ply.Ope.Buffering.E] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/start
    # スニーク+ジャンプ：特殊納刀に移行
        execute if entity @s[tag=Ply.Ope.Buffering.F] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/util/move_jump
# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_tec/22_guard_rage/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_tec/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 120.. run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/end
