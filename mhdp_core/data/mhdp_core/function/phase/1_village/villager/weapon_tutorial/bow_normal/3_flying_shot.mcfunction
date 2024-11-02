#> mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/3_flying_shot
#
# 武器チュートリアル 大剣・地ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：飛翔にらみ撃ち ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  弓の鉄蟲糸技は ","color": "#FFFFFF","bold": false},{"text":"飛翔にらみ撃ち","color": "#ff9900","bold": true},{"text":" です。\n","color": "#FFFFFF","bold": false},\
        {"text":"  翔蟲の移動中に ","color": "#FFFFFF","bold": false},{"text":"抜刀攻撃","color": "#ff9900","bold": true},{"text":" をすると発動します。\n","color": "#FFFFFF","bold": false},\
        {"text":"  移動と攻撃を両立することができる便利な技です。\n","color": "#FFFFFF","bold": false},\
        {"text":"  空中で矢を引き絞り、着地するまでに ","color": "#FFFFFF","bold": false},{"text":"3回射撃","color": "#ff9900","bold": true},{"text":" で攻撃できます。\n","color": "#FFFFFF","bold": false},\
        {"text":"  クリティカル距離が長く、遠くからでも高威力の射撃ができます。\n","color": "#FFFFFF","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"飛翔にらみ撃ちを使用し、空中で射撃する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    scoreboard players reset $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 8
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Normal.FlyingShot,scores={Wpn.GeneralTimer=7}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"飛翔にらみ撃ちを使用し、空中で射撃する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 150.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
