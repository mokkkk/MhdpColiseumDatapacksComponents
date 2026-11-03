#> mhdp_monster_reus:core/util/end_blink
#
# まばたき終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.end_blink

# モデル変更
    # 通常
    execute if entity @s[tag=!Mns.Break.Head] run function animated_java_reus:reus/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_reus:blueprint/reus/head_upper"'\
    }
    # apply_blink に分岐を追加したら、こちらにも対応する戻し先モデルを追加する
    # (例: Mns.Break.Head → "minecraft:aj_sub/reus/head_upper_break")
