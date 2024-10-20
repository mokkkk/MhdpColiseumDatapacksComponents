#> mhdp_monster_tutorial_01:core/tick/05_monster_attack
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# チュートリアル用タグ付与
    execute if score @s Mns.General.DummyTimer matches 60 run tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsDamage

# モンスターの行動開始
    execute if score @s Mns.General.DummyTimer matches 10 run tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsNotMove

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：回避 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"ダッシュジャンプ","color": "#ff9900","bold": true},{"text": " の出始めには、無敵時間があります。\n","color": "#00FFC3","bold": false},\
        {"text":"  無敵時間の間にモンスターの攻撃に当たると、\n","color": "#00FFC3","bold": false},{"text":"ジャンプ回避","color": "#ff9900","bold": true},{"text": " が発動します。\n","color": "#00FFC3","bold": false},\
        {"text":"  武器の攻撃中は無敵時間が付与されないため、攻撃の手を止めるか、納刀する必要があります。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：回避 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  無敵時間は短いため、成功させるのは難しいですが、\n","color": "#00FFC3","bold": false},\
        {"text":"  成功すると ","color": "#00FFC3","bold": false},{"text":"ダメージとノックバックを無効化","color": "#ff9900","bold": true},{"text": " できます。\n","color": "#00FFC3","bold": false},\
        {"text":"  また、攻撃の他にも、咆哮や風圧によるノックバックも無効化できます。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：攻撃後
    # execute if entity @n[tag=Mns.Root.Ranposu,tag=!Mns.State.Tutorial.IsDamage] if score @s Mns.General.DummyTimer matches 860.. run function mhdp_monster_tutorial_01:core/tick/change_phase
