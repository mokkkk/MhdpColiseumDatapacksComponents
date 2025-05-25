#> mhdp_items:core/init/weapon_data
#
# 武器データの初期化を行う
#
# @within function mhdp_items:load

# 初期化
    data modify storage mhdp_core:game_data WeaponAttackData set value {}

# 大剣
    function mhdp_items:weapons/great_sword/init
# 片手剣
    function mhdp_items:weapons/short_sword/init
# 弓
    function mhdp_items:weapons/bow/init

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say 武器データ初期化