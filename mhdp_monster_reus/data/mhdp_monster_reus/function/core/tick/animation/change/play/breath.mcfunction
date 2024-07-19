#> mhdp_monster_reus:core/tick/animation/change/play/breath
#
# アニメーション変更処理 突進
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットがある程度近くにいる場合、バックステップ
    execute if entity @n[tag=Mns.Target.Reus,distance=..8] run tag @s add Anim.Backstep

# それ以外の場合、通常のブレス
    execute if entity @s[tag=!Anim.Backstep] run tag @s add Anim.Breath
