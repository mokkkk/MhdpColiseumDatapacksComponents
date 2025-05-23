#> mhdp_core:beta/phase/1_village/tutorial/start
#
# ベータ版処理 チュートリアル再生開始
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 訓練中は利用不可
    execute if entity @s[tag=Ply.State.IsTraining] run return run tellraw @s {"text": "【訓練中は利用できません】","color": "red"}

# 通知
    playsound ui.button.click master @s ~ ~ ~ 1 1

# 既にチュートリアルエンティティがいる場合、中断させる
    execute if entity @n[type=item_display,tag=Vlg.VillageTutorial] run tellraw @a {"text":"【チュートリアル再生を中断しました】"}
    execute if entity @n[type=item_display,tag=Vlg.VillageTutorial] run kill @e[type=text_display,tag=Other.Text.Tutorial]
    execute if entity @n[type=item_display,tag=Vlg.VillageTutorial] run return run kill @e[type=item_display,tag=Vlg.VillageTutorial]

# チュートリアル再生用エンティティ召喚
    tellraw @a {"text":"【チュートリアル再生を開始します...】"}
    summon item_display ~ ~10 ~ {Tags:["Vlg.Root","Vlg.VillageTutorial"]}
