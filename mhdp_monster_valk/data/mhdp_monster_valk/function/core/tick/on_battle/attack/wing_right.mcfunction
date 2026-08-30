#> mhdp_monster_valk:core/tick/on_battle/attack/wing_right
#
# tick処理 戦闘中 攻撃 (右翼爪)
#
# @within function mhdp_monsters:core/switch/macro/m.start_attack

# エラー検知用
    execute if entity @s[type=item_display] run return 1

# 攻撃中タグ付与
    execute if entity @s[type=slime,tag=Mns.HitBox.Valk.WingR] run tag @s add Mns.State.IsAttackPart
    execute if entity @s[type=slime,tag=Mns.HitBox.Valk.ArmR] run tag @s add Mns.State.IsAttackPart
