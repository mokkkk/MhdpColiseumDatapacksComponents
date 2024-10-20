#> mhdp_monster_tutorial_01:core/tick/05_monster_attack
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル用タグ付与
    execute if score @s Mns.General.DummyTimer matches 60 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsDamage

# モンスターの行動開始
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターの攻撃は威力が高く、非常に危険です。\n","color": "#00FFC3","bold": false},\
        {"text":"  攻撃を受けると吹き飛ばされ、しばらく武器が使えなくなります。\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターが攻撃してきそうな予兆を見せた場合、\n","color": "#00FFC3","bold": false},\
        {"text":"  武器を納刀し、モンスターから離れて攻撃を回避しましょう。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターは、攻撃後に隙が生じます。\n","color": "#00FFC3","bold": false},\
        {"text":"  無理に攻めずに、少し離れてモンスターの動きを見ながら、\n","color": "#00FFC3","bold": false},\
        {"text":"  攻撃後の隙を狙うようにすると、安全に戦うことができます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：モンスターの攻撃 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  もし攻撃を受けて、ダメージを負ってしまった場合は、\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"回復薬","color": "#ff9900","bold": true},{"text": " で体力を回復しましょう。\n","color": "#00FFC3","bold": false},\
        {"text": "  回復薬を選択し、マウス","color": "#00FFC3","bold": false},{"keybind":"key.use","color": "#00FFC3","bold": false},{"text":" を長押しすることで使用できます。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：攻撃後
    execute if entity @n[tag=Mns.Root.Ranposu,tag=!Mns.State.Tutorial.IsDamage] if score @s Mns.General.DummyTimer matches 600.. run function mhdp_monster_tutorial_01:core/tick/change_phase
