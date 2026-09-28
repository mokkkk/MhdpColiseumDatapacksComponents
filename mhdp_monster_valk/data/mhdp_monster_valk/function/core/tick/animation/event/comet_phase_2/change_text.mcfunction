#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/change_text
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main

# スコア増加
    scoreboard players add @s Mns.Valk.SubCount 1

# テキスト変更
    # function animated_java_valk:valk/as_node {name:"comet_star",command:"data modify entity @s text set value {\"text\":\"\",\"font\":\"vfx/valstrax\"}"}

# 終了
    execute if score @s Mns.Valk.SubCount matches 2.. run scoreboard players set @s Mns.Valk.SubCount 0
