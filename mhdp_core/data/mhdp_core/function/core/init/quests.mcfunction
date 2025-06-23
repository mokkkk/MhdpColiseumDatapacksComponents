#> mhdp_core:core/init/quests
#
# クエストデータの初期化を行う
#
# @within function 

# Pos
#   0:下位 1:上位 2:特殊
# Content.Monsters.Timing
#   Initial:最初から Half:対象モンスター体力半減時 Death:対象モンスター討伐時
# Content.Time
#   day:日中 night：夜


# 初期化
    data modify storage mhdp_core:game_data QuestList set value []

# チュートリアル用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:1,Name:"チュートリアル",Level:1,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:12,AttackMultiply:35,Field:"Coliseum",Time:"day",TimeLimit:60,DeathCount:99,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1},\
            {MonsterId:9002,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# チュートリアル用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:2,Name:"詳細チュートリアル",Level:1,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:16,AttackMultiply:20,Field:"Coliseum",Time:"day",TimeLimit:60,DeathCount:99,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1},\
            {MonsterId:9001,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 初級：青鳥竜の狩猟
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:10,Name:"初級：青鳥竜の狩猟",Level:1,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:12,AttackMultiply:50,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 中級：火竜の狩猟
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:11,Name:"中級：火竜の狩猟",Level:2,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:18,AttackMultiply:50,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1002,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 上級：斬竜の狩猟
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:12,Name:"上級：斬竜の狩猟",Level:3,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:18,AttackMultiply:50,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1003,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 超上級：天彗龍の狩猟
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:13,Name:"超上級：???の狩猟",Level:4,Pos:0,IsEmergency:false,HideMonsters:true,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:14,AttackMultiply:50,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1004,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 初級：青鳥竜の狩猟
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:14,Name:"初級：青鳥竜の狩猟(高難度)",Level:4,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:18,AttackMultiply:100,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 中級：火竜の狩猟
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:15,Name:"中級：火竜の狩猟(高難度)",Level:5,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:21,AttackMultiply:110,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1002,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 上級：斬竜の狩猟
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:16,Name:"上級：斬竜の狩猟(高難度)",Level:6,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:24,AttackMultiply:100,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1003,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 超上級：天彗龍の狩猟
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:17,Name:"超上級：???の狩猟(高難度)",Level:7,Pos:0,IsEmergency:false,HideMonsters:true,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:25,AttackMultiply:105,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1004,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:18,Name:"DEBUG:さんどばっぐくん",Level:1,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:9000,AttackMultiply:100,Field:"Coliseum",Time:"day",TimeLimit:999,DeathCount:99999,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:19,Name:"DEBUG：???の狩猟",Level:7,Pos:0,IsEmergency:false,HideMonsters:true,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:100,AttackMultiply:100,Field:"Coliseum",Time:"day",TimeLimit:999,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1004,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:20,Name:"DEBUG:テスト用クエスト2",Level:3,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:30,AttackMultiply:200,Field:"Coliseum",Time:"day",TimeLimit:5454,DeathCount:999,RewardMoney:15,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1},\
            {MonsterId:1,Timing:"Death",TargetMonsterId:1001}\
        ]}\
    }

# テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:21,Name:"DEBUG:とってもながいクエスト名てすと",Level:7,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:200,AttackMultiply:200,Field:"Coliseum",Time:"day",TimeLimit:999,DeathCount:999,RewardMoney:999,RewardId:-1,Monsters:[\
            {MonsterId:3,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:22,Name:"DEBUG:非表示クエスト",Level:7,Pos:0,IsEmergency:false,HideMonsters:true,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:false},\
        Content:{HpMultiply:200,AttackMultiply:200,Field:"Test",Time:"day",TimeLimit:999,DeathCount:999,RewardMoney:999,RewardId:-1,Monsters:[\
            {MonsterId:0,Timing:"Initial",TargetMonsterId:-1},\
            {MonsterId:1,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# クエスト受注書作成用データ・基礎部分
    data modify storage mhdp_core:game_data QuestBookData set value {\
        Level:["","★","★★","★★★","★★★★","★★★★★","★★★★★★","★★★★★★★","★★★★★★★★"],\
        Field:[{ID:"Coliseum",Name:"闘技場"},{ID:"Test",Name:"その辺"}],\
        Monsters:[\
            {ID:0,ShowName:{"text":"\uE001","color":"white","font":"icons/mhdp_icons","hover_event":{"action":"show_text","value":[{"text":"火竜てすと"}]}}},\
            {ID:1,ShowName:{"text":"\uE002","color":"white","font":"icons/mhdp_icons","hover_event":{"action":"show_text","value":[{"text":"雌火竜てすと"}]}}},\
            {ID:2,ShowName:{"text":"\uE003","color":"white","font":"icons/mhdp_icons","hover_event":{"action":"show_text","value":[{"text":"斬竜てすと"}]}}},\
            {ID:3,ShowName:{"text":"\uE004","color":"white","font":"icons/mhdp_icons","hover_event":{"action":"show_text","value":[{"text":"雷狼竜てすと"}]}}}\
        ]\
    }

# クエスト受注書作成用データ・モンスター部分
    data modify storage mhdp_core:temp MonsterData set from storage mhdp_core:monster_data MonsterData
    function mhdp_core:core/init/quests_monsterdata

# 反映
    function mhdp_core:phase/1_village/start/quest/main

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say クエストデータ初期化