#> mhdp_core:phase/1_village/villager/weapon_tutorial/end
#
# 武器チュートリアル 終了処理
#
# @within function mhdp_core:tick

# スコア削除
    scoreboard objectives setdisplay sidebar.team.gold
    scoreboard players reset $mhdp_temp_weapon_tutorial_text Mns.Tutorial.Text
    scoreboard players reset $mhdp_temp_weapon_tutorial_value Mns.Tutorial.Text
    scoreboard players reset $mhdp_temp_weapon_tutorial_value_2 Mns.Tutorial.Text
    scoreboard players reset $mhdp_temp_weapon_tutorial_value_3 Mns.Tutorial.Text

# チーム、タグ消去
    team leave @a[team=Team.WeaponTutorial]
    tag @a remove Vlg.WeaponTutorial.TargetPlayer

# 終了
    kill @e[tag=Vlg.WeaponTutorial]
