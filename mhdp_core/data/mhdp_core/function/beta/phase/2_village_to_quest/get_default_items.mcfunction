#> mhdp_core:beta/phase/2_village_to_quest/get_default_items
#
# 基礎アイテムを入手する
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# 回復薬
    give @p paper[item_name='{"text":"回復薬","color":"green","italic":false}',custom_name='{"text":"回復薬","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"体力を少量回復する薬。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=10,custom_model_data=1,food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:2147483647},custom_data={IsMhdpItem:1b,ItemType:1,ItemId:1,ItemName:"Potion",UseTimer:40}] 10

# 回復薬グレート
    give @p paper[item_name='{"text":"回復薬グレート","color":"green","italic":false}',custom_name='{"text":"回復薬グレート","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"体力を回復する薬。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=10,custom_model_data=1,food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:2147483647},custom_data={IsMhdpItem:1b,ItemType:1,ItemId:2,ItemName:"MegaPotion",UseTimer:40}] 10

# 秘薬
    give @p paper[item_name='{"text":"秘薬","color":"green","italic":false}',custom_name='{"text":"秘薬","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"体力の最大値が上昇し、","color":"white","italic":false}','{"text":"さらに体力を完全に回復する。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=2,custom_model_data=53,food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:2147483647},custom_data={IsMhdpItem:1b,ItemType:1,ItemId:53,ItemName:"MaxPotion",UseTimer:10}] 2

# 砥石
    give @p carrot_on_a_stick[item_name='{"text":"砥石","color":"green","italic":false}',custom_name='{"text":"砥石","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"武器を研磨し，","color":"white","italic":false}','{"text":"斬れ味を回復させる。","color":"white","italic":false}','{"text":"何度でも使用できる。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=100,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:100,ItemName:"whetstone",UseTimer:50}]

# 剝ぎ取りナイフ
    give @p carrot_on_a_stick[item_name='{"text":"剥ぎ取りナイフ","color":"green","italic":false}',custom_name='{"text":"剥ぎ取りナイフ","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"狩猟生活の必需品。","color":"white","italic":false}','{"text":"倒したモンスターに使用すると、","color":"white","italic":false}','{"text":"素材を剥ぎ取ることができる。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=102,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:102,ItemName:"carving_knife",UseTimer:50}]

# 不動の装衣
    give @p carrot_on_a_stick[item_name='{"text":"不動の装衣","color":"green","italic":false}',custom_name='{"text":"不動の装衣","color":"green","italic":false}',lore=['{"text":"[特殊装具]","color":"dark_purple","italic":false}','{"text":"--------------------","color":"dark_gray"}','{"text":"一定時間の間、","color":"white","italic":false}','{"text":"ノックバックを無効化する。","color":"white","italic":false}','{"text":"受けるダメージも軽減する。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=1000,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:1000,ItemName:"immovable_cloth",UseTimer:50,IsSpItem:1b}]

# 翔蟲
    give @p carrot_on_a_stick[item_name='{"text":"翔蟲","color":"green","italic":false}',custom_name='{"text":"翔蟲","color":"green","italic":false}',lore=['{"text":"[特殊装具]","color":"dark_purple","italic":false}','{"text":"--------------------","color":"dark_gray"}','{"text":"正面方向に糸を伸ばし、","color":"white","italic":false}','{"text":"高速で移動する。","color":"white","italic":false}','{"text":"移動中は鉄蟲糸技が使用可能。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=1001,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:1001,ItemName:"wirebug",UseTimer:50,IsSpItem:1b}]
