#> mhdp_monster_dino:core/tick/animation/event/tail_side_r/m.particle_tail
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ~ ~ ~ run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.7 0.1 0.7 0 10
