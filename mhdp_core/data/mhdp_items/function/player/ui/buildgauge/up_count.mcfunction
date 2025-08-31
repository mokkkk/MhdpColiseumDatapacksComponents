#> mhdp_items:player/ui/buildgauge/up_count
#
# UI表示処理等 建材ゲージ関連
#

# スコア増加
    scoreboard players add @s Ply.Stats.BuildGauge.Count 1

# 演出
    playsound entity.item.pickup master @s ~ ~ ~ 1 1.5
    scoreboard players set @s Ply.Timer.BuildGaugeAnimation 3
