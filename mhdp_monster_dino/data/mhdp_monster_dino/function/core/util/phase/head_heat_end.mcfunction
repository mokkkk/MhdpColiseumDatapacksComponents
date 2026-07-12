#> mhdp_monster_dino:core/util/phase/head_heat_end
#
# 喉赤熱化から通常に戻るまで
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s remove Mns.Dino.State.HeadHeat

# 部位ID更新
    scoreboard players set @e[type=slime,tag=Mns.HitBox.Dino.Head] Mns.Hitbox.PartId 0

# モデル変更
    function mhdp_monster_dino:core/util/models/charge_end
