#> mhdp_items:sp_items/wirebug/util/interrupt
#
# 特殊装具の割り込み処理
# 右記functionに分岐処理を追加する：mhdp_items:core/switch/item/drop
#
# @within function mhdp_items:core/switch/item/init

# 割り込み処理実行
    function mhdp_items:sp_items/wirebug/util/interrupt

# 念のためclear
    clear @s carrot_on_a_stick[custom_data~{ItemName:"wirebug"}]

# give
    data modify storage api: Arg.Path set value "mhdp_items:sp_items/wirebug"
    data modify storage api: Arg.Count set value 1
    function api:give_item.m with storage api: Arg
