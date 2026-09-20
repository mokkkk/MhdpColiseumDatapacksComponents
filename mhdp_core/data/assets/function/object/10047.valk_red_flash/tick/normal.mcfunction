#> assets:object/10047.valk_red_flash/tick/normal
#
# 通常版 tick（frame 送り + Long/非Long の生存管理）
#
# @within function assets:object/10047.valk_red_flash/tick/

# frame 送り（0→1→2→3。3 で固定）
    execute if score @s ObjectTick matches ..1 run data modify entity @s text set value {"text":"0","font":"vfx/valstrax/red_flash"}
    execute if score @s ObjectTick matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/valstrax/red_flash"}
    execute if score @s ObjectTick matches 3 run data modify entity @s text set value {"text":"2","font":"vfx/valstrax/red_flash"}
    execute if score @s ObjectTick matches 4.. run data modify entity @s text set value {"text":"3","font":"vfx/valstrax/red_flash"}

# 終了：ロング版はループ（呼び出し側が kill するまで生存）、通常版は 5 tick で消滅
    execute if entity @s[tag=10047.Long] if score @s ObjectTick matches 5.. run scoreboard players set @s ObjectTick 0
    execute if entity @s[tag=!10047.Long] if score @s ObjectTick matches 5.. run function assets:object/10047.valk_red_flash/remove/
