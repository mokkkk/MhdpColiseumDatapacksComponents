#> mhdp_monster_dino:core/tick/animation/event/tail_side_r/m.attack_head
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# ヒット確認
    $execute positioned ^$(posx) ^$(posy) ^$(posz) as @a[tag=Ply.State.EnableDamage,distance=..2.5] run tag @s add Temp.Hit
    $execute positioned ^$(posx) ^$(posy) ^$(posz) positioned ~ ~ ~ run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.7 0.1 0.7 0 10
    $execute on vehicle if entity @s[tag=Mns.Dino.State.TailHeat] run particle lava ^$(posx) ^$(posy) ^$(posz) 0.3 0.1 0.3 0 1
