#> mhdp_monster_dino:core/register
#
# モンスターデータの登録を行う
#
# @within function 

## 斬竜

# scoreboard定義
    # 頭部位耐久値
        scoreboard objectives add Mns.Dino.Head.Damage dummy
        scoreboard objectives add Mns.Dino.Head.Damage.Max dummy
    # 胴部位耐久値
        scoreboard objectives add Mns.Dino.Body.Damage dummy
        scoreboard objectives add Mns.Dino.Body.Damage.Max dummy
    # 尻尾部位耐久値
        scoreboard objectives add Mns.Dino.Tail.Damage dummy
        scoreboard objectives add Mns.Dino.Tail.Damage.Max dummy
    # 右足部位耐久値
        scoreboard objectives add Mns.Dino.LegR.Damage dummy
        scoreboard objectives add Mns.Dino.LegR.Damage.Max dummy
    # 左足部位耐久値
        scoreboard objectives add Mns.Dino.LegL.Damage dummy
        scoreboard objectives add Mns.Dino.LegL.Damage.Max dummy
    # 赤熱化喉耐久値
        scoreboard objectives add Mns.Dino.Sp.RedHead.Damage dummy
        scoreboard objectives add Mns.Dino.Sp.RedHead.Damage.Max dummy
    # フェーズ
        # 尻尾
            scoreboard objectives add Mns.Dino.PhaseCount.Tail dummy
        # 喉
            scoreboard objectives add Mns.Dino.PhaseCount.Head dummy
    # 怯み回数
        # 頭
            scoreboard objectives add Mns.Dino.Head.Damage.Count dummy
        # 尻尾
            scoreboard objectives add Mns.Dino.Tail.Damage.Count dummy
        # 右足
            scoreboard objectives add Mns.Dino.LegR.Damage.Count dummy
        # 左足
            scoreboard objectives add Mns.Dino.LegL.Damage.Count dummy
# 警戒値
    scoreboard objectives add Mns.Dino.Caution dummy
# 発見値
    scoreboard objectives add Mns.Dino.Search dummy
# ヘイト
    scoreboard objectives add Mns.Dino.Hate dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1003}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1003}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1003,\
        Icon:"uE013",\
        Name:"dino",\
        UpperName:"Dino",\
        NameId:"monster.dino.name",\
        ShowName:{"translate":"monster.glavenus.name"},\
        LootTable:"mhdp_items:materials/dino/random_all",\
        ShowHp:true,\
        Hp:10000,\
        StunDamage:200,\
        TireDamage:300,\
        AngerDamagePer:12,\
        AngerTimer:60,\
        AngerAttackMult:110,\
        AngerSpeed:10,\
        ParalysisDamage:500,\
        ParalysisTimer:10,\
        PoisonDamage:400,\
        PoisonTimer:20,\
        PoisonEffectDamage:50,\
        BombDamage:400,\
        BombEffectDamage:200,\
        FlashBombEnable:true,\
        SoundBombEnable:false,\
        ParalyseTrapEnable:true,\
        ParalyseTrapTimer:10,\
        HallTrapEnable:false,\
        HallTrapTimer:15,\
        CounterDamage:30,\
        HeadPartDamage:11,\
        BodyPartDamage:15\
    }

# 肉質データ
# 切断,打撃,弾,火,水,雷,氷,龍
# 頭, 胴
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1003}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1003}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1003,\
        Defences:[\
            [50,55,62,0,25,10,15,15],\
            [35,40,25,0,15,5,10,10],\
            [40,30,35,0,20,5,10,10],\
            [37,35,30,0,15,5,5,5],\
            [37,35,30,0,15,5,5,5],\
            [67,75,62,0,25,10,15,15],\
            [75,70,55,0,30,10,15,15],\
            [30,30,20,0,15,5,5,5]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:1003}] run data remove storage mhdp_core:monster_data AttackData[{Uid:1003}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:1003,\
        Attacks:[]\
    }

# 尻尾攻撃・正面
    data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {\
        Name:"Tail",AttackPart:"tail",VectorType:"Normal",\
        DamageValue:8.4f,ObjectDamageValue:25,GuardValue:5,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail",DamageValue:8.4f,GuardValue:5,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail.Heat",DamageValue:10.2f,GuardValue:6,ElementType:1,ElementMultiply:20,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     # 引き戻し
#         data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail.Anger.Back",DamageValue:3.0f,GuardValue:1,ElementType:0,ElementMultiply:0,Knockback:0,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 噛みつき
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Bite",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:1,IsLaunch:false,LaunchType:2,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Bite.Heat",DamageValue:5.5f,GuardValue:2,ElementType:1,ElementMultiply:20,Knockback:1,IsLaunch:false,LaunchType:2,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 噛みつきコンボ
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"BiteCombo",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:true,LaunchType:2,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"BiteCombo.Heat",DamageValue:5.5f,GuardValue:2,ElementType:1,ElementMultiply:20,Knockback:2,IsLaunch:true,LaunchType:2,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 2連噛みつき
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"BiteDouble",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:2,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"BiteDouble.Heat",DamageValue:5.5f,GuardValue:2,ElementType:1,ElementMultiply:20,Knockback:3,IsLaunch:false,LaunchType:2,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 軸合わせ噛みつき
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Bite.Heat.Turn",DamageValue:3.0f,GuardValue:1,ElementType:1,ElementMultiply:20,Knockback:0,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 尻尾攻撃・正面
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail",DamageValue:8.4f,GuardValue:5,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail.Heat",DamageValue:10.2f,GuardValue:6,ElementType:1,ElementMultiply:20,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     # 引き戻し
#         data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Tail.Anger.Back",DamageValue:3.0f,GuardValue:1,ElementType:0,ElementMultiply:0,Knockback:0,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 尻尾攻撃・側面
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailSide",DamageValue:7.2f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailSide.Heat",DamageValue:8.9f,GuardValue:4,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 尻尾攻撃・背面
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailBack",DamageValue:6.2f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailBack.Heat",DamageValue:7.8f,GuardValue:3,ElementType:1,ElementMultiply:20,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 尻尾攻撃・飛びかかり
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailJump",DamageValue:7.8f,GuardValue:5,ElementType:0,ElementMultiply:0,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailJump.Heat",DamageValue:9.0f,GuardValue:6,ElementType:1,ElementMultiply:30,Knockback:3,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 火炎・尻尾
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailFlame.Tail",DamageValue:7.2f,GuardValue:3,ElementType:1,ElementMultiply:20,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
# # 火炎・炎
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"TailFlame.Flame",DamageValue:8.0f,GuardValue:4,ElementType:1,ElementMultiply:100,Knockback:1,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # ブレス
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Breath",DamageValue:8.0f,GuardValue:5,ElementType:1,ElementMultiply:80,Knockback:1,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 大回転斬り
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Round",DamageValue:12.0f,GuardValue:7,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:true,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks append value {Name:"Round.Heat",DamageValue:14.0f,GuardValue:7,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:true,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}
