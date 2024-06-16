#> mhdp_core:phase/3_quest/change_phase/general/player/skill/reset_food_skills
#
# クエスト終了時 プレイヤーのリセット処理 食事スキルタグの消去
#
# @within
#    function mhdp_core:phase/3_quest/change_phase/succeed/change

# タグを取得
    data modify storage mhdp_core:temp FoodSkills set from entity @s Tags

# 処理開始
    function mhdp_core:phase/3_quest/change_phase/general/player/skill/reset_food_skills_loop

# 終了
    data remove storage mhdp_core:temp FoodSkills
