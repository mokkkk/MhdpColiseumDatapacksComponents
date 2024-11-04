#> mhdp_monster_tutorial_02:core/tick/02_attack/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 200 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1

    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest,tag=Ply.Weapon.Equip.ShortSword] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：攻撃 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀中に "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで、攻撃する。\n"},\
        {"text":"  片手剣・地ノ型の場合、\n  長押しすることで最大5回まで自動で攻撃する。\n"}\
    ]
    execute if score @s Mns.General.DummyTimer matches 200 run tellraw @a[tag=Ply.State.PlayingQuest,tag=Ply.Weapon.Equip.ShortSword] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：攻撃 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"スニークしながらマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで、\n  より強力な攻撃ができる。\n"},\
        {"text":"  片手剣・地ノ型の場合、\n  長押しし続けると、最大9回まで自動で攻撃する。\n"},\
        {"text":"  攻撃の隙が大きいので、モンスターの転倒時などのチャンスに狙おう。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest,tag=Ply.Weapon.Equip.GreatSword] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：攻撃 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀中に "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで、攻撃する。\n"},\
        {"text":"  大剣・地ノ型の場合、\n  長押しして力を溜め、離すことで攻撃する。\n"}\
    ]
    execute if score @s Mns.General.DummyTimer matches 200 run tellraw @a[tag=Ply.State.PlayingQuest,tag=Ply.Weapon.Equip.GreatSword] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：攻撃 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"スニークしながらマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで、\n  より強力な攻撃ができる。\n"},\
        {"text":"  大剣・地ノ型の場合、\n  長押しして力を溜めた後、離すことで強力な攻撃ができる。\n"},\
        {"text":"  攻撃の隙が大きいので、モンスターの転倒時などのチャンスに狙おう。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest,tag=Ply.Weapon.Equip.Bow] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：攻撃 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀中に "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで、攻撃する。\n"},\
        {"text":"  弓・地ノ型の場合、\n  長押しして力を溜め、離すことで矢を発射して攻撃する。\n"}\
    ]
    execute if score @s Mns.General.DummyTimer matches 200 run tellraw @a[tag=Ply.State.PlayingQuest,tag=Ply.Weapon.Equip.Bow] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：攻撃 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"スニークしながらマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで、\n  より強力な攻撃ができる。\n"},\
        {"text":"  弓・地ノ型の場合、\n  長押しして力を溜めた後、離すことで強力な射撃を行える。\n"},\
        {"text":"  攻撃の隙が大きいので、モンスターの転倒時などのチャンスに狙おう。\n"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 250.. run scoreboard players set @s Mns.General.DummyCounter -1
