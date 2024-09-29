#> mhdp_core:beta/phase/1_village/select_weapon/summon
#
# 武器選択用のUIを召喚する
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 初期化
    kill @e[tag=Beta.Ui]

# text
    summon text_display 234 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Ss.Normal"],text:'{"bold":true,"color":"#FF8282","text":"[片手剣・地ノ型]"}'}
    summon text_display 236 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Ss.Tec"],text:'{"bold":true,"color":"#78FFED","text":"[片手剣・天ノ型]"}'}
    summon text_display 238 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Gs.Normal"],text:'{"bold":true,"color":"#FF8282","text":"[大剣・地ノ型]"}'}
    summon text_display 240 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Gs.Tec"],text:'{"bold":true,"color":"#78FFED","text":"[大剣・天ノ型]"}'}
    summon text_display 242 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Bw.Normal"],text:'{"bold":true,"color":"#FF8282","text":"[弓・地ノ型]"}'}
    summon text_display 244 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Bw.Tec"],text:'{"bold":true,"color":"#78FFED","text":"[弓・天ノ型]"}'}

# Interaction
    summon interaction 234 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Ss.Normal"],response:1b}
    summon interaction 236 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Ss.Tec"],response:1b}
    summon interaction 238 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Gs.Normal"],response:1b}
    summon interaction 240 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Gs.Tec"],response:1b}
    summon interaction 242 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Bw.Normal"],response:1b}
    summon interaction 244 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Bw.Tec"],response:1b}

# Display
    summon item_display 234 65.7 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":301}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Normal"]}
    summon item_display 234.3 66.1 198.6 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":303}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Normal"]}
    summon item_display 236 65.7 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":301}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Tec"]}
    summon item_display 236.3 66.1 198.6 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":303}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Tec"]}
    summon item_display 238 66.3 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":201}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Gs.Normal"]}
    summon item_display 240 66.3 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":201}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Gs.Tec"]}
    summon item_display 242 66.3 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":104}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Bw.Normal"]}
    summon item_display 244 66.3 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":104}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Bw.Tec"]}
