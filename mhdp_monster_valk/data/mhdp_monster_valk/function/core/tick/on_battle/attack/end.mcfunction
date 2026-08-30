#> mhdp_monster_valk:core/tick/on_battle/attack/end
#
# tick処理 戦闘中 攻撃終了時の後始末
#
# @within function mhdp_monsters:core/util/tick/event/end_attack

# エラー検知用
    execute if entity @s[type=item_display] run return 1

# 攻撃中タグ消去
    execute if entity @s[type=slime] run tag @s remove Mns.State.IsAttackPart
