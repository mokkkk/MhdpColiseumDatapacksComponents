#> mhdp_monster_dino:core/tick/animation/event/roundforce/m.attack_head
#
# アニメーションイベントハンドラ 大回転斬り
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    $particle flame ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.1 2
    $particle crit ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.5 10