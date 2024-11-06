#> mhdp_items:sp_items/inst_ss_normal/util/use
#
# 片手剣の指南書・地使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 表示
    playsound ui.button.click master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    tellraw @s [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n-----【 弓・地ノ型 】---------------------\n\n","color":"#00FFC3","bold": true},\
        {"text":"◇溜め："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し\n","color": "#ff9900"},\
        {"text":" ┗ ◇射撃："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"離す\n\n","color": "#ff9900"},\
        {"text":"◇竜の一矢："},{"text":"スニーク+マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n","color": "#ff9900"},\
        {"text":" ┗ ◇竜の千々矢："},{"text":"竜の一矢溜め完了後、さらにマウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n\n","color": "#ff9900"},\
        {"text":"-------------------------------------\n","color":"#00FFC3","bold": true}\
    ]
