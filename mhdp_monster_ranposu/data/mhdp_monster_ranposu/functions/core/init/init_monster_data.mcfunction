#> mhdp_monster_ranposu:core/init/init_monster_data
#
# モンスターデータの初期化を行う
#
# @within function 

## 青鳥竜
# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1001}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1001}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1001,\
        Icon:"uE011",\
        Name:"ranposu",\
        JpName:"青鳥竜",\
        ShowName:'{"text":"青鳥竜"}',\
        ShowHp:true,\
        Hp:40000,\
        StunDamagePer:10,\
        TireDamagePer:30,\
        AngerDamagePer:12,\
        AngerTimer:90,\
        AngerAttackMult:110,\
        AngerSpeed:5,\
        ParalysisDamage:2000,\
        ParalysisTimer:10,\
        PoisonDamage:3000,\
        PoisonTimer:40,\
        PoisonEffectDamage:100,\
        FlashBombEnable:true,\
        SoundBombEnable:false,\
        ParalyseTrapEnable:true,\
        ParalyseTrapTimer:10,\
        HallTrapEnable:false,\
        HallTrapTimer:15,\
        Defences:[\
            [100,100,100,100,100,100,100,100],\
            [100,100,100,100,100,100,100,100]\
        ],\
        HeadPartDamage:12,\
        BodyPartDamage:20\
    }

# 肉質データ
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1001}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1001}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1001,\
        Defences:[\
            [100,100,100,100,100,100,100,100],\
            [100,100,100,100,100,100,100,100]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:1001}] run data remove storage mhdp_core:monster_data AttackData[{Uid:1001}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:1001,\
        Attacks:[]\
    }
    function mhdp_monster_ranposu:core/init/init_attack_data
