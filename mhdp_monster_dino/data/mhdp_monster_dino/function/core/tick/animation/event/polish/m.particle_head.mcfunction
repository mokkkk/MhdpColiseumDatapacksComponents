#> mhdp_monster_dino:core/tick/animation/event/polish/m.attack_head
#
# アニメーションイベントハンドラ 研ぎ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    $particle crit ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.5 10
    $particle block{block_state:"minecraft:copper_block"} ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.5 3
