#> mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/1_charge_slash
#
# 武器チュートリアル 大剣・地ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：溜め斬り ","color":"#00FFC3","bold": true},{"text":"1/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"溜め斬り","color": "#ff9900","bold": true},{"text":" は、","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"スニークせずマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで発動します。\n","color": "#00FFC3","bold": false},\
        {"text":"  ボタンを長押しする限り力を溜め、離すと攻撃します。\n","color": "#00FFC3","bold": false},\
        {"text":"  3段階まで力を溜めることができ、\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"溜めるほど高威力","color": "#ff9900","bold": true},{"text":" の攻撃ができます。\n","color": "#00FFC3","bold": false},\
        {"text":"  ただし、溜めすぎると勝手に溜め斬りが発動し、\n","color": "#00FFC3","bold": false},\
        {"text":"  ","color": "#00FFC3","bold": false},{"text":"逆に威力が下がってしまう","color": "#ff9900","bold": true},{"text":" ので注意してください。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Vlg.General.Timer matches 210 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 210 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：溜め斬り ","color":"#00FFC3","bold": true},{"text":"2/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  溜め中は移動ができず、溜め斬り後は隙が大きいです。\n","color": "#00FFC3","bold": false},\
        {"text":"  素早く ","color": "#00FFC3","bold": false},{"text":"納刀して隙をキャンセル","color": "#ff9900","bold": true},{"text":" することで、","color": "#00FFC3","bold": false},\
        {"text":"  すぐにモンスターの攻撃の回避に移ることができます。\n","color": "#00FFC3","bold": false}\
    ]

    execute if score @s Vlg.General.Timer matches 410 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 410 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：溜め斬り ","color":"#00FFC3","bold": true},{"text":"3/3","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  抜刀攻撃でも、溜め斬りが発動します。","color": "#00FFC3","bold": false},\
        {"text":"  空中で抜刀攻撃をすると、","color": "#00FFC3","bold": false},{"text":"前進しながら","color": "#ff9900","bold": true},{"text":" 溜めに移行します。\n","color": "#00FFC3","bold": false},\
        {"text":"  モンスターに近づきながら溜め斬りに移行できるので、\n","color": "#00FFC3","bold": false},\
        {"text":"  ジャンプ抜刀攻撃を覚えておきましょう。\n","color": "#00FFC3","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"最大まで溜めた溜め斬りを使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"空中で抜刀攻撃をする：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text styled {"color":"yellow"}
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 3
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 3
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Gs.Normal.ChargeSlash,scores={Wpn.GeneralTimer=2,Wpn.Gs.ChargeCount=3..}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Gs.Normal.Charge,tag=Ply.Flag.DrawAttack,tag=Ply.Ope.IsAir,scores={Wpn.GeneralTimer=2}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"最大まで溜めた溜め斬りを使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"空中で抜刀攻撃をする：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 500.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
