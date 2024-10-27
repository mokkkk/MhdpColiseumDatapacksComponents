#> mhdp_core:phase/1_village/villager/weapon_tutorial/end
#
# 武器チュートリアル 終了処理
#
# @within function mhdp_core:tick

# スコア削除
    scoreboard objectives setdisplay sidebar.team.gold
    scoreboard players reset $mhdp_temp_weapon_tutorial_text Vlg.WeaponTutorial.Text
    scoreboard players reset $mhdp_temp_weapon_tutorial_value Vlg.WeaponTutorial.Text
    scoreboard players reset $mhdp_temp_weapon_tutorial_value_2 Vlg.WeaponTutorial.Text
    scoreboard players reset $mhdp_temp_weapon_tutorial_value_3 Vlg.WeaponTutorial.Text

# チーム、タグ消去
    team leave @a[team=Team.WeaponTutorial]
    tag @a remove Vlg.WeaponTutorial.TargetPlayer
    tag @a remove Ply.Temp.Tutorial.Guard

# 終了
    kill @e[tag=Vlg.WeaponTutorial]
