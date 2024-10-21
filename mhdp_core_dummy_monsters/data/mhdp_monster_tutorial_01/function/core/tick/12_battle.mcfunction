#> mhdp_monster_tutorial_01:core/tick/11_item
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの状態をデフォルトにする
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsDisablePartDamage
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsDisableDamage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：狩猟 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  それでは、これまでの知識を活かして、\n","color": "#00FFC3","bold": false},\
        {"text":"  実際にモンスターと戦ってみましょう。\n","color": "#00FFC3","bold": false}\
    ]


# 遷移：モンスター討伐後
    execute if entity @n[tag=Mns.Root.Ranposu,tag=Mns.State.Death] if score @s Mns.General.DummyTimer matches 60.. run function mhdp_monster_tutorial_01:core/tick/change_phase
