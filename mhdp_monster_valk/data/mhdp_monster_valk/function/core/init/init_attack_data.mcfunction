#> mhdp_monster_valk:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_valk:core/init/init_monster_data

# 槍：突き
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Spear",DamageValue:8.0f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
