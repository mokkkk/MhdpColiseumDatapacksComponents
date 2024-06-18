#> mhdp_core:phase/3_quest/call_from_monster/macro/m.remove_target_monster
#
# モンスターから呼び出す処理 死亡時
#
# @within function mhdp_core:player/phase_quest/death_animation/end_on_quest

# 対応するモンスターのデータを消去
    $data remove storage mhdp_core:game_data ActiveQuest.TargetMonsters[{MonsterId:$(MonsterUid)}]
