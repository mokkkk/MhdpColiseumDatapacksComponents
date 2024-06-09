#> mhdp_monster_ranposu:core/init/init_monster_data
#
# モンスターデータの初期化を行う
#
# @within function 

## 青鳥竜
# モンスターデータ
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
        AngerAttackMult:120,\
        ParalysisDamage:2000,\
        ParalysisTimer:10,\
        PoisonDamage:3000,\
        PoisonTimer:40,\
        PoisonDamageMult:100,\
        FlashBombEnable:true,\
        SoundBombEnable:false,\
        ParalyseTrapEnable:true,\
        ParalyseTrapTimer:10,\
        HallTrapEnable:true,\
        HallTrapTimer:15,\
        Defences:[\
            [100,100,100,100,100,100,100,100],\
            [100,100,100,100,100,100,100,100]\
        ],\
        HeadPartDamage:12,\
        BodyPartDamage:20\
    }

# クエスト受注書作成用データ
    data modify storage mhdp_core:game_data QuestBookData.Monsters append value {ID:1001,ShowName:{"text":"\\uE001","color":"white","font":"icons/mhdp_icons","hoverEvent":{"action":"show_text","value":[{"text":"青鳥竜"}]}}}
