#> mhdp_core:phase/3_quest/map/coliseum/remove_redstone
#
# クエスト中のtick処理 大闘技場
#
# @within function mhdp_core:phase/3_quest/tick

tellraw @a {text:"【ERROR】 旧バージョンのフィールドtick処理が呼び出されています",color:"red"}

# レッドストーントーチの削除
    setblock 216 65 147 stone
