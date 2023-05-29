---wip types

---@class OxStash
---@field name string
---@field label string
---@field owner? boolean | string | number
---@field slots number
---@field weight number
---@field groups? string | string[] | { [string]: number }
---@field blip? { id: number, colour: number, scale: number }
---@field coords? vector3
---@field target? { loc: vector3, length: number, width: number, heading: number, minZ: number, maxZ: number, distance: number, debug?: boolean, drawSprite?: boolean }

return {
	{
		coords = vec3(378.79818725586, -1606.4309082031, 29.292371749878),
		target = {
			loc = vec3(451.25, -994.28, 30.69),
			length = 1.2,
			width = 5.6,
			heading = 0,
			minZ = 29.49,
			maxZ = 32.09,
			label = 'Abrir locker personal'
		},
		name = 'policelocker',
		label = 'Locker Personal | P.F.A',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = shared.police
	},
	
	{
		coords = vec3(-441.92346191406, 5987.0053710938, 31.716220855713),
		target = {
			loc = vec3(451.25, -994.28, 30.69),
			length = 1.2,
			width = 5.6,
			heading = 0,
			minZ = 29.49,
			maxZ = 32.09,
			label = 'Abrir locker personal'
		},
		name = 'gnalocker',
		label = 'Locker Personal | G.N.A',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['gna'] = 0}
	},

	{
		coords = vec3(301.3, -600.23, 43.28),
		target = {
			loc = vec3(301.82, -600.99, 43.29),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Abrir locker personal'
		},
		name = 'emslocker',
		label = 'Locker Personal | SAME',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},

	{
		coords = vec3(153.88491821289, -787.51519775391, -31.229328155518),
		name = 'stafflocker',
		label = 'STAFF | Devoluciones',
		owner = false,
		slots = 500,
		weight = 200000000,
		groups = {['realestate'] = 0}
	},
}
