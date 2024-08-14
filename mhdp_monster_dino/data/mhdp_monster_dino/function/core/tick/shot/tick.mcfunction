#> mhdp_monster_dino:core/tick/shot/tick
#
# 弾用tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 火炎
    execute if entity @s[tag=Mns.Shot.Dino.Flame] run function mhdp_monster_dino:core/tick/shot/flame/tick

# ブレス
    execute if entity @s[tag=Mns.Shot.Dino.Breath] run function mhdp_monster_dino:core/tick/shot/breath/tick
