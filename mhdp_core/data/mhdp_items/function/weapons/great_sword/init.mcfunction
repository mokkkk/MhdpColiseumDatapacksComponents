#> mhdp_items:weapons/great_sword/init
#
# 大剣の初期化処理
#
# @within function mhdp_items:/**

# 初期化
    data modify storage mhdp_core:game_data WeaponAttackData.GreatSword set value {}

# 地の型
    # 直接攻撃
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.DirectAttack set value {AttackType:"Cut",DamageMult:50,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.02,IsVfxStrong:false,VfxScale:[3f,4f,3f]}
    # 溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargeSlash.1 set value {AttackType:"Cut",DamageMult:80,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:100,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargeSlash.2 set value {AttackType:"Cut",DamageMult:110,PartDamageMult:100,ElementDamageMult:130,StunValue:0,TireValue:120,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargeSlash.3 set value {AttackType:"Cut",DamageMult:180,PartDamageMult:100,ElementDamageMult:150,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:true,VfxScale:[6f,6f,6f]}
    # 空中溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargeSlash.Air.1 set value {AttackType:"Cut",DamageMult:100,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:200,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,8f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargeSlash.Air.2 set value {AttackType:"Cut",DamageMult:140,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:220,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,8f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargeSlash.Air.3 set value {AttackType:"Cut",DamageMult:195,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:250,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,8f,5f]}
    # タックル
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.Tackle.1 set value {AttackType:"Blow",DamageMult:50,PartDamageMult:100,ElementDamageMult:0,StunValue:30,TireValue:200,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:false}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.Tackle.2 set value {AttackType:"Blow",DamageMult:60,PartDamageMult:100,ElementDamageMult:0,StunValue:40,TireValue:200,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:false}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.Tackle.3 set value {AttackType:"Blow",DamageMult:80,PartDamageMult:100,ElementDamageMult:0,StunValue:55,TireValue:200,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:false}

# 天の型
    # 直接攻撃
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.DirectAttack set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.02,IsVfxStrong:false,VfxScale:[3f,4f,3f]}
    # 溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.1 set value {AttackType:"Cut",DamageMult:80,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:100,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.2 set value {AttackType:"Cut",DamageMult:100,PartDamageMult:100,ElementDamageMult:130,StunValue:0,TireValue:120,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.3 set value {AttackType:"Cut",DamageMult:165,PartDamageMult:100,ElementDamageMult:150,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
    # 強溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.High.1 set value {AttackType:"Cut",DamageMult:110,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:120,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:0.2,IsVfxStrong:false,VfxScale:[5f,6f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.High.2 set value {AttackType:"Cut",DamageMult:170,PartDamageMult:100,ElementDamageMult:130,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:0.2,IsVfxStrong:false,VfxScale:[5f,6f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.High.3 set value {AttackType:"Cut",DamageMult:220,PartDamageMult:100,ElementDamageMult:150,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:0.2,IsVfxStrong:false,VfxScale:[5f,6f,5f]}
    # 真溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.1 set value {AttackType:"Cut",DamageMult:300,PartDamageMult:150,ElementDamageMult:100,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.3,IsVfxStrong:true,VfxScale:[6f,10f,6f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.2 set value {AttackType:"Cut",DamageMult:400,PartDamageMult:150,ElementDamageMult:130,StunValue:0,TireValue:220,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.3,IsVfxStrong:true,VfxScale:[6f,10f,6f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.3 set value {AttackType:"Cut",DamageMult:520,PartDamageMult:150,ElementDamageMult:150,StunValue:0,TireValue:350,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.3,IsVfxStrong:true,VfxScale:[6f,10f,6f]}
    # 空中溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Air.1 set value {AttackType:"Cut",DamageMult:100,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:200,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,8f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Air.2 set value {AttackType:"Cut",DamageMult:140,PartDamageMult:100,ElementDamageMult:130,StunValue:0,TireValue:220,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,8f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Air.3 set value {AttackType:"Cut",DamageMult:195,PartDamageMult:100,ElementDamageMult:150,StunValue:0,TireValue:250,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.05,IsVfxStrong:false,VfxScale:[5f,8f,5f]}
    # タックル
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Tackle.1 set value {AttackType:"Blow",DamageMult:50,PartDamageMult:100,ElementDamageMult:0,StunValue:30,TireValue:200,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:false}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Tackle.2 set value {AttackType:"Blow",DamageMult:60,PartDamageMult:100,ElementDamageMult:0,StunValue:40,TireValue:200,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:false}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Tackle.3 set value {AttackType:"Blow",DamageMult:80,PartDamageMult:100,ElementDamageMult:0,StunValue:55,TireValue:200,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:false}
