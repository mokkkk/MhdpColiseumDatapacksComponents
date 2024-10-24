#> mhdp_monster_tutorial_01:core/tick/09_monster_break
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル用タグ付与
    execute if score @s Mns.General.DummyTimer matches 10 run tag @a[tag=Ply.State.PlayingQuest] remove Ply.Temp.Tutorial.Avoid
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsBroken

# モンスターの行動停止
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsNotMove
    execute if score @s Mns.General.DummyTimer matches 400 run scoreboard players set @n[tag=Mns.Root.Ranposu] Mns.Anger.Damage 1

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：怯み ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  同じ部位に攻撃し続けると、モンスターが ","color": "#00FFC3","bold": false},{"text":"怯み、隙が生じます","color": "#ff9900","bold": true},{"text": " 。\n","color": "#00FFC3","bold": false},\
        {"text":"  部位によっては ","color": "#00FFC3","bold": false},{"text":"部位破壊","color": "#ff9900","bold": true},{"text": " が発生します。\n","color": "#00FFC3","bold": false},\
        {"text":"  部位破壊すると、貰える報酬が増えたり、\n  モンスターの攻撃が弱体化することがあります。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：怯み ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  怯みの動作は、部位によって異なります。\n","color": "#00FFC3","bold": false},\
        {"text":"  例えば、足に攻撃し続けると ","color": "#00FFC3","bold": false},{"text":"モンスターが転倒する","color": "#ff9900","bold": true},{"text": " ことがあります。\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターによって有効な部位は異なるので、\n  戦う相手によって狙う部位を変えましょう。\n","color": "#00FFC3","bold": false}\
    ]

# スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"部位破壊についての説明を聞く","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text blank

# 遷移：怒り状態移行後
    execute if score @s Mns.General.DummyTimer matches 400 as @n[tag=Mns.Root.Ranposu] at @s run function mhdp_monster_ranposu:core/tick/animation/change/interrupt_anger
    execute if entity @n[tag=Mns.Root.Ranposu,tag=Mns.State.IsAnger] if score @s Mns.General.DummyTimer matches 400.. run function mhdp_monster_tutorial_01:core/tick/change_phase
