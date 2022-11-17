-- import trouble plugin safely
local setup, trouble = pcall(require, "touble")
if not setup then
	return
end

-- enable trouble
trouble.setup()
