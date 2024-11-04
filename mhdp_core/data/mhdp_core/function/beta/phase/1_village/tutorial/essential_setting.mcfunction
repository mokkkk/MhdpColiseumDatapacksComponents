#> mhdp_core:beta/phase/1_village/tutorial/essential_setting
#
# ベータ版処理 チュートリアル再生開始
#
# @within function mhdp_core:phase/1_village/change_phase/check

# メッセージ
    execute as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：必須設定 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  本マップをプレイするうえで、必須設定は以下の通りです。\n"},\
        {"text":"  ・ビデオ設定 > 演算距離は 12チャンク以上 にすること\n","color": "#ff9900","bold": true},\
        {"text":"    マルチプレイの場合、server.propertiesに以下の設定を書く\n","color": "#ff9900","bold": true},\
        {"text":"       - simulation-distance=12\n","color": "#ff9900","bold": true},\
        {"text":"  ・言語設定 > フォント設定から、\n","color": "#ff9900","bold": true},\
        {"text":"    Unicodeフォントを強制する を オフ に設定すること\n","color": "#ff9900","bold": true},\
        {"text":"  ・専用リソースパックを適用すること\n","color": "#ff9900","bold": true}\
    ]

# フラグ更新
    data modify storage mhdp_core:save_data Flag.BetaShowEssential set value true
