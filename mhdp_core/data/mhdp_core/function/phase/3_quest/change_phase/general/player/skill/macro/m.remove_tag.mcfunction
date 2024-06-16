#> mhdp_core:phase/3_quest/change_phase/general/player/skill/macro/m.remove_tag
#
# クエスト終了時 プレイヤーのリセット処理 食事スキルタグの消去
#
# @within
#    function mhdp_core:phase/3_quest/change_phase/succeed/change

# タグを削除
    $tag @s remove $(TargetFoodSkill)
