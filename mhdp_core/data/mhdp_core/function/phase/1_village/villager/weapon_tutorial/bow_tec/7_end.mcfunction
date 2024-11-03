#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/4_end
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：おわりに ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  弓・天ノ型の使い方についての説明は以上です。\n"},\
        {"text":"  スタミナ管理は難しいものの、使いこなせば非常に強力な武器です。\n"},\
        {"text":"  怒涛の連射で、モンスターの弱点を射抜きましょう！\n"}\
    ]

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 200.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
