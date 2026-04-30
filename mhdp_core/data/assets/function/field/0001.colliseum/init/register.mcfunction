#> assets:field/0001.colliseum/init/register
#
# フィールド初期化処理 register

# フィールド情報登録
    data remove storage mhdp_core:game_data FieldData[{FieldId:1}]
    data modify storage mhdp_core:game_data FieldData append value {\
        FieldId:1,\
        Name:"闘技場",\
        Pos:{X:-67,Y:66,Z:102},\
        StartPos:{X:221,Y:66,Z:141},\
        AreaList:[\
            {AreaId:0, X:220,Y:66,Z:140, Height:66, FromArea:[\
                {AreaId:1}\
            ]},\
            {AreaId:1, X:-67,Y:66,Z:102, Height:66, FromArea:[\
                {AreaId:0}\
            ]}\
        ]\
    }
