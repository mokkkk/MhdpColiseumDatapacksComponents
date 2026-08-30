#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 壁に当たるまで再帰
    scoreboard players set #mhdp_temp_valk_beam_count MhdpCore 30
    function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam_loop
    scoreboard players reset #mhdp_temp_valk_beam_count MhdpCore
