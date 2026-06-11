#> mhdp_monster_karakuri:core/tick/on_battle/attack/end
#
# tick処理 戦闘中 攻撃
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# エラー検知用
    execute if entity @s[type=item_display] run return 1

# 攻撃中タグ消去
    execute if entity @s[type=slime] run tag @s remove Mns.State.IsAttackPart
