#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/2_cs
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：チャージステップ ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  溜め中、または射撃後に"},{"text":"ジャンプ","color": "#ff9900","bold": true},{"text":" すると、\n"},\
        {"text":"  "},{"text":"チャージステップ","color": "#ff9900","bold": true},{"text":" が発動します。\n"},\
        {"text":"  高速で移動しながら "},{"text":"溜めレベルを1段階上昇","color": "#ff9900","bold": true},{"text":" させます。\n"},\
        {"text":"  チャージステップの発動には、スタミナが必要なので注意しましょう。\n"},\
        {"text":"  "},{"text":"最大レベルの射撃後にチャージステップを使用する","color": "#ff9900","bold": true},{"text":" ことで、\n"},\
        {"text":"  隙をキャンセルしつつ "},{"text":"連続で射撃することができます","color": "#ff9900","bold": true},{"text":" 。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 200 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 200 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：チャージステップ ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  チャージステップの開始時には "},{"text":"無敵時間","color": "#ff9900","bold": true},{"text":" があります。\n"},\
        {"text":"  無敵時間でモンスターの攻撃を避けると "},{"text":"ジャスト回避","color": "#ff9900","bold": true},{"text":" となり、\n"},\
        {"text":"  "},{"text":"スタミナと仕込み矢ゲージが大きく増加","color": "#ff9900","bold": true},{"text":" します。\n"},\
        {"text":"  非常に大きなメリットのため、見切りやすい攻撃を見つけ、\n"},\
        {"text":"  積極的に狙いましょう。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 350 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 350 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：溜めレベル ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"溜めレベル","color": "#ff9900","bold": true},{"text":" の上げ方は、以下の手段があります。\n"},\
        {"text":"  状況に応じて使い分けましょう。\n"},\
        {"text":"  １．溜め続ける\n"},\
        {"text":"  ２．最大レベル以外の射撃後、\n"},{"text":"      スニークせずマウス"},{"keybind":"key.use"},{"text":"長押し(溜めに移行)\n"},\
        {"text":"  ３．溜め中にチャージステップを使用する\n"},\
        {"text":"  ４．射撃後にチャージステップを使用する\n"}\
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
            if score $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text matches ..0 \
            if score @s Vlg.General.Timer matches 420.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
