#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/1_shot
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：射撃 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"スニークせずマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで "},\
        {"text":""},{"text":"溜め","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  その後、ボタンを離すと "},{"text":"射撃","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  溜めている間はスタミナを消費し "},{"text":"2回まで溜めレベルが上昇","color": "#ff9900","bold": true},{"text":" します。\n"},\
        {"text":"  "},{"text":"矢の本数と威力が増加します","color": "#ff9900","bold": true},{"text":"。\n"},\
        {"text":"  また、抜刀攻撃時も溜めを使用します。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 200 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 200 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：剛射 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  射撃後に "},{"text":"スニークしながらマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 短押しで、\n"},\
        {"text":"  "},{"text":"剛射","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  直前の射撃より "},{"text":"1段階レベルの高い射撃","color": "#ff9900","bold": true},{"text":" を行います。\n"},\
        {"text":"  剛射を使うことで、 "},{"text":"最大レベルの射撃を連続で使用できます","color": "#ff9900","bold": true},{"text":" 。\n"},\
        {"text":"  スタミナ消費量や隙が大きいので、モンスターの攻撃には注意しましょう。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 400 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 400 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：クリティカル距離 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  矢には "},{"text":"クリティカル距離","color": "#ff9900","bold": true},{"text":" があります。\n"},\
        {"text":"  モンスターと適度な距離で射撃をすると、\n"},\
        {"text":"  矢の命中時に "},{"text":"音がなります","color": "#ff9900","bold": true},{"text":" 。\n"},\
        {"text":"  クリティカル距離では "},{"text":"矢の威力が大幅に上昇","color": "#ff9900","bold": true},{"text":" します。\n"},\
        {"text":"  距離を保ちながら戦うことを意識しましょう。\n"}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"クリティカル距離で矢を当てる：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"最大レベルの射撃を使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text {"text":"剛射を使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text styled {"color":"yellow"}
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 10
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 3
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text 3
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3 run tag @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] add Ply.Temp.Tutorial.CritShot
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=!Ply.Temp.Tutorial.CritShot] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=!Ply.Temp.Tutorial.CritShot] run \
            tag @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] add Ply.Temp.Tutorial.CritShot
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Max,scores={Wpn.GeneralTimer=3}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Power,scores={Wpn.GeneralTimer=3}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Power,scores={Wpn.GeneralTimer=3,Wpn.Bw.ChargeCount=2..}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"クリティカル距離で矢を当てる","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"最大レベルの射撃を使用する：残り","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text {"text":"剛射を使用する：残り","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches ..0 \
            if score $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 420.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
