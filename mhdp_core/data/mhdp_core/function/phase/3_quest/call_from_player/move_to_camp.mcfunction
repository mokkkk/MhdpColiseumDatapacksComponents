#> mhdp_core:phase/3_quest/call_from_player/move_to_camp
#
# プレイヤーから呼び出す処理 ベースキャンプへの移動
#
# @within function mhdp_core:player/phase_quest/death_animation/end_on_quest

# マップ個別処理(BCへの移動)
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/3_quest/map/coliseum/move_to_camp
