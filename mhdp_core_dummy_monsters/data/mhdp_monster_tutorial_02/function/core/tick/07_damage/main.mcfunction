#> mhdp_monster_tutorial_02:core/tick/07_damage/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：怯み ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  同じ部位を攻撃し続けると、モンスターが "},{"text":"怯んで","color": "#ff9900","bold": true},{"text":" 隙が生まれる。\n"},\
        {"text":"  攻撃の狙いを定めて、有利に戦おう。\n"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 260.. run scoreboard players set @s Mns.General.DummyCounter -1
