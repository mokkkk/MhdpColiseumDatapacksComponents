#> mhdp_monster_tutorial_02:core/tick/07_damage/main
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
        {"text":"  モンスターの素材が入手できる。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 260 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 260 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：訓練所 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  拠点にある "},{"text":"訓練所","color": "#ff9900","bold": true},{"text": " では、\n"},\
        {"text":"  より詳しい武器の使い方を学ぶことができる。\n"},\
        {"text":"  天ノ型の操作は非常に難しいので、訓練所で試すと良いだろう。\n"},\
        {"text":"  もしまだ基本操作や戦い方に不安があるなら、\n"},\
        {"text":"  "},{"text":"詳細チュートリアル","color": "#ff9900","bold": true},{"text": " クエストを受注しよう。\n"}\
    ]

    execute if score @s Mns.General.DummyTimer matches 460 as @a[tag=Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Mns.General.DummyTimer matches 460 run tellraw @a[tag=Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：モンスターリスト ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  一度でも戦ったことのあるモンスターは、\n"},\
        {"text":"  拠点に置かれた "},{"text":"モンスターリスト","color": "#ff9900","bold": true},{"text": " で情報を見ることができる。\n"},\
        {"text":"  モンスターの生態や、攻略情報を調べることができる。\n"},\
        {"text":"  青鳥竜の情報が追加されたので、拠点に戻ったら読んでみてほしい。\n"}\
    ]

# 終了
    execute if score @s Mns.General.DummyTimer matches 600.. run function mhdp_monster_tutorial_02:core/death/death
