#> mhdp_items:weapons/short_sword/util/direct_attack
#
# 武器の直接攻撃処理
#
# @within function mhdp_items:core/switch/macro/m.direct_attack

# 攻撃データを設定
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Normal.DirectAttack
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.DirectAttack
