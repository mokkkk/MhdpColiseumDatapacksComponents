#> mhdp_monster_valk:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_valk:core/init/init_monster_data

# 突き
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Spear",DamageValue:8.0f,GuardValue:4,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 翼槍回転斬り
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"SpearSpin",DamageValue:8.6f,GuardValue:5,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 翼槍叩きつけ
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Vertical.Hand",DamageValue:4.0f,GuardValue:1,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Vertical",DamageValue:10.0f,GuardValue:6,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Bite",DamageValue:6.0f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
