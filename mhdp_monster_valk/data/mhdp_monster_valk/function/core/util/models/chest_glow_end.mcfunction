#> mhdp_monster_valk:core/util/models/chest_glow_end
#
# 胸発光終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink
#
# TODO: item_model の値は仮のプレースホルダ。AJ 再エクスポート後の実際の aj_sub / blueprint モデル名に差し替えること。

# モデル変更
    function animated_java_valk:valk/as_node {name: 'body_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/body_0"'\
    }
