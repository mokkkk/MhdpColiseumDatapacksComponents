#> mhdp_core:core/init/position
#
# 座標の初期化を行う
#
# @within function 

# 初期化
    data modify storage mhdp_core:game_data PositionList set value []

# 初期スポーン地点
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"InitialSpawnPoint",X:266,Y:63,Z:204,Rotate:90\
    }

# 訓練所→村移動地点
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"TrainingToVillage",X:250,Y:64,Z:213,Rotate:180\
    }

# 闘技場スポーン地点
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"TrainingSpawnPoint",X:-88,Y:69,Z:762,Rotate:-90\
    }

# 下位クエスト受注書
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"QuestBookKohaku",X:241,Y:64,Z:215,Facing:"north",Rotate:-90\
    }

say 座標初期化