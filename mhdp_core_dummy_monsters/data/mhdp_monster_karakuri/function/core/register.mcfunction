#> mhdp_monster_karakuri:core/register
#
# モンスターデータの登録を行う
#
# @within function 

## 青鳥竜

# scoreboard定義
    # 警戒値
        scoreboard objectives add Mns.Karakuri.Caution dummy
    # 発見値
        scoreboard objectives add Mns.Karakuri.Search dummy
    # ヘイト
        scoreboard objectives add Mns.Karakuri.Hate dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:8001}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:8001}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:8001,\
        Icon:"NONE",\
        Name:"karakuri",\
        UpperName:"Karakuri",\
        NameId:"monster.karakuri.name",\
        ShowName:{"translate":"monster.karakuri.name"},\
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
        Attacks:[]\
    }

# 噛みつき
    data modify storage mhdp_core:monster_data AttackData[{Uid:8001}].Attacks append value {\
        Name:"Bite",AttackPart:"head",VectorType:"Normal",\
        DamageValue:0.0f,ObjectDamageValue:10,GuardValue:2,ElementType:0,ElementMultiply:0,\
        KnockbackStrength:1,IsLaunch:false,LaunchAngle:0,\
        IsFixedDamage:false,IsDisableDefence:false,IsDisableDamageInterval:false,IsDisableGuts:false\
    }

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say mhdp_monster_karakuri:core/register データ登録完了

# say モンスター処理：青鳥竜 init monster data
