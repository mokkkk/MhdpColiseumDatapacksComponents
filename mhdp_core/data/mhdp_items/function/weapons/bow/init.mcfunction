#> mhdp_items:weapons/bow/init
#
# 弓の初期化処理
#
# @within function mhdp_items:/**

# 初期化
    data modify storage mhdp_core:game_data WeaponAttackData.Bow set value {}

# 地の型

# 天の型
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.1 set value {AttackType:Shot,DamageMult:10,PartDamageMult:100,ElementDamageMult:50,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.2 set value {AttackType:Shot,DamageMult:7,PartDamageMult:100,ElementDamageMult:70,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.3 set value {AttackType:Shot,DamageMult:8,PartDamageMult:100,ElementDamageMult:90,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.4 set value {AttackType:Shot,DamageMult:10,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.1.Crit set value {AttackType:Shot,DamageMult:21,PartDamageMult:100,ElementDamageMult:80,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.2.Crit set value {AttackType:Shot,DamageMult:15,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.3.Crit set value {AttackType:Shot,DamageMult:16,PartDamageMult:100,ElementDamageMult:125,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.4.Crit set value {AttackType:Shot,DamageMult:20,PartDamageMult:100,ElementDamageMult:135,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}

    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.1 set value {AttackType:Cut,DamageMult:10,PartDamageMult:100,ElementDamageMult:15,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:false,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.2 set value {AttackType:Cut,DamageMult:12,PartDamageMult:100,ElementDamageMult:20,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:false,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.3 set value {AttackType:Cut,DamageMult:14,PartDamageMult:100,ElementDamageMult:30,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:false,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.4 set value {AttackType:Cut,DamageMult:18,PartDamageMult:100,ElementDamageMult:30,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:false,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.1.Crit set value {AttackType:Cut,DamageMult:18,PartDamageMult:100,ElementDamageMult:30,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:false,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.2.Crit set value {AttackType:Cut,DamageMult:20,PartDamageMult:100,ElementDamageMult:38,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:false,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.3.Crit set value {AttackType:Cut,DamageMult:22,PartDamageMult:100,ElementDamageMult:50,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:false,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    data modify storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.4.Crit set value {AttackType:Cut,DamageMult:25,PartDamageMult:100,ElementDamageMult:50,StunValue:0,TireValue:2,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:false,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}

say -- 弓データ初期化