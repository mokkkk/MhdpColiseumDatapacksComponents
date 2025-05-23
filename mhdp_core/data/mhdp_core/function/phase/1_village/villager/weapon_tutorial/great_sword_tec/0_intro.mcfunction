#> mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/0_intro
#
# 武器チュートリアル 大剣・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：大剣・天ノ型の特徴 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ","color": "#FFFFFF","bold": false},{"text":"大剣・天ノ型","color": "#ff9900","bold": true},{"text":" は、重い動作と強力な一撃、\n","color": "#FFFFFF","bold": false},\
        {"text":"  多数のアーマー技によるカウンターが特徴の、切断属性の武器です。\n","color": "#FFFFFF","bold": false}\
    ]

    execute if score @s Vlg.General.Timer matches 210 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 210 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"【 チュートリアル：大剣・天ノ型の特徴 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  天ノ型では、溜め → 強溜め → 真溜めのように、\n","color": "#FFFFFF","bold": false},\
        {"text":"  さらに威力の高い溜め斬りを連続で放つことができます。\n","color": "#FFFFFF","bold": false},\
        {"text":"  それらを繋ぐタックルや相殺斬り上げを使い、\n","color": "#FFFFFF","bold": false},\
        {"text":"  ダメージを受けながらもモンスターの攻撃をやり過ごし、\n","color": "#FFFFFF","bold": false},\
        {"text":"  本命の溜め斬りを当てる、カウンター寄りの戦い方を得意とします。\n","color": "#FFFFFF","bold": false}\
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
