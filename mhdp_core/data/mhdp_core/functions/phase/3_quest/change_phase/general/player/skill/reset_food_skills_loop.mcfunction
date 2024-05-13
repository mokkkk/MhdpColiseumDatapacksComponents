#> mhdp_core:phase/3_quest/change_phase/general/player/skill/reset_food_skills_loop
#
# クエスト終了時 プレイヤーのリセット処理 食事スキルタグの消去
#
# @within
#    function mhdp_core:phase/3_quest/change_phase/succeed/change

# データを取り出す
    data modify storage mhdp_core:temp Temp.TargetFoodSkill set from storage mhdp_core:temp FoodSkills[-1]
    data remove storage mhdp_core:temp FoodSkills[-1]

# 食事スキルの命名規則に沿うタグを消す
    data modify storage mhdp_core:temp Temp.TagPrefix set string storage mhdp_core:temp Temp.TargetFoodSkill 0 10
    execute if data storage mhdp_core:temp Temp{TagPrefix:"Skill.Food"} run function mhdp_core:phase/3_quest/change_phase/general/player/skill/macro/m.remove_tag with storage mhdp_core:temp Temp
    # data remove storage mhdp_core:temp Temp

# データが残っている限り繰り返す
    execute if data storage mhdp_core:temp FoodSkills[0] run function mhdp_core:phase/3_quest/change_phase/general/player/skill/reset_food_skills_loop
