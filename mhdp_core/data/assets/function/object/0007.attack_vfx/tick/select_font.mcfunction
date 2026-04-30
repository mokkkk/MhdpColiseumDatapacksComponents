#> assets:object/0007.attack_vfx/tick/select_font
#
# 攻撃Vfxのtick処理
#
# @within function mhdp_items:/**

# フォント指定
    execute if entity @s[tag=slash] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "slash"
    execute if entity @s[tag=slash_strong] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "slash_strong"
    execute if entity @s[tag=slash_ride] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "slash_ride"
    execute if entity @s[tag=slash_counter] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "slash_counter"
    execute if entity @s[tag=slash_arts] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "slash_arts"
    execute if entity @s[tag=blow] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "blow"
    execute if entity @s[tag=blow_strong] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "blow_strong"
    execute if entity @s[tag=shot] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "shot"
    execute if entity @s[tag=shot_strong] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "shot_strong"
    execute if entity @s[tag=shot_arts] run data modify storage mhdp_core:temp Temp.Vfx.Font set value "shot_arts"
