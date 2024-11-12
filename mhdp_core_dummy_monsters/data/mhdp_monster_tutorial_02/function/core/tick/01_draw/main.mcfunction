#> mhdp_monster_tutorial_02:core/tick/01_draw/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：抜刀 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ホットバーで空欄のアイテムを選択し、 "},{"keybind":"key.swapOffhand","color": "#ff9900","bold": true},{"text":"キー","color": "#ff9900","bold": true},{"text":" を押すと、\n"},\
        {"text":"  武器の抜刀ができる。\n"},\
        {"text":"  または"},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" を押すと、\n"},\
        {"text":"  "},{"text":"抜刀攻撃","color": "#ff9900","bold": true},{"text":" ができる。"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 150.. run function mhdp_monster_tutorial_02:core/tick/02_attack/start
