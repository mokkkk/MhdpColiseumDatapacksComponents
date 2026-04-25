#> mhdp_items:weapons/lance/type_tec/20_low_spear/main
#
# 突き1 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"空中強突き"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 5 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/20_low_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/lance/type_tec/20_low_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_tec/20_low_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_tec/20_low_spear/animation_3
    execute if score @s Wpn.GeneralTimer matches 100 run function mhdp_items:weapons/lance/type_tec/20_low_spear/animation_4
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_tec/20_low_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_tec/20_low_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_tec/20_low_spear/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/lance/type_tec/20_low_spear/attack
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/lance/type_tec/20_low_spear/attack
    execute if score @s Wpn.GeneralTimer matches 11 run function mhdp_items:weapons/lance/type_tec/20_low_spear/attack
    execute if score @s Wpn.GeneralTimer matches 14 run function mhdp_items:weapons/lance/type_tec/20_low_spear/attack
    execute if score @s Wpn.GeneralTimer matches 17 run function mhdp_items:weapons/lance/type_tec/20_low_spear/attack

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 着地判定
    execute if score @s Wpn.GeneralTimer matches 3 run tag @s add Ply.Ope.IsAir
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 8..98 run scoreboard players set @s Wpn.GeneralTimer 99
    execute if score @s Wpn.GeneralTimer matches 99 run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/effect_on_ground

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/d
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/e
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/arts_main

# 遷移
     # 左クリック：突き2に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 104.. run function mhdp_items:weapons/lance/type_tec/2_spear_2/start
     # 右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 104.. run function mhdp_items:weapons/lance/type_tec/4_charge/start
     # スニーク+ジャンプ：ガードダッシュに移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 104.. run function mhdp_items:weapons/lance/type_tec/7_guard_dash/start
    # ジャンプ：ステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 104.. run function mhdp_items:weapons/lance/type_tec/10_step/start
     # スニーク+右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.Buffering.D] if score @s Wpn.GeneralTimer matches 104.. run function mhdp_items:weapons/lance/type_tec/11_charge_counter/start
     # スニーク+左クリック：突進に移行
        execute if entity @s[tag=Ply.Ope.Buffering.E] if score @s Wpn.GeneralTimer matches 104.. run function mhdp_items:weapons/lance/type_tec/18_dash/start

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 104.. run function mhdp_items:weapons/lance/type_tec/22_guard_rage/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 104.. run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 110.. run function mhdp_items:weapons/lance/type_tec/20_low_spear/end
