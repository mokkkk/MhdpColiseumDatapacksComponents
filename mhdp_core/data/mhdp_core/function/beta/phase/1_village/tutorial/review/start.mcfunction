#> mhdp_core:beta/phase/1_village/tutorial/review/start
#
# ベータ版処理 チュートリアル再生開始
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 通知
    execute as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1

# 目次の表示
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "light_purple"},\
        {"text":"-----【再生したいチュートリアルをクリックしてください】-----\n","color": "gold","bold": true},\
        {"text":"\n 基礎知識\n\n","bold": true,"color": "gold"},\
        {"text":" - [ベースキャンプ]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 1"}},\
        {"text":" - [斬れ味]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 10"}},\
        {"text":" - [スタミナ]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 20"}},\
        {"text":"\n 戦闘\n\n","bold": true,"color": "gold"},\
        {"text":" - [抜刀・攻撃]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 30"}},\
        {"text":" - [ガード]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 40"}},\
        {"text":" - [回避]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 50"}},\
        {"text":" - [消費アイテム]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 60"}},\
        {"text":" - [特殊装具]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 70"}},\
        {"text":"\n モンスター\n\n","bold": true,"color": "gold"},\
        {"text":" - [モンスターとの戦い方]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 80"}},\
        {"text":" - [部位]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 90"}},\
        {"text":" - [怒り状態]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 100"}},\
        {"text":" - [剥ぎ取り]\n","clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.TutorialTrigger set 110"}},\
        {"text":"\n--------------------------------------------","color": "gold","bold": true}\
    ]
