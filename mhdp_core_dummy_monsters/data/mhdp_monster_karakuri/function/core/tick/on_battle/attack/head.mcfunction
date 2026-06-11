#> mhdp_monster_karakuri:core/tick/on_battle/attack/head
#
# tick処理 戦闘中 攻撃
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# エラー検知用
    execute if entity @s[type=item_display] run return 1

# 攻撃中タグ付与
    execute if entity @s[type=slime,tag=Mns.HitBox.Karakuri.Head] run tag @s add Mns.State.IsAttackPart
    execute if entity @s[type=slime,tag=Mns.HitBox.Karakuri.Body] run tag @s add Mns.State.IsAttackPart
