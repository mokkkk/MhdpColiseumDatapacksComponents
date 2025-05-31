#> mhdp_items:weapons/short_sword/type_tec/11_tsumuji/main
#
# 旋刈り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"旋刈り"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 8 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_2
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_3
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_4
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_5
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_6
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_7
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/attack
    execute if score @s Wpn.GeneralTimer matches 12 run function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/attack_pursuit

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~-2.2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..11 run tp @s ~ ~ ~ ~2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 12..13 run tp @s ~ ~ ~ ~0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 7 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 16 run function api:weapon_operation/attribute_reset
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 5 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 5 run scoreboard players set $strength player_motion.api.launch 2000
    execute if score @s Wpn.GeneralTimer matches 5 rotated ~ 0 run function player_motion:api/launch_looking

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartDoubleJump] if score @s Wpn.GeneralTimer matches 3..24 run function mhdp_items:core/buffering/jump
    execute if entity @s[tag=Ply.Ope.UsedSneakingEnderEye.Long] if score @s Wpn.GeneralTimer matches 3..24 run function mhdp_items:core/buffering/f

# 遷移
    # スニーク+ジャンプ時：バックステップに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.StartKeyJump] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/change_to_backstep
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/short_sword/util/move_jump
    # 同時押し長押し：溜め斬り落としに移行
        execute if entity @s[tag=Ply.Ope.Buffering.F] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/start_finish

# 終了
    execute if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/end
