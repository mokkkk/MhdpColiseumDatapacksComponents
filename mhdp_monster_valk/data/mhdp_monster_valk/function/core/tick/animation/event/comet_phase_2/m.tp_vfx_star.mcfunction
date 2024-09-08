#> mhdp_monster_valk:core/tick/animation/event/comet_phase_1/m.summon_vfx
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 召喚
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run tp @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Star] ~ ~ ~ ~ 0
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust_color_transition{from_color:[1.000,0.412,0.412],scale:4,to_color:[1.000,1.000,1.000]} ~ ~5 ~ 1 1 1 0 20 force
    # $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust_color_transition{from_color:[1.000,0.412,0.412],scale:4,to_color:[1.000,1.000,1.000]} ~ ~5 ~ 2 2 2 0 20 force
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle firework ~ ~5 ~ 1 1 1 0.2 20 force
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle campfire_cosy_smoke ~ ~5 ~ 1 1 1 0.05 20 force
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle explosion ~ ~5 ~ 2 2 2 0.2 30 force
