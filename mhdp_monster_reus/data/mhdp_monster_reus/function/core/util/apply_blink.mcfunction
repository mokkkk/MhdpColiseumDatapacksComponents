#> mhdp_monster_reus:core/util/apply_blink
#
# まばたき開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    # 通常
    execute if entity @s[tag=!Mns.Break.Head] run function animated_java_reus:reus/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/reus/head_upper_blink"'\
    }
    # 怒り・部位破壊などでモデルが変わる場合は、状態タグの組み合わせごとに分岐を追加する
    # (例: Mns.Break.Head → "minecraft:aj_sub/reus/head_upper_break_blink")
