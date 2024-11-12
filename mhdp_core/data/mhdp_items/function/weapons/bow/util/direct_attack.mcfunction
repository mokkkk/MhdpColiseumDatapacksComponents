#> mhdp_items:weapons/bow/util/direct_attack
#
# 武器の直接攻撃処理
#
# @within function mhdp_items:core/switch/macro/m.direct_attack

# 攻撃データを設定
    # execute if entity @s[tag=!Ply.Weapon.Type.Tech] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.DirectAttack
    # execute if entity @s[tag=Ply.Weapon.Type.Tech] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.DirectAttack
