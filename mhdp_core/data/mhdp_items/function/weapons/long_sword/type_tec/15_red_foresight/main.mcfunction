#> mhdp_items:weapons/long_sword/type_tec/15_red_foresight/main
#
# 見切り斬り・旋 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.red_foresight"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 1 positioned ~ ~1.65 ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^1 0.2 0.2 0.2 0 3
    execute if score @s Wpn.GeneralTimer matches 3..5 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 3..7 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.3 0.1 0.3 0 3
    execute if score @s Wpn.GeneralTimer matches 3 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 9 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/animation_3
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/animation_4
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/animation_5
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/animation_6
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/animation_7
    execute if score @s Wpn.GeneralTimer matches 3 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -80 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/particle
    execute if score @s Wpn.GeneralTimer matches 3 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^2.2 rotated ~80 -80 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/particle
    execute if score @s Wpn.GeneralTimer matches 9 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -40 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/particle
    execute if score @s Wpn.GeneralTimer matches 9 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^2.2 rotated ~80 -40 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/attack.m {Type:1}
    execute if score @s Wpn.GeneralTimer matches 9 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/attack.m {Type:2}

# 移動
    execute if score @s Wpn.GeneralTimer matches 3 at @s rotated ~180 -30 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 5 at @s rotated ~180 -30 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:true, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..5 run tp @s ~ ~ ~ ~ ~0.5

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 18 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsKeyJump] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/d
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/e
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/jump
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/f
    execute if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/arts_main

# 無敵時間
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set @s Ply.Timer.Avoid 5

# 遷移
    # 左クリック：赤刃斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/1_normal_1/start
    # スニーク右クリック同時：気刃突きに移行
        execute if entity @s[tag=Ply.Ope.Buffering.E] if score @s Wpn.GeneralTimer matches 15.. if score @s Wpn.Ls.SpiritGauge matches 1.. run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/start
    # スニーク+ジャンプ：特殊納刀に移行
        execute if entity @s[tag=Ply.Ope.Buffering.F] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/start
# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/27_critical_juncture/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 26.. run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/end
