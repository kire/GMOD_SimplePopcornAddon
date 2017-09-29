AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()

	self:SetModel("models/teh_maestro/popcorn.mdl")
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType( SIMPLE_USE )
	
	local phys = self:GetPhysicsObject()

	if phys:IsValid() then

		phys:Wake()

	end	

end

function ENT:Use(_, pPlayer)
	if (pPlayer:HasWeapon("weapon_popcorn")) then
		pPlayer:ChatPrint("You already have popcorn!")
	elseif ((pPlayer:getDarkRPVar("money") or 0) < 100) then
		pPlayer:ChatPrint("You cant afford popcorn!")
	else
		pPlayer:addMoney(-100)
		pPlayer:Give("weapon_popcorn")
	end
end