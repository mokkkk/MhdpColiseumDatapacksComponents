#> mhdp_monsters:core/switch/macro/m.damage
# 
# 分岐処理 モンスター被ダメージ処理 本体
#
# @within function mhdp_monsters:core/switch/remove

# 対象のモンスターの被ダメージ処理を実行
    $execute as @e[type=item_display,tag=Mns.Root.$(UpperName)] run function mhdp_monster_$(Prefix):core/damage/damage
