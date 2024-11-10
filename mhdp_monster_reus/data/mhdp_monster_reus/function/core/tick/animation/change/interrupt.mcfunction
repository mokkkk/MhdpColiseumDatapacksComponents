#> mhdp_monster_reus:core/tick/animation/change/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    # tag @s add Anim.Fly.Flame.Vertical
    # function mhdp_monster_reus:core/tick/animation/change/play/move
    function animated_java:reus_aj/animations/fly_damage_counter_start/tween {duration:1, to_frame: 1}

# 軸合わせ
    # tag @s add Mns.Temp.IsTurn
    # scoreboard players set @s Mns.General.TurnCount 2

# アニメーション変更
    # function mhdp_monster_reus:core/tick/animation/change/main
