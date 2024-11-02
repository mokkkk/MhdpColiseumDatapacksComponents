#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/3_pierce
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：竜の一矢 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  射撃後、または剛射後に ","color": "#FFFFFF","bold": false},{"text":"スニークしながらマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで、\n","color": "#FFFFFF","bold": false},\
        {"text":"  ","color": "#FFFFFF","bold": false},{"text":"竜の一矢","color": "#ff9900","bold": true},{"text":" が発動します。\n","color": "#FFFFFF","bold": false},\
        {"text":"  長時間溜めた後 ","color": "#FFFFFF","bold": false},{"text":"貫通し複数ヒットする矢","color": "#ff9900","bold": true},{"text":" を撃ちます。\n","color": "#FFFFFF","bold": false},\
        {"text":"  クリティカル距離が長く、遠くからでも大ダメージを与えられるほか、\n","color": "#FFFFFF","bold": false},\
        {"text":"  ","color": "#FFFFFF","bold": false},{"text":"切断属性","color": "#ff9900","bold": true},{"text":" を持つため、尻尾などへのダメージが上がります。\n","color": "#FFFFFF","bold": false},\
        {"text":"  竜の一矢は ","color": "#FFFFFF","bold": false},{"text":"直前の射撃の溜めレベル","color": "#ff9900","bold": true},{"text":" に応じて威力が変わります。\n","color": "#FFFFFF","bold": false}\
    ]

    execute if score @s Vlg.General.Timer matches 240 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 240 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"【 チュートリアル：竜の一矢 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  竜の一矢は ","color": "#FFFFFF","bold": false},{"text":"スタミナを消費しません","color": "#ff9900","bold": true},{"text":" 。\n","color": "#FFFFFF","bold": false},\
        {"text":"  スタミナが尽きる直前に、コンボの締めとして使うと良いでしょう。\n","color": "#FFFFFF","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"最大レベルの竜の一矢を使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 2
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players reset $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Pierce,scores={Wpn.GeneralTimer=45,Wpn.Bw.ChargeCount=2..}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"最大レベルの竜の一矢を使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 420.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
