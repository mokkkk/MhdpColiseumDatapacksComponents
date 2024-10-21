#> mhdp_monster_tutorial_01:core/tick/10_monster_anger
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの行動開始
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：怒り状態 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ある程度ダメージを与えると、モンスターが ","color": "#00FFC3","bold": false},{"text":"怒り状態","color": "#ff9900","bold": true},{"text": " になります。\n","color": "#00FFC3","bold": false},\
        {"text":"  怒り状態のモンスターのHPバーには ","color": "#00FFC3","bold": false},{"text":"\uE001","font":"minecraft:ui/monster_hp","color": "white","bold": false},{"text":" のようなアイコンが出ます。\n","color": "#00FFC3","bold": false},\
        {"text":"  怒ったモンスターは、","color": "#00FFC3","bold": false},{"text":"攻撃力と行動速度","color": "#ff9900","bold": true},{"text": " が上昇します。\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターによっては、怒り状態専用の行動をとることがあります。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：怒り状態 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  行動速度が上がるため、隙も少なく、とても危険な状態です。\n","color": "#00FFC3","bold": false},\
        {"text":"  慣れないうちは、攻撃の回避に徹することも重要です。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：一定時間後
    execute if score @s Mns.General.DummyTimer matches 400.. run function mhdp_monster_tutorial_01:core/tick/change_phase
