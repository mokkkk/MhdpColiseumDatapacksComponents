#> mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.attack
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle dust{color:[1.000,0.412,0.412],scale:3} ^ ^ ^-3 0.5 0.5 0.5 0.15 2
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle crimson_spore ^ ^ ^-3 0.3 0.3 0.3 1 30
