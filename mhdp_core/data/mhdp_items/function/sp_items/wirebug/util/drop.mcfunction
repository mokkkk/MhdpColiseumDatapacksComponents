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
    give @s carrot_on_a_stick[item_name='{"text":"翔蟲","color":"green","italic":false}',custom_name='{"text":"翔蟲","color":"green","italic":false}',lore=['{"text":"[特殊装具]","color":"dark_purple","italic":false}','{"text":"--------------------","color":"dark_gray"}','{"text":"正面方向に糸を伸ばし、","color":"white","italic":false}','{"text":"高速で移動する。","color":"white","italic":false}','{"text":"移動中は鉄蟲糸技が使用可能。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=1001,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:1001,ItemName:"wirebug",UseTimer:50,IsSpItem:1b}]