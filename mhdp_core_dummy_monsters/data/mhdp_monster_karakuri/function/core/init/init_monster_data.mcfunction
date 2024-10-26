#> mhdp_monster_karakuri:core/init/init_monster_data
#
# モンスターデータの初期化を行う
#
# @within function 

## 青鳥竜

# scoreboard定義
    # 頭部位耐久値
        scoreboard objectives add Mns.Karakuri.Head.Damage dummy
        scoreboard objectives add Mns.Karakuri.Head.Damage.Max dummy
    # 胴部位耐久値
        scoreboard objectives add Mns.Karakuri.Body.Damage dummy
        scoreboard objectives add Mns.Karakuri.Body.Damage.Max dummy
    # 怯み回数
        scoreboard objectives add Mns.Karakuri.DamageCount dummy
    # 尻尾攻撃回数
        scoreboard objectives add Mns.Karakuri.TailCount dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:8001}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:8001}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:8001,\
        Icon:"NONE",\
        Name:"karakuri",\
        UpperName:"Karakuri",\
        JpName:"からくり飛竜",\
        ShowName:'{"text":"からくり飛竜"}',\
        LootTable:"mhdp_items:materials/karakuri",\
        ShowHp:true,\
        Hp:99999,\
        StunDamage:99999,\
        TireDamage:99999,\
        AngerDamagePer:100,\
        AngerTimer:60,\
        AngerAttackMult:100,\
        AngerSpeed:20,\
        ParalysisDamage:99999,\
        ParalysisTimer:0,\
        PoisonDamage:99999,\
        PoisonTimer:0,\
        PoisonEffectDamage:0,\
        BombDamage:99999,\
        BombEffectDamage:0,\
        FlashBombEnable:true,\
        SoundBombEnable:false,\
        ParalyseTrapEnable:false,\
        ParalyseTrapTimer:10,\
        HallTrapEnable:false,\
        HallTrapTimer:15\
    }

# 肉質データ
# 切断,打撃,弾,火,水,雷,氷,龍
# 頭, 胴, 尻尾, 右脚, 左脚
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:8001}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:8001}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:8001,\
        Defences:[\
            [100,100,100,30,30,30,30,30],\
            [35,35,35,30,30,30,30,30],\
            [40,40,40,30,30,30,30,30],\
            [30,30,30,30,30,30,30,30],\
            [30,30,30,30,30,30,30,30]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:8001}] run data remove storage mhdp_core:monster_data AttackData[{Uid:8001}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:8001,\
        Attacks:[{Id:"Bite"}]\
    }
    function mhdp_monster_karakuri:core/init/init_attack_data

# say モンスター処理：からくり飛竜 init monster data