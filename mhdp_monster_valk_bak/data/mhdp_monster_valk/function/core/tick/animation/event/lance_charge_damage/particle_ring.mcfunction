#> mhdp_monster_valk:core/tick/animation/event/lance_charge/particle_ring
#
# アニメーションイベントハンドラ 龍気吸引
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 演出
    playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.5
    playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.5
    particle end_rod ^0 ^ ^-15 ^0 ^0 ^1500000000 0.000000001 0 force
    particle end_rod ^4.63525 ^ ^-14.26585 ^-463525000 ^0 ^1426585000 0.000000001 0 force
    particle end_rod ^8.81678 ^ ^-12.13525 ^-881678000 ^0 ^1213525000 0.000000001 0 force
    particle end_rod ^12.13525 ^ ^-8.81678 ^-1213525000 ^0 ^881678000 0.000000001 0 force
    particle end_rod ^14.26585 ^ ^-4.63525 ^-1426585000 ^0 ^463525000 0.000000001 0 force
    particle end_rod ^15 ^ ^0 ^-1500000000 ^0 ^0 0.000000001 0 force
    particle end_rod ^14.26585 ^ ^4.63525 ^-1426585000 ^0 ^-463525000 0.000000001 0 force
    particle end_rod ^12.13525 ^ ^8.81678 ^-1213525000 ^0 ^-881678000 0.000000001 0 force
    particle end_rod ^8.81678 ^ ^12.13525 ^-881678000 ^0 ^-1213525000 0.000000001 0 force
    particle end_rod ^4.63525 ^ ^14.26585 ^-463525000 ^0 ^-1426585000 0.000000001 0 force
    particle end_rod ^0 ^ ^15 ^0 ^0 ^-1500000000 0.000000001 0 force
    particle end_rod ^-4.63525 ^ ^14.26585 ^463525000 ^0 ^-1426585000 0.000000001 0 force
    particle end_rod ^-8.81678 ^ ^12.13525 ^881678000 ^0 ^-1213525000 0.000000001 0 force
    particle end_rod ^-12.13525 ^ ^8.81678 ^1213525000 ^0 ^-881678000 0.000000001 0 force
    particle end_rod ^-14.26585 ^ ^4.63525 ^1426585000 ^0 ^-463525000 0.000000001 0 force
    particle end_rod ^-15 ^ ^0 ^1500000000 ^0 ^0 0.000000001 0 force
    particle end_rod ^-14.26585 ^ ^-4.63525 ^1426585000 ^0 ^463525000 0.000000001 0 force
    particle end_rod ^-12.13525 ^ ^-8.81678 ^1213525000 ^0 ^881678000 0.000000001 0 force
    particle end_rod ^-8.81678 ^ ^-12.13525 ^881678000 ^0 ^1213525000 0.000000001 0 force
    particle end_rod ^-4.63525 ^ ^-14.26585 ^463525000 ^0 ^1426585000 0.000000001 0 force
