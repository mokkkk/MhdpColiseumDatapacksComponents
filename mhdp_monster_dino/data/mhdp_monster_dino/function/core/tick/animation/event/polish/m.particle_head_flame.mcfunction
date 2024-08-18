#> mhdp_monster_dino:core/tick/animation/event/polish/m.particle_head_flame
#
# アニメーションイベントハンドラ 研ぎ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    $particle flame ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.1 3
    $particle lava ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0 1
