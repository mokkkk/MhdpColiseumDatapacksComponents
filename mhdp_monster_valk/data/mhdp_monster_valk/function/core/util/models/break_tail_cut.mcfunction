#> mhdp_monster_valk:core/util/models/break_tail_cut
#
# 尻尾切断時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink
#
# TODO: item_model の値は仮のプレースホルダ。AJ 再エクスポート後の実際の aj_sub / blueprint モデル名に差し替えること。

# モデル変更
    function animated_java_valk:valk/as_node {name: 'tail_3', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/tail_3_cut"'\
    }
