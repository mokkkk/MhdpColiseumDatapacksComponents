#> mhdp_monster_tutorial_01:core/tick/11_item
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの行動停止
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"1/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  アイテムには、 ","color": "#00FFC3","bold": false},{"text":"消費アイテム","color": "#ff9900","bold": true},{"text":" と ","color": "#00FFC3","bold": false},{"text":"特殊装具","color": "#ff9900","bold": true},{"text": " があります。\n","color": "#00FFC3","bold": false},\
        {"text":"  アイテムの効果は、説明文に書かれています。\n","color": "#00FFC3","bold": false},\
        {"text":"  回復薬などの消費アイテムは使用すると無くなるので、\n","color": "#00FFC3","bold": false},\
        {"text":"  クエスト中に使える回数には限りがあります。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"2/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  特殊装具は使ってもなくなりませんが、\n  ","color": "#00FFC3","bold": false},{"text":"クールタイム","color": "#ff9900","bold": true},{"text":" があり、連続では使用できません。\n","color": "#00FFC3","bold": false},\
        {"text":"  クールタイムは、スタミナの上部に表示されています。\n","color": "#00FFC3","bold": false},\
        {"text":"  アイテムのアイコンが灰色の間は使用できません。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"3/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  特殊装具は、それぞれユニークな効果を持っています。\n","color": "#00FFC3","bold": false},\
        {"text":"  例えば ","color": "#00FFC3","bold": false},{"text":"不動の装衣","color": "#ff9900","bold": true},{"text":" の使用中は、攻撃を受けても怯まなくなります。\n","color": "#00FFC3","bold": false},\
        {"text":"  使用中は、アイテムアイコンが黄色く光ります。\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターの攻撃を無視できるため、強攻撃を当てやすくなります。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 660 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 660 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"4/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"翔蟲","color": "#ff9900","bold": true},{"text":" を使うと、正面方向に高速移動できます。\n","color": "#00FFC3","bold": false},\
        {"text":"  空を飛んでモンスターの攻撃を回避することもできます。\n","color": "#00FFC3","bold": false},\
        {"text":"  さらに、翔蟲による移動中に","color": "#00FFC3","bold": false},{"text":"抜刀攻撃","color": "#00FFC3","bold": false},{"text":" をすると、\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"鉄蟲糸技","color": "#ff9900","bold": true},{"text":" という特殊な攻撃を行うことができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  ホットバーは、翔蟲の隣を空欄にしておき、\n  抜刀攻撃を出しやすくすると良いでしょう。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：一定時間後
    execute if score @s Mns.General.DummyTimer matches 800.. run function mhdp_monster_tutorial_01:core/tick/change_phase
