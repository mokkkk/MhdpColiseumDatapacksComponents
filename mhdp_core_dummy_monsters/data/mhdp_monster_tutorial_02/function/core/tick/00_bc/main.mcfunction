#> mhdp_monster_tutorial_02:core/tick/00_bc/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：ベースキャンプ ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  クエストに出発すると "},{"text":"ベースキャンプ","color": "#ff9900","bold": true},{"text":" に移動する。\n"},\
        {"text":"  前に見える洞窟に進み、モンスターのいるフィールドに移動しよう。\n"},\
        {"text":"  フィールドに移動すると "},{"text":"制限時間の経過が始まる","color": "#ff9900","bold": true},{"text":" 。\n"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 60.. run scoreboard players set @s Mns.General.DummyCounter -1
