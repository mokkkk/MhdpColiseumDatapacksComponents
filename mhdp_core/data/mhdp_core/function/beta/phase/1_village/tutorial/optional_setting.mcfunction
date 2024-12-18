#> mhdp_core:beta/phase/1_village/tutorial/optional_setting
#
# ベータ版処理 チュートリアル再生開始
#
# @within function mhdp_core:phase/1_village/change_phase/check

# メッセージ
    execute as @a[tag=!Ply.State.PlayingQuest] at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
    tellraw @a[tag=!Ply.State.PlayingQuest] [\
        {"text":"","color": "#FFFFFF","bold": false},\
        {"text":"【 チュートリアル：推奨設定 ","color":"#00FFC3","bold": true},{"text":"1/1","color":"#00FFC3","bold": false},{"text":" 】\n\n","color":"#00FFC3","bold": true},\
        {"text":"  本マップでの推奨設定は以下の通りです。\n"},\
        {"text":"  ・ビデオ設定 > 描画距離は 12チャンク以上 にすること\n","color": "#ff9900","bold": true},\
        {"text":"  ・ビデオ設定 > パーティクルの表示は すべて にすること\n","color": "#ff9900","bold": true},\
        {"text":"  ・サウンド設定 > 主音量をうるさくない程度に調整すること\n","color": "#ff9900","bold": true},\
        {"text":"  ・できれば一人称視点でプレイすること\n","color": "#ff9900","bold": true}\
    ]

# フラグ更新
    data modify storage mhdp_core:save_data Flag.BetaShowOptional set value true
