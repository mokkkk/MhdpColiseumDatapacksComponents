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
        {"text":"〇通常コンボ１："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"短押し\n","color": "#ffc49d"},\
        {"text":" ┗ 〇通常コンボ２："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"短押し\n","color": "#ffc49d"},\
        {"text":"   ┗ ☆通常コンボ３："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"短押し\n\n","color": "#ffc49d"},\
        {"text":"〇水平斬りコンボ１："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"長押し\n","color": "#ffc49d"},\
        {"text":" ┗ 〇水平斬りコンボ２："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n","color": "#ffc49d"},\
        {"text":"   ┗ ☆水平斬りコンボ３："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n","color": "#ffc49d"},\
        {"text":"※ 水平斬りコンボは、通常コンボの任意のタイミングで使用できる\n\n"},\
        {"text":"〇盾攻撃コンボ１："},{"text":"スニーク中にマウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n","color": "#ffc49d"},\
        {"text":" ┗ 〇盾攻撃コンボ２："},{"text":"スニーク中にマウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n","color": "#ffc49d"},\
        {"text":"   ┗ ☆盾攻撃コンボ３："},{"text":"スニーク中にマウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n","color": "#ffc49d"},\
        {"text":"※ 盾攻撃コンボは、通常・水平斬りコンボの任意のタイミングで使用できる\n\n"},\
        {"text":"◇回転斬り："},{"text":"〇の攻撃後、","color": "#ffc49d"},{"keybind":"key.sneak","color": "#ffc49d"},{"text":"+マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"同時押し\n","color": "#ffc49d"},\
        {"text":"◇旋刈り："},{"text":"☆の攻撃後、","color": "#ffc49d"},{"keybind":"key.sneak","color": "#ffc49d"},{"text":"+マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"同時押し\n\n","color": "#ffc49d"},\
        {"text":"◇ガード："},{"text":"スニーク\n","color": "#ffc49d"},\
        {"text":" ┗ ◇ジャストガード："},{"text":"モンスターの攻撃に合わせてタイミング良くガード\n","color": "#ffc49d"},\
        {"text":"   ┗ ☆カウンター斬り："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n\n","color": "#ffc49d"},\
        {"text":"◇バックステップ："},{"text":"任意の攻撃後、スニーク+ジャンプ\n","color": "#ffc49d"},\
        {"text":" ┣ ◇突進斬り："},{"text":"無操作で自動的に発動、または抜刀攻撃\n","color": "#ffc49d"},\
        {"text":" ┣ ◇ジャストラッシュ１："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"短押し\n","color": "#ffc49d"},\
        {"text":" ┃  ┗ ◇ジャストラッシュ２："},{"text":"タイミング良くマウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n","color": "#ffc49d"},\
        {"text":" ┃    ┗ ◇ジャストラッシュ３："},{"text":"タイミング良くマウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n","color": "#ffc49d"},\
        {"text":" ┃      ┗ ◇ジャストラッシュ４："},{"text":"タイミング良くマウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n","color": "#ffc49d"},\
        {"text":" ┗ ◇溜め斬り："},{"text":"マウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"長押し後、離す\n\n","color": "#ffc49d"},\
        {"text":"◇駆け上がり斬り："},{"text":"ジャストラッシュまたは溜め斬り命中時、自動で発動\n","color": "#ffc49d"},\
        {"text":" ┗ ◇フォールバッシュ："},{"text":"空中でマウス","color": "#ffc49d"},{"keybind":"key.use","color": "#ffc49d"},{"text":"\n\n","color": "#ffc49d"},\
        {"text":"-------------------------------------\n","color":"#00FFC3","bold": true}\
    ]
