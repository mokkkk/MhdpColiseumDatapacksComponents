#> mhdp_monster_tutorial_01:core/tick/06_monster_attack_guard
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターの行動開始
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：ガード ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  片手剣や大剣など、一部の武器は ","color": "#00FFC3","bold": false},{"text":"ガード","color": "#ff9900","bold": true},{"text": " ができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  抜刀中に ","color": "#00FFC3","bold": false},{"text":"スニーク","color": "#ff9900","bold": true},{"text": " すると、武器や盾を構えてガードの姿勢を取ります。\n","color": "#00FFC3","bold": false},\
        {"text":"  または、納刀中にホットバーの空欄を選択しながらスニークすると、\n","color": "#00FFC3","bold": false},\
        {"text":"  抜刀すると同時にガードすることができます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：ガード ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ガード中に攻撃を受けると、 ","color": "#00FFC3","bold": false},{"text":"スタミナや斬れ味を消費して\n","color": "#ff9900","bold": true},\
        {"text":"  受けるダメージを軽減します。\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"完全にダメージを無効化することはできない","color": "#ff9900","bold": true},{"text": " ので注意してください。\n","color": "#00FFC3","bold": false},\
        {"text":"  なお、スタミナが足りない場合、ガードは失敗します。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：攻撃後
    # execute if score @s Mns.General.DummyTimer matches 400.. run function mhdp_monster_tutorial_01:core/tick/change_phase
