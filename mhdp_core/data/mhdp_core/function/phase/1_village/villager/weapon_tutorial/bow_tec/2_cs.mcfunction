#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/2_cs
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"\n【 チュートリアル：チャージステップ ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  溜め中、または射撃後に","color": "#FFFFFF","bold": false},{"text":"ジャンプ","color": "#ff9900","bold": true},{"text":" すると、\n","color": "#FFFFFF","bold": false},\
        {"text":"  ","color": "#FFFFFF","bold": false},{"text":"チャージステップ","color": "#ff9900","bold": true},{"text":" が発動します。\n","color": "#FFFFFF","bold": false},\
        {"text":"  高速で移動しながら ","color": "#FFFFFF","bold": false},{"text":"溜めレベルを1段階上昇","color": "#ff9900","bold": true},{"text":" させます。\n","color": "#FFFFFF","bold": false},\
        {"text":"  チャージステップの発動には、スタミナが必要なので注意しましょう。\n","color": "#FFFFFF","bold": false},\
        {"text":"  最大レベルの射撃後にチャージステップを使用することで、\n","color": "#FFFFFF","bold": false},\
        {"text":"  ","color": "#FFFFFF","bold": false},{"text":"最大レベルの射撃を連続で使用することができます","color": "#ff9900","bold": true},{"text":"。\n","color": "#FFFFFF","bold": false}\
    ]

    execute if score @s Vlg.General.Timer matches 200 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 200 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"【 チュートリアル：溜めレベル ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  ","color": "#FFFFFF","bold": false},{"text":"溜めレベル","color": "#ff9900","bold": true},{"text":" の上げ方は、以下の手段があります。\n","color": "#FFFFFF","bold": false},\
        {"text":"  状況に応じて使い分けましょう。\n","color": "#FFFFFF","bold": false},\
        {"text":"  １．溜め続ける\n","color": "#FFFFFF","bold": false},\
        {"text":"  ２．最大レベル以外の射撃後、\n","color": "#FFFFFF","bold": false},{"text":"      スニークせずマウス","color": "#FFFFFF","bold": false},{"keybind":"key.use","color": "#FFFFFF","bold": false},{"text":"長押し(溜めに移行)\n","color": "#FFFFFF","bold": false},\
        {"text":"  ３．溜め中にチャージステップを使用する\n","color": "#FFFFFF","bold": false},\
        {"text":"  ４．射撃後にチャージステップを使用する\n","color": "#FFFFFF","bold": false}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"チャージステップを使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text styled {"color":"yellow"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"最大レベルの射撃を使用する：残り","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text styled {"color":"yellow"}
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 4
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 10
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players reset $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text
    # スコア減算
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Max,scores={Wpn.GeneralTimer=3}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Max,scores={Wpn.GeneralTimer=3}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 1
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0.. \
            if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Power,scores={Wpn.GeneralTimer=3,Wpn.Bw.ChargeCount=2..}] run \
            scoreboard players remove $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text 1
    # チュートリアル完了
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"チャージステップを使用する：","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display name $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text {"text":"最大レベルの射撃を使用する：残り","color":"green"}
        execute if score @s Vlg.General.Timer matches 3.. \
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches 0 run \
            scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 420.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
