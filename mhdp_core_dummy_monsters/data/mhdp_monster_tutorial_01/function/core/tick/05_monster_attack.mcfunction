#> mhdp_monster_tutorial_01:core/tick/05_monster_attack
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの行動開始
    execute if score @s Mns.General.DummyTimer matches 750 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"1/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターの攻撃は威力が高く、非常に危険です。\n"},\
        {"text":"  攻撃を受けると"},{"text":"吹き飛ばされ、しばらく武器が使えなくなります","color": "#ff9900","bold": true},{"text": " 。\n"},\
        {"text":"  モンスターが攻撃してきそうな予兆を見せた場合、\n"},\
        {"text":"  武器を納刀し、モンスターから離れて攻撃を回避しましょう。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"2/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターは、攻撃後に隙が生じます。\n"},\
        {"text":"  無理に攻めずに、少し離れてモンスターの動きを見ながら、\n"},\
        {"text":"  攻撃後の隙を狙うようにすると、安全に戦うことができます。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"3/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  もし攻撃を受けて、ダメージを負ってしまった場合は、\n"},\
        {"text":"  "},{"text":"回復薬","color": "#ff9900","bold": true},{"text": " で体力を回復しましょう。\n"},\
        {"text": "  回復薬を選択し、マウス"},{"keybind":"key.use"},{"text":" を長押しすることで使用できます。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 660 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 660 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"4/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  また、モンスターは "},{"text":"咆哮や風圧","color": "#ff9900","bold": true},{"text": " を使うことがあります。\n"},\
        {"text":"  咆哮を受けると、 "},{"text":"しばらく移動できなくなります","color": "#ff9900","bold": true},{"text": " 。\n"},\
        {"text":"  風圧を受けると、 "},{"text":"モンスターから離れるように飛ばされます","color": "#ff9900","bold": true},{"text": " 。\n"},\
        {"text":"  どちらもダメージはありませんが、できる限り回避するようにしましょう。\n"}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"青鳥竜の攻撃を耐える：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players reset $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text

# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 45
    # チュートリアル完了：回避
        execute if score @s Mns.General.DummyTimer matches 750.. run scoreboard players add @s MhdpCore 1
        execute if score @s Mns.General.DummyTimer matches 750.. if score @s MhdpCore matches 20.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 750.. if score @s MhdpCore matches 20.. run scoreboard players set @s MhdpCore 0
        execute if score @s Mns.General.DummyTimer matches 750.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"青鳥竜の攻撃を耐える：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 750.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}

# 遷移：攻撃後
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 800.. run function mhdp_monster_tutorial_01:core/tick/change_phase
