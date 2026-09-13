#> assets:object/10047.valk_red_flash/tick/
#
# 龍閃 赤フラッシュ VFX tick（旧 mhdp_monster_valk:core/tick/shot/vfx_red_flash/tick）
#
# @within function assets:core/**

# 経過
    scoreboard players add @s ObjectTick 1

# frame 送り（0→1→2→3。3 で固定）
    execute if score @s ObjectTick matches ..1 run data modify entity @s text set value {"text":"0","font":"vfx/valstrax/red_flash"}
    execute if score @s ObjectTick matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/valstrax/red_flash"}
    execute if score @s ObjectTick matches 3 run data modify entity @s text set value {"text":"2","font":"vfx/valstrax/red_flash"}
    execute if score @s ObjectTick matches 4.. run data modify entity @s text set value {"text":"3","font":"vfx/valstrax/red_flash"}

# 終了：ロング版はループ（呼び出し側が kill するまで生存）、通常版は 5 tick で消滅
    execute if entity @s[tag=10047.Long] if score @s ObjectTick matches 5.. run scoreboard players set @s ObjectTick 0
    execute if entity @s[tag=!10047.Long] if score @s ObjectTick matches 5.. run function assets:object/10047.valk_red_flash/remove/
