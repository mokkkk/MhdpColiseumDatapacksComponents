#> mhdp_core:beta/phase/1_village/tutorial/review/12_monster_item
#
# ベータ版処理 チュートリアル再生
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 1
    execute if score @s Ply.Ope.TutorialTrigger matches 110 run \
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n【 チュートリアル：剥ぎ取り ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  討伐したモンスターの中央に近づき、"},{"text":"剝ぎ取りナイフ","color": "#ff9900","bold": true},{"text": " を使うと、\n"},\
        {"text":"  モンスターの素材が入手できます。\n"},\
        {"text":"  剝ぎ取りナイフは、部位破壊した尻尾などに対しても使用できます。\n"},\
        {"text":"  剝ぎ取りは、狩人の醍醐味です。\n"},\
        {"text":"\n  "},\
        {"text":"l","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},{"text":"                                                            "},\
        {"text":"r","clickEvent":{"action":"run_command","value":"/return 0"},"color": "#7a7a7a","font":"icons/book"},\
        {"text":"\n"}\
    ]
