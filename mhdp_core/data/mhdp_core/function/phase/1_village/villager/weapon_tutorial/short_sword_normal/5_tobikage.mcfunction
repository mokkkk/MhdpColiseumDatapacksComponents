#> mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_normal/5_tobikage
#
# 武器チュートリアル 片手剣・地ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：飛影 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  片手剣の鉄蟲糸技は "},{"text":"飛影","color": "#ff9900","bold": true},{"text":" です。\n"},\
        {"text":"  翔蟲の移動中に "},\
            {"text":"抜刀攻撃","color": "#ff9900","bold": true},{"text":" をすると発動します。\n"},\
        {"text":"  モンスターに攻撃が命中すると、そのまま大きく飛び上がります。\n"},\
        {"text":"  モンスターより少し上を狙って翔蟲で移動すると、攻撃が当てやすいです。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 260 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 260 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：フォールバッシュ ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  飛影を当てて飛び上がった後、空中で "},{"text":"マウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" を押すと、\n"},\
        {"text":"  "},{"text":"フォールバッシュ","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  高威力の打撃攻撃で、落下中と着地時で、合計2回ヒットします。\n"},\
        {"text":"  モンスターの頭に当てると気絶値を溜めることができるので、\n  可能なら頭を狙って攻撃しましょう。\n"}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"飛影を当てる：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"フォールバッシュを使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text styled {"color":"yellow"}
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 3
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 3
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Ss.Normal.Tobikage,tag=Ply.Flag.Hit,scores={Wpn.GeneralTimer=3}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Ss.Normal.Fall.High,scores={Wpn.GeneralTimer=4}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"飛影を当てる：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"フォールバッシュを使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 400.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
