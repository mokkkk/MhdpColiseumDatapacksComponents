#> mhdp_items:hunter_note/info/weapon_guide/show.m
#
# ハンターノート操作 武器操作説明 片手剣 地ノ型
#
# @within function mhdp_core:player/tick

# 遷移用
    $data modify storage mhdp_core:temp Temp.Dialog.Trigger set value $(Trigger)
    $data modify storage mhdp_core:temp Temp.Dialog.Value set value $(Value)

# 表示
    execute if entity @s[tag=Ply.Weapon.Equip.ShortSword,tag=!Ply.Weapon.Type.Tech] run function mhdp_items:hunter_note/info/weapon_guide/short_sword_normal.m with storage mhdp_core:temp Temp.Dialog
    execute if entity @s[tag=Ply.Weapon.Equip.ShortSword,tag=Ply.Weapon.Type.Tech] run function mhdp_items:hunter_note/info/weapon_guide/short_sword_tec.m with storage mhdp_core:temp Temp.Dialog

# 終了
    data remove storage mhdp_core:temp Temp.Dialog
