#> mhdp_monster_reus:core/init/init_monster_data
#
# モンスターデータの初期化を行う
#
# @within function 

## 青鳥竜

# scoreboard定義
    # 頭部位耐久値
        scoreboard objectives add Mns.Reus.Head.Damage dummy
        scoreboard objectives add Mns.Reus.Head.Damage.Max dummy
    # 胴部位耐久値
        scoreboard objectives add Mns.Reus.Body.Damage dummy
        scoreboard objectives add Mns.Reus.Body.Damage.Max dummy
    # 怯み回数
        scoreboard objectives add Mns.Reus.DamageCount dummy
    # 尻尾攻撃回数
        scoreboard objectives add Mns.Reus.TailCount dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1002}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1002}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1002,\
        Icon:"uE011",\
        Name:"reus",\
        UpperName:"Reus",\
        JpName:"火竜",\
        ShowName:'{"text":"火竜"}',\
        ShowHp:true,\
        Hp:10000,\
        StunDamage:200,\
        TireDamage:300,\
        AngerDamagePer:12,\
        AngerTimer:60,\
        AngerAttackMult:110,\
        AngerSpeed:5,\
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
        HeadPartDamage:12,\
        BodyPartDamage:20\
    }

# 肉質データ
# 切断,打撃,弾,火,水,雷,氷,龍
# 頭, 胴, 尻尾, 右脚, 左脚
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1002}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1002}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1002,\
        Defences:[\
            [60,70,50,30,30,30,30,10],\
            [50,45,35,30,30,30,30,10]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:1002}] run data remove storage mhdp_core:monster_data AttackData[{Uid:1002}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:1002,\
        Attacks:[{Id:"Bite"}]\
    }
    function mhdp_monster_reus:core/init/init_attack_data

say 青鳥竜 init monster data