#> assets:field/0001.colliseum/remove/
#
# フィールド消去処理

# ActiveFieldを削除
    data remove storage mhdp_core:game_data ActiveField

# 中心点削除
    kill @e[type=marker,tag=Mk.Field.Center]
    kill @e[type=marker,tag=Mk.Field.Back]

# forceload解除
    forceload remove -167 37 251 100
    forceload remove -167 101 251 184

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say assets:field/remove colliseum
