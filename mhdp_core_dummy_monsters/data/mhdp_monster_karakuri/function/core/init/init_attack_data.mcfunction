#> mhdp_monster_karakuri:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_karakuri:core/init/init_monster_data

# 噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:8001}].Attacks append value {Name:"Bite",DamageValue:0.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
