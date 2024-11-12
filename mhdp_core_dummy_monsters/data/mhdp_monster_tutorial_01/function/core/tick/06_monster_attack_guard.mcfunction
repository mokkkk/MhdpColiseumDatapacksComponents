#> mhdp_monster_tutorial_01:core/tick/06_monster_attack_guard
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの行動停止
    execute if score @s Mns.General.DummyTimer matches 2 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：ガード ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  片手剣や大剣など、一部の武器は "},{"text":"ガード","color": "#ff9900","bold": true},{"text": " ができます。\n"},\
        {"text":"  抜刀中に "},{"text":"スニーク","color": "#ff9900","bold": true},{"text": " すると、武器や盾を構えてガードの姿勢を取ります。\n"},\
        {"text":"  または、納刀中にホットバーの空欄を選択しながらスニークすると、\n"},\
        {"text":"  抜刀すると同時にガードすることができます。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：ガード ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ガード中に攻撃を受けると、 "},{"text":"スタミナや斬れ味を消費して\n","color": "#ff9900","bold": true},\
        {"text":"  受けるダメージを軽減します。\n"},\
        {"text":"  "},{"text":"完全にダメージを無効化することはできない","color": "#ff9900","bold": true},{"text": " ので注意してください。\n"},\
        {"text":"  なお、スタミナが足りない場合、ガードは失敗します。\n"}\
    ]

# スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"ガードについての説明を聞く","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text blank

# 遷移：一定時間後
    execute if score @s Mns.General.DummyTimer matches 400.. run function mhdp_monster_tutorial_01:core/tick/change_phase
