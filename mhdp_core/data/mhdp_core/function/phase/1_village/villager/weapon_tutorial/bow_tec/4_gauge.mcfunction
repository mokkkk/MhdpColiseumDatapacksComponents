#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/4_gauge
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# メッセージ
    execute if score @s Vlg.General.Timer matches 60 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 60 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color":"#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：仕込み矢ゲージ ","color":"#00FFC3","bold": true},{"text":"1/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"9","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"},{"text":"9","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"},{"text":"9","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"},{"text":"\uF814","font":"space"},{"text":"#","font":"ui/weapon/bow/gauge"},{"text":"\uF801","font":"space"},\
        {"text":"\n  これは "},{"text":"仕込み矢ゲージ","color": "#ff9900","bold": true},{"text":" です。\n"},\
        {"text":"  後述する、ビン装填や導ノ矢に使用します。\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 200 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 200 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color":"#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：仕込み矢ゲージ ","color":"#00FFC3","bold": true},{"text":"2/2","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  仕込み矢ゲージは、以下の行動で溜まります。\n"},\
        {"text":"  １．溜め中、自動的に増加する\n"},\
        {"text":"  ２．モンスターに矢を当てる\n"},\
        {"text":"  ３．チャージステップのジャスト回避を成功させる\n"}\
    ]

    execute if score @s Vlg.General.Timer matches 350 as @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    execute if score @s Vlg.General.Timer matches 350 run tellraw @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial] [\
        {"text":"","color":"#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：ビンゲージ ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  "},{"text":"0","font":"ui/weapon/bow/bottle"},{"text":"0","font":"ui/weapon/bow/bottle"},{"text":"0","font":"ui/weapon/bow/bottle"},{"text":"0","font":"ui/weapon/bow/bottle"},{"text":"0","font":"ui/weapon/bow/bottle"},{"text":"0","font":"ui/weapon/bow/bottle"},{"text":"0","font":"ui/weapon/bow/bottle"},{"text":"0","font":"ui/weapon/bow/bottle"},\
        {"text":"\n  これは "},{"text":"ビンゲージ","color": "#ff9900","bold": true},{"text":" です。\n"},\
        {"text":"  ビン装填により溜まります。\n"},\
        {"text":"  射撃時、自動的にビンゲージを1つ消費して矢に特殊な効果を与え、\n  攻撃力が増加します。\n"},\
        {"text":"  装填できるビンは、武器の "},{"text":"アイテム説明文","color": "#ff9900","bold": true},{"text":" で確認できます。\n"}\
    ]

# 初期スコア表示
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"ゲージに関する説明を聞く","color":"green"}
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text blank
# スコア設定
    execute if score @s Vlg.General.Timer matches 2 run scoreboard players set $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
    # # スコア減算
    #     execute if score @s Vlg.General.Timer matches 3.. \
    #         if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0.. \
    #         if entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Wpn.Bw.Tec.Shot.Pierce,scores={Wpn.GeneralTimer=45,Wpn.Bw.ChargeCount=2..}] run \
    #         scoreboard players remove $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text 1
    # # チュートリアル完了
    #     execute if score @s Vlg.General.Timer matches 3.. \
    #         if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
    #         scoreboard players display name $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text {"text":"最大レベルの竜の一矢を使用する：","color":"green"}
    #     execute if score @s Vlg.General.Timer matches 3.. \
    #         if score $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text matches 0 run \
    #         scoreboard players display numberformat $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text fixed {"text":"OK!","color":"yellow"}

# 遷移：時間
    execute if score @s Vlg.General.Timer matches 500.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/change_phase
