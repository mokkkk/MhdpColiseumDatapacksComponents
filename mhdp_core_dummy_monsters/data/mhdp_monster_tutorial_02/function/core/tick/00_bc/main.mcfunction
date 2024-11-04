#> mhdp_monster_tutorial_02:core/tick/00_bc/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：ベースキャンプ ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  クエストに出発すると "},{"text":"ベースキャンプ","color": "#ff9900","bold": true},{"text":" に移動する。\n"},\
        {"text":"  前の洞窟から、モンスターのいるフィールドに移動できる。\n"}\
    ]

# 終了