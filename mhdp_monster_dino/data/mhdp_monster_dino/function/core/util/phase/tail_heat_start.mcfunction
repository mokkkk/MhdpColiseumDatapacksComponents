#> mhdp_monster_dino:core/util/phase/tail_heat_start
#
# 尻尾の加熱
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s add Mns.Dino.State.TailHeat

# 部位ID更新
    scoreboard players set @e[type=slime,tag=Mns.HitBox.Dino.Tail] Mns.Hitbox.PartId 6

# モデル変更
    function mhdp_monster_dino:core/util/models/heat_start
