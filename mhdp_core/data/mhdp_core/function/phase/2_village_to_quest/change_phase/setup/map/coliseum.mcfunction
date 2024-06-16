#> mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum
#
# クエスト開始処理 大闘技場のフィールド初期化処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/start_quest

# 中心点設置
# モンスター召喚位置の決定などに使用
    summon marker -67 66 102 {Tags:["Mk.Field.Center"]}
    schedule function mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum_place_center 10t

# プレイヤーを移動
    tp @a[tag=Ply.State.PlayingQuest] 221 66 141
    spawnpoint @a[tag=Ply.State.PlayingQuest] 221 66 141
