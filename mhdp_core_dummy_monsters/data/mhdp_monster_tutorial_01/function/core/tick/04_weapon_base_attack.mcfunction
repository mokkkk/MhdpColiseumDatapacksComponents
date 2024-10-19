#> mhdp_monster_tutorial_01:core/tick/04_weapon_base_attack
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル用タグ付与
    execute if score @s Mns.General.DummyTimer matches 60 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsDamage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"1/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀中に ","color": "#00FFC3","bold": false},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" を押すか、\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターに近づいて ","color": "#00FFC3","bold": false},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.attack","color": "#ff9900","bold": true},{"text":" で攻撃ができます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"2/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text": "  ","color": "#00FFC3","bold": false},{"text":"地の型","color": "#ff9900","bold": true},{"text": " の場合、スニークせずに マウス","color": "#00FFC3","bold": false},{"keybind":"key.use","color": "#00FFC3","bold": false},{"text":" を長押しすることで、\n","color": "#00FFC3","bold": false},\
        {"text":"  隙の少ない通常攻撃を出すことができます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"3/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  スニークしながら マウス","color": "#00FFC3","bold": false},{"keybind":"key.use","color": "#00FFC3","bold": false},{"text":" を長押しすることで、\n","color": "#00FFC3","bold": false},\
        {"text":"  隙が大きい代わりに威力が高い ","color": "#00FFC3","bold": false},{"text":"強攻撃","color": "#ff9900","bold": true},{"text":" を出すことができます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 660 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 660 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"4/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  大剣や弓など、一部の武器は溜め攻撃を使うことができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  マウス","color": "#00FFC3","bold": false},{"keybind":"key.use","color": "#00FFC3","bold": false},{"text":" を長押ししたあと、\n","color": "#00FFC3","bold": false},\
        {"text":"  ボタンを離したときに攻撃します。\n","color": "#00FFC3","bold": false},\
        {"text":"  基本的に、長時間溜めるほど攻撃の威力が高くなります。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：攻撃後
    # execute if entity @n[tag=Mns.Root.Ranposu,tag=!Mns.State.Tutorial.IsDamage] if score @s Mns.General.DummyTimer matches 860.. run function mhdp_monster_tutorial_01:core/tick/change_phase
