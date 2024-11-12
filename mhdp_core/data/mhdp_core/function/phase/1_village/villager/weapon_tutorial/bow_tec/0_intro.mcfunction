#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/0_intro
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：弓・天ノ型の特徴 ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"弓・天ノ型","color": "#ff9900","bold": true},{"text":" は、抜群の機動力を誇る、\n"},\
        {"text":"  テクニカルな戦い方ができる遠距離武器です。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 210 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 210 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：弓・天ノ型の特徴 ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  チャージステップにより、高速で移動しながら戦うことができます。\n"},\
        {"text":"  また、仕掛け矢ゲージを用い、攻撃力を強化できます。\n"},\
        {"text":"  行動のほとんどにスタミナが必要なため、\n"},\
        {"text":"  スタミナが尽きないように注意する必要があります。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 210 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 210 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：弓・天ノ型の特徴 ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  なお、遠距離武器はモンスターの防御力の影響が大きいため、\n"},\
        {"text":"  的確に弱点を狙う必要があります。\n"},\
        {"text":"  また、遠距離で戦えるので攻撃は回避しやすいですが、\n"},\
        {"text":"  その分防御力が低く受けるダメージが大きいので、\n"},\
        {"text":"  注意してください。\n"}\
    ]

# スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard objectives setdisplay sidebar.team.gold Vlg.WeaponTutorial.Text
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_text Vlg.WeaponTutorial.Text 999999999
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 0
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_text Vlg.WeaponTutorial.Text {"text":""}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_text Vlg.WeaponTutorial.Text blank
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"武器の特徴を学ぶ","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text blank

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 400.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
