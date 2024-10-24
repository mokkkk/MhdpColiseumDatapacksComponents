#> mhdp_monster_tutorial_01:core/tick/11_item
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの状態をデフォルトにする
    execute if score @s Mns.General.DummyTimer matches 150 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove
    execute if score @s Mns.General.DummyTimer matches 150 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsDisablePartDamage
    execute if score @s Mns.General.DummyTimer matches 150 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsDisableDamage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：狩猟 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  それでは、これまでの知識を活かして、\n","color": "#00FFC3","bold": false},\
        {"text":"  実際にモンスターと戦ってみましょう。\n","color": "#00FFC3","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"青鳥竜を討伐する：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players reset $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players reset $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text

# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
    # チュートリアル完了：攻撃
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. if entity @n[tag=Mns.Root.Ranposu,tag=Mns.State.Death] run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"青鳥竜を討伐する：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}
    tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsDamage

# 遷移：討伐後
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 60.. run function mhdp_monster_tutorial_01:core/tick/change_phase
