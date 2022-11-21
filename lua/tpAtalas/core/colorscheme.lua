require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = '#13111b',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'love',
		info = 'foam',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'text',
			h6 = 'foam',
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'highlight_low' },
	},
})

local status, _ = pcall(vim.cmd, 'colorscheme rose-pine')
if not status then
	print('Colorscheme not found!') -- print error if colorscheme not installed
	return
end

-----------------------------
-- Rose Pine Color Palette --
-----------------------------
-- https://rosepinetheme.com/palette/ingredients
-- Run <leader>cro to activate the colorizer plugin or :ColorizerToggle

-- Rosé Pine
-- Base
-- #191724	rgb(25 23 36)	hsl(249deg 22% 12%)
-- Surface
-- #1f1d2e	rgb(31 29 46)	hsl(247deg 23% 15%)
-- Overlay
-- #26233a	rgb(38 35 58)	hsl(248deg 25% 18%)
-- Muted
-- #6e6a86	rgb(110 106 134)	hsl(249deg 12% 47%)
-- Subtle
-- #908caa	rgb(144 140 170)	hsl(248deg 15% 61%)
-- Text
-- #e0def4	rgb(224 222 244)	hsl(245deg 50% 91%)
-- Love
-- #eb6f92	rgb(235 111 146)	hsl(343deg 76% 68%)
-- Gold
-- #f6c177	rgb(246 193 119)	hsl(35deg 88% 72%)
-- Rose
-- #ebbcba	rgb(235 188 186)	hsl(2deg 55% 83%)
-- Pine
-- #31748f	rgb(49 116 143)	hsl(197deg 49% 38%)
-- Foam
-- #9ccfd8	rgb(156 207 216)	hsl(189deg 43% 73%)
-- Iris
-- #c4a7e7	rgb(196 167 231)	hsl(267deg 57% 78%)
-- Highlight Low
-- #21202e	rgb(33 32 46)	hsl(244deg 18% 15%)
-- Highlight Med
-- #403d52	rgb(64 61 82)	hsl(249deg 15% 28%)
-- Highlight High
-- #524f67	rgb(82 79 103)	hsl(248deg 13% 36%)
