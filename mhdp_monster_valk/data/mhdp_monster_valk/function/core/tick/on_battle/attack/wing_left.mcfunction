#> mhdp_monster_valk:core/tick/on_battle/attack/wing_left
#
# tick処理 戦闘中 攻撃 (左翼爪)
#
# @within function mhdp_monsters:core/switch/macro/m.start_attack

# エラー検知用
    execute if entity @s[type=item_display] run return 1

# 攻撃中タグ付与
    execute if entity @s[type=slime,tag=Mns.HitBox.Valk.WingL] run tag @s add Mns.State.IsAttackPart
    execute if entity @s[type=slime,tag=Mns.HitBox.Valk.ArmL] run tag @s add Mns.State.IsAttackPart
