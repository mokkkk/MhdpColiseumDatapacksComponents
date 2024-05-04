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
        ID:0,Name:"テスト用クエスト1",Level:1,Pos:0,IsEmergency:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:100,AttackMultiply:100,Field:"Coliseum",TimeLimit:15,DeathCount:3,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:0,Timing:"Initial",TargetMonsterId:-1},\
            {MonsterId:1,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 1:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:1,Name:"テスト用クエスト2",Level:3,Pos:0,IsEmergency:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:200,AttackMultiply:200,Field:"Coliseum",TimeLimit:1,DeathCount:999,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:2,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# 2:テスト用
    data modify storage mhdp_core:game_data QuestList append value {\
        ID:999,Name:"灯りさす火を求むれど射干玉の",Level:3,Pos:0,IsEmergency:false,\
        State:{IsPlayed:false,IsCleared:false,IsHardCleared:false,Visible:true},\
        Content:{HpMultiply:200,AttackMultiply:200,Field:"Test",TimeLimit:999,DeathCount:999,RewardMoney:6,RewardId:-1,Monsters:[\
            {MonsterId:3,Timing:"Initial",TargetMonsterId:-1}\
        ]}\
    }

# クエスト受注書作成用データ
    data modify storage mhdp_core:game_data QuestBookData set value {\
        Level:["","★","★★","★★★","★★★★","★★★★★","★★★★★★","★★★★★★★","★★★★★★★★"],\
        Field:[{ID:"Coliseum",Name:"闘技場"},{ID:"Test",Name:"どっか"}],\
        Monsters:[{ID:0,Name:{"text":"ほげ","color":red,"hoverEvent":{"action":"show_text","value":[{"text":"aaa"}]}}},{ID:1,Name:{"text":"ふが","color":black,"hoverEvent":{"action":"show_text","value":[{"text":"aaa"}]}}},{ID:2,Name:{"text":"ぴよ","color":white,"hoverEvent":{"action":"show_text","value":[{"text":"aaa"}]}}},{ID:3,Name:{"text":"太郎","color":blue,"hoverEvent":{"action":"show_text","value":[{"text":"aaa"}]}}}]\
    }


say クエストデータ初期化