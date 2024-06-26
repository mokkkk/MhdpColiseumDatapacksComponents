#> mhdp_items:core/switch/weapon_sheathe
# 
# 分岐処理 各武器の納刀処理
#
# @within function mhdp_items:/**

# サブ武器消去
    clear @s ender_eye[custom_data~{IsSubWeapon:1b}]

# 効果音
    execute at @s run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    
# 念のためデータ取得
    function mhdp_core:player/data/load_data

# 分岐処理
    data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.WeaponTypePrefix
    function mhdp_items:core/switch/macro/m.sheathe with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
