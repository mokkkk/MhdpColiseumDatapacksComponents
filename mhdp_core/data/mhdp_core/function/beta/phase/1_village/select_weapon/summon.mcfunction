#> mhdp_core:beta/phase/1_village/select_weapon/summon
#
# 武器選択用のUIを召喚する
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 初期化
    kill @e[tag=Beta.Ui]

# クエスト受注本
    summon text_display -79 71 775 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:{"bold":true,"color":"white","text":"クエスト受注"},alignment:"center"}

# モンスターリスト
    execute if data storage mhdp_core:game_data QuestList[{ID:1}].State{IsPlayed:true} run summon text_display -87 71 777 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:{"bold":true,"color":"white","text":"青鳥竜の情報"},alignment:"center"}
    execute if data storage mhdp_core:game_data QuestList[{ID:2}].State{IsPlayed:true} positioned -87 71 777 unless entity @n[type=text_display,tag=Beta.Display.Other,distance=..1] run summon text_display -87 71 777 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:{"bold":true,"color":"white","text":"青鳥竜の情報"},alignment:"center"}
    execute if data storage mhdp_core:game_data QuestList[{ID:11}].State{IsPlayed:true} run summon text_display -87 71 775 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:{"bold":true,"color":"white","text":"火竜の情報"},alignment:"center"}
    execute if data storage mhdp_core:game_data QuestList[{ID:12}].State{IsPlayed:true} run summon text_display -87 71 773 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:{"bold":true,"color":"white","text":"斬竜の情報"},alignment:"center"}
    execute if data storage mhdp_core:game_data QuestList[{ID:13}].State{IsPlayed:true} run summon text_display -87 71 771 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Other"],text:{"bold":true,"color":"white","text":"天彗龍の情報"},alignment:"center"}

# 村チュートリアル再生用
    summon text_display -80 71 785 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial"],text:{"bold":true,"color":"white","text":"[遊び方の確認]"},alignment:"center"}
    summon text_display -80 70.6 785 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial"],text:{"bold":true,"color":"white","text":"右クリック"},alignment:"center"}
    summon interaction -80 69 785 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Tutorial"],response:1b}
    summon item_display -80 70 785 {item:{id:"minecraft:bell",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Tutorial"],billboard:"vertical"}

    summon text_display -77 71 787 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial.Essential"],text:{"bold":true,"color":"red","text":"[！必須設定の確認]"},alignment:"center"}
    summon text_display -77 70.6 787 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial.Essential"],text:{"bold":true,"color":"white","text":"右クリック"},alignment:"center"}
    summon interaction -77 69 787 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Tutorial.Essential"],response:1b}
    summon item_display -77 70 787 {item:{id:"minecraft:chain_command_block",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Tutorial.Essential"],billboard:"vertical"}

    summon text_display -77 71 791 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial.Optional"],text:{"bold":true,"color":"gold","text":"[推奨設定の確認]"},alignment:"center"}
    summon text_display -77 70.6 791 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial.Optional"],text:{"bold":true,"color":"white","text":"右クリック"},alignment:"center"}
    summon interaction -77 69 791 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Tutorial.Optional"],response:1b}
    summon item_display -77 70 791 {item:{id:"minecraft:repeating_command_block",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Tutorial.Optional"],billboard:"vertical"}

    summon text_display -77 71 771 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.ResetClearTime"],text:{"bold":true,"color":"gold","text":"[クリアタイム消去]"},alignment:"center"}
    summon text_display -77 70.6 771 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.ResetClearTime"],text:{"bold":true,"color":"white","text":"右クリック"},alignment:"center"}
    summon interaction -77 69 771 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.ResetClearTime"],response:1b}
    summon item_display -77 70 771 {item:{id:"minecraft:barrier",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.ResetClearTime"],billboard:"vertical"}

# チュートリアル一覧確認用
    summon text_display -88 71 784 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial.Review"],text:{"bold":true,"text":"[チュートリアルを読む]"},alignment:"center"}
    summon text_display -88 70.6 784 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Tutorial.Review"],text:{"bold":true,"color":"white","text":"右クリック"},alignment:"center"}
    summon interaction -88 69 784 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Tutorial.Review"],response:1b}
    summon item_display -88 70 784 {item:{id:"minecraft:paper",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Tutorial.Review"],billboard:"vertical"}

# 訓練所移動用(訓練開始・停止)
    summon text_display -95 71 791 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Training"],text:{"bold":true,"color":"white","text":"[訓練所の利用開始・終了]"},alignment:"center"}
    summon text_display -95 70.6 791 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Training"],text:{"bold":true,"color":"white","text":"右クリック"},alignment:"center"}
    summon interaction -95 69 791 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Training"],response:1b}
    summon item_display -95 70 791 {item:{id:"minecraft:iron_sword",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Training"],billboard:"vertical"}
    # summon text_display -93 71 762 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Training"],text:'{"bold":true,"color":"white","text":"[村に移動]"}',alignment:"center"}

# からくり飛竜操作用
    summon text_display -112 71 800 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.KarakuriOpe"],text:{"bold":true,"color":"white","text":"[からくり飛竜のモード変更]"},alignment:"center"}
    summon text_display -112 70.6 800 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.KarakuriOpe"],text:{"bold":true,"color":"white","text":"右クリック"},alignment:"center"}
    summon interaction -112 69 800 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.KarakuriOpe"],response:1b}
    summon item_display -112 70 800 {item:{id:"minecraft:iron_pickaxe",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.KarakuriOpe"],billboard:"vertical"}

# 武器チュートリアル再生用
    summon text_display -112 71 795 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.WeaponTutorial"],text:{"bold":true,"color":"white","text":"[武器の操作説明]"},alignment:"center"}
    summon text_display -112 70.6 795 {view_range:0.1f,width:0.4f,height:0.4f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.WeaponTutorial"],text:{"bold":true,"color":"white","text":"右クリック"},alignment:"center"}
    summon interaction -112 69 795 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.WeaponTutorial"],response:1b}
    summon item_display -112 70 795 {item:{id:"minecraft:book",count:1},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.WeaponTutorial"],billboard:"vertical"}

# 武器
# Text
    summon text_display -81 71 795 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Ss.Normal"],text:{"bold":true,"color":"#FF8282","text":"[片手剣・地ノ型]"},alignment:"center"}
    summon text_display -81 71 799 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Gs.Normal"],text:{"bold":true,"color":"#FF8282","text":"[大剣・地ノ型]"},alignment:"center"}
    summon text_display -81 71 803 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Bw.Normal"],text:{"bold":true,"color":"#FF8282","text":"[弓・地ノ型]"},alignment:"center"}
# Interaction
    summon interaction -81 69 795 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Ss.Normal"],response:1b}
    summon interaction -81 69 799 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Gs.Normal"],response:1b}
    summon interaction -81 69 803 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Bw.Normal"],response:1b}
# Display
    summon item_display -80.3 71.7 795.6 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:item_model":"minecraft:weapons/short_sword/display_sword","minecraft:custom_model_data":{strings:["drawing"]}}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Normal"]}
    summon item_display -80.6 72.1 795.3 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:item_model":"minecraft:weapons/short_sword/display_shield","minecraft:custom_model_data":{strings:["drawing_sub"]}}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Normal"]}
    summon item_display -81 72.3 799 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:item_model":"minecraft:weapons/great_sword/display","minecraft:custom_model_data":{strings:["drawing"]}}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Gs.Normal"]}
    summon item_display -81 72.3 803 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:item_model":"minecraft:weapons/bow/display","minecraft:custom_model_data":{strings:["pulling_0"]}}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Bw.Normal"]}
    execute as @e[type=item_display,tag=Beta.Display.Ss.Normal] at @s run tp @s ~ ~ ~ ~90 ~
    execute as @e[type=item_display,tag=Beta.Display.Gs.Normal] at @s run tp @s ~ ~ ~ ~90 ~
    execute as @e[type=item_display,tag=Beta.Display.Bw.Normal] at @s run tp @s ~ ~ ~ ~90 ~
# Lectern
    fill -82 69 794 -82 69 806 oak_slab replace
    setblock -82 69 795 lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:[[{"text":"片手剣・地ノ型\n\n難易度：","color":"black"},{"text":"★","color":"gold"},{"text":"★★★","color":"dark_gray"},{"text":"\n\n特徴：\n　身軽な動きが特徴で、マインクラフト標準の操作に近い感覚で戦える。\n　盾を持っているため、ガードも可能。","color":"black"}]]}}}} replace
    setblock -82 69 797 oak_slab replace
    setblock -82 69 799 lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:[[{"text":"大剣・地ノ型\n\n難易度：","color":"black"},{"text":"★★","color":"gold"},{"text":"★★","color":"dark_gray"},{"text":"\n\n特徴：\n　動作は遅いが、威力の高い一撃を放つ。最大まで溜めて放つ溜め斬りは、トップクラスの威力を誇る。\n　ガード可能で、一撃離脱の戦い方を得意とする。","color":"black"}]]}}}} replace
    setblock -82 69 801 oak_slab replace
    setblock -82 69 803 lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:[[{"text":"弓・地ノ型\n\n難易度：","color":"black"},{"text":"★★","color":"gold"},{"text":"★★","color":"dark_gray"},{"text":"\n\n特徴：\n　マインクラフト標準の弓に似た感覚で操作できる。適正距離を保つことで、高いダメージを与えられる。\n　防御力が下がるため、攻撃に当たらない立ち回りが必要。","color":"black"}]]}}}} replace
    setblock -82 69 805 oak_slab replace

# チュートリアルクリア後、天の型解放
    execute if data storage mhdp_core:save_data Flag{BetaTutorial:false} run return 0
    # Text
        summon text_display -81 71 797 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Ss.Tec"],text:{"bold":true,"color":"#78FFED","text":"[片手剣・天ノ型]"},alignment:"center"}
        summon text_display -81 71 801 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Gs.Tec"],text:{"bold":true,"color":"#78FFED","text":"[大剣・天ノ型]"},alignment:"center"}
        summon text_display -81 71 805 {view_range:0.1f,width:0.9f,height:0.9f,billboard:"vertical",default_background:1b,Tags:["Beta.Ui","Beta.Display.Bw.Tec"],text:{"bold":true,"color":"#78FFED","text":"[弓・天ノ型]"},alignment:"center"}
    # Interaction
        summon interaction -81 69 797 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Ss.Tec"],response:1b}
        summon interaction -81 69 801 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Gs.Tec"],response:1b}
        summon interaction -81 69 805 {width:1.5f,height:1.7f,Tags:["Other.Interaction.UI","Beta.Ui","Beta.Interaction.Bw.Tec"],response:1b}
    # Display
        summon item_display -80.3 71.7 797.6 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:item_model":"minecraft:weapons/short_sword/display_sword","minecraft:custom_model_data":{strings:["drawing"]}}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Tec"]}
        summon item_display -80.6 72.1 797.3 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:item_model":"minecraft:weapons/short_sword/display_shield","minecraft:custom_model_data":{strings:["drawing_sub"]}}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Ss.Tec"]}
        summon item_display -81 72.3 801 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:item_model":"minecraft:weapons/great_sword/display","minecraft:custom_model_data":{strings:["drawing"]}}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Gs.Tec"]}
        summon item_display -81 72.3 805 {item_display:"head",item:{id:"minecraft:ender_eye",count:1,components:{"minecraft:item_model":"minecraft:weapons/bow/display","minecraft:custom_model_data":{strings:["pulling_0"]}}},Tags:["Other.Interaction.UI","Beta.Ui","Beta.Display.Bw.Tec"]}
    # Lectern
        setblock -82 69 797 lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:[[{"text":"片手剣・天ノ型\n\n難易度：","color":"black"},{"text":"★★★★","color":"gold"},{"text":"\n\n特徴：\n　身軽な動きが特徴。操作難易度が非常に高いが、柔軟なコンボルートを持つ。\n　盾による攻撃はモンスターにめまいを起こす。\n　ガード可能で、ジャストガードによりダメージを大きく軽減できる。","color":"black"}]]}}}} replace
        setblock -82 69 801 lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:[[{"text":"大剣・天ノ型\n\n難易度：","color":"black"},{"text":"★★★","color":"gold"},{"text":"★","color":"dark_gray"},{"text":"\n\n特徴：\n　動作は遅いが、溜め斬りを連続で放つことができる。真溜め斬りは、全武器の中で最高の威力を持つ。\n　タックルや相殺斬り上げによるカウンターが可能で、肉を切らせて骨を断つ戦法を得意とする。","color":"black"}]]}}}} replace
        setblock -82 69 805 lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:[[{"text":"弓・天ノ型\n\n難易度：","color":"black"},{"text":"★★★★","color":"gold"},{"text":"\n\n特徴：\n　高い機動力と、遠距離攻撃が特徴。\n　スタミナ管理は難しいが、ステップを駆使し、強力な射撃を連続で行うことができる。\n　仕掛け矢ゲージを使い、矢の威力をさらに高められる。","color":"black"}]]}}}} replace
    execute as @e[type=item_display,tag=Beta.Display.Ss.Tec] at @s run tp @s ~ ~ ~ ~90 ~
    execute as @e[type=item_display,tag=Beta.Display.Gs.Tec] at @s run tp @s ~ ~ ~ ~90 ~
    execute as @e[type=item_display,tag=Beta.Display.Bw.Tec] at @s run tp @s ~ ~ ~ ~90 ~
