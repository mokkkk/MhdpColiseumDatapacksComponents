#> mhdp_monster_dino:core/tick/animation/event/bite/m.attack_head
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) as @a[tag=Ply.State.EnableDamage,distance=..2.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ~ ~-2 ~ as @a[tag=Ply.State.EnableDamage,distance=..2.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crit ~ ~ ~ 0.2 0.2 0.2 0.1 10
