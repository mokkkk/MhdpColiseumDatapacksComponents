#> mhdp_monster_dino:core/tick/animation/event/roundforce/m.attack_head
#
# アニメーションイベントハンドラ 大回転斬り
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    $particle flame ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.1 3 force
    $particle crit ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.5 10 force
    $particle crit ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.8 10 force
    $particle lava ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.5 1 force
