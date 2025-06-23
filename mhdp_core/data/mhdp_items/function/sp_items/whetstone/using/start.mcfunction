#> mhdp_items:sp_items/whetstone/using/start
#
# 砥石の使用中処理
#
# @within function mhdp_items:sp_items/whetstone/tick

# 武器のモデルを変更
    # scoreboard players set #mhdp_arg_cmd_offset MhdpCore 2
    # execute if items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsDrawing:0b}] run function mhdp_items:core/util/item_modify_offhand
    execute if items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsDrawing:0b}] run function api:weapon/whetstone.m {Slot:"offhand"}
