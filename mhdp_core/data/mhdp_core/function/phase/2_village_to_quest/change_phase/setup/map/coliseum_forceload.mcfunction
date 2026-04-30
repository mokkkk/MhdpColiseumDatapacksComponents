#> mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum_forceload
#
# マップのforceload処理
#
# @within function mhdp_core:phase/2_village_to_quest/start/quest/main

tellraw @a {text:"【ERROR】 旧バージョンのフィールドforceload処理が呼び出されています",color:"red"}

# forceload
    forceload add -167 37 251 100
    forceload add -167 101 251 184
