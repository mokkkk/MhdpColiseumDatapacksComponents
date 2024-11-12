#> mhdp_items:sp_items/immovable_cloth/using/start
#
# 不動の装衣の使用中処理
#
# @within function mhdp_items:sp_items/immovable_cloth/start

# 演出
    particle firework ~ ~1 ~ 0 0 0 0.2 20
    playsound item.armor.equip_chain master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1

# 防具を装着
    item replace entity @s armor.head with carrot_on_a_stick[item_name='"不動の装衣"',hide_tooltip={},custom_data={NoPickup:1b,Immovable:1b},enchantments={levels:{"minecraft:binding_curse":1}},enchantment_glint_override=false,minecraft:custom_model_data=99999] 1
    item replace entity @s armor.chest with chainmail_chestplate[item_name='"不動の装衣"',hide_tooltip={},custom_data={NoPickup:1b,Immovable:1b},enchantments={levels:{"minecraft:binding_curse":1}},enchantment_glint_override=false,trim={material:"minecraft:none",pattern:"minecraft:rocksteady",show_in_tooltip:false}] 1
