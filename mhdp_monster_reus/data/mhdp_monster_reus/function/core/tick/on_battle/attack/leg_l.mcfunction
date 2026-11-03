#> mhdp_monster_reus:core/tick/on_battle/attack/leg_l
#
# tick処理 戦闘中 攻撃 (左脚)
#
# @within function mhdp_monsters:core/switch/macro/m.start_attack

# エラー検知用
    execute if entity @s[type=item_display] run return 1

# 攻撃中タグ付与
    execute if entity @s[type=slime,tag=Mns.HitBox.Reus.LegL] run tag @s add Mns.State.IsAttackPart
