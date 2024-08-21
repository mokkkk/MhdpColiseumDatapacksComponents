#> mhdp_monster_dino:core/tick/animation/event/voice/m.particle_tail
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ~ ~ ~ run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.7 0.1 0.7 0 10
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ~ ~ ~ run particle crit ~ ~0.1 ~ 0.3 0.1 0.3 0.4 10
