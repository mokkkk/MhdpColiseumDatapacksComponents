#> mhdp_monster_reus:core/tick/shot/tick
#
# 弾用tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ブレス
    execute if entity @s[tag=Mns.Shot.Reus.Breath] run function mhdp_monster_reus:core/tick/shot/breath/tick
