#> mhdp_monster_ranposu:core/util/fetch_player
#
# プレイヤー取得
#
# @within function mhdp_monsters:core/switch/macro/m.fetch_player

# TODO: mhdp_monster_ranposu:core/util/fetch_player

# 同エリアのプレイヤーに候補タグ付与
    tag @a remove Mns.Candidate.Ranposu
    scoreboard players operation #temp_current_area_id Fld.CurrentAreaId = @s Fld.CurrentAreaId
    execute as @a if score @s Fld.CurrentAreaId = #temp_current_area_id Fld.CurrentAreaId run tag @s add Mns.Candidate.Ranposu
    scoreboard players reset #temp_current_area_id

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say mhdp_monster_ranposu:core/util/fetch_player
