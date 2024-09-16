#> mhdp_monster_valk:core/init/init_monster_data
#
# モンスターデータの初期化を行う
#
# @within function 

## 天彗龍

# scoreboard定義
    # 頭部位耐久値
        scoreboard objectives add Mns.Valk.Head.Damage dummy
        scoreboard objectives add Mns.Valk.Head.Damage.Max dummy
    # 胴部位耐久値
        scoreboard objectives add Mns.Valk.Body.Damage dummy
        scoreboard objectives add Mns.Valk.Body.Damage.Max dummy
    # 尻尾部位耐久値
        scoreboard objectives add Mns.Valk.Tail.Damage dummy
        scoreboard objectives add Mns.Valk.Tail.Damage.Max dummy
    # 右腕部位耐久値
        scoreboard objectives add Mns.Valk.ArmR.Damage dummy
        scoreboard objectives add Mns.Valk.ArmR.Damage.Max dummy
    # 左腕部位耐久値
        scoreboard objectives add Mns.Valk.ArmL.Damage dummy
        scoreboard objectives add Mns.Valk.ArmL.Damage.Max dummy
    # 右足部位耐久値
        scoreboard objectives add Mns.Valk.LegR.Damage dummy
        scoreboard objectives add Mns.Valk.LegR.Damage.Max dummy
    # 左足部位耐久値
        scoreboard objectives add Mns.Valk.LegL.Damage dummy
        scoreboard objectives add Mns.Valk.LegL.Damage.Max dummy
    # 右翼部位耐久値
        scoreboard objectives add Mns.Valk.WingR.Damage dummy
        scoreboard objectives add Mns.Valk.WingR.Damage.Max dummy
    # 左翼部位耐久値
        scoreboard objectives add Mns.Valk.WingL.Damage dummy
        scoreboard objectives add Mns.Valk.WingL.Damage.Max dummy

# フェーズ
    # 怯み回数
        # 頭
            scoreboard objectives add Mns.Valk.Head.Damage.Count dummy
        # 尻尾
            scoreboard objectives add Mns.Valk.Tail.Damage.Count dummy
        # 右腕
            scoreboard objectives add Mns.Valk.ArmR.Damage.Count dummy
        # 左腕
            scoreboard objectives add Mns.Valk.ArmL.Damage.Count dummy
        # 右足
            scoreboard objectives add Mns.Valk.LegR.Damage.Count dummy
        # 左足
            scoreboard objectives add Mns.Valk.LegL.Damage.Count dummy
    # フェーズ
        scoreboard objectives add Mns.Valk.PhaseCount dummy
    # 移動回数
        scoreboard objectives add Mns.Valk.DashCount dummy
    # サブカウント
        scoreboard objectives add Mns.Valk.SubCount dummy
    # 滑空突進往復回数
        scoreboard objectives add Mns.Valk.JetCount dummy

# メインデータ
    execute if data storage mhdp_core:monster_data MonsterData[{Uid:1004}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:1004}]
    data modify storage mhdp_core:monster_data MonsterData append value {\
        Uid:1004,\
        Icon:"uE014",\
        Name:"valk",\
        UpperName:"Valk",\
        JpName:"天彗龍",\
        ShowName:'{"text":"天彗龍"}',\
        LootTable:"mhdp_items:materials/valk",\
        ShowHp:true,\
        Hp:13000,\
        StunDamage:400,\
        TireDamage:300,\
        AngerDamagePer:10,\
        AngerTimer:120,\
        AngerAttackMult:125,\
        AngerSpeed:10,\
        ParalysisDamage:500,\
        ParalysisTimer:10,\
        PoisonDamage:400,\
        PoisonTimer:17,\
        PoisonEffectDamage:60,\
        BombDamage:400,\
        BombEffectDamage:200,\
        FlashBombEnable:true,\
        SoundBombEnable:false,\
        ParalyseTrapEnable:false,\
        ParalyseTrapTimer:0,\
        HallTrapEnable:false,\
        HallTrapTimer:0,\
        HeadPartDamage:9,\
        BodyPartDamage:8,\
        TailPartDamage:6,\
        ArmRPartDamage:7,\
        ArmLPartDamage:7,\
        LegRPartDamage:7,\
        LegLPartDamage:7,\
        WingRPartDamage:7,\
        WingLPartDamage:7\
    }

# 肉質データ
# 切断,打撃,弾,火,水,雷,氷,龍
# 頭, 胴, 尻尾, 右腕, 左腕, 右脚, 左脚, 右翼, 左翼
    execute if data storage mhdp_core:monster_data DefenceData[{Uid:1004}] run data remove storage mhdp_core:monster_data DefenceData[{Uid:1004}]
    data modify storage mhdp_core:monster_data DefenceData append value {\
        Uid:1004,\
        Defences:[\
            [50,55,62,0,25,10,15,15],\
            [35,40,25,0,15,5,10,10],\
            [40,30,35,0,20,5,10,10],\
            [37,35,30,0,15,5,5,5],\
            [37,35,30,0,15,5,5,5],\
            [37,35,30,0,15,5,5,5],\
            [37,35,30,0,15,5,5,5],\
            [37,35,30,0,15,5,5,5],\
            [37,35,30,0,15,5,5,5]\
        ]\
    }

# 攻撃力データ
    execute if data storage mhdp_core:monster_data AttackData[{Uid:1004}] run data remove storage mhdp_core:monster_data AttackData[{Uid:1004}]
    data modify storage mhdp_core:monster_data AttackData append value {\
        Uid:1004,\
        Attacks:[]\
    }
    function mhdp_monster_valk:core/init/init_attack_data

say 天彗龍 init monster data