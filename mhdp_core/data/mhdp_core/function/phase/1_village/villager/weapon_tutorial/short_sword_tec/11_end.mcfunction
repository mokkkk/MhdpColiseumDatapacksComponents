#> mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/11_end
#
# 武器チュートリアル 片手剣・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：おわりに ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  片手剣・天ノ型の使い方についての説明は以上です。\n","color": "#00FFC3","bold": false},\
        {"text":"  片手剣は、操作難易度の高さに見合う強さを持った武器です。\n","color": "#00FFC3","bold": false},\
        {"text":"  使いこなして、舞うように華麗に戦いましょう！\n","color": "#00FFC3","bold": false}\
    ]

# 遷移：一定時間後
    execute if score @s Vlg.General.Timer matches 200.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
