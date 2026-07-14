local MAIN = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/nutel4a/CWLight/refs/heads/main/.github/workflows/CycleWareLight.lua", true))()'
local ADAPT = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/nutel4a/CWLight/refs/heads/main/.github/workflows/CycleWareLightAdaptive.lua", true))()'

local e = (identifyexecutor or getexecutorname or function() end)()

for _,v in ipairs{
	getgenv, gethui, readfile, writefile, isfile, listfiles,
	newcclosure, checkcaller, keytap, keystroke, firesignal
} do

	if type(v) ~= "function" then
		return print("not supported.")
	end
end

local s = ({
	Xeno = ADAPT,
	MacSploit = MAIN,
	Real = MAIN
})[e] or ((hookmetamethod and getnamecallmethod) and MAIN or ADAPT)

if not pcall(loadstring(s)) and s == MAIN then
	pcall(loadstring(ADAPT))
end
