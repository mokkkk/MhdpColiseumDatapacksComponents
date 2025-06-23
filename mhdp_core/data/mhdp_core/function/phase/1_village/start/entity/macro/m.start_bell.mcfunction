#> mhdp_core:phase/1_village/start/entity/macro/m.start_bell
#
# 村Phase開始・更新処理 処理に必要なEntityの有無を確認
#
# @within function mhdp_core:phase/1_village/start/entity/main

# クエスト出発ベル
    $execute unless block $(X) $(Y) $(Z) chest run setblock $(X) $(Y) $(Z) bell[facing=$(Facing),attachment=floor] replace
    $execute unless entity @e[type=interaction,tag=Other.Interaction.Bell] run summon interaction $(X) $(Y) $(Z) {width:1.2f,height:1.2f,response:1b,Tags:["Other.Interaction.UI","Other.Interaction.Bell"]}
    $execute unless entity @e[type=text_display,tag=Other.Text.Bell] positioned $(X) $(Y) $(Z) run summon text_display ~ ~1 ~ {view_range:0.1f,width:1.5f,height:1.5f,billboard:"vertical",default_background:1b,Tags:["Other.Text.Bell"],text:{"bold":true,"color":"white","text":"クエスト出発"},alignment:"center"}
