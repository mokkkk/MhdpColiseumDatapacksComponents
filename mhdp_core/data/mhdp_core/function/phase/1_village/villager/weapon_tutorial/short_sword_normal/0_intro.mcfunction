#> mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_normal/0_intro
#
# 武器チュートリアル 片手剣・地ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：片手剣・地ノ型の特徴 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"片手剣・地ノ型","color": "#ff9900","bold": true},{"text":" は、Minecraft標準に近い戦い方で戦うことができる、\n","color": "#00FFC3","bold": false},\
        {"text":"  とても扱いやすい武器種です。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Vlg.General.Timer matches 210 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 210 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：片手剣・地ノ型の特徴 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  移動しながら発動できる剣コンボや、\n","color": "#00FFC3","bold": false},\
        {"text":"  高威力の剣盾ラッシュといった技が使用できます。\n","color": "#00FFC3","bold": false},\
        {"text":"  剣コンボは任意のタイミングで中断でき、\n","color": "#00FFC3","bold": false},\
        {"text":"  盾によるガードも可能なため、\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターの攻撃に対処しやすいです。\n","color": "#00FFC3","bold": false}\
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
