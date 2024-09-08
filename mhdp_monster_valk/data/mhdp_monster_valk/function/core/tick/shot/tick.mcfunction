#> mhdp_monster_valk:core/tick/shot/tick
#
# 弾用tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 彗星演出
    execute if entity @s[tag=Mns.Shot.Valk.Vfx.Comet] run function mhdp_monster_valk:core/tick/shot/vfx_comet/tick
    execute if entity @s[tag=Mns.Shot.Valk.Vfx.Star] run function mhdp_monster_valk:core/tick/shot/vfx_comet_star/tick

# ブレス
    # execute if entity @s[tag=Mns.Shot.Valk.Breath] run function mhdp_monster_valk:core/tick/shot/breath/tick

# 尻尾
    # execute if entity @s[tag=Mns.Shot.Valk.Tail] run function mhdp_monster_valk:core/tick/shot/tail/tick
