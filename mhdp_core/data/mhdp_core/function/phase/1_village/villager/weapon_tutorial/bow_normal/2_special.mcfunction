#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_normal/1_charge_slash
#
# 武器チュートリアル 弓・地ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：竜の一矢 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ","color": "#FFFFFF","bold": false},{"text":"スニークしながらマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで ","color": "#FFFFFF","bold": false},\
        {"text":"","color": "#FFFFFF","bold": false},{"text":"竜の一矢","color": "#ff9900","bold": true},{"text":" が発動します。\n","color": "#FFFFFF","bold": false},\
        {"text":"  矢を引き絞り終えた後にボタンを離すと攻撃します。\n","color": "#FFFFFF","bold": false},\
        {"text":"  竜の一矢は ","color": "#FFFFFF","bold": false},{"text":"貫通し、複数回ヒット","color": "#ff9900","bold": true},{"text":" します。\n","color": "#FFFFFF","bold": false},\
        {"text":"  また、クリティカル距離が長く、遠くからでも大ダメージを与えられます。\n","color": "#FFFFFF","bold": false},\
        {"text":"  竜の一矢は ","color": "#FFFFFF","bold": false},{"text":"切断属性","color": "#ff9900","bold": true},{"text":" を持つため、尻尾などへのダメージが上がります。\n","color": "#FFFFFF","bold": false}\
    ]

    execute if score @s Vlg.General.Timer matches 200 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 200 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"【 チュートリアル：竜の千々矢 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  竜の一矢の後、ボタンを離さずさらに溜めることによって、\n","color": "#FFFFFF","bold": false},\
        {"text":"  大量の矢を装填する ","color": "#FFFFFF","bold": false},{"text":"竜の千々矢","color": "#ff9900","bold": true},{"text":" が発動します。\n","color": "#FFFFFF","bold": false},\
        {"text":"  矢の装填が終わった後にボタンを離すと攻撃します。\n","color": "#FFFFFF","bold": false},\
        {"text":"  無数の矢を一度に放ち ","color": "#FFFFFF","bold": false},{"text":"複数回ヒット","color": "#ff9900","bold": true},{"text":" する攻撃をします。\n","color": "#FFFFFF","bold": false},\
        {"text":"  射撃時に拡散してしまうため、","color": "#FFFFFF","bold": false},\
        {"text":" ","color": "#FFFFFF","bold": false},{"text":"モンスターに密着","color": "#ff9900","bold": true},{"text":" すると当てやすいです。\n","color": "#FFFFFF","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"竜の一矢を使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"竜の千々矢を使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text styled {"color":"yellow"}
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 2
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 2
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Normal.Shot.Pierce,scores={Wpn.GeneralTimer=1001}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Normal.Shot.Shower,scores={Wpn.GeneralTimer=1001}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"竜の一矢を使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"竜の千々矢を使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 500.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
