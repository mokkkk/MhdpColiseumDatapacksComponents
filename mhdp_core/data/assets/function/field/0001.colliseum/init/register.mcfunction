#> assets:field/0001.colliseum/init/register
#
# フィールド初期化処理 register

# フィールド情報登録
    data remove storage mhdp_core:game_data FieldData[{ID:1}]
    data modify storage mhdp_core:game_data FieldData append value {\
        ID:1,\
        Name:"闘技場",\
        Pos:[-67,66,102],\
        StartPos:[221,66,141],\
        AreaList:[\
            {ID:1, CenterPos:[-67,66,102], Height:66}\
        ]\
    }
