#> mhdp_core:phase/1_village/start/entity/macro/m.start_bell
#
# 村Phase開始・更新処理 処理に必要なEntityの有無を確認
#
# @within function mhdp_core:phase/1_village/start/entity/main

# クエストボード
    kill @e[tag=Other.Interaction.Board]
    $execute positioned $(X) $(Y) $(Z) positioned ^1 ^ ^ run summon interaction ~ ~ ~ {width:1.5f,height:2f,Tags:["Other.Interaction.UI","Other.Interaction.Board"],response:1b}
    $execute positioned $(X) $(Y) $(Z) positioned ^ ^ ^ run summon interaction ~ ~ ~ {width:1.5f,height:2f,Tags:["Other.Interaction.UI","Other.Interaction.Board"],response:1b}
    $execute positioned $(X) $(Y) $(Z) positioned ^-1 ^ ^ run summon interaction ~ ~ ~ {width:1.5f,height:2f,Tags:["Other.Interaction.UI","Other.Interaction.Board"],response:1b}
    $execute unless entity @e[type=text_display,tag=Other.Text.Board] positioned $(X) $(Y) $(Z) positioned ^ ^1 ^1 run summon text_display ~ ~ ~ {view_range:0.1f,width:1.5f,height:1.5f,billboard:"vertical",default_background:1b,Tags:["Other.Text.Board"],text:{"bold":true,"color":"white","text":"クエスト参加"},alignment:"center"}
