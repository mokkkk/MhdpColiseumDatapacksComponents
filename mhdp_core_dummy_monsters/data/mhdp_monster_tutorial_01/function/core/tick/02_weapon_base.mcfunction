#> mhdp_monster_tutorial_01:core/tick/02_weapon_base
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：武器の操作 基本編 ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ホットバーで、空欄のアイテムを選択した状態で "},{"keybind":"key.swapOffhand","color": "#ff9900","bold": true},{"text":"キー","color": "#ff9900","bold": true},{"text":" を押すと、\n"},\
        {"text":"  武器の抜刀ができます。\n"}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"武器を抜刀する：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
    execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. if entity @a[tag=Ply.State.PlayingQuest,tag=Ply.Weapon.Drawing] run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
    # チュートリアル完了
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"武器を抜刀する：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}

# 遷移：武器抜刀後
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 150.. run function mhdp_monster_tutorial_01:core/tick/change_phase
