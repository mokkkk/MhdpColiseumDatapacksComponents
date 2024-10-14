#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/flash
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute positioned ^ ^2 ^8 run tp @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet] ~ ~ ~ ~ 0

# サイズ変更
    execute store result storage mhdp_core:temp Temp.Scale float 0.01 run scoreboard players add #mhdp_temp_valk_flash_scale MhdpCore 30
    function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/m.flash with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp.Scale