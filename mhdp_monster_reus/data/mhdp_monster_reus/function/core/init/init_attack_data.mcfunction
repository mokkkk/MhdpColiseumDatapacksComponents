#> mhdp_monster_reus:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_reus:core/init/init_monster_data

# 噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"LandBite",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:1,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# チャージ噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"ChargeBite",DamageValue:11.5f,GuardValue:6,ElementType:1,ElementMultiply:40,Knockback:3,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 突進
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"Dash",DamageValue:6.3f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 尻尾回転
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"TailSpin",DamageValue:5.2f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 床ドン
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"Jump",DamageValue:8.5f,GuardValue:5,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# ブレス
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"Breath",DamageValue:7.5f,GuardValue:4,ElementType:1,ElementMultiply:60,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# ひっかき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"Claw",DamageValue:6.2f,GuardValue:3,ElementType:1,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 飛行嚙みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"FlyBite",DamageValue:3.2f,GuardValue:1,ElementType:0,ElementMultiply:0,Knockback:0,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 飛行尻尾なぎはらい
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"FlyTail",DamageValue:6.1f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 急襲
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"Assault",DamageValue:8.5f,GuardValue:6,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# なぎはらい火炎放射
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"FlameSweep",DamageValue:10.8f,GuardValue:6,ElementType:1,ElementMultiply:60,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 地走り火炎
    data modify storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks append value {Name:"FlameVertical",DamageValue:12.3f,GuardValue:7,ElementType:1,ElementMultiply:80,Knockback:3,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
