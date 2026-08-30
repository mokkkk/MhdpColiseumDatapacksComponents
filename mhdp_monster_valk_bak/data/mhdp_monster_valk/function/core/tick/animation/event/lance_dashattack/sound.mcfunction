#> mhdp_monster_valk:core/tick/animation/event/lance_bite/sound
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7
