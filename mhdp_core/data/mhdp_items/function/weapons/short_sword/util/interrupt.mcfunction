#> mhdp_items:weapons/short_sword/util/interrupt
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.interrupt

# ステータス削除
    attribute @s generic.attack_speed modifier remove mhdp_core:weapon_attack_speed
    attribute @s generic.movement_speed modifier remove mhdp_core:weapon_movement_speed
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s generic.attack_damage modifier add mhdp_core:weapon_attack_damage 5.0 add_value
    effect clear @s slowness

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 状態タグ削除
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard
    tag @s remove Ply.Weapon.Armod.Super
    tag @s remove Ply.Weapon.Armod.Hyper
    tag @s remove Ply.Flag.DrawAttack
    tag @s remove Ply.Flag.Hit
    tag @s remove Ply.Flag.Just.Success
    tag @s remove Ply.Flag.Counter

# アニメーション停止
    function mhdp_items:weapons/short_sword/util/stop_all_animations

# 武器モデルのリセット
    # メインハンド
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
        data modify storage mhdp_core:temp Args.Slot set value "mainhand"
        execute if items entity @s weapon.mainhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsDrawing:1b}] run function mhdp_items:core/util/item_modify_draw
    # オフハンド
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 3
        execute if items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsSubWeapon:1b,IsDrawing:1b}] run function mhdp_items:core/util/item_modify_offhand
