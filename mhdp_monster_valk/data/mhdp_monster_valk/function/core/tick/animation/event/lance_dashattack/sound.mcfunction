#> mhdp_monster_valk:core/tick/animation/event/lance_dashattack/sound
#
# アニメーションイベントハンドラ 突進(体当たり)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/main

# 効果音
    playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7
