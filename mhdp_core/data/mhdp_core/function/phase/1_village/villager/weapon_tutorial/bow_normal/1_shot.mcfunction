#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_normal/1_shot
#
# 武器チュートリアル 大剣・地ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：射撃 ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"スニークせずマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで "},\
        {"text":""},{"text":"溜め","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  その後、ボタンを離すと "},{"text":"射撃","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  弓を完全に引くと "},\
        {"text":""},{"text":"矢の本数が増え","color": "#ff9900","bold": true},{"text":" 高威力の射撃ができます。\n"},\
        {"text":"  また、抜刀攻撃時も溜めを使用します。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 150 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 150 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：射撃 ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  弓を引き終えてからさらに溜め、\n"},\
        {"text":"  "},{"text":"音が鳴った後に","color": "#ff9900","bold": true},{"text":" 射撃を行うことで、"},\
        {"text":"より高威力の射撃ができます。\n"},\
        {"text":"  モンスターが遠くにいるときなど、隙のあるときに狙いましょう。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 350 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 350 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
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
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 10
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
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"クリティカル距離で矢を当てる","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 420.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
