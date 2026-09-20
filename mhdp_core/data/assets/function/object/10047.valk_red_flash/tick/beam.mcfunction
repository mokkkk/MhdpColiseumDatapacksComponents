#> assets:object/10047.valk_red_flash/tick/beam
#
# ビームVFX版 tick（Override.IsBeamVfx）frame 送り + 経過tickに応じたスケール拡大（溜め演出）
# 自動消滅はしない（呼び出し側が明示的に kill するまで生存）
#
# @within function assets:object/10047.valk_red_flash/tick/

# frame 送り（0→1→2→3。3 で固定）
    execute if score @s MhdpCore matches ..1 run data modify entity @s text set value {"text":"0","font":"vfx/valstrax/jet"}
    execute if score @s MhdpCore matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/valstrax/jet"}
    execute if score @s MhdpCore matches 3.. run data modify entity @s text set value {"text":"2","font":"vfx/valstrax/jet"}

# スケール拡大：経過tickをクランプ（20tickで頭打ち）
    scoreboard players operation #mhdp_temp_valk_beam_vfx_tick MhdpCore = @s ObjectTick
    execute if score #mhdp_temp_valk_beam_vfx_tick MhdpCore matches 20.. run scoreboard players set #mhdp_temp_valk_beam_vfx_tick MhdpCore 20

# スケール = 2.0 + 0.3 * 経過tick（8.0で頭打ち）
    scoreboard players set #mhdp_temp_valk_beam_vfx_step MhdpCore 30
    scoreboard players operation #mhdp_temp_valk_beam_vfx_tick MhdpCore *= #mhdp_temp_valk_beam_vfx_step MhdpCore
    scoreboard players add #mhdp_temp_valk_beam_vfx_tick MhdpCore 200
    execute store result entity @s transformation.scale[0] float 0.01 run scoreboard players get #mhdp_temp_valk_beam_vfx_tick MhdpCore
    execute store result entity @s transformation.scale[1] float 0.01 run scoreboard players get #mhdp_temp_valk_beam_vfx_tick MhdpCore
    execute store result entity @s transformation.scale[2] float 0.01 run scoreboard players get #mhdp_temp_valk_beam_vfx_tick MhdpCore

# 終了
    scoreboard players reset #mhdp_temp_valk_beam_vfx_tick MhdpCore
    scoreboard players reset #mhdp_temp_valk_beam_vfx_step MhdpCore
    execute if score @s MhdpCore matches 3.. run scoreboard players set @s MhdpCore 0
