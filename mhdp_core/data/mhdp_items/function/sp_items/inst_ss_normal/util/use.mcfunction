#> mhdp_items:sp_items/inst_ss_normal/util/use
#
# 片手剣の指南書・地使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 表示
    playsound ui.button.click master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    tellraw @s [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n-----【 片手剣・地ノ型 】------------------\n\n","color":"#00FFC3","bold": true},\
        {"text":"◇剣コンボ１～５："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し\n\n","color": "#ff9900"},\
        {"text":"◇ガード："},{"text":"スニーク\n","color": "#ff9900"},\
        {"text":" ┣ ◇回転斬り："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"短押し\n","color": "#ff9900"},\
        {"text":" ┗ ◇剣盾ラッシュ："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し\n\n","color": "#ff9900"},\
        {"text":"-------------------------------------\n","color":"#00FFC3","bold": true}\
    ]
