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
        LootTable:"mhdp_items:materials/reus",\
        ShowHp:true,\
        Hp:11000,\
        StunDamage:200,\
        TireDamage:300,\
        AngerDamagePer:10,\
        AngerTimer:60,\
        AngerAttackMult:120,\
        AngerSpeed:8,\
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
        CounterDamage:75,\
        HeadPartDamage:7,\
        BodyPartDamage:7,\
        TailPartDamage:5,\
        LegRPartDamage:4,\
        LegLPartDamage:4\
    }

# 肉質データ
# 切断,打撃,弾,火,水,雷,氷,龍
# 頭, 胴, 尻尾, 右脚, 左脚
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1002}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1002}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1002,\
        Defences:[\
            [70,75,62,0,15,25,10,30],\
            [35,40,25,0,5,15,10,15],\
            [50,40,35,0,5,20,10,25],\
            [40,42,35,0,8,12,10,17],\
            [40,42,35,0,8,12,10,17]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:1002}] run data remove storage mhdp_core:monster_data AttackData[{Uid:1002}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:1002,\
        Attacks:[{Id:"Bite"}]\
    }
    function mhdp_monster_reus:core/init/init_attack_data

# say モンスター処理：火竜 init monster data