#> mhdp_monster_valk:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_valk:core/init/init_monster_data

# 突き
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Spear",DamageValue:8.0f,GuardValue:4,ElementType:5,ElementMultiply:10,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 翼槍回転斬り
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"SpearSpin",DamageValue:8.6f,GuardValue:5,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 翼槍叩きつけ
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Vertical.Hand",DamageValue:3.0f,GuardValue:1,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Vertical",DamageValue:10.0f,GuardValue:6,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Bite",DamageValue:6.0f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 突進攻撃
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"DashAttack",DamageValue:5.8f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:true,LaunchType:2,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 蛇行突進
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Tackle",DamageValue:6.5f,GuardValue:4,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 滑空突進
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"JetTackle",DamageValue:9.2f,GuardValue:5,ElementType:5,ElementMultiply:10,Knockback:2,IsLaunch:true,LaunchType:2,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 翼叩きつけ
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"VerticalS",DamageValue:12.0f,GuardValue:6,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 薙ぎ払い
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Sweep",DamageValue:8.6f,GuardValue:4,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {Name:"Sweep.Anger",DamageValue:9.5f,GuardValue:5,ElementType:5,ElementMultiply:40,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
