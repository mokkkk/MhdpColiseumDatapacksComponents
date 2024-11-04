#> mhdp_monster_tutorial_02:core/tick/04_stamina/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：スタミナ ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n","color":"#00FFC3","bold": true},\
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
        {"text":"\n\n  "},{"text":"スタミナゲージ","color": "#ff9900","bold": true},{"text":" には気を配ろう。\n"},\
        {"text":"  スタミナがなくなると、ダッシュやジャンプができなくなる。\n"},\
        {"text":"  立ち止まるか、ゆっくり歩いていると回復する。\n"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 260.. run scoreboard players set @s Mns.General.DummyCounter -1
