require("rose-pine").setup({
	--- @usage 'main' | 'moon'
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = true,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = "base",
		panel = "surface",
		border = "highlight_med",
		comment = "muted",
		link = "iris",
		punctuation = "subtle",

		error = "love",
		hint = "love",
		info = "foam",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = "highlight_med" },
	},
})

-- set colorscheme to tokyonight-night with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
-- local status, _ = pcall(vim.cmd, "colorscheme iceberg")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
