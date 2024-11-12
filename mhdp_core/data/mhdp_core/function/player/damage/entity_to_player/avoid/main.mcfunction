#> mhdp_core:player/damage/entity_to_player/avoid/main
#
# フレーム回避成功時処理
#
# @within function mhdp_monsters:**

# 効果音
    playsound entity.player.attack.sweep master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2

# フレーム回避成功時の処理を実行
    function mhdp_items:core/switch/weapon_avoid

# 無敵時間設定
    scoreboard players set @s Ply.Timer.Avoid 0
    scoreboard players set @s Ply.Timer.DamageInterval 10

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.Avoid
