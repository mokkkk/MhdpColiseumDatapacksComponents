#> mhdp_items:weapons/great_sword/type_tec/20_counter_stance_success/main
#
# 威姿呵成の構え メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"威姿呵成の構え"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/20_counter_stance_success/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/20_counter_stance_success/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/20_counter_stance_success/animation_2

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 10000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength player_motion.api.launch 5000
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function player_motion:api/launch_looking

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 右クリック長押し：真溜めに移行
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 10.. run function mhdp_items:weapons/great_sword/type_tec/1_charge/start_with_stance


# 終了
    execute if score @s Wpn.GeneralTimer matches 50.. run function mhdp_items:weapons/great_sword/type_tec/20_counter_stance_success/end
