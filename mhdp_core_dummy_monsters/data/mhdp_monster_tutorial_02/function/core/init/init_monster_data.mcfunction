#> mhdp_monster_tutorial_02:core/init/init_monster_data
#
# モンスターデータの初期化を行う
#
# @within function 

## チュートリアル

# scoreboard定義


# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:9002}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:9002}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:9002,\
        Icon:"NONE",\
        Name:"tutorial_02",\
        UpperName:"Tutorial02",\
        JpName:"チュートリアル02",\
        ShowName:{"text":"チュートリアル02"},\
        LootTable:"mhdp_items:materials/tutorial_02",\
        ShowHp:true,\
        Hp:10000,\
        StunDamage:0,\
        TireDamage:0,\
        AngerDamagePer:0,\
        AngerTimer:0,\
        AngerAttackMult:0,\
        AngerSpeed:0,\
        ParalysisDamage:0,\
        ParalysisTimer:0,\
        PoisonDamage:0,\
        PoisonTimer:0,\
        PoisonEffectDamage:0,\
        BombDamage:0,\
        BombEffectDamage:0,\
        FlashBombEnable:false,\
        SoundBombEnable:false,\
        ParalyseTrapEnable:false,\
        ParalyseTrapTimer:0,\
        HallTrapEnable:false,\
        HallTrapTimer:0\
    }

# 肉質データ
# なし
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:9002}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:9002}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:9002,\
        Defences:[\
            [0]\
        ]\
    }

# 攻撃力データ
    # execute if data storage mhdp_core:monster_data AttackData[{Uid:9002}] run data remove storage mhdp_core:monster_data AttackData[{Uid:9002}]
    # data modify storage mhdp_core:monster_data AttackData append value {\
    #     Uid:9002,\
    #     Attacks:[]\
    # }
    # function mhdp_monster_tutorial_02:core/init/init_attack_data

# say チュートリアル02 init monster data