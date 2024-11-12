#> mhdp_monster_tutorial_01:core/tick/13_end
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モンスターを消えなくする
    scoreboard players set @n[tag=Mns.Root.Ranposu] Mns.General.RemoveTimer 1

# メッセージ
    execute if score @s Mns.General.DummyTimer matches 60 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 60 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：剥ぎ取り ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  討伐したモンスターの中央に近づき、"},{"text":"剝ぎ取りナイフ","color": "#ff9900","bold": true},{"text": " を使うと、\n"},\
        {"text":"  モンスターの素材が入手できます。\n"},\
        {"text":"  剝ぎ取りナイフは、部位破壊した尻尾などに対しても使用できます。\n"},\
        {"text":"  剝ぎ取りは、狩人の醍醐味です。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：訓練所 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  拠点にある "},{"text":"訓練所","color": "#ff9900","bold": true},{"text": " では、\n"},\
        {"text":"  より詳しい武器の使い方を学ぶことができます。\n"},\
        {"text":"  地ノ型は操作が簡単ですが、天ノ型の操作は非常に難しいので、\n"},\
        {"text":"  訓練所で試してみると良いでしょう。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：モンスターリスト ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  一度でも戦ったことのあるモンスターは、\n"},\
        {"text":"  拠点に置かれた "},{"text":"モンスターリスト","color": "#ff9900","bold": true},{"text": " で情報を見ることができます。\n"},\
        {"text":"  モンスターの生態や、攻略情報を調べることができます。\n"},\
        {"text":"  青鳥竜の情報が追加されたので、拠点に戻ったら読んでみてください。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 660 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 660 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：最後に ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  これでチュートリアルは終了です。\n"},\
        {"text":"  様々なモンスターの狩猟を楽しんでください。\n"},\
        {"text":"  "},{"text":"お疲れさまでした！","color": "#ff9900","bold": true},{"text": " \n"}\
    ]

# 遷移：一定時間後
    execute if score @s Mns.General.DummyTimer matches 800.. run function mhdp_monster_tutorial_01:core/tick/change_phase
