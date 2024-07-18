#> mhdp_monster_reus:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_reus:core/init/init_monster_data

# 噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"LandBite",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:1,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# チャージ噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"ChargeBite",DamageValue:11.0f,GuardValue:6,ElementType:1,ElementMultiply:40,Knockback:3,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 突進
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"Dash",DamageValue:6.0f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 尻尾回転
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"TailSpin",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
