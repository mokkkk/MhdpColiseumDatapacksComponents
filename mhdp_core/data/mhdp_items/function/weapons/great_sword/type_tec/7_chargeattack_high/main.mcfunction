#> mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/main
#
# 強溜め斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"強溜め斬り"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/animation_3
    execute if score @s Wpn.AnimationTimer matches 4 rotated ~ 0 run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/effect_on_ground
    execute if score @s Wpn.AnimationTimer matches 1 positioned ^ ^2 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/attack

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 6 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 抜刀攻撃終了
    execute if score @s Wpn.GeneralTimer matches 5 run tag @s remove Ply.Flag.DrawAttack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~0.05 ~
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 3 run tp @s ~ ~0.05 ~
    execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength player_motion.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~ 0 run function player_motion:api/launch_looking

# 演出
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~ ~2

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartDoubleJump] if score @s Wpn.GeneralTimer matches 1..39 run function mhdp_items:core/buffering/jump

# 遷移
    # 右クリックを離した場合、溜めに移行
        execute if entity @s[tag=!Ply.Ope.IsSneaking,tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/type_tec/1_charge/start_with_other
    # スニーク+右クリック長押し：反撃斬り上げ溜めに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/util/move_jump
    
# 終了
    execute if score @s Wpn.GeneralTimer matches 40.. run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/end
