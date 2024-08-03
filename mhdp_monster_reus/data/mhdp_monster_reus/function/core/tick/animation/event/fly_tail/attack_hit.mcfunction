#> mhdp_monster_reus:core/tick/animation/event/fly_tail/attack_hit
#
# アニメーションイベントハンドラ 飛行尻尾なぎはらい
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_chargebite/main

# ヒット判定
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ~ ~-1 ~ as @a[tag=Ply.State.EnableDamage,distance=..2.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 1
