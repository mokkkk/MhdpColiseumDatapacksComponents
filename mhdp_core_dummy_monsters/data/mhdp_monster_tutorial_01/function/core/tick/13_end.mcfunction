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
        {"text":"\n【 チュートリアル：剥ぎ取り ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  討伐したモンスターの中央に近づき、","color": "#00FFC3","bold": false},{"text":"剝ぎ取りナイフ","color": "#ff9900","bold": true},{"text": " を使うと、\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターの素材が入手できます。\n","color": "#00FFC3","bold": false},\
        {"text":"  剝ぎ取りナイフは、部位破壊した尻尾などに対しても使用できます。\n","color": "#00FFC3","bold": false},\
        {"text":"  剝ぎ取りは、狩人の醍醐味です。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：訓練所 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  拠点にある ","color": "#00FFC3","bold": false},{"text":"訓練所","color": "#ff9900","bold": true},{"text": " では、\n","color": "#00FFC3","bold": false},\
        {"text":"  より詳しい武器の使い方を学ぶことができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  地ノ型は操作が簡単ですが、天ノ型の操作は非常に難しいので、\n","color": "#00FFC3","bold": false},\
        {"text":"  訓練所で試してみると良いでしょう。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：モンスターリスト ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  一度でも戦ったことのあるモンスターは、\n","color": "#00FFC3","bold": false},\
        {"text":"  拠点に置かれた ","color": "#00FFC3","bold": false},{"text":"モンスターリスト","color": "#ff9900","bold": true},{"text": " で情報を見ることができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターの生態や、攻略情報を調べることができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  青鳥竜の情報が追加されたので、拠点に戻ったら読んでみてください。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Mns.General.DummyTimer matches 660 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 660 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"\n【 チュートリアル：最後に ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  これでチュートリアルは終了です。\n","color": "#00FFC3","bold": false},\
        {"text":"  様々なモンスターの狩猟を楽しんでください。\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"お疲れさまでした！","color": "#ff9900","bold": true},{"text": " \n","color": "#00FFC3","bold": false}\
    ]

# 遷移：一定時間後
    execute if score @s Mns.General.DummyTimer matches 800.. run function mhdp_monster_tutorial_01:core/tick/change_phase
