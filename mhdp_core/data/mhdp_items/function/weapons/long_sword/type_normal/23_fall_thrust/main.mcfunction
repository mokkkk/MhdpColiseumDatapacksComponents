#> mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/main
#
# 落下突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.falling_thrust"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 6 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/animation_0
    execute if score @s Wpn.GeneralTimer matches 6 run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/animation_1
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/animation_2
    execute if score @s Wpn.GeneralTimer matches 101 run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/animation_1
    execute if score @s Wpn.GeneralTimer matches 102 run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/animation_2

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 7..99 unless score @s Wpn.HitCount matches 1.. run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/attack
    execute if score @s Wpn.GeneralTimer matches 100 run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -90 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 6 rotated ~ 90 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 103 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 着地判定
    execute if score @s Wpn.GeneralTimer matches 3 run tag @s add Ply.Ope.IsAir
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 8..98 run scoreboard players set @s Wpn.GeneralTimer 99
    execute if score @s Wpn.GeneralTimer matches 99 run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/effect_on_ground

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/arts_main

# 遷移
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/util/move_jump

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_normal/26_sakura_slash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 110.. run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/end
