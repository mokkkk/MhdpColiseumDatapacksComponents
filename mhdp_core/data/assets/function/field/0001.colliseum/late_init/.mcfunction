#> assets:field/0001.colliseum/late_init/
#
# forceload完了後に実行されるフィールド初期化処理

# エリアの初期化
    # summon marker -67 66 102 {Tags:["Mk.Field.Center"]}
    function assets:core/field/area/init_area.m with storage mhdp_core:game_data FieldData[{FieldId:1}].AreaList[{AreaId:0}]
    function assets:core/field/area/init_area.m with storage mhdp_core:game_data FieldData[{FieldId:1}].AreaList[{AreaId:1}]

# TODO: モンスターの配置チェック
    # モンスターの配置エリアIDを確認。存在しないエリアの場合、エラーを表示する
    # エラーの場合、エリア1に配置する

# リタイア用ベルのinteraction 存在チェック + 召喚
    execute positioned 216 67 147 unless entity @n[type=interaction,tag=Other.Interaction.RetireBell,distance=..2] run summon interaction 216 67 147 {width:1.2f,height:1.2f,response:1b,Tags:["Other.Interaction.UI","Other.Interaction.RetireBell"]}
    execute positioned 216 68 147 unless entity @n[type=text_display,tag=Other.Text.RetireBell,distance=..2] run summon text_display 216 68 147 {view_range:0.1f,width:1.5f,height:1.5f,billboard:"vertical",default_background:1b,Tags:["Other.Text.RetireBell"],text:{"bold":true,"color":"white","text":"クエストリタイア"},alignment:"center"}

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say assets:field/late_init colliseum
