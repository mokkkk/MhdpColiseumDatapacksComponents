#> mhdp_monster_ranposu:core/register
#
# モンスターデータの登録を行う
#
# @within function 

## 青鳥竜

# scoreboard定義
# 頭部位耐久値
    scoreboard objectives add Mns.Ranposu.Head.Damage dummy
    scoreboard objectives add Mns.Ranposu.Head.Damage.Max dummy
# 胴部位耐久値
    scoreboard objectives add Mns.Ranposu.Body.Damage dummy
    scoreboard objectives add Mns.Ranposu.Body.Damage.Max dummy
# 怯み回数
    scoreboard objectives add Mns.Ranposu.DamageCount dummy
# 尻尾攻撃回数
    scoreboard objectives add Mns.Ranposu.TailCount dummy
# 警戒値
    scoreboard objectives add Mns.Ranposu.Caution dummy
# 発見値
    scoreboard objectives add Mns.Ranposu.Search dummy
# ヘイト
    scoreboard objectives add Mns.Ranposu.Hate dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1001}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1001}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1001,\
        Icon:"uE011",\
        Name:"ranposu",\
        UpperName:"Ranposu",\
        NameId:"monster.ranposu.name",\
        ShowName:{"translate":"monster.ranposu.name"},\
        LootTable:"mhdp_items:materials/ranposu/random_all",\
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
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1001}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1001}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1001,\
        Defences:[\
            [60,70,50,30,30,30,30,10],\
            [50,45,35,30,30,30,30,10]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:1001}] run data remove storage mhdp_core:monster_data AttackData[{Uid:1001}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:1001,\
        Attacks:[]\
    }

# # 噛みつき
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks append value {Name:"Bite",DamageValue:5.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:1,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 強噛みつき
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks append value {Name:"BiteStrong",DamageValue:7.0f,GuardValue:4,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 尻尾攻撃
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks append value {Name:"Tail",DamageValue:4.0f,GuardValue:2,ElementType:0,ElementMultiply:0,Knockback:1,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 移動ひっかき
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks append value {Name:"MoveClaw",DamageValue:7.0f,GuardValue:3,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # タックル
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks append value {Name:"Tackle",DamageValue:6.0f,GuardValue:5,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# # 急襲
#     data modify storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks append value {Name:"Jump",DamageValue:9.0f,GuardValue:6,ElementType:0,ElementMultiply:0,Knockback:2,IsLaunch:false,LaunchType:1,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false}

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say mhdp_monster_ranposu:core/register データ登録完了

# say モンスター処理：青鳥竜 init monster data
