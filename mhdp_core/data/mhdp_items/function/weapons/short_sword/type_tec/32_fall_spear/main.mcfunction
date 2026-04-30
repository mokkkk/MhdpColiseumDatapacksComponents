#> mhdp_items:weapons/short_sword/type_tec/32_fall_spear/main
#
# 溜め斬り落とし メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"落下突き"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/animation_5
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/animation_7
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/animation_6
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/animation_7
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/animation_8
    execute if score @s Wpn.GeneralTimer matches 100 run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/animation_9

# 演出
    execute if score @s Wpn.GeneralTimer matches 7 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 7..99 unless score @s Wpn.HitCount matches 5.. run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/attack
    execute if score @s Wpn.GeneralTimer matches 100 run scoreboard players reset @s Wpn.HitCount

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 100 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 着地判定
    execute if score @s Wpn.GeneralTimer matches 3 run tag @s add Ply.Ope.IsAir
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 8..98 run scoreboard players set @s Wpn.GeneralTimer 99
    execute if score @s Wpn.GeneralTimer matches 99 run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/effect_on_ground

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -60 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 6 rotated ~ 90 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 3..114 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint] if score @s Wpn.GeneralTimer matches 3..114 run function mhdp_items:core/buffering/jump

# 遷移
    # 右クリック：斬り上げに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 104..109 run function mhdp_items:weapons/short_sword/type_tec/29_upper_slash/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 104..109 run function mhdp_items:weapons/short_sword/util/move_jump

# 終了
    execute if score @s Wpn.GeneralTimer matches 110.. run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/end
