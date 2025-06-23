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

# 剝ぎ取りナイフ
    data modify storage api: Arg.Path set value "mhdp_items:sp_items/carving_knife"
    data modify storage api: Arg.Count set value 1
    function api:give_item.m with storage api: Arg

# 武器操作指南書
    execute if entity @s[tag=Ply.Weapon.Equip.ShortSword,tag=!Ply.Weapon.Type.Tech] run data modify storage api: Arg.Path set value "mhdp_items:sp_items/inst_ss_normal"
    execute if entity @s[tag=Ply.Weapon.Equip.ShortSword,tag=Ply.Weapon.Type.Tech] run data modify storage api: Arg.Path set value "mhdp_items:sp_items/inst_ss_tec"
    execute if entity @s[tag=Ply.Weapon.Equip.GreatSword,tag=!Ply.Weapon.Type.Tech] run data modify storage api: Arg.Path set value "mhdp_items:sp_items/inst_gs_normal"
    execute if entity @s[tag=Ply.Weapon.Equip.GreatSword,tag=Ply.Weapon.Type.Tech] run data modify storage api: Arg.Path set value "mhdp_items:sp_items/inst_gs_tec"
    execute if entity @s[tag=Ply.Weapon.Equip.Bow,tag=!Ply.Weapon.Type.Tech] run data modify storage api: Arg.Path set value "mhdp_items:sp_items/inst_bw_normal"
    execute if entity @s[tag=Ply.Weapon.Equip.Bow,tag=Ply.Weapon.Type.Tech] run data modify storage api: Arg.Path set value "mhdp_items:sp_items/inst_bw_tec"
    data modify storage api: Arg.Count set value 1
    function api:give_item.m with storage api: Arg

# 不動の装衣
    data modify storage api: Arg.Path set value "mhdp_items:sp_items/immovable_cloth"
    data modify storage api: Arg.Count set value 1
    function api:give_item.m with storage api: Arg

# 翔蟲
    data modify storage api: Arg.Path set value "mhdp_items:sp_items/wirebug"
    data modify storage api: Arg.Count set value 1
    function api:give_item.m with storage api: Arg

# 肉焼きセット
    data modify storage api: Arg.Path set value "mhdp_items:sp_items/nikuyaki"
    data modify storage api: Arg.Count set value 1
    function api:give_item.m with storage api: Arg

# 生肉
    data modify storage api: Arg.Path set value "mhdp_items:consume_items/raw_meat"
    data modify storage api: Arg.Count set value 2
    function api:give_item.m with storage api: Arg

# クエストクリア後の時間記録用に、forceload
    forceload add -79 770
