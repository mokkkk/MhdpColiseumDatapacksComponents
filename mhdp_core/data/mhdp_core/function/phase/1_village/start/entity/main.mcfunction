#> mhdp_core:phase/1_village/start/entity/main
#
# 村Phase開始・更新処理 処理に必要なEntityの有無を確認
#
# @within function mhdp_core:phase/1_village/start/main

# クエスト出発口
    execute unless entity @e[type=interaction,tag=Other.Interaction.Bell] run summon interaction 223 64 206 {width:1.2f,height:1.2f,response:1b,Tags:["Other.Interaction.UI","Other.Interaction.Bell"]}
    execute unless entity @e[type=text_display,tag=Other.Text.Bell] run summon text_display 223 65 206 {view_range:0.1f,width:1.5f,height:1.5f,billboard:"vertical",default_background:1b,Tags:["Other.Text.Bell"],text:'{"bold":true,"color":"white","text":"クエスト出発"}',alignment:"center"}
    execute unless entity @e[type=text_display,tag=Other.Text.Board] run summon text_display 226 65 201 {view_range:0.1f,width:1.5f,height:1.5f,billboard:"vertical",default_background:1b,Tags:["Other.Text.Board"],text:'{"bold":true,"color":"white","text":"クエスト参加"}',alignment:"center"}

# 処理用のEntity配置
    kill @e[tag=Other.Interaction.Board]
    summon interaction 225 64 200 {width:1.5f,height:2f,Tags:["Other.Interaction.UI","Other.Interaction.Board"],response:1b}
    summon interaction 226 64 200 {width:1.5f,height:2f,Tags:["Other.Interaction.UI","Other.Interaction.Board"],response:1b}
    summon interaction 227 64 200 {width:1.5f,height:2f,Tags:["Other.Interaction.UI","Other.Interaction.Board"],response:1b}
