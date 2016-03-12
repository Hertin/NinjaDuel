function Water_Shunshinjutsu( key )
	local caster = key.caster;
	local scale = caster:GetModelScale();
	caster:SetModelScale(0.1);
	Timers:CreateTimer( 1.0 , function()
           caster:SetModelScale(1)
       end)
end