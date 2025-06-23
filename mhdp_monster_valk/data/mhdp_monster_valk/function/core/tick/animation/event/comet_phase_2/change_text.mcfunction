#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/change_text
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# スコア増加
    scoreboard players add @s Mns.Valk.SubCount 1

# テキスト変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.comet_star] run data modify entity @s text set value {"text":"","font":"vfx/valstrax"}
    # execute if score @s Mns.Valk.SubCount matches ..1 on passengers if entity @s[tag=aj.valk_aj.bone.comet_star] run data modify entity @s text set value {"text":"a","font":"vfx/valstrax"}
    # execute if score @s Mns.Valk.SubCount matches 2.. on passengers if entity @s[tag=aj.valk_aj.bone.comet_star] run data modify entity @s text set value {"text":"b","font":"vfx/valstrax"}

# 終了
    execute if score @s Mns.Valk.SubCount matches 2.. run scoreboard players set @s Mns.Valk.SubCount 0
