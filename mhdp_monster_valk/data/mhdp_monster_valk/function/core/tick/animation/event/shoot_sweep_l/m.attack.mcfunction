#> mhdp_monster_valk:core/tick/animation/event/shoot_sweep_l/m.attack
#
# アニメーションイベントハンドラ 薙ぎ払い
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^ ^2.5 ^ as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^ ^5 ^ as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^-2 ^2.5 ^ as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^-2 ^5 ^ as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit

    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle cloud ^ ^ ^ 0.3 0.3 0.3 0.1 2
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^ ^2.5 ^ run particle cloud ^ ^ ^ 0.3 0.3 0.3 0.1 2
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^ ^5 ^ run particle cloud ^ ^ ^ 0.3 0.3 0.3 0.1 2