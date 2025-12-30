#> mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/main
#
# 相殺斬り上げ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"通常攻撃・３"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/animation_4
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/animation_3
    execute if score @s Wpn.AnimationTimer matches 4 positioned ^ ^3 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/particle
    execute if score @s Wpn.AnimationTimer matches 5 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/attack

# # 先行入力
#     execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint] if score @s Wpn.GeneralTimer matches 1..39 run function mhdp_items:core/buffering/jump
#     execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.StartKeyJump] if score @s Ply.Stats.Arts.1 >= @s Ply.Stats.Arts.1.Max if score @s Wpn.GeneralTimer matches 1..39 run function mhdp_items:core/buffering/a

# 遷移
    # # スニーク+ジャンプ：狩技・強化納刀に移行
    #     execute if entity @s[tag=Ply.Ope.Buffering.A,tag=!Ply.Flag.CounterSuccess] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/type_tec/17_power_sheathe/start
    # # ジャンプ回避
    #     execute if entity @s[tag=Ply.Ope.Buffering.Jump,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/util/move_jump

# 終了
    execute if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/end
