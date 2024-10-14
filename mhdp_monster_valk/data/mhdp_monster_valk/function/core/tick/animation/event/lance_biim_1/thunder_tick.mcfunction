#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/particle
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 演出移動
    execute as @e[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long,tag=!Temp.IsTp] run tp @s ^ ^2 ^8
