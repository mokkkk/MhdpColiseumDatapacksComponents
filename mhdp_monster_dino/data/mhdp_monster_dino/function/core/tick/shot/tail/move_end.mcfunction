#> mhdp_monster_dino:core/tick/shot/tail/move_end
#
# 尻尾tick処理
#
# @within function mhdp_monster_dino:core/tick/shot/tail/tick

# 剥ぎ取り可能にする
    tag @s add Mns.State.IsCanCarving
    scoreboard players set @s Mns.General.Carving.Count 1
    scoreboard players set @s Mns.Uid 1002

# 演出
    particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 終了
    tag @s remove Mns.Shot.Dino.Tail
