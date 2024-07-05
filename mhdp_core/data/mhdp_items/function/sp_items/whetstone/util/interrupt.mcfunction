#> mhdp_items:sp_items/whetstone/util/interrupt
#
# 特殊装具の割り込み処理
#
# @within function mhdp_items:core/switch/item/init

# 武器のモデルを変更
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 0
    execute if items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsDrawing:0b}] run function mhdp_items:core/util/item_modify_offhand

# タグ消去
    tag @s remove Itm.Sp.Whetstone.Using

# スコア削除
    scoreboard players set @s Itm.Whetstone.GeneralTimer 0

# 移動速度リセット
    effect clear @s slowness
    attribute @s generic.jump_strength modifier remove mhdp_core:sp_item_jump_strength
