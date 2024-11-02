-- vim:fdm=marker
-- Neovim Color File
-- Name:            doom-one
-- Maintainer:      https://github.com/NTBBloodbath
-- License:         The MIT License (MIT)
-- Based On:        https://github.com/romgrk/doom-one.vim and the original Doom Emacs one

local colors = {
  dark = {
    bg = "#141414",
    fg = "#ffffff",

    bg_alt = "#141414",
    fg_alt = "#ffffff",

		base0 = "#1b2229",
		base1 = "#1c1e1e",
		base2 = "#202328",
		base3 = "#23272e",
		base4 = "#3f444a",
		base5 = "#5b6268",
		base6 = "#73797e",
		base7 = "#9ca0a4",
		base8 = "#dfdfdf",

		grey = "#ffffff",
		red = "#ff7bb4",   
		orange = "#ffdaf7",
		green = "#ff8ead",
		teal = "#ffe8ab",
		yellow = "#d4ffc1",
		blue = "#b1e3ff",
		dark_blue = "#2257a0",
		magenta = "#ffedba",
		violet = "#ffffff",
		cyan = "#3cb1ff",
		dark_cyan = "#5699af",
  },
	light = {
		bg = "#fafafa",
		fg = "#383a42",

		bg_alt = "#f0f0f0",
		fg_alt = "#c6c7c7",

		base0 = "#f0f0f0",
		base1 = "#e7e7e7",
		base2 = "#dfdfdf",
		base3 = "#c6c7c7",
		base4 = "#9ca0a4",
		base5 = "#424242",
		base6 = "#2e2e2e",
		base7 = "#1e1e1e",
		base8 = "#1b2229",

		grey = "#9ca0a4",
		red = "#e45649",
		orange = "#da8548",
		green = "#50a14f",
		teal = "#4db5bd",
		yellow = "#986801",
		blue = "#4078f2",
		dark_blue = "#a0bcf8",
		magenta = "#a626a4",
		violet = "#b751b6",
		cyan = "#0184bc",
		dark_cyan = "#005478",
	},
}

colors.get_palette = function(current_bg)
	return colors[current_bg]
end

return colors
