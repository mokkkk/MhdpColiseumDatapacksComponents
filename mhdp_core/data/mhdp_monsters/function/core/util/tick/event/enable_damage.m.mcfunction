#> mhdp_monsters:core/util/tick/event/enable_damage.m
# 
# 汎用処理 ダメージ有効化
#
# @input arg Monster モンスター名

# ダメージ有効化タグ付与
    $function animated_java:$(Name)/as_all_locators {command:'execute if entity @s[type=slime,tag=Mns.HitBox] run tag @s add Entity.EnableDamage'}
