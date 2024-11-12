#> mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum
#
# クエスト開始処理 大闘技場のフィールド初期化処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/start_quest

# リタイア用ベルのinteraction召喚
    execute positioned 216 67 147 unless entity @n[type=interaction,tag=Other.Interaction.RetireBell,distance=..2] run summon interaction 216 67 147 {width:1.2f,height:1.2f,response:1b,Tags:["Other.Interaction.UI","Other.Interaction.RetireBell"]}
    execute positioned 216 68 147 unless entity @n[type=text_display,tag=Other.Text.RetireBell,distance=..2] run summon text_display 216 68 147 {view_range:0.1f,width:1.5f,height:1.5f,billboard:"vertical",default_background:1b,Tags:["Other.Text.RetireBell"],text:'{"bold":true,"color":"white","text":"クエストリタイア"}',alignment:"center"}

# 中心点設置
# モンスター召喚位置の決定などに使用
    summon marker -67 66 102 {Tags:["Mk.Field.Center"]}
    schedule function mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum_place_center 10t

# プレイヤーを移動
    tp @a[tag=Ply.State.PlayingQuest] 221 66 141
    spawnpoint @a[tag=Ply.State.PlayingQuest] 221 66 141
