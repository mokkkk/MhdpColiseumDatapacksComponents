#> mhdp_monster_reus:core/init/init_monster_data
#
# モンスターデータの初期化を行う
#
# @within function 

## 火竜

# scoreboard定義
    # 頭部位耐久値
        scoreboard objectives add Mns.Reus.Head.Damage dummy
        scoreboard objectives add Mns.Reus.Head.Damage.Max dummy
    # 胴部位耐久値
        scoreboard objectives add Mns.Reus.Body.Damage dummy
        scoreboard objectives add Mns.Reus.Body.Damage.Max dummy
    # 尻尾部位耐久値
        scoreboard objectives add Mns.Reus.Tail.Damage dummy
        scoreboard objectives add Mns.Reus.Tail.Damage.Max dummy
    # 右足部位耐久値
        scoreboard objectives add Mns.Reus.LegR.Damage dummy
        scoreboard objectives add Mns.Reus.LegR.Damage.Max dummy
    # 左足部位耐久値
        scoreboard objectives add Mns.Reus.LegL.Damage dummy
        scoreboard objectives add Mns.Reus.LegL.Damage.Max dummy
    # 突進攻撃回数
        scoreboard objectives add Mns.Reus.DashCount dummy
    # フェーズ
        scoreboard objectives add Mns.Reus.PhaseCount dummy
    # 足怯み回数
        scoreboard objectives add Mns.Reus.Leg.Damage.Count dummy
    # 空中怯み回数
        scoreboard objectives add Mns.Reus.Fly.Damage.Count dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1002}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1002}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1002,\
        Icon:"uE012",\
        Name:"reus",\
        UpperName:"Reus",\
        JpName:"火竜",\
        ShowName:'{"text":"火竜"}',\
        ShowHp:true,\
        Hp:7000,\
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
        HeadPartDamage:7,\
        BodyPartDamage:12,\
        TailPartDamage:7,\
        LegRPartDamage:7,\
        LegLPartDamage:7\
    }

# 肉質データ
# 切断,打撃,弾,火,水,雷,氷,龍
# 頭, 胴, 尻尾, 右脚, 左脚
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1002}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1002}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1002,\
        Defences:[\
            [60,70,50,30,30,30,30,10],\
            [60,70,50,30,30,30,30,10],\
            [60,70,50,30,30,30,30,10],\
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

say 火竜 init monster data