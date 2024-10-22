#> mhdp_monster_tutorial_01:core/tick/03_weapon_base_drawing
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル用タグ付与
    execute if score @s Mns.General.DummyTimer matches 2 run tag @a[tag=Ply.State.PlayingQuest] add Ply.Temp.Tutorial.DrawAttack

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：武器の操作 基本編 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀中に ","color": "#00FFC3","bold": false},{"keybind":"key.swapOffhand","color": "#ff9900","bold": true},{"text":"キー","color": "#ff9900","bold": true},{"text":" を押すか、\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"マウスホイール","color": "#ff9900","bold": true},{"text":" などで別のアイテムを選択することで、\n","color": "#00FFC3","bold": false},\
        {"text":"  武器を納刀します。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：武器の操作 基本編 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  また、ホットバーで空欄を選択した状態で ","color": "#00FFC3","bold": false},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" を押すと、\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"抜刀攻撃","color": "#ff9900","bold": true},{"text":" ができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  抜刀しながら、即座に攻撃することができます。\n","color": "#00FFC3","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"武器を納刀する：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text {"text":"抜刀攻撃をする：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text styled {"color":"green"}

# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text 1
    # チュートリアル完了：納刀
        execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. if entity @a[tag=Ply.State.PlayingQuest,tag=!Ply.Weapon.Drawing] run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"武器を納刀する：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}
    # チュートリアル完了：抜刀攻撃
        execute if score $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text matches 0.. if entity @a[tag=Ply.State.PlayingQuest,tag=!Ply.Temp.Tutorial.DrawAttack] run scoreboard players remove $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text {"text":"抜刀攻撃をする：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}

# 遷移：時間
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 300.. run function mhdp_monster_tutorial_01:core/tick/change_phase
