#> mhdp_core:beta/phase/2_village_to_quest/get_default_items
#
# 基礎アイテムを入手する
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# 回復薬
    data modify storage api: Arg.Path set value "mhdp_items:consume_items/potion"
    data modify storage api: Arg.Count set value 10
    function api:give_item.m with storage api: Arg

# 回復薬グレート
    data modify storage api: Arg.Path set value "mhdp_items:consume_items/mega_potion"
    data modify storage api: Arg.Count set value 10
    function api:give_item.m with storage api: Arg

# 秘薬
    data modify storage api: Arg.Path set value "mhdp_items:consume_items/max_potion"
    data modify storage api: Arg.Count set value 2
    function api:give_item.m with storage api: Arg

# 砥石
    data modify storage api: Arg.Path set value "mhdp_items:sp_items/whetstone"
    data modify storage api: Arg.Count set value 1
    function api:give_item.m with storage api: Arg

# # 剝ぎ取りナイフ
#     give @s carrot_on_a_stick[item_name='{"text":"剥ぎ取りナイフ","color":"green","italic":false}',custom_name='{"text":"剥ぎ取りナイフ","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"狩猟生活の必需品。","color":"white","italic":false}','{"text":"倒したモンスターに使用すると、","color":"white","italic":false}','{"text":"素材を剥ぎ取ることができる。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=102,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:102,ItemName:"carving_knife",UseTimer:50}]

# # 武器操作指南書
#     execute if entity @s[tag=Ply.Weapon.Equip.ShortSword,tag=!Ply.Weapon.Type.Tech] run give @s carrot_on_a_stick[item_name='{"text":"片手剣の指南書・地","color":"green","italic":false}',custom_name='{"text":"片手剣の指南書・地","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"片手剣の操作を確認できる。","color":"white","italic":false}','{"text":"右クリックで使用する。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=201,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:201,ItemName:"inst_ss_normal",UseTimer:50}]
#     execute if entity @s[tag=Ply.Weapon.Equip.ShortSword,tag=Ply.Weapon.Type.Tech] run give @s carrot_on_a_stick[item_name='{"text":"片手剣の指南書・天","color":"green","italic":false}',custom_name='{"text":"片手剣の指南書・天","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"片手剣の操作を確認できる。","color":"white","italic":false}','{"text":"右クリックで使用する。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=202,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:202,ItemName:"inst_ss_tec",UseTimer:50}]
#     execute if entity @s[tag=Ply.Weapon.Equip.GreatSword,tag=!Ply.Weapon.Type.Tech] run give @s carrot_on_a_stick[item_name='{"text":"大剣の指南書・地","color":"green","italic":false}',custom_name='{"text":"大剣の指南書・地","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"大剣の操作を確認できる。","color":"white","italic":false}','{"text":"右クリックで使用する。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=201,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:203,ItemName:"inst_gs_normal",UseTimer:50}]
#     execute if entity @s[tag=Ply.Weapon.Equip.GreatSword,tag=Ply.Weapon.Type.Tech] run give @s carrot_on_a_stick[item_name='{"text":"大剣の指南書・天","color":"green","italic":false}',custom_name='{"text":"大剣の指南書・天","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"大剣の操作を確認できる。","color":"white","italic":false}','{"text":"右クリックで使用する。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=202,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:204,ItemName:"inst_gs_tec",UseTimer:50}]
#     execute if entity @s[tag=Ply.Weapon.Equip.Bow,tag=!Ply.Weapon.Type.Tech] run give @s carrot_on_a_stick[item_name='{"text":"弓の指南書・地","color":"green","italic":false}',custom_name='{"text":"弓の指南書・地","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"弓の操作を確認できる。","color":"white","italic":false}','{"text":"右クリックで使用する。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=201,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:205,ItemName:"inst_bw_normal",UseTimer:50}]
#     execute if entity @s[tag=Ply.Weapon.Equip.Bow,tag=Ply.Weapon.Type.Tech] run give @s carrot_on_a_stick[item_name='{"text":"弓の指南書・天","color":"green","italic":false}',custom_name='{"text":"弓の指南書・天","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"弓の操作を確認できる。","color":"white","italic":false}','{"text":"右クリックで使用する。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=202,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:206,ItemName:"inst_bw_tec",UseTimer:50}]

# # 不動の装衣
#     give @s carrot_on_a_stick[item_name='{"text":"不動の装衣","color":"green","italic":false}',custom_name='{"text":"不動の装衣","color":"green","italic":false}',lore=['{"text":"[特殊装具]","color":"dark_purple","italic":false}','{"text":"--------------------","color":"dark_gray"}','{"text":"一定時間の間、","color":"white","italic":false}','{"text":"ノックバックを無効化する。","color":"white","italic":false}','{"text":"受けるダメージも軽減する。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=1000,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:1000,ItemName:"immovable_cloth",UseTimer:50,IsSpItem:1b}]

# # 翔蟲
#     give @s carrot_on_a_stick[item_name='{"text":"翔蟲","color":"green","italic":false}',custom_name='{"text":"翔蟲","color":"green","italic":false}',lore=['{"text":"[特殊装具]","color":"dark_purple","italic":false}','{"text":"--------------------","color":"dark_gray"}','{"text":"正面方向に糸を伸ばし、","color":"white","italic":false}','{"text":"高速で移動する。","color":"white","italic":false}','{"text":"移動中は鉄蟲糸技が使用可能。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=1001,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:1001,ItemName:"wirebug",UseTimer:50,IsSpItem:1b}]

# # 肉焼きセット
#     item replace entity @s inventory.0 with carrot_on_a_stick[item_name='{"text":"肉焼きセット","color":"green","italic":false}',custom_name='{"text":"肉焼きセット","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"使用すると肉を焼くことができる。","color":"white","italic":false}','{"text":"もう一度肉を右クリックで取り出す。","color":"white","italic":false}','{"text":"上手に焼こう。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=1,custom_model_data=103,custom_data={IsMhdpItem:1b,ItemType:3,ItemId:103,ItemName:"nikuyaki",UseTimer:50}]

# 生肉
    data modify storage api: Arg.Path set value "mhdp_items:consume_items/raw_meat"
    data modify storage api: Arg.Count set value 2
    function api:give_item.m with storage api: Arg

# クエストクリア後の時間記録用に、forceload
    forceload add -79 770
