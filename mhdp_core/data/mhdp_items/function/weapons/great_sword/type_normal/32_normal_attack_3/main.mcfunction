#> mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/main
#
# 相殺斬り上げ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"通常攻撃・３"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/animation_4
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/animation_3
    execute if score @s Wpn.AnimationTimer matches 4 positioned ^ ^3 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/particle
    execute if score @s Wpn.AnimationTimer matches 5 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/attack

# 遷移
    # 右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 17.. run function mhdp_items:weapons/great_sword/type_normal/1_charge/start
    # Ctrl+右クリック長押し時、震怒竜怨斬に移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint] if score @s Wpn.GeneralTimer matches 17.. if score @s Ply.Stats.Arts.2 >= @s Ply.Stats.Arts.2.Max run function mhdp_items:weapons/great_sword/type_normal/4_guard/change_to_rage

# 終了
    execute if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/great_sword/type_normal/32_normal_attack_3/end
