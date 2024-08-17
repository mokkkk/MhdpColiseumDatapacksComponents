#> mhdp_monster_dino:core/init/init_monster_data
#
# モンスターデータの初期化を行う
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
    # 移動回数
        scoreboard objectives add Mns.Dino.DashCount dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1003}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1003}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1003,\
        Icon:"uE013",\
        Name:"dino",\
        UpperName:"Dino",\
        JpName:"斬竜",\
        ShowName:'{"text":"斬竜"}',\
        LootTable:"mhdp_items:materials/dino",\
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
        HallTrapEnable:true,\
        HallTrapTimer:15,\
        HeadPartDamage:3,\
        BodyPartDamage:7,\
        TailPartDamage:5,\
        LegRPartDamage:4,\
        LegLPartDamage:4\
    }

# 肉質データ
# 切断,打撃,弾,火,水,雷,氷,龍
# 頭, 胴, 尻尾, 右脚, 左脚
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1003}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1003}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1003,\
        Defences:[\
            [70,75,62,0,15,25,10,30],\
            [35,40,25,0,5,15,10,15],\
            [50,40,35,0,5,20,10,25],\
            [40,42,35,0,8,12,10,17],\
            [40,42,35,0,8,12,10,17]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:1003}] run data remove storage mhdp_core:monster_data AttackData[{Uid:1003}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:1003,\
        Attacks:[{Id:"Bite"}]\
    }
    function mhdp_monster_dino:core/init/init_attack_data

say 斬竜 init monster data