#> mhdp_items:weapons/great_sword/init
#
# 大剣の初期化処理
#
# @within function mhdp_items:/**

# 初期化
    data modify storage mhdp_core:game_data WeaponAttackData.GreatSword set value {}

# 地の型

# 天の型
    # 溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.1 set value {AttackType:"Cut",DamageMult:80,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:100,DragonAuraValue:0,IsDecreseSharpness:true}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.2 set value {AttackType:"Cut",DamageMult:120,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:120,DragonAuraValue:0,IsDecreseSharpness:true}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.3 set value {AttackType:"Cut",DamageMult:160,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true}
    # 強溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.High.0 set value {AttackType:"Cut",DamageMult:100,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:100,DragonAuraValue:0,IsDecreseSharpness:true}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.High.1 set value {AttackType:"Cut",DamageMult:250,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:120,DragonAuraValue:0,IsDecreseSharpness:true}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.High.2 set value {AttackType:"Cut",DamageMult:280,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.High.3 set value {AttackType:"Cut",DamageMult:350,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true}
    # 真溜め斬り
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.0 set value {AttackType:"Cut",DamageMult:350,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:100,DragonAuraValue:0,IsDecreseSharpness:true}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.1 set value {AttackType:"Cut",DamageMult:380,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:120,DragonAuraValue:0,IsDecreseSharpness:true}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.2 set value {AttackType:"Cut",DamageMult:400,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true}
        data modify storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.3 set value {AttackType:"Cut",DamageMult:500,PartDamageMult:100,ElementDamageMult:100,StunValue:0,TireValue:150,DragonAuraValue:0,IsDecreseSharpness:true}
