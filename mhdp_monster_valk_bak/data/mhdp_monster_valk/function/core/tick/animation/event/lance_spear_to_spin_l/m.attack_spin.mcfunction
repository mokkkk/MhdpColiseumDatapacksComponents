#> mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.attack_spin
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run particle cloud ^ ^ ^-3 0.3 0.3 0.3 0.1 3

    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^-2 ^ ^ as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^-2 ^ ^ run particle cloud ^ ^ ^-3 0.3 0.3 0.3 0.1 2

    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^-4 ^ ^ as @a[tag=Ply.State.EnableDamage,distance=..3.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ^-4 ^ ^ run particle cloud ^ ^ ^-3 0.3 0.3 0.3 0.1 2
