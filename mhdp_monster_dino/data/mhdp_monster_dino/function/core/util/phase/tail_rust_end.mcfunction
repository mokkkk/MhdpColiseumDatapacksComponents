#> mhdp_monster_dino:core/util/phase/tail_rust_check
#
# 尻尾の風化
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# カウントリセット
    scoreboard players set @s Mns.Dino.PhaseCount.Tail 0

# 状態更新(一時)
    tag @s remove Mns.Dino.State.TailRust

# 部位ID更新
    scoreboard players set @e[type=slime,tag=Mns.HitBox.Dino.Tail] Mns.Hitbox.PartId 2

# モデル変更
    function mhdp_monster_dino:core/util/models/rust_end
