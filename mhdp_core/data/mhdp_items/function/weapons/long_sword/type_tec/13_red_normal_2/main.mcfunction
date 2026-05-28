#> mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/main
#
# 赤刃斬り2 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.red_normal_2"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_chain master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 4 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 10 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/animation_3
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/animation_4
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/animation_5
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/animation_6
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/animation_7
    execute if score @s Wpn.GeneralTimer matches 4 positioned ~ ~1.65 ~ positioned ^-0.5 ^-0.3 ^1.2 rotated ~80 -10 run function mhdp_items:weapons/long_sword/type_tec/3_normal_3/particle
    execute if score @s Wpn.GeneralTimer matches 4 positioned ~ ~1.65 ~ positioned ^-0.5 ^-0.3 ^2.2 rotated ~80 -10 run function mhdp_items:weapons/long_sword/type_tec/3_normal_3/particle
    execute if score @s Wpn.GeneralTimer matches 10 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -30 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/particle
    execute if score @s Wpn.GeneralTimer matches 10 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^2.2 rotated ~80 -30 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/attack_0
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/attack_1

# 移動
    execute if entity @s[tag=!Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyBack] if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:2500, IsForce:false, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyForward] if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 11 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 20 run function api:weapon_operation/attribute_nojump
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..31 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/d
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/e
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/jump
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/f
    execute if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/arts_main

# 遷移
    # 左クリック：赤刃斬り3に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/long_sword/type_tec/3_normal_3/start
    # 右クリック：気刃斬り1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/long_sword/type_tec/4_spirit_slash_1/start
    # スニーク左クリック：移動斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_tec/8_move_slash/start
    # スニーク右クリック：見切り斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.D] if score @s Wpn.GeneralTimer matches 14.. if score @s Wpn.Ls.SpiritGauge matches 1.. run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/start
    # スニーク右クリック同時：気刃突きに移行
        execute if entity @s[tag=Ply.Ope.Buffering.E] if score @s Wpn.GeneralTimer matches 14.. if score @s Wpn.Ls.SpiritGauge matches 1.. run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/util/move_jump
    # スニーク+ジャンプ：特殊納刀に移行
        execute if entity @s[tag=Ply.Ope.Buffering.F] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/start
# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_tec/27_critical_juncture/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 32.. run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/end
