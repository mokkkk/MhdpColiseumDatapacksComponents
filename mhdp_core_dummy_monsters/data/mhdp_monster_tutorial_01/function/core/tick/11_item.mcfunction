#> mhdp_monster_tutorial_01:core/tick/11_item
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの行動停止
    execute if score @s Mns.General.DummyTimer matches 2 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsNotMove
    execute if score @s Mns.General.DummyTimer matches 2 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsDisablePartDamage
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set @n[tag=Mns.Root.Ranposu] Mns.Anger.Timer 1

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"1/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  アイテムには、 "},{"text":"消費アイテム","color": "#ff9900","bold": true},{"text":" と "},{"text":"特殊装具","color": "#ff9900","bold": true},{"text": " があります。\n"},\
        {"text":"  アイテムの効果は、説明文に書かれています。\n"},\
        {"text":"  回復薬などの消費アイテムは使用すると無くなるので、\n"},\
        {"text":"  クエスト中に使える回数には限りがあります。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"2/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  特殊装具は使ってもなくなりませんが、\n  "},{"text":"クールタイム","color": "#ff9900","bold": true},{"text":" があり、連続では使用できません。\n"},\
        {"text":"  クールタイムは、スタミナの上部に表示されています。\n"},\
        {"text":"  アイテムのアイコンが灰色の間は使用できません。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"3/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  特殊装具は、それぞれユニークな効果を持っています。\n"},\
        {"text":"  例えば "},{"text":"不動の装衣","color": "#ff9900","bold": true},{"text":" の使用中は、攻撃を受けても怯まなくなります。\n"},\
        {"text":"  使用中は、アイテムアイコンが黄色く光ります。\n"},\
        {"text":"  モンスターの攻撃を無視できるため、強攻撃を当てやすくなります。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 660 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 660 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：アイテム ","color":"#00FFC3","bold": true},{"text":"4/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"翔蟲","color": "#ff9900","bold": true},{"text":" を使うと、正面方向に高速移動できます。\n"},\
        {"text":"  空を飛んでモンスターの攻撃を回避することもできます。\n"},\
        {"text":"  さらに、翔蟲による移動中に"},{"text":"抜刀攻撃"},{"text":" をすると、\n"},\
        {"text":"  "},{"text":"鉄蟲糸技","color": "#ff9900","bold": true},{"text":" という特殊な攻撃を行うことができます。\n"},\
        {"text":"  片手剣や大剣の鉄蟲糸技は、\n  移動中の抜刀攻撃をモンスターに当てることで発動します。\n"},\
        {"text":"  翔蟲の隣のアイテム欄は空にしておくのがおすすめです。\n"}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"不動の装衣を使用する：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text {"text":"翔蟲を使用する：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text {"text":"翔蟲の鉄蟲糸技を使用する：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text styled {"color":"green"}

# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text 1
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text 1
    # チュートリアル完了：不動の装衣
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. if entity @a[tag=Ply.State.PlayingQuest,tag=Itm.Sp.ImmovableCloth.Using] run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"不動の装衣を使用する：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}
    # チュートリアル完了：翔蟲
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text matches 0.. if entity @a[tag=Ply.State.PlayingQuest,tag=Itm.Sp.Wirebug.Using] run scoreboard players remove $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text {"text":"翔蟲を使用する：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}
    # チュートリアル完了：鉄蟲糸技
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text matches 0.. if entity @a[tag=Ply.State.PlayingQuest,tag=Itm.Sp.Wirebug.UsedSkill] run scoreboard players remove $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text {"text":"翔蟲の鉄蟲糸技を使用する：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}

# 遷移：時間
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text matches ..0 \
            if score $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 800.. run function mhdp_monster_tutorial_01:core/tick/change_phase
