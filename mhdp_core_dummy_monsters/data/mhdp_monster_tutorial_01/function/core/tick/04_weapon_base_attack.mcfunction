#> mhdp_monster_tutorial_01:core/tick/04_weapon_base_attack
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル用タグ付与
    execute if score @s Mns.General.DummyTimer matches 2 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsDamage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"1/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀中に "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" を押すか、\n"},\
        {"text":"  モンスターに近づいて "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.attack","color": "#ff9900","bold": true},{"text":" で攻撃ができます。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"2/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text": "  "},{"text":"地ノ型","color": "#ff9900","bold": true},{"text": " の場合、スニークせずに マウス"},{"keybind":"key.use"},{"text":" を長押しすることで、\n"},\
        {"text":"  隙の少ない通常攻撃を出すことができます。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 610 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 610 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"3/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  大剣や弓など、一部の武器は溜め攻撃を使うことができます。\n"},\
        {"text":"  マウス"},{"keybind":"key.use"},{"text":" を長押ししたあと、\n"},\
        {"text":"  ボタンを離したときに攻撃します。\n"},\
        {"text":"  基本的に、長時間溜めるほど攻撃の威力が高くなります。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 960 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 960 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：武器の操作 攻撃 ","color":"#00FFC3","bold": true},{"text":"4/4","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  スニークしながら マウス"},{"keybind":"key.use"},{"text":" を長押しすることで、\n"},\
        {"text":"  隙が大きい代わりに威力が高い "},{"text":"強攻撃","color": "#ff9900","bold": true},{"text":" を出すことができます。\n"},\
        {"text":"  モンスターの転倒時など、大きな隙を狙って強攻撃を当てましょう。\n"}\
    ]

# 初期スコア表示
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"モンスターに攻撃を当てる：残り","color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text styled {"color":"green"}
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players reset $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text

# スコア設定
    execute if score @s Mns.General.DummyTimer matches 2 run scoreboard players set $mhdp_temp_tutorial_value Mns.Tutorial.Text 15
    # チュートリアル完了：攻撃
        execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0.. if entity @n[tag=Mns.Root.Ranposu,tag=!Mns.State.Tutorial.IsDamage] run scoreboard players remove $mhdp_temp_tutorial_value Mns.Tutorial.Text 1
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display name $mhdp_temp_tutorial_value Mns.Tutorial.Text {"text":"モンスターに攻撃を当てる：","color":"green"}
        execute if score @s Mns.General.DummyTimer matches 3.. if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches 0 run scoreboard players display numberformat $mhdp_temp_tutorial_value Mns.Tutorial.Text fixed {"text":"OK!","color":"green"}
    tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsDamage

# 遷移：攻撃後
    execute if score $mhdp_temp_tutorial_value Mns.Tutorial.Text matches ..0 \
            if score @s Mns.General.DummyTimer matches 1100.. run function mhdp_monster_tutorial_01:core/tick/change_phase
