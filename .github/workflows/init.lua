local MAIN_URL = "https://raw.githubusercontent.com/nutel4a/CWLight/refs/heads/main/.github/workflows/CycleWareLight.lua"
local ADAPTIVE_URL = "https://raw.githubusercontent.com/nutel4a/CWLight/refs/heads/main/.github/workflows/CycleWareLightAdaptive.lua"

local OVERRIDES = { Xeno = "adaptive", MacSploit = "main", Real = "main" }

local function exists(name)
	local ok, fn = pcall(function() return _G[name] or getfenv()[name] end)
	return ok and typeof(fn) == "function"
end

local function getExecutorName()
	local ok, name = pcall(function()
		return (identifyexecutor or getexecutorname or function() end)()
	end)
	return ok and name or nil
end

local build = OVERRIDES[getExecutorName()]
if not build then
	build = (exists("hookmetamethod") and exists("getnamecallmethod")) and "main" or "adaptive"
end

local url = build == "main" and MAIN_URL or ADAPTIVE_URL

local ok = pcall(function()
	return (loadstring or load)(game:HttpGet(url, true))()
end)

if not ok and build == "main" then
	pcall(function()
		return (loadstring or load)(game:HttpGet(ADAPTIVE_URL, true))()
	end)
end
