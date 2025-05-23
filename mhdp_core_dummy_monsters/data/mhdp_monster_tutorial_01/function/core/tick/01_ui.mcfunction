#> mhdp_monster_tutorial_01:core/tick/01_ui
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：画面表示・斬れ味 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"3","color": "white","font":"ui/sharpness"},\
        {"text":"\n  これは "},{"text":"斬れ味ゲージ","color": "#ff9900","bold": true},{"text":" です。\n"},\
        {"text":"  弓以外の武器を持っている場合、表示されます。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：画面表示・斬れ味 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターに攻撃をする際、斬れ味を消費します。\n"},\
        {"text":"  武器の斬れ味が下がると、"},{"text":" 黄 ","color": "yellow","bold": true},{"text":"橙 ","color": "#FF8000","bold": true},{"text":"赤 ","color": "red","bold": true},{"text":"…のように、色が変わっていきます。\n"},\
        {"text":"  斬れ味が悪いと、"},{"text":"モンスターへのダメージが大きく減少します","color": "#ff9900","bold": true},{"text":"。\n"},\
        {"text":"  研石を使うと、斬れ味を回復することができます。\n"},\
        {"text":"  隙を見て砥石を使い、高い斬れ味を保ちましょう。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：画面表示・スタミナ ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n","color":"#00FFC3","bold": true},\
            {"text":"  ","bold": false},\
            {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
            {"text": "\uF801","font": "space","bold": false},\
            {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
            {"text": "\uF801","font": "space","bold": false},\
            {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
            {"text": "\uF801","font": "space","bold": false},\
            {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
            {"text": "\uF801","font": "space","bold": false},\
            {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
            {"text": "\uF801","font": "space","bold": false},\
            {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
            {"text": "\uF801","font": "space","bold": false},\
            {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
            {"text": "\uF801","font": "space","bold": false},\
            {"text":"#","font":"ui/tutorial/stamina","color":"white","bold": false},\
            {"text": "\uF801","font": "space","bold": false},\
            {"text": "\uF801","font": "space","bold": false},{"text":"\uF813\uF801","font": "space","bold": false},{"text":"_","font":"ui/tutorial/stamina","color":"white","bold": false},\
        {"text":"\n\n  これは "},{"text":"スタミナゲージ","color": "#ff9900","bold": true},{"text":" です。\n"}\
    ]
    
    execute if score @s Mns.General.DummyTimer matches 660 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 660 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：画面表示・スタミナ ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ジャンプやダッシュなどの行動をとると、スタミナを消費します。\n"},\
        {"text":"  スタミナが尽きると、"},{"text":"ジャンプおよびダッシュができなくなります","color": "#ff9900","bold": true},{"text":"。\n"},\
        {"text":"  スタミナは時間で自然に回復します。\n"},\
        {"text":"  スタミナが減ったら攻撃の手を止め、回復に専念しましょう。\n"}\
    ]

# スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"UIについての説明を聞く","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text blank

# 遷移：一定時間経過後
    execute if score @s Mns.General.DummyTimer matches 800.. run function mhdp_monster_tutorial_01:core/tick/change_phase
