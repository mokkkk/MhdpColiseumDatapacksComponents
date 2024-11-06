#> mhdp_items:sp_items/inst_ss_normal/util/use
#
# 片手剣の指南書・地使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 表示
    playsound ui.button.click master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    tellraw @s [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"\n-----【 片手剣・天ノ型】 --------------------\n\n","color":"#00FFC3","bold": true},\
        {"text":"〇溜め："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し\n","color": "#ff9900"},\
        {"text":" ┗ 〇射撃："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"離す\n","color": "#ff9900"},\
        {"text":"   ┗ 〇剛射："},{"text":"スニーク+マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"短押し\n","color": "#ff9900"},\
        {"text":" ※ 最大レベル以外の射撃後、","color": "gray"},{"text":"マウス","color": "gray"},{"keybind":"key.use","color": "gray"},{"text":"長押しで溜めに移行する\n\n","color": "gray"},\
        {"text":"◇竜の一矢："},{"text":"射撃または剛射後、スニーク+マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す\n\n","color": "#ff9900"},\
        {"text":"◇チャージステップ："},{"text":"〇の攻撃後、ジャンプ\n","color": "#ff9900"},\
        {"text":" ┣ 〇溜め："},{"text":"マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し\n","color": "#ff9900"},\
        {"text":" ┗ 〇射撃："},{"text":"無操作\n\n","color": "#ff9900"},\
        {"text":"◇ビン装填："},{"text":"スニーク+マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"短押し(仕込み矢ゲージ1本消費)\n\n","color": "#ff9900"},\
        {"text":"◇導ノ矢："},{"text":"スニーク+マウス","color": "#ff9900"},{"keybind":"key.use","color": "#ff9900"},{"text":"長押し→離す(仕込み矢ゲージ1本消費)\n\n","color": "#ff9900"},\
        {"text":"-------------------------------------\n","color":"#00FFC3","bold": true}\
    ]
