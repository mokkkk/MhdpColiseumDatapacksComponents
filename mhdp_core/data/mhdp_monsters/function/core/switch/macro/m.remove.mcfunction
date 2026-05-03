#> mhdp_monsters:core/switch/macro/m.remove
# 
# 分岐処理 モンスター消去処理 本体
#
# @within function mhdp_monsters:core/switch/remove

# デバッグ用
    $execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say mhdp_monster_$(Prefix):core/remove/remove

# 対象のモンスターの消去処理を実行
    $function mhdp_monster_$(Prefix):core/remove/remove
