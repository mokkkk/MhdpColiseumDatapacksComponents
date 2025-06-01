#> mhdp_items:weapons/short_sword/type_normal/10_charge/main
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"溜め"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..5 run function mhdp_items:weapons/short_sword/type_normal/10_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/short_sword/type_normal/10_charge/animation_1

# 演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 10 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 20 run function mhdp_items:weapons/short_sword/type_normal/10_charge/up_charge_count

# 移動
    execute if score @s Wpn.GeneralTimer matches 6 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 6 run scoreboard players set $strength player_motion.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 6 rotated ~180 0 run function player_motion:api/launch_looking

# 遷移
    # 右クリック解除：回転斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/short_sword/type_normal/11_spin/start
    # 溜め：剣の舞に移行
        execute if entity @s[tag=Wpn.Ss.Normal.Charge,tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 30.. run function mhdp_items:weapons/short_sword/type_normal/10_charge/change_to_dance_rush

# 終了
    execute if score @s Wpn.GeneralTimer matches 1000.. run function mhdp_items:weapons/short_sword/type_normal/10_charge/end
