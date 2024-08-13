#> mhdp_monster_dino:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_dino:core/init/init_monster_data

# 噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Bite",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 尻尾攻撃・正面
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail",DamageValue:8.4f,GuardValue:4,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    # 引き戻し
        data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail.Anger.Back",DamageValue:3.0f,GuardValue:1,ElementType:0,ElementMultiply:0,Knockback:0,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 尻尾攻撃・側面
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailSide",DamageValue:7.2f,GuardValue:4,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 尻尾攻撃・背面
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailBack",DamageValue:6.2f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
