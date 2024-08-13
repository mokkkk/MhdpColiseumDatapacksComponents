#> mhdp_monster_dino:core/tick/animation/event/bite/m.attack_head
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) as @a[tag=Ply.State.EnableDamage,distance=..2.5] run tag @s add Temp.Hit
    $execute on vehicle if entity @s[tag=Mns.Dino.State.HeadHeat] run particle flame ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.1 3
