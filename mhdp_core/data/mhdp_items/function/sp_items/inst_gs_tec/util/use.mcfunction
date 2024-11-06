#> mhdp_items:sp_items/inst_ss_normal/util/use
#
# 片手剣の指南書・地使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 表示
    playsound ui.button.click master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    tellraw @s [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n-----【 大剣・天ノ型 】 ------------------\n\n","color":"#00FFC3","bold": true},\
        {"text":"〇溜め斬り："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n","color": "#ff9900"},\
        {"text":" ┗ 〇強溜め斬り："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n","color": "#ff9900"},\
        {"text":"   ┗ △真溜め斬り："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n\n","color": "#ff9900"},\
        {"text":"◇タックル："},{"text":"〇または△の攻撃の溜め中にジャンプ\n\n","color": "#ff9900"},\
        {"text":"◇相殺斬り上げ："},{"text":"〇の攻撃後、スニーク+マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n","color": "#ff9900"},\
        {"text":" ┗ ◇追撃十字斬り："},{"text":"相殺成功後、マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n","color": "#ff9900"},\
        {"text":"   ┗ ◇強溜め斬り："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n","color": "#ff9900"},\
        {"text":" ※ 相殺斬り上げは、ガード中に","color": "gray"},{"text":"マウス","color": "gray"},{"keybind":"key.use","color": "gray"},{"text":"長押しでも発動できる\n\n","color": "gray"},\
        {"text":"◇ガード："},{"text":"スニーク\n\n","color": "#ff9900"},\
        {"text":"-------------------------------------\n","color":"#00FFC3","bold": true}\
    ]
