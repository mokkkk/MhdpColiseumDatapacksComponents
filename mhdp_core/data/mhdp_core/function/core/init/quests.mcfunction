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

# 0:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:0,Name:"青鳥竜の狩猟",Level:1,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:18,AttackMultiply:70,Field:"Coliseum",Time:"day",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 0:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:1,Name:"さんどばっぐくん",Level:1,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:9000,AttackMultiply:100,Field:"Coliseum",Time:"day",TimeLimit:999,DeathCount:99999,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 1:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:2,Name:"テスト用クエスト2",Level:3,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:30,AttackMultiply:200,Field:"Coliseum",Time:"day",TimeLimit:5454,DeathCount:999,RewardMoney:15,RewardId:-1,Monsters:[\
            {MonsterId:1001,Timing:"Initial",TargetMonsterId:-1},\
            {MonsterId:1,Timing:"Death",TargetMonsterId:1001}\
        ]}\
    }

# 2:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:3,Name:"とってもながいクエスト名てすと",Level:7,Pos:0,IsEmergency:false,HideMonsters:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:200,AttackMultiply:200,Field:"Coliseum",Time:"day",TimeLimit:999,DeathCount:999,RewardMoney:999,RewardId:-1,Monsters:[\
            {MonsterId:3,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 3:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:4,Name:"非表示クエスト",Level:7,Pos:0,IsEmergency:false,HideMonsters:true,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
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
            {ID:0,ShowName:{"text":"\\uE001","color":"white","font":"icons/mhdp_icons","hoverEvent":{"action":"show_text","value":[{"text":"火竜てすと"}]}}},\
            {ID:1,ShowName:{"text":"\\uE002","color":"white","font":"icons/mhdp_icons","hoverEvent":{"action":"show_text","value":[{"text":"雌火竜てすと"}]}}},\
            {ID:2,ShowName:{"text":"\\uE003","color":"white","font":"icons/mhdp_icons","hoverEvent":{"action":"show_text","value":[{"text":"斬竜てすと"}]}}},\
            {ID:3,ShowName:{"text":"\\uE004","color":"white","font":"icons/mhdp_icons","hoverEvent":{"action":"show_text","value":[{"text":"雷狼竜てすと"}]}}}\
        ]\
    }

# クエスト受注書作成用データ・モンスター部分
    data modify storage mhdp_core:temp MonsterData set from storage mhdp_core:monster_data MonsterData
    function mhdp_core:core/init/quests_monsterdata

# 反映
    function mhdp_core:phase/1_village/start/quest/main

say クエストデータ初期化