#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/tp_vfx_star
#
# アニメーションイベントハンドラ 彗星・滑空 (at_locator pos_comet_star から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main

# 追従
    tp @n[type=text_display,tag=10044.StarVfx] ~ ~ ~ ~ 0

# 演出
    particle dust_color_transition{from_color:[1.000,0.000,0.152],scale:4,to_color:[1.000,1.000,1.000]} ~ ~5 ~ 1 1 1 0 20 force
    particle firework ~ ~5 ~ 1 1 1 0.2 20 force
    particle campfire_cosy_smoke ~ ~5 ~ 1 1 1 0.05 20 force
    particle explosion ~ ~5 ~ 2 2 2 0.2 30 force
