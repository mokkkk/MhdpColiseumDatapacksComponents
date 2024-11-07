#> mhdp_core:core/init/position
#
# 座標の初期化を行う
#
# @within function 

# 初期化
    data modify storage mhdp_core:game_data PositionList set value []

# 初期スポーン地点
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"InitialSpawnPoint",X:-83,Y:69,Z:775,Rotate:0\
    }

# 訓練所→村移動地点（未修整）
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"TrainingToVillage",X:250,Y:64,Z:213,Rotate:180\
    }

# 訓練所スポーン地点
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"TrainingSpawnPoint",X:-88,Y:69,Z:762,Rotate:-90\
    }

## 村オブジェクト

# 下位クエスト受注書
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"QuestBookKohaku",X:-79,Y:69,Z:775,Facing:"west",Rotate:-90\
    }

# 落とし物チェスト（未修整）
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"LostItemChest",X:260,Y:64,Z:212,Facing:"north",Rotate:90\
    }

# クエスト出発ベル
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"StartBell",X:-91,Y:70,Z:762,Facing:"east",InverseFacing:"west",Rotate:90\
    }

# クエストボード
    data modify storage mhdp_core:game_data PositionList append value {\
        ID:"QuestBoard",X:-83,Y:70,Z:759,Rotate:0\
    }
  
say 座標初期化