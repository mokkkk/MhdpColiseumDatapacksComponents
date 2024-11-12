#> mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/4_charge_great
#
# 武器チュートリアル 大剣・地ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：大溜め斬り ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"大溜め斬り","color": "#ff9900","bold": true},{"text":" は、"},\
        {"text":"  "},{"text":"ガード中にマウス","color": "#ff9900","bold": true},{"keybind":"key.use","color": "#ff9900","bold": true},{"text":" 長押しで発動します。\n"},\
        {"text":"  ボタンを長押しする限り力を溜め、離すと攻撃します。\n"},\
        {"text":"  3段階まで力を溜めることができ、\n"},\
        {"text":"  "},{"text":"溜めるほど高威力","color": "#ff9900","bold": true},{"text":" の攻撃ができます。\n"},\
        {"text":"  溜め斬りとは異なり、溜め時間に制限がありません。\n"},\
        {"text":"  そのため、"},{"text":"好きなタイミングで","color": "#ff9900","bold": true},{"text":" 攻撃ができます。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 210 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 210 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：大溜め斬り ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  大溜めは、通常の溜め斬りより溜めが遅く、時間がかかります。\n"},\
        {"text":"  その代わり、非常に威力が高く、\n"},\
        {"text":"  攻撃の出始めに "},{"text":"アーマーが付与","color": "#ff9900","bold": true},{"text":" されるため、\n"},\
        {"text":"  タックルと同じく、モンスターの攻撃を受けながら攻撃できます。\n"},\
        {"text":"  大剣・地ノ型の最大威力の攻撃のため、\n  転倒時などの隙を狙って積極的に使用しましょう。\n"}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"最大まで溜めた大溜め斬りを使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players reset $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 2
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Gs.Normal.Cross,scores={Wpn.GeneralTimer=2,Wpn.Gs.ChargeCount=3..}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"最大まで溜めた大溜め斬りを使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 350.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
