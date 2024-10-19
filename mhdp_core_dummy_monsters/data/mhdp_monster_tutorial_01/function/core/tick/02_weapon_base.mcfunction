#> mhdp_monster_tutorial_01:core/tick/02_weapon_base
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：武器の操作 基本編 ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ホットバーで、空欄のアイテムを選択した状態で ","color": "#00FFC3","bold": false},{"keybind":"key.swapOffhand","color": "#ff9900","bold": true},{"text":"キー","color": "#ff9900","bold": true},{"text":" を押すと、\n","color": "#00FFC3","bold": false},\
        {"text":"  武器の抜刀ができます。\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：武器抜刀後
    execute if entity @a[tag=Ply.Weapon.Drawing] if score @s Mns.General.DummyTimer matches 60.. run function mhdp_monster_tutorial_01:core/tick/change_phase
