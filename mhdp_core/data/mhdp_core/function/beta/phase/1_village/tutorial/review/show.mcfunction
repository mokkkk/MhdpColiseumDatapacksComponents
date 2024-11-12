#> mhdp_core:beta/phase/1_village/tutorial/review/show
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 通知
    execute as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1

# ベースキャンプ
    execute if score @s Ply.Ope.TutorialTrigger matches 1..9 run function mhdp_core:beta/phase/1_village/tutorial/review/01_bc

# 斬れ味
    execute if score @s Ply.Ope.TutorialTrigger matches 10..19 run function mhdp_core:beta/phase/1_village/tutorial/review/02_sharpness

# スタミナ
    execute if score @s Ply.Ope.TutorialTrigger matches 20..29 run function mhdp_core:beta/phase/1_village/tutorial/review/03_stamina

# 抜刀
    execute if score @s Ply.Ope.TutorialTrigger matches 30..39 run function mhdp_core:beta/phase/1_village/tutorial/review/04_weapon

# ガード
    execute if score @s Ply.Ope.TutorialTrigger matches 40..49 run function mhdp_core:beta/phase/1_village/tutorial/review/05_guard

# 回避
    execute if score @s Ply.Ope.TutorialTrigger matches 50..59 run function mhdp_core:beta/phase/1_village/tutorial/review/06_avoid

# 消費アイテム
    execute if score @s Ply.Ope.TutorialTrigger matches 60..69 run function mhdp_core:beta/phase/1_village/tutorial/review/07_consumable_item

# 特殊装具
    execute if score @s Ply.Ope.TutorialTrigger matches 70..79 run function mhdp_core:beta/phase/1_village/tutorial/review/08_sp_item_wirebug

# モンスターとの戦い方
    execute if score @s Ply.Ope.TutorialTrigger matches 80..89 run function mhdp_core:beta/phase/1_village/tutorial/review/09_monster_basic

# 部位
    execute if score @s Ply.Ope.TutorialTrigger matches 90..99 run function mhdp_core:beta/phase/1_village/tutorial/review/10_monster_defence

# 怒り状態
    execute if score @s Ply.Ope.TutorialTrigger matches 100..109 run function mhdp_core:beta/phase/1_village/tutorial/review/11_monster_anger

# 剝ぎ取り
    execute if score @s Ply.Ope.TutorialTrigger matches 110..119 run function mhdp_core:beta/phase/1_village/tutorial/review/12_monster_item

# 終了
    scoreboard players set @s Ply.Ope.TutorialTrigger -1
