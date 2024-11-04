#> mhdp_monster_tutorial_02:core/tick/03_heal/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：回復 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ダメージを受けたときは "},{"text":"回復薬","color": "#ff9900","bold": true},{"text":" を使って回復しよう。\n"},\
        {"text":"  アイテムを手に持って "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで使用できる。\n"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 260.. run scoreboard players set @s Mns.General.DummyCounter -1
