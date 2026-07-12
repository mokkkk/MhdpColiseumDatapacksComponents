#> mhdp_monster_dino:core/util/phase/head_heat
#
# 喉赤熱化から通常に戻るまで
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# カウントセット
    scoreboard players set @s Mns.Dino.PhaseCount.Head 30

# 状態更新
    tag @s add Mns.Dino.State.HeadHeat

# 部位ID更新
    scoreboard players set @e[type=slime,tag=Mns.HitBox.Dino.Tail] Mns.Hitbox.PartId 6

# モデル変更
    function mhdp_monster_dino:core/util/models/charge_start
