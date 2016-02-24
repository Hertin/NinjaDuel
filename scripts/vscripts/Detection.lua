function Detection( key )
	local caster = key.caster;
	local targets = key.target_entities;
	for i,unit in pairs(targets) do
		local startpoint=caster:GetAbsOrigin();
		local endpoint=unit:GetAbsOrigin();
		local vector=endpoint-startpoint;
		local info={
        	EffectName = "particles/econ/items/mirana/mirana_crescent_arrow/mirana_spell_crescent_arrow.vpcf",
        	vSpawnOrigin = caster:GetAbsOrigin(),
        	fDistance = vector:Length(),
        	fStartRadius = 125,
        	fEndRadius = 125,
        	Source = caster,
        	bHasFrontalCone = false,
        	bReplaceExisting = false,
        	iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        	iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
        	iUnitTargetType = DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO,
        	fExpireTime = GameRules:GetGameTime() + 20.0,
			bDeleteOnHit = true,
			vVelocity = vector:Normalized() * 675,
			bProvidesVision = true,
			iVisionRadius = 300,
			iVisionTeamNumber = caster:GetTeamNumber()
		}
		ProjectileManager:CreateLinearProjectile(info)
    end
end