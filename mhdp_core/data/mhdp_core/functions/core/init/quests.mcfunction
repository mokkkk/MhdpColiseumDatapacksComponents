#> mhdp_core:core/init/quests
#
# クエストデータの初期化を行う
#
# @within function 

# Pos
#   0:下位 1:上位 2:特殊
# Content.Monsters.Timing
#   Initial:最初から Half:対象モンスター体力半減時 Death:対象モンスター討伐時

# 初期化
    data modify storage mhdp_core:game_data QuestList set value []

# 0:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:0,Name:{"text":"テスト用クエスト1","bold":true},Pos:0,IsEmergency:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:100,AttackMultiply:100,Field:"Coliseum",TimeLimit:15,DeathCount:3,RewardMoney:5,RewardId:-1,Monsters:[\
            {MonsterId:0,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 1:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:1,Name:{"text":"テスト用クエスト2","bold":true},Pos:0,IsEmergency:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:200,AttackMultiply:200,Field:"Coliseum",TimeLimit:30,DeathCount:999,RewardMoney:5,RewardId:-1,Monsters:[\
            {MonsterId:0,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

say クエストデータ初期化