#> mhdp_monster_ranposu:core/init/init_monster_data
#
# モンスターデータの初期化を行う
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

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1001}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1001}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1001,\
        Icon:"uE011",\
        Name:"ranposu",\
        UpperName:"Ranposu",\
        JpName:"青鳥竜",\
        ShowName:'{"text":"青鳥竜"}',\
        ShowHp:true,\
        Hp:20000,\
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
        BombDamage:2000,\
        BombEffectDamage:400,\
        FlashBombEnable:true,\
        SoundBombEnable:false,\
        ParalyseTrapEnable:true,\
        ParalyseTrapTimer:10,\
        HallTrapEnable:false,\
        HallTrapTimer:15,\
        HeadPartDamage:12,\
        BodyPartDamage:20\
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
        Attacks:[{Id:"Bite"}]\
    }
    function mhdp_monster_ranposu:core/init/init_attack_data

say 青鳥竜 init monster data