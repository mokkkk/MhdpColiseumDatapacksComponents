#> mhdp_monster_tutorial_01:core/tick/0_bc/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの行動無効、無敵化
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsNotMove
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsDisableDamage
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsDisablePartDamage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：ベースキャンプ ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ここは ","color": "#00FFC3","bold": false},{"text":"ベースキャンプ","color": "#ff9900","bold": true},{"text":" です。\n","color": "#00FFC3","bold": false},\
        {"text":"  クエストに出発すると、まずベースキャンプに移動します。\n","color": "#00FFC3","bold": false},\
        {"text":"  クエスト開始直後、ベースキャンプからフィールドに移動するまでは\n","color": "#00FFC3","bold": false},\
        {"text":"  時間が経過しません","color": "#ff9900","bold": true},{"text":"。\n","color": "#00FFC3","bold": false},\
        {"text":"  アイテムを整理し、狩りの準備を整えましょう。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：ベースキャンプ ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  先にある洞窟に進むと、モンスターのいるフィールドに移動します。\n","color": "#00FFC3","bold": false},\
        {"text":"  武器を使うためには、ホットバーに空きスロットが必要です。\n","color": "#00FFC3","bold": false},\
        {"text":"  1つ以上の空きスロットを作ってから移動してください","color": "#ff9900","bold": true},{"text":"。\n","color": "#00FFC3","bold": false}\
    ]


# 遷移：誰かがフィールドに移動した時
    execute if entity @a[tag=Ply.State.PlayingQuest,tag=Ply.State.MnsTarget] if score @s Mns.General.DummyTimer matches 260.. run function mhdp_monster_tutorial_01:core/tick/change_phase
