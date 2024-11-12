#> mhdp_monster_tutorial_02:core/tick/05_sharpness/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest,tag=!Ply.Weapon.Equip.Bow] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：画面表示・斬れ味 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"2","color": "white","font":"ui/sharpness"},\
        {"text":"\n  "},{"text":"斬れ味","color": "#ff9900","bold": true},{"text":" が減少した時は "},{"text":"砥石","color": "#ff9900","bold": true},{"text":" を使おう。\n"},\
        {"text":"  アイテムを手に持って "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" で使用できる。\n"},\
        {"text":"  使用には時間がかかるので、モンスターの攻撃に気を付けよう。\n"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 260.. run scoreboard players set @s Mns.General.DummyCounter -1
