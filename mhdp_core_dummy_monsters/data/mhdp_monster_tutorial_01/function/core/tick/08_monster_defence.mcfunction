#> mhdp_monster_tutorial_01:core/tick/08_monster_defence
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル用タグ付与
    execute if score @s Mns.General.DummyTimer matches 2 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsBroken

# モンスターの行動停止
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsNotMove
    execute if score @s Mns.General.DummyTimer matches 260 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsDisablePartDamage
    execute if score @s Mns.General.DummyTimer matches 260 run scoreboard players set @n[tag=Mns.Root.Ranposu] Mns.Anger.Damage 99999999

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：部位 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  モンスターには、","color": "#00FFC3","bold": false},{"text":"部位","color": "#ff9900","bold": true},{"text": " が存在します。\n","color": "#00FFC3","bold": false},\
        {"text":"  部位によって ","color": "#00FFC3","bold": false},{"text":"有効な属性や攻撃種別が異なります","color": "#ff9900","bold": true},{"text": " 。\n","color": "#00FFC3","bold": false},\
        {"text":"  例えば青鳥竜の場合、胴体よりも頭の方がダメージを与えやすいです。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：部位 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  また、同じ部位を狙うことで、有利に戦えます。\n","color": "#00FFC3","bold": false},\
        {"text":"  試しに、青鳥竜の頭を攻撃し続けてください。\n","color": "#00FFC3","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"青鳥竜の頭を攻撃する：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players reset $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text

# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
    # チュートリアル完了：ジャンプ回避
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. if entity @n[tag=Mns.Root.Ranposu,tag=!Mns.State.Tutorial.IsBroken] run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"青鳥竜の頭を攻撃する：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}

# 遷移：部位破壊成功後、または一定時間後
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 400.. run function mhdp_monster_tutorial_01:core/tick/change_phase
    execute if score @s Mns.General.DummyTimer matches 7200.. run function mhdp_monster_tutorial_01:core/tick/change_phase
