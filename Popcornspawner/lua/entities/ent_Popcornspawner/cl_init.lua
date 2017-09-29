include("shared.lua")

function ENT:Draw()
    self.Entity:DrawModel()

	end

surface.CreateFont( "edyhomo", {
	font = "trebuchet18",
	size = 80,
	weight = 1000,
	antialias = true,
})

surface.CreateFont( "edyhomo1", {
	font = "trebuchet18",
	size = 40,
	weight = 1000,
	antialias = true,
})

function ENT:Initialize ()
	self.aps = 40
	self.lastRot = CurTime()
	self.curRot = 0
end

function ENT:Draw()
	
	local Maxs = self:LocalToWorld(self:OBBMaxs())
	local EntPos = self:GetPos()
	local TextPos = Vector(EntPos.x,EntPos.y,Maxs.z+9)
	
	cam.Start3D2D(TextPos, Angle(180, self.curRot, -90), .1)
		draw.SimpleText("Popcorn", "edyhomo",0, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	cam.End3D2D()	
	cam.Start3D2D(TextPos, Angle(180, self.curRot + 180, -90), .1)
		draw.SimpleText("Popcorn", "edyhomo",0, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()

	local TextPos = Vector(EntPos.x,EntPos.y,Maxs.z+3)

	cam.Start3D2D(TextPos, Angle(180, self.curRot, -90), .1)
		draw.SimpleText("Press E", "edyhomo1",0, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	cam.End3D2D()	
	cam.Start3D2D(TextPos, Angle(180, self.curRot + 180, -90), .1)
		draw.SimpleText("Press E", "edyhomo1",0, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()		
	
	self:DrawModel()	
end

function ENT:OnRemove( )
end	