#> mhdp_items:core/switch/item/interrupt
# 
# 分岐処理 特殊装具の初期化処理
#
# @within function mhdp_core:

# 念のためデータを取得
    function mhdp_core:player/data/load_data

# 分岐処理
    execute if data storage mhdp_core:temp PlayerData.SpItems[0] run data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.SpItems[0]
    execute if data storage mhdp_core:temp PlayerData.SpItems[0] run function mhdp_items:core/switch/item/macro/m.interrupt with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    execute if data storage mhdp_core:temp PlayerData.SpItems[1] run data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.SpItems[1]
    execute if data storage mhdp_core:temp PlayerData.SpItems[1] run function mhdp_items:core/switch/item/macro/m.interrupt with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    # 砥石
    # 今のところダメージを受けても研げる方がストレスがないため、割り込みを実行しない
        # function mhdp_items:sp_items/whetstone/util/interrupt
    # 肉焼きセット
        function mhdp_items:sp_items/nikuyaki/util/interrupt

# 反映
    function mhdp_core:player/data/save_data
