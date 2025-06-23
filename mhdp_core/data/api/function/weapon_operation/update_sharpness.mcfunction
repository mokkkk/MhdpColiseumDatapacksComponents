#> api:weapon_operation/update_sharpness
#
# 斬れ味を行進
#
# @input storage api: Arg.CurrentSharpness 斬れ味数値
# @input storage api: Arg.SharpnessColor 斬れ味色

# 斬れ味更新
    $execute if data storage mhdp_core:temp PlayerData.Item.Mainhand.components."minecraft:custom_data"{IsMhdpWeapon:1b,IsSubWeapon:0b} run item modify entity @s weapon.mainhand {function:set_custom_data,tag:{CurrentSharpness:$(CurrentSharpness),CurrentSharpnessColor:$(SharpnessColor)}}
    $execute if data storage mhdp_core:temp PlayerData.Item.Offhand.components."minecraft:custom_data"{IsMhdpWeapon:1b,IsSubWeapon:0b} run item modify entity @s weapon.offhand {function:set_custom_data,tag:{CurrentSharpness:$(CurrentSharpness),CurrentSharpnessColor:$(SharpnessColor)}}
