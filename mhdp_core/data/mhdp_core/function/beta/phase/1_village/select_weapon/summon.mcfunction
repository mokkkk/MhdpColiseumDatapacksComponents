#> mhdp_core:beta/phase/1_village/select_weapon/summon
#
# 武器選択用のUIを召喚する
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 初期化
    kill @e[tag=Beta.Ui]

# 色々教える用
    summon text_display 241 66 215 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:'{"bold":true,"color":"white","text":"クエスト受注"}',alignment:"center"}
    
    execute if data storage mhdp_core:game_data QuestList[{ID:1}].State{IsPlayed:true} run summon text_display 235 66 218 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:'{"bold":true,"color":"white","text":"青鳥竜の情報"}',alignment:"center"}
    execute if data storage mhdp_core:game_data QuestList[{ID:11}].State{IsPlayed:true} run summon text_display 233 66 218 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:'{"bold":true,"color":"white","text":"火竜の情報"}',alignment:"center"}
    execute if data storage mhdp_core:game_data QuestList[{ID:12}].State{IsPlayed:true} run summon text_display 231 66 218 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:'{"bold":true,"color":"white","text":"斬竜の情報"}',alignment:"center"}
    execute if data storage mhdp_core:game_data QuestList[{ID:13}].State{IsPlayed:true} run summon text_display 229 66 218 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:'{"bold":true,"color":"white","text":"天彗龍の情報"}',alignment:"center"}

# 村チュートリアル再生用
    summon text_display 259 65 202 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial"],text:'{"bold":true,"color":"white","text":"[チュートリアル再生]"}',alignment:"center"}
    summon text_display 259 64.6 202 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial"],text:'{"bold":true,"color":"white","text":"右クリック"}',alignment:"center"}
    summon interaction 259 63 202 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Tutorial"],response:1b}
    summon item_display 259 64 202 {item:{id:"minecraft:bell",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Tutorial"],billboard:"vertical"}

# 訓練所移動用
    summon text_display 250 66 215 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Training"],text:'{"bold":true,"color":"white","text":"[訓練所に移動]"}',alignment:"center"}
    summon text_display 250 65.6 215 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Training"],text:'{"bold":true,"color":"white","text":"右クリック"}',alignment:"center"}
    summon interaction 250 64 215 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Training"],response:1b}
    summon item_display 250 65 215 {item:{id:"minecraft:iron_sword",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Training"],billboard:"vertical"}

# からくり飛竜操作用
# TODO:闘技場完成後、場所を移す
    summon text_display 145 60 -17 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.KarakuriOpe"],text:'{"bold":true,"color":"white","text":"[からくり飛竜のモード変更]"}',alignment:"center"}
    summon text_display 145 59.6 -17 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.KarakuriOpe"],text:'{"bold":true,"color":"white","text":"右クリック"}',alignment:"center"}
    summon interaction 145 58 -17 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.KarakuriOpe"],response:1b}
    summon item_display 145 59 -17 {item:{id:"minecraft:iron_pickaxe",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.KarakuriOpe"],billboard:"vertical"}

# 武器チュートリアル再生用
# TODO:闘技場完成後、場所を移す
    summon text_display 145 60 -2 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.WeaponTutorial"],text:'{"bold":true,"color":"white","text":"[武器の操作説明]"}',alignment:"center"}
    summon text_display 145 59.6 -2 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.WeaponTutorial"],text:'{"bold":true,"color":"white","text":"右クリック"}',alignment:"center"}
    summon interaction 145 58 -2 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.WeaponTutorial"],response:1b}
    summon item_display 145 59 -2 {item:{id:"minecraft:book",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.WeaponTutorial"],billboard:"vertical"}

# Text
    summon text_display 234 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Ss.Normal"],text:'{"bold":true,"color":"#FF8282","text":"[片手剣・地ノ型]"}',alignment:"center"}
    summon text_display 238 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Gs.Normal"],text:'{"bold":true,"color":"#FF8282","text":"[大剣・地ノ型]"}',alignment:"center"}
    summon text_display 242 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Bw.Normal"],text:'{"bold":true,"color":"#FF8282","text":"[弓・地ノ型]"}',alignment:"center"}
# Interaction
    summon interaction 234 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Ss.Normal"],response:1b}
    summon interaction 238 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Gs.Normal"],response:1b}
    summon interaction 242 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Bw.Normal"],response:1b}
# Display
    summon item_display 234 65.7 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":301}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Normal"]}
    summon item_display 234.3 66.1 198.6 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":303}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Normal"]}
    summon item_display 238 66.3 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":201}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Gs.Normal"]}
    summon item_display 242 66.3 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":104}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Bw.Normal"]}
# Lectern
    fill 234 63 199 244 63 199 oak_slab replace
    setblock 234 63 199 lectern[facing=south,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"片手剣・地ノ型\\n\\n難易度：","color":"black"},{"text":"★","color":"gold"},{"text":"★★★","color":"dark_gray"},{"text":"\\n\\n特徴：\\n　身軽な動きが特徴で、マインクラフト標準の操作に近い感覚で戦える。\\n　盾を持っているため、ガードも可能。","color":"black"}]']}}}} replace
    setblock 236 63 199 oak_slab replace
    setblock 238 63 199 lectern[facing=south,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"大剣・地ノ型\\n\\n難易度：","color":"black"},{"text":"★★","color":"gold"},{"text":"★★","color":"dark_gray"},{"text":"\\n\\n特徴：\\n　動作は遅いが、威力の高い一撃を放つ。最大まで溜めて放つ溜め斬りは、トップクラスの威力を誇る。\\n　ガード可能で、一撃離脱の戦い方を得意とする。","color":"black"}]']}}}} replace
    setblock 240 63 199 oak_slab replace
    setblock 242 63 199 lectern[facing=south,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"弓・地ノ型\\n\\n難易度：","color":"black"},{"text":"★★","color":"gold"},{"text":"★★","color":"dark_gray"},{"text":"\\n\\n特徴：\\n　マインクラフト標準の弓に似た感覚で操作できる。適正距離を保つことで、高いダメージを与えられる。\\n　防御力が下がるため、攻撃に当たらない立ち回りが必要。","color":"black"}]']}}}} replace
    setblock 244 63 199 oak_slab replace

# チュートリアルクリア後、天の型解放
    execute if data storage mhdp_core:save_data Flag{BetaTutorial:false} run return 0
    # Text
        summon text_display 236 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Ss.Tec"],text:'{"bold":true,"color":"#78FFED","text":"[片手剣・天ノ型]"}',alignment:"center"}
        summon text_display 240 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Gs.Tec"],text:'{"bold":true,"color":"#78FFED","text":"[大剣・天ノ型]"}',alignment:"center"}
        summon text_display 244 65 198.8 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Bw.Tec"],text:'{"bold":true,"color":"#78FFED","text":"[弓・天ノ型]"}',alignment:"center"}
    # Interaction
        summon interaction 236 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Ss.Tec"],response:1b}
        summon interaction 240 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Gs.Tec"],response:1b}
        summon interaction 244 63 198 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Bw.Tec"],response:1b}
    # Display
        summon item_display 236 65.7 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":301}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Tec"]}
        summon item_display 236.3 66.1 198.6 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":303}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Tec"]}
        summon item_display 240 66.3 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":201}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Gs.Tec"]}
        summon item_display 244 66.3 198 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:custom_model_data":104}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Bw.Tec"]}
    # Lectern
        setblock 236 63 199 lectern[facing=south,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"片手剣・天ノ型\\n\\n難易度：","color":"black"},{"text":"★★★★","color":"gold"},{"text":"\\n\\n特徴：\\n　身軽な動きが特徴。操作難易度が非常に高いが、柔軟なコンボルートを持つ。\\n　盾による攻撃はモンスターにめまいを起こす。\\n　ガード可能で、ジャストガードによりダメージを大きく軽減できる。","color":"black"}]']}}}} replace
        setblock 240 63 199 lectern[facing=south,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"大剣・天ノ型\\n\\n難易度：","color":"black"},{"text":"★★★","color":"gold"},{"text":"★","color":"dark_gray"},{"text":"\\n\\n特徴：\\n　動作は遅いが、溜め斬りを連続で放つことができる。真溜め斬りは、全武器の中で最高の威力を持つ。\\n　タックルや相殺斬り上げによるカウンターが可能で、肉を切らせて骨を断つ戦法を得意とする。","color":"black"}]']}}}} replace
        setblock 244 63 199 lectern[facing=south,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"弓・天ノ型\\n\\n難易度：","color":"black"},{"text":"★★★★","color":"gold"},{"text":"\\n\\n特徴：\\n　高い機動力と、遠距離攻撃が特徴。\\n　スタミナ管理は難しいが、ステップを駆使し、強力な射撃を連続で行うことができる。\\n　仕掛け矢ゲージを使い、矢の威力をさらに高められる。","color":"black"}]']}}}} replace
