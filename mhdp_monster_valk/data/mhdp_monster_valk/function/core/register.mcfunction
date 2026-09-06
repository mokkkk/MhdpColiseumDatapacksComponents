#> mhdp_monster_valk:core/register
#
# モンスターデータの登録を行う
#
# @within function

## 天彗龍

# scoreboard定義
    # 頭部位耐久値
        scoreboard objectives add Mns.Valk.Head.Damage dummy
        scoreboard objectives add Mns.Valk.Head.Damage.Max dummy
    # 胴部位耐久値
        scoreboard objectives add Mns.Valk.Body.Damage dummy
        scoreboard objectives add Mns.Valk.Body.Damage.Max dummy
    # 尻尾部位耐久値
        scoreboard objectives add Mns.Valk.Tail.Damage dummy
        scoreboard objectives add Mns.Valk.Tail.Damage.Max dummy
    # 右腕部位耐久値
        scoreboard objectives add Mns.Valk.ArmR.Damage dummy
        scoreboard objectives add Mns.Valk.ArmR.Damage.Max dummy
    # 左腕部位耐久値
        scoreboard objectives add Mns.Valk.ArmL.Damage dummy
        scoreboard objectives add Mns.Valk.ArmL.Damage.Max dummy
    # 右足部位耐久値
        scoreboard objectives add Mns.Valk.LegR.Damage dummy
        scoreboard objectives add Mns.Valk.LegR.Damage.Max dummy
    # 左足部位耐久値
        scoreboard objectives add Mns.Valk.LegL.Damage dummy
        scoreboard objectives add Mns.Valk.LegL.Damage.Max dummy
    # 右翼部位耐久値
        scoreboard objectives add Mns.Valk.WingR.Damage dummy
        scoreboard objectives add Mns.Valk.WingR.Damage.Max dummy
    # 左翼部位耐久値
        scoreboard objectives add Mns.Valk.WingL.Damage dummy
        scoreboard objectives add Mns.Valk.WingL.Damage.Max dummy
    # 胴部位耐久値(吸引中)
        scoreboard objectives add Mns.Valk.BodySp.Damage dummy
        scoreboard objectives add Mns.Valk.BodySp.Damage.Max dummy
    # 怯み回数
        scoreboard objectives add Mns.Valk.Head.Damage.Count dummy
        scoreboard objectives add Mns.Valk.Tail.Damage.Count dummy
        scoreboard objectives add Mns.Valk.ArmR.Damage.Count dummy
        scoreboard objectives add Mns.Valk.ArmL.Damage.Count dummy
        scoreboard objectives add Mns.Valk.LegR.Damage.Count dummy
        scoreboard objectives add Mns.Valk.LegL.Damage.Count dummy
    # 内部フェーズ (大技解禁・形態変化 : 戦闘フェーズ内の行動選択で使用)
        scoreboard objectives add Mns.Valk.PhaseCount dummy
        scoreboard objectives add Mns.Valk.PhaseCount.Comet dummy
        scoreboard objectives add Mns.Valk.PhaseCount.Move dummy
        scoreboard objectives add Mns.Valk.PhaseCount.Beam dummy
    # 移動回数
        scoreboard objectives add Mns.Valk.DashCount dummy
    # サブカウント
        scoreboard objectives add Mns.Valk.SubCount dummy
    # 滑空突進往復回数
        scoreboard objectives add Mns.Valk.JetCount dummy
    # 龍気吸引回数
        scoreboard objectives add Mns.Valk.ChargeCount dummy
    # 怒り終了回数
        scoreboard objectives add Mns.Valk.EndAngerCount dummy
    # 移動を伴う技のクールタイム
        scoreboard objectives add Mns.Valk.MoveSkill.CoolDown dummy
# 警戒値
    scoreboard objectives add Mns.Valk.Caution dummy
# 発見値
    scoreboard objectives add Mns.Valk.Search dummy
# ヘイト
    scoreboard objectives add Mns.Valk.Hate dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1004}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1004}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1004,\
        Icon:"uE014",\
        Name:"valk",\
        UpperName:"Valk",\
        NameId:"monster.valk.name",\
        ShowName:{"translate":"monster.valk.name"},\
        LootTable:"mhdp_items:materials/valk/random_all",\
        ShowHp:true,\
        Hp:13000,\
        StunDamage:400,\
        TireDamage:300,\
        AngerDamagePer:10,\
        AngerTimer:120,\
        AngerAttackMult:125,\
        AngerSpeed:8,\
        ParalysisDamage:600,\
        ParalysisTimer:10,\
        PoisonDamage:500,\
        PoisonTimer:25,\
        PoisonEffectDamage:60,\
        BombDamage:400,\
        BombEffectDamage:150,\
        FlashBombEnable:true,\
        SoundBombEnable:false,\
        ParalyseTrapEnable:false,\
        ParalyseTrapTimer:0,\
        HallTrapEnable:false,\
        HallTrapTimer:0,\
        CounterDamage:75,\
        HeadPartDamage:9,\
        BodyPartDamage:8,\
        TailPartDamage:6,\
        ArmRPartDamage:7,\
        ArmLPartDamage:7,\
        LegRPartDamage:7,\
        LegLPartDamage:7,\
        WingRPartDamage:7,\
        WingLPartDamage:7\
    }

# 肉質データ
# 切断,打撃,弾,火,水,雷,氷,龍
# 0:頭 1:胴 2:尻尾 3:右腕 4:左腕 5:右脚 6:左脚 7:右翼 8:左翼 9:胸(吸引中)
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1004}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1004}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1004,\
        Defences:[\
            [55,55,50,25,25,25,25,0],\
            [40,40,40,20,20,20,20,0],\
            [45,30,25,20,20,20,20,0],\
            [32,31,26,25,25,25,25,0],\
            [32,31,26,25,25,25,25,0],\
            [32,31,26,15,15,15,15,0],\
            [32,31,26,15,15,15,15,0],\
            [25,35,25,25,25,25,25,0],\
            [25,35,25,25,25,25,25,0],\
            [80,80,60,25,25,25,25,0]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:1004}] run data remove storage mhdp_core:monster_data AttackData[{Uid:1004}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:1004,\
        Attacks:[]\
    }

# 翼槍突き (右翼爪)
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Spear.Right",AttackPart:"wing_right",VectorType:"Normal",\
        DamageValue:8.0f,ObjectDamageValue:25,GuardValue:4,ElementType:5,ElementMultiply:10,\
        KnockbackStrength:2,IsLaunch:true,LaunchAngle:35,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }
# 翼槍突き (左翼爪)
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Spear.Left",AttackPart:"wing_left",VectorType:"Normal",\
        DamageValue:8.0f,ObjectDamageValue:25,GuardValue:4,ElementType:5,ElementMultiply:10,\
        KnockbackStrength:2,IsLaunch:true,LaunchAngle:35,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 翼槍回転斬り (右翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"SpearSpin.Right",AttackPart:"wing_right",VectorType:"Radial",\
        DamageValue:8.6f,ObjectDamageValue:20,GuardValue:5,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }
# 翼槍回転斬り (左翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"SpearSpin.Left",AttackPart:"wing_left",VectorType:"Radial",\
        DamageValue:8.6f,ObjectDamageValue:20,GuardValue:5,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 翼槍叩きつけ(手)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Vertical.Hand",AttackPart:"body",VectorType:"Normal",\
        DamageValue:3.0f,ObjectDamageValue:5,GuardValue:1,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:2,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 翼槍叩きつけ (右翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Vertical.Right",AttackPart:"wing_right",VectorType:"Normal",\
        DamageValue:10.0f,ObjectDamageValue:20,GuardValue:6,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }
# 翼槍叩きつけ (左翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Vertical.Left",AttackPart:"wing_left",VectorType:"Normal",\
        DamageValue:10.0f,ObjectDamageValue:20,GuardValue:6,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 翼槍振り上げ
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Upper",AttackPart:"body",VectorType:"Normal",\
        DamageValue:11.0f,ObjectDamageValue:20,GuardValue:7,ElementType:5,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:true,LaunchAngle:35,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 噛みつき
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Bite",AttackPart:"head",VectorType:"Normal",\
        DamageValue:6.0f,ObjectDamageValue:10,GuardValue:3,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:2,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 突進攻撃
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"DashAttack",AttackPart:"body",VectorType:"Normal",\
        DamageValue:5.8f,ObjectDamageValue:15,GuardValue:3,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:2,IsLaunch:true,LaunchAngle:35,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 蛇行突進
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Tackle",AttackPart:"body",VectorType:"Normal",\
        DamageValue:6.5f,ObjectDamageValue:20,GuardValue:4,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:2,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 滑空突進
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"JetTackle",AttackPart:"body",VectorType:"Normal",\
        DamageValue:9.2f,ObjectDamageValue:25,GuardValue:5,ElementType:5,ElementMultiply:10,\
        KnockbackStrength:2,IsLaunch:true,LaunchAngle:35,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 龍閃
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Beam",AttackPart:"none",VectorType:"Normal",\
        DamageValue:16.5f,ObjectDamageValue:50,GuardValue:5,ElementType:5,ElementMultiply:100,\
        KnockbackStrength:3,IsLaunch:true,LaunchAngle:35,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 彗星
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Comet",AttackPart:"none",VectorType:"Normal",\
        DamageValue:21.0f,ObjectDamageValue:60,GuardValue:20,ElementType:5,ElementMultiply:10,\
        KnockbackStrength:3,IsLaunch:true,LaunchAngle:35,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 翼叩きつけ (右翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"VerticalS.Right",AttackPart:"wing_right",VectorType:"Normal",\
        DamageValue:12.0f,ObjectDamageValue:20,GuardValue:6,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }
# 翼叩きつけ (左翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"VerticalS.Left",AttackPart:"wing_left",VectorType:"Normal",\
        DamageValue:12.0f,ObjectDamageValue:20,GuardValue:6,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 薙ぎ払い (右翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Sweep.Right",AttackPart:"wing_right",VectorType:"Normal",\
        DamageValue:8.6f,ObjectDamageValue:15,GuardValue:4,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }
# 薙ぎ払い (左翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Sweep.Left",AttackPart:"wing_left",VectorType:"Normal",\
        DamageValue:8.6f,ObjectDamageValue:15,GuardValue:4,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 薙ぎ払い(怒り) (右翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Sweep.Anger.Right",AttackPart:"wing_right",VectorType:"Normal",\
        DamageValue:9.5f,ObjectDamageValue:15,GuardValue:5,ElementType:5,ElementMultiply:40,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }
# 薙ぎ払い(怒り) (左翼爪)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Sweep.Anger.Left",AttackPart:"wing_left",VectorType:"Normal",\
        DamageValue:9.5f,ObjectDamageValue:15,GuardValue:5,ElementType:5,ElementMultiply:40,\
        KnockbackStrength:3,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 射撃
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Shot",AttackPart:"none",VectorType:"Normal",\
        DamageValue:6.5f,ObjectDamageValue:10,GuardValue:3,ElementType:5,ElementMultiply:100,\
        KnockbackStrength:1,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# 爆発 (側面)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Bomb.Side",AttackPart:"none",VectorType:"Normal",\
        DamageValue:8.5f,ObjectDamageValue:15,GuardValue:6,ElementType:5,ElementMultiply:100,\
        KnockbackStrength:2,IsLaunch:true,LaunchAngle:60,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }
# 爆発 (前方)
    #TODO: ObjectDamageの調整
    data modify storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks append value {\
        Name:"Bomb.Forward",AttackPart:"none",VectorType:"Normal",\
        DamageValue:8.5f,ObjectDamageValue:15,GuardValue:5,ElementType:5,ElementMultiply:100,\
        KnockbackStrength:2,IsLaunch:true,LaunchAngle:35,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say mhdp_monster_valk:core/register データ登録完了

# say モンスター処理：天彗龍 register
