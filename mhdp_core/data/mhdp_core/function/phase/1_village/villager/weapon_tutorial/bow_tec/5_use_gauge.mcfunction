#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/2_cs
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color":"#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：ビン装填 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"スニークしながらマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 短押しで、\n"},\
        {"text":"  "},{"text":"ビン装填","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  "},{"text":"仕込み矢ゲージを1メモリ消費","color": "#ff9900","bold": true},{"text":" し、ビンを8本装填します。\n"},\
        {"text":"  ビンは射撃時に1つ消費され、矢の威力上昇などの効果を与えます。\n"},\
        {"text":"  "},{"text":"竜の一矢にはビンの効果が適用されません","color": "#ff9900","bold": true},{"text":" 。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 250 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 250 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color":"#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：導ノ矢 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"スニークしながらマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで、\n"},\
        {"text":"  仕込み矢ゲージを1メモリ消費し、"},{"text":"導ノ矢","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  導ノ矢を当てた部位に対し、"},{"text":"全ての矢が追尾する","color": "#ff9900","bold": true},{"text":" ようになります。\n"},\
        {"text":"  効果中は溜めレベルに関係なく "},{"text":"常に最大レベルの射撃","color": "#ff9900","bold": true},{"text":" ができ、\n"},\
        {"text":"  "},{"text":"導ノ矢を当てた部位に対するダメージが増加","color": "#ff9900","bold": true},{"text":" します。\n"},\
        {"text":"  非常に効果が大きいため、導ノ矢の効果は可能な限り維持しましょう。\n"}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"ビン装填を使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"導ノ矢を使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text styled {"color":"yellow"}
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 2
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players reset $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Equip,scores={Wpn.GeneralTimer=3}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Horming,scores={Wpn.GeneralTimer=3}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"ビン装填を使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"導ノ矢を使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 420.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
