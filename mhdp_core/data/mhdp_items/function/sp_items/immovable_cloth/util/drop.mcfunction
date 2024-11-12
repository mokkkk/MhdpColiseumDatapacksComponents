#> mhdp_items:sp_items/immovable_cloth/util/interrupt
#
# 特殊装具の割り込み処理
# 右記functionに分岐処理を追加する：mhdp_items:core/switch/item/drop
#
# @within function mhdp_items:core/switch/item/init

# 割り込み処理実行
    function mhdp_items:sp_items/immovable_cloth/util/interrupt

# 念のためclear
    clear @s carrot_on_a_stick[custom_data~{ItemName:"immovable_cloth"}]

# give
    give @s carrot_on_a_stick[item_name='{"text":"不動の装衣","color":"green","italic":false}',custom_name='{"text":"不動の装衣","color":"green","italic":false}',lore=['{"text":"[特殊装具]","color":"dark_purple","italic":false}','{"text":"--------------------","color":"dark_gray"}','{"text":"一定時間の間、","color":"white","italic":false}','{"text":"ノックバックを無効化する。","color":"white","italic":false}','{"text":"受けるダメージも軽減する。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=1000,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:1000,ItemName:"immovable_cloth",UseTimer:50,IsSpItem:1b}]
