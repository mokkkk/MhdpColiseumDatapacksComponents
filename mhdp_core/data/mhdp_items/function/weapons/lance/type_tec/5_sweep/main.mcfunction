#> mhdp_items:weapons/lance/type_tec/5_sweep/main
#
# 薙ぎ払い メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"薙ぎ払い"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/5_sweep/animation_3
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/lance/type_tec/5_sweep/animation_4
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/lance/type_tec/5_sweep/animation_5
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_tec/5_sweep/animation_6
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_tec/5_sweep/animation_7
    execute if score @s Wpn.AnimationTimer matches 1 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_tec/5_sweep/particle
    execute if score @s Wpn.AnimationTimer matches 1 positioned ~ ~1.65 ~ positioned ^ ^ ^2.7 run function mhdp_items:weapons/lance/type_tec/5_sweep/particle
    execute if score @s Wpn.AnimationTimer matches 1 positioned ~ ~1.65 ~ positioned ^ ^ ^3.2 run function mhdp_items:weapons/lance/type_tec/5_sweep/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 2 run function mhdp_items:weapons/lance/type_tec/5_sweep/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 at @s run tp @s ~ ~ ~ ~1 ~-0.2

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 10 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..17 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..17 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/arts_main

# 遷移
     # 左クリック：突きに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/lance/type_tec/5_sweep/change_to_spear
     # スニーク+ジャンプ：ガードダッシュに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/lance/type_tec/7_guard_dash/start
    # ジャンプ：ステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/lance/type_tec/10_step/start

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/30_upper_bash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/lance/type_tec/5_sweep/end
