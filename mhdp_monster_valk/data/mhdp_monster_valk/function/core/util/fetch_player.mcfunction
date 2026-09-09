#> mhdp_monster_valk:core/util/fetch_player
#
# プレイヤー取得
#
# @within function mhdp_monsters:core/switch/macro/m.fetch_player

# 同エリアのプレイヤーに候補タグ付与
    tag @a remove Mns.Candidate.Valk
    scoreboard players operation #temp_current_area_id Fld.CurrentAreaId = @s Fld.CurrentAreaId
    execute as @a if score @s Fld.CurrentAreaId = #temp_current_area_id Fld.CurrentAreaId run tag @s add Mns.Candidate.Valk
    scoreboard players reset #temp_current_area_id

# ボスバー表示更新
    bossbar set mhdp_monster:valk players @a[tag=Mns.Candidate.Valk]

# 戦闘中
    # 同エリアプレイヤーの発見値を固定
        execute if score @s Mns.General.Phase matches 2 run scoreboard players set @a[tag=Mns.Candidate.Valk] Mns.Valk.Search 1000
    # ターゲット確認
        execute if score @s Mns.General.Phase matches 2 run function mhdp_monster_valk:core/tick/on_battle/check_target

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say mhdp_monster_valk:core/util/fetch_player
