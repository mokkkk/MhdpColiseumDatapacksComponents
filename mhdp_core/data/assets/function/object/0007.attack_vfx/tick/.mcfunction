#> assets:object/0007.attack_vfx/tick/
#
# 攻撃Vfxのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# フォント指定
    function assets:object/0007.attack_vfx/tick/select_font
    execute if score @s ObjectTick matches 1 run data modify storage mhdp_core:temp Temp.Vfx.String set value "0"
    execute if score @s ObjectTick matches 2 run data modify storage mhdp_core:temp Temp.Vfx.String set value "1"
    execute if score @s ObjectTick matches 3 run data modify storage mhdp_core:temp Temp.Vfx.String set value "2"
    execute if score @s ObjectTick matches 4 run data modify storage mhdp_core:temp Temp.Vfx.String set value "3"
    execute if score @s ObjectTick matches 5 run data modify storage mhdp_core:temp Temp.Vfx.String set value "4"
    execute if score @s ObjectTick matches 6 run data modify storage mhdp_core:temp Temp.Vfx.String set value "5"
    execute if score @s ObjectTick matches 7 run data modify storage mhdp_core:temp Temp.Vfx.String set value "6"
    execute if score @s ObjectTick matches 8 run data modify storage mhdp_core:temp Temp.Vfx.String set value "7"
    execute if score @s ObjectTick matches 9 run data modify storage mhdp_core:temp Temp.Vfx.String set value "8"
    execute if score @s ObjectTick matches 10 run data modify storage mhdp_core:temp Temp.Vfx.String set value "9"
    execute if score @s ObjectTick matches 11 run data modify storage mhdp_core:temp Temp.Vfx.String set value "a"
    execute if score @s ObjectTick matches 12 run data modify storage mhdp_core:temp Temp.Vfx.String set value "b"
    execute if score @s ObjectTick matches 13 run data modify storage mhdp_core:temp Temp.Vfx.String set value "c"
    execute if score @s ObjectTick matches 14 run data modify storage mhdp_core:temp Temp.Vfx.String set value "d"
    execute if score @s ObjectTick matches 15 run data modify storage mhdp_core:temp Temp.Vfx.String set value "e"
    execute if score @s ObjectTick matches 16 run data modify storage mhdp_core:temp Temp.Vfx.String set value "f"

# 文字更新
    function assets:object/0007.attack_vfx/tick/update_text.m with storage mhdp_core:temp Temp.Vfx

# 終了
    data remove storage mhdp_core:temp Temp.Vfx
    execute if score @s ObjectTick matches 17.. run kill @s
