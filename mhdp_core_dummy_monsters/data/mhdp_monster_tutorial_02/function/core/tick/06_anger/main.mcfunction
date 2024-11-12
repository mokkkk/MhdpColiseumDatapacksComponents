#> mhdp_monster_tutorial_02:core/tick/01_draw/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：怒り状態 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"\uE001","font":"minecraft:ui/monster_hp","color": "white","bold": false},{"text":" 怒り状態","color": "#ff9900","bold": true},{"text":" のモンスターは非常に危険だ。\n"},\
        {"text":"  もし攻撃するのが厳しいなら、回避に徹するのも良いだろう。\n"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 260.. run scoreboard players set @s Mns.General.DummyCounter -1
