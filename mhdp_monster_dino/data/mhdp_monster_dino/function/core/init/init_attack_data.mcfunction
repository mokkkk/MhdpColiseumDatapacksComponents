#> mhdp_monster_dino:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_dino:core/init/init_monster_data

# 噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Bite",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:1,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Bite.Heat",DamageValue:6.0f,GuardValue:2,ElementType:1,ElementMultiply:20,Knockback:1,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Bite.Heat.Turn",DamageValue:3.0f,GuardValue:1,ElementType:1,ElementMultiply:20,Knockback:0,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 尻尾攻撃・正面
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail",DamageValue:8.4f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail.Heat",DamageValue:10.2f,GuardValue:4,ElementType:1,ElementMultiply:20,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    # 引き戻し
        data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail.Anger.Back",DamageValue:3.0f,GuardValue:1,ElementType:0,ElementMultiply:0,Knockback:0,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 尻尾攻撃・側面
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailSide",DamageValue:7.2f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailSide.Heat",DamageValue:8.9f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 尻尾攻撃・背面
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailBack",DamageValue:6.2f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailBack.Heat",DamageValue:7.8f,GuardValue:3,ElementType:1,ElementMultiply:20,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 尻尾攻撃・飛びかかり
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailJump",DamageValue:7.8f,GuardValue:5,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailJump.Heat",DamageValue:9.0f,GuardValue:5,ElementType:1,ElementMultiply:30,Knockback:3,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 火炎・尻尾
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailFlame.Tail",DamageValue:7.2f,GuardValue:3,ElementType:1,ElementMultiply:20,Knockback:2,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# 火炎・炎
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailFlame.Flame",DamageValue:8.0f,GuardValue:3,ElementType:1,ElementMultiply:100,Knockback:1,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# ブレス
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Breath",DamageValue:8.0f,GuardValue:3,ElementType:1,ElementMultiply:80,Knockback:1,IsLaunch:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# 大回転斬り
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Round",DamageValue:12.0f,GuardValue:6,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:true,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Round.Heat",DamageValue:13.2f,GuardValue:6,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:true,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
