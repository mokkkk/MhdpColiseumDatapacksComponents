#> mhdp_monster_reus:core/tick/animation/event/land_tail_spin_r/attack_hit
#
# アニメーションイベントハンドラ 尻尾回転
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_chargebite/main

# ヒット判定
    $execute positioned ^$(posx) ^$(posy) ^$(posz) as @a[tag=Ply.State.EnableDamage,distance=..2.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 1
