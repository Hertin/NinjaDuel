function Zanzou( keys )
	local point = keys.target_points[1]
	local caster = keys.caster
	local ability = keys.ability
	local duration = keys.duration
	local radius = keys.radius
	local vision = keys.vision

	if not caster.zanzous then
		caster.zanzous={}
		caster.zanzouPtcls={}
	end

	caster:EmitSound("Hero_EmberSpirit.FireRemnant.Cast")
	local ptclPathZanzou='particles/units/heroes/hero_ember_spirit/ember_spirit_sleight_of_fist_caster.vpcf'
	local ptclZanzou = ParticleManager:CreateParticle(ptclPathZanzou, PATTACH_CUSTOMORIGIN, caster)
	ParticleManager:SetParticleControl(ptclZanzou,0,point)
	-- local p2='particles/skills/yingluo/yingluo_ambientfx_effigy_wm16_dire_lvl3.vpcf'
	-- local p2_c = ParticleManager:CreateParticle(p2, PATTACH_CUSTOMORIGIN, caster)
	-- ParticleManager:SetParticleControl(p2_c,0,point)
	local zanzouUnit = CreateUnitByName("zanzou",point,false,caster,caster,caster:GetTeam())
	zanzouUnit:SetDayTimeVisionRange(vision)
	zanzouUnit:SetNightTimeVisionRange(vision)

	-- print(#caster.zanzous)
	if #caster.zanzous == 3 then
		print("remove zanzou")
		ParticleManager:DestroyParticle(caster.zanzouPtcls[1],true)
		caster.zanzous[1]:RemoveSelf()
		table.remove(caster.zanzous,1)
		table.remove(caster.zanzouPtcls,1)		
	end
	print("#table",#caster.zanzous)
	caster.zanzous[#caster.zanzous+1] = zanzouUnit
	caster.zanzouPtcls[#caster.zanzouPtcls+1] = ptclZanzou
	print("#table",#caster.zanzous)

	Timers:CreateTimer(duration, function()
		-- print(duration)
		ParticleManager:DestroyParticle(ptclZanzou,true)
		zanzouUnit:RemoveSelf()
		table.remove(caster.zanzous,1)
		table.remove(caster.zanzouPtcls,1)
		return nil
	end)
end

function Zanzou_kai( keys )
	local caster = keys.caster
	local ability = keys.ability
	local radius = keys.radius


	
	if caster.zanzous and caster.zanzous[1] then
		local ptclZanzou=caster.zanzouPtcls[#caster.zanzouPtcls]
		local zanzouUnit=caster.zanzous[#caster.zanzous]
		basepoint = caster:GetAbsOrigin()
		targetpoint = zanzouUnit:GetAbsOrigin()
		caster:SetModelScale(0.1)
		local ptclPath = "particles/units/heroes/hero_ember_spirit/ember_spirit_remnant_dash.vpcf"
		local ptclFlamePath = "particles/units/heroes/hero_ember_spirit/ember_spirit_flameguard.vpcf"
		local ptcl = ParticleManager:CreateParticle(ptclPath, PATTACH_ABSORIGIN_FOLLOW, caster)
        ParticleManager:SetParticleControl(ptcl, 0, basepoint)
        ParticleManager:SetParticleControl(ptcl, 1, basepoint)
		local ptclHitPath = "particles/units/heroes/hero_ember_spirit/ember_spirit_hit.vpcf"

		ability:SetActivated(false)
		local dirction = (targetpoint - basepoint):Normalized()
		caster:SetForwardVector(dirction)

		Timers:CreateTimer(0.02, function()

				local currpoint = caster:GetAbsOrigin()
				dirction = (targetpoint - currpoint):Normalized()
				currpoint = currpoint+dirction* 35
				caster:SetAbsOrigin(currpoint)
				if (currpoint-targetpoint):Length() < 50 then
					ParticleManager:DestroyParticle(ptclZanzou,false)
					zanzouUnit:RemoveSelf()
					table.remove(caster.zanzous,#caster.zanzous)
					table.remove(caster.zanzouPtcls,#caster.zanzouPtcls)
					local ptclHit = ParticleManager:CreateParticle(ptclHitPath, PATTACH_WORLDORIGIN, nil)
					ParticleManager:SetParticleControl(ptclHit, 0, currpoint)
					print("team",caster:GetTeam())
					local targets = FindUnitsInRadius(caster:GetTeam(),currpoint,nil,300,DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_ALL,DOTA_UNIT_TARGET_FLAG_NONE,0,false)
					print("#target:",#targets)
					for i,v in ipairs(targets) do
						local damageTable = {
							victim = v,
							attacker = caster,
							damage = 100,
							damage_type = DAMAGE_TYPE_MAGICAL,
						}	
						ApplyDamage(damageTable)
					end

					

					

					-- aoe_damage(caster,caster:GetAbsOrigin(),radius)
					caster:SetModelScale(1)
					Timers:CreateTimer(0.02, function()
						
						ParticleManager:DestroyParticle(ptcl,false)
						FindClearSpaceForUnit(caster,targetpoint,false)
						ability:SetActivated(true)
        				ParticleManager:ReleaseParticleIndex( ptclHit )  
						return nil
						end)					
					return nil					
				end				
				return 0.01
			end)
	end
end