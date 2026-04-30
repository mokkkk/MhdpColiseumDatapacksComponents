#> assets:field/0001.colliseum/init/
#
# フィールド初期化処理

# フィールド情報登録
    function assets:field/0001.colliseum/init/register

# ActiveFieldに指定
    data modify storage mhdp_core:game_data ActiveField set from storage mhdp_core:game_data FieldData[{FieldId:1}]

# forceload
    function assets:field/0001.colliseum/init/forceload

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say assets:field/init colliseum
