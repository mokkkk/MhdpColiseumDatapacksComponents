#> mhdp_monster_tutorial_01:core/tick/05_monster_attack
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの行動開始
    execute if score @s Mns.General.DummyTimer matches 200 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"1/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターの攻撃は威力が高く、非常に危険です。\n","color": "#00FFC3","bold": false},\
        {"text":"  攻撃を受けると","color": "#00FFC3","bold": false},{"text":"吹き飛ばされ、しばらく武器が使えなくなります","color": "#ff9900","bold": true},{"text": " 。\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターが攻撃してきそうな予兆を見せた場合、\n","color": "#00FFC3","bold": false},\
        {"text":"  武器を納刀し、モンスターから離れて攻撃を回避しましょう。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"2/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターは、攻撃後に隙が生じます。\n","color": "#00FFC3","bold": false},\
        {"text":"  無理に攻めずに、少し離れてモンスターの動きを見ながら、\n","color": "#00FFC3","bold": false},\
        {"text":"  攻撃後の隙を狙うようにすると、安全に戦うことができます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"3/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  もし攻撃を受けて、ダメージを負ってしまった場合は、\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"回復薬","color": "#ff9900","bold": true},{"text": " で体力を回復しましょう。\n","color": "#00FFC3","bold": false},\
        {"text": "  回復薬を選択し、マウス","color": "#00FFC3","bold": false},{"keybind":"key.use","color": "#00FFC3","bold": false},{"text":" を長押しすることで使用できます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 660 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 660 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"4/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  また、モンスターは ","color": "#00FFC3","bold": false},{"text":"咆哮や風圧","color": "#ff9900","bold": true},{"text": " を使うことがあります。\n","color": "#00FFC3","bold": false},\
        {"text":"  咆哮を受けると、 ","color": "#00FFC3","bold": false},{"text":"しばらく移動できなくなります","color": "#ff9900","bold": true},{"text": " 。\n","color": "#00FFC3","bold": false},\
        {"text":"  風圧を受けると、 ","color": "#00FFC3","bold": false},{"text":"モンスターから離れるように飛ばされます","color": "#ff9900","bold": true},{"text": " 。\n","color": "#00FFC3","bold": false},\
        {"text":"  どちらもダメージはありませんが、できる限り回避するようにしましょう。\n","color": "#00FFC3","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"青鳥竜の攻撃を耐える：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players reset $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text

# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 60
    # チュートリアル完了：回避
        scoreboard players add @s MhdpCore 1
        execute if score @s MhdpCore matches 20.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
        execute if score @s MhdpCore matches 20.. run scoreboard players set @s MhdpCore 0
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"青鳥竜の攻撃を耐える：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}
    tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsDamage

# 遷移：攻撃後
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 800.. run function mhdp_monster_tutorial_01:core/tick/change_phase
