#> assets:object/10045.valk_beam/tick/
#
# ループ VFX tick（旧 mhdp_monster_valk:core/tick/shot の frame 送り）
#
# @within function assets:core/**

# 経過
    scoreboard players add @s ObjectTick 1
    scoreboard players add @s MhdpCore 1

# frame 送り（0→1→2 を繰り返す）
    execute if score @s MhdpCore matches ..1 run data modify entity @s text set value {"text":"0","font":"vfx/valstrax/beam"}
    execute if score @s MhdpCore matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/valstrax/beam"}
    execute if score @s MhdpCore matches 3.. run data modify entity @s text set value {"text":"2","font":"vfx/valstrax/beam"}
    execute if score @s MhdpCore matches 3.. run scoreboard players set @s MhdpCore 0

# 終了
    # TODO: 旧はアニメイベント側で kill @e[tag=...] していた。呼び出し側から kill するか、下記の寿命上限を適正値に調整すること
    execute if score @s ObjectTick matches 300.. run function assets:object/10045.valk_beam/remove/
