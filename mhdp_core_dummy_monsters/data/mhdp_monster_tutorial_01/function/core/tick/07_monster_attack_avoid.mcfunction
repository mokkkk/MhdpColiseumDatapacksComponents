#> mhdp_monster_tutorial_01:core/tick/07_monster_attack_avoid
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル用タグ付与
    execute if score @s Mns.General.DummyTimer matches 2 run tag @a[tag=Ply.State.PlayingQuest] add Ply.Temp.Tutorial.Avoid

# モンスターの行動開始
    execute if score @s Mns.General.DummyTimer matches 260 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：回避 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"ダッシュジャンプ","color": "#ff9900","bold": true},{"text": " の出始めには、無敵時間があります。\n"},\
        {"text":"  その間にモンスターの攻撃に当たると "},{"text":"ジャンプ回避","color": "#ff9900","bold": true},{"text": " が発動します。\n"},\
        {"text":"  武器の攻撃中はジャンプできないため、\n  攻撃の手を止めるか、納刀する必要があります。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：回避 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  無敵時間は短いため、成功させるのは難しいですが、\n"},\
        {"text":"  成功すると "},{"text":"ダメージとノックバックを完全に無効化","color": "#ff9900","bold": true},{"text": " できます。\n"},\
        {"text":"  また、攻撃の他にも、咆哮や風圧によるノックバックも無効化できます。\n"}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"ジャンプ回避でモンスターの攻撃を避ける：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players reset $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text

# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
    # チュートリアル完了：ジャンプ回避
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. if entity @a[tag=Ply.State.PlayingQuest,tag=!Ply.Temp.Tutorial.Avoid] run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"ジャンプ回避でモンスターの攻撃を避ける：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}

# 遷移：回避成功後、または一定時間後
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 400.. run function mhdp_monster_tutorial_01:core/tick/change_phase
    execute if score @s Mns.General.DummyTimer matches 3600.. run function mhdp_monster_tutorial_01:core/tick/change_phase
