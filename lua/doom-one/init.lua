-- Neovim Color File
-- Name:            doom-one
-- Maintainer:      https://github.com/NTBBloodbath
-- License:         The MIT License (MIT)
-- Based On:        https://github.com/romgrk/doom-one.vim and the original Doom Emacs one

-- Helpers {{{

local doom_one = {}

local utils = require("doom-one.utils")
local colors = require("doom-one.colors")

local config = {
	ui = {
		cursor_coloring = vim.g.doom_one_cursor_coloring or false,
		terminal_colors = vim.g.doom_one_terminal_colors or true,
		italic_comments = vim.g.doom_one_italic_comments or false,
		enable_treesitter = vim.g.doom_one_enable_treesitter or true,
		diagnostics_text_color = vim.g.doom_one_diagnostics_text_color or false,
		transparent_background = vim.g.doom_one_transparent_background or false,
		pumblend = {
			enable = vim.g.doom_one_pumblend_enable or false,
			transparency_amount = vim.g.doom_one_pumblend_transparency or 20,
		},
	},
	plugins = {
		neorg = vim.g.doom_one_plugin_neorg or true,
		barbar = vim.g.doom_one_plugin_barbar or false,
		telescope = vim.g.doom_one_plugin_telescope or false,
		neogit = vim.g.doom_one_plugin_neogit or true,
		nvim_tree = vim.g.doom_one_plugin_nvim_tree or true,
		dashboard = vim.g.doom_one_plugin_dashboard or true,
		startify = vim.g.doom_one_plugin_startify or true,
		whichkey = vim.g.doom_one_plugin_whichkey or true,
		indent_blankline = vim.g.doom_one_plugin_indent_blankline or true,
		vim_illuminate = vim.g.doom_one_plugin_vim_illuminate or true,
		lspsaga = vim.g.doom_one_plugin_lspsaga or false,
	},
}

local function set_hl(group, values)
	vim.api.nvim_set_hl(0, group, values)
end

-- }}}

-- TODO: Re-add plugins integration here
doom_one.set_colorscheme = function()
	-- Set UI options
	------------------
	if config.ui.cursor_coloring then
		vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor25-Cursor"
	end

	if config.ui.pumblend.enable then
		vim.opt.pumblend = config.ui.pumblend.transparency_amount
	end

	-- Set colorscheme
	------------------
	local current_bg = vim.opt.background:get()
	local palette = colors.get_palette(current_bg)

	local dark_theme = current_bg == "dark"

	--- GENERAL UI
	-----------------
	set_hl("Normal", { bg = config.ui.transparent_background and "NONE" or palette.bg, fg = palette.fg })
	set_hl("NormalPopup", { bg = palette.bg_alt, fg = utils.lighten(palette.fg, 0.2) })
	set_hl("NormalPopover", { bg = palette.bg_alt, fg = utils.lighten(palette.fg, 0.2) })
	set_hl("NormalPopupPrompt", { bg = palette.bg_alt, fg = palette.base7, bold = true })
	set_hl("NormalPopupSubtle", { bg = palette.bg_alt, fg = palette.base6 })
	set_hl("EndOfBuffer", { bg = "bg", fg = "bg" })

	set_hl("Visual", { bg = palette.dark_blue })
	set_hl("VisualBold", { bg = palette.dark_blue, bold = true })

	set_hl("LineNr", { bg = "bg", fg = palette.grey })
	set_hl("Cursor", { bg = palette.blue })
	set_hl("CursorLine", { bg = palette.bg_alt })
	set_hl("CursorLineNr", { bg = palette.bg_alt, fg = "fg" })
	set_hl("CursorColumn", { bg = palette.bg_alt })

	set_hl("Folded", { bg = palette.bg_alt, fg = palette.base5 })
	set_hl("FoldColumn", { bg = "bg", fg = palette.fg_alt })
	set_hl("SignColumn", { bg = "bg" })
	set_hl("ColorColumn", { bg = palette.bg_alt })

	set_hl("IndentGuide", { fg = palette.grey })
	set_hl("IndentGuideEven", { link = "IndentGuide" })
	set_hl("IndentGuideOdd", { link = "IndentGuide" })

	set_hl("TermCursor", { fg = "fg", reverse = true })
	set_hl("TermCursorNC", { fg = palette.fg_alt, reverse = true })
	set_hl("TermNormal", { link = "Normal" })
	set_hl("TermNormalNC", { link = "TermNormal" })

	set_hl("WildMenu", { bg = palette.dark_blue, fg = "fg" })
	set_hl("Separator", { fg = palette.fg_alt })
	set_hl("VertSplit", { bg = "bg", fg = palette.grey })

	set_hl("TabLine", { bg = palette.bg_alt, fg = palette.base7, bold = true })
	set_hl("TabLineSel", { bg = "bg", fg = palette.blue, bold = true })
	set_hl("TabLineFill", { bg = palette.base1, bold = true })

	set_hl("StatusLine", { bg = dark_theme and palette.base3 or palette.base2, fg = palette.base8 })
	set_hl("StatusLineNC", { bg = palette.bg_alt, fg = palette.base6 })
	set_hl("StatusLinePart", { bg = palette.bg_alt, fg = palette.base6, bold = true })
	set_hl("StatusLinePartNC", { link = "StatusLinePart" })

	set_hl("Pmenu", { bg = palette.bg_alt, fg = "fg" })
	set_hl("PmenuSel", { bg = palette.blue, fg = dark_theme and palette.base0 or palette.base8 })
	set_hl("PmenuSelBold", { bg = palette.blue, fg = dark_theme and palette.base0 or palette.base8, bold = true })
	set_hl("PmenuSbar", { bg = palette.bg_alt })
	set_hl("PmenuThumb", { bg = palette.grey })

	--- Search, Highlight, Conceal, Messages
	----------------------------------------
	set_hl("Search", { bg = palette.dark_blue, fg = "fg" })
	set_hl("Substitute", { fg = palette.red, bold = true, strikethrough = true })
	set_hl("IncSearch", { bg = palette.yellow, fg = "bg", bold = true })
	set_hl("IncSearchCursor", { reverse = true })

	set_hl("Conceal", { fg = palette.grey })
	set_hl("SpecialKey", { fg = palette.violet, bold = true })
	set_hl("NonText", { fg = palette.fg_alt, bold = true })
	set_hl("MatchParen", { fg = palette.red, bold = true })
	set_hl("Whitespace", { fg = palette.grey })

	set_hl("Highlight", { bg = palette.bg_alt })
	set_hl("HighlightSubtle", { link = "Highlight" })

	set_hl("Question", { fg = palette.green, bold = true })

	set_hl("File", { fg = "fg" })
	set_hl("Directory", { fg = palette.violet, bold = true })
	set_hl("Title", { fg = palette.violet, bold = true })

	set_hl("Bold", { bold = true })
	set_hl("Emphasis", { fg = palette.green, bold = true })

	--- Text Levels
	---------------
	local text_colors = {
		Normal = palette.fg,
		Info = palette.blue,
		Success = palette.green,
		Warning = palette.yellow,
		Debug = palette.yellow,
		Error = palette.red,
		Special = palette.violet,
		Muted = dark_theme and palette.base7 or palette.base5,
	}

	for group, hl in pairs(text_colors) do
		set_hl("Text" .. group, { fg = hl })
		set_hl("Text" .. group .. "Bold", { fg = hl, bold = true })
	end

	set_hl("Msg", { link = "TextSuccess" })
	set_hl("MoreMsg", { link = "TextInfo" })
	set_hl("WarningMsg", { link = "TextWarning" })
	set_hl("Error", { link = "TextError" })
	set_hl("ErrorMsg", { link = "TextError" })
	set_hl("ModeMsg", { link = "TextSpecial" })
	set_hl("Todo", { link = "TextWarningBold" })

	--- Checkhealth
	---------------
	set_hl("healthError", { link = "ErrorMsg" })
	set_hl("healthSuccess", { link = "Msg" })
	set_hl("healthWarning", { link = "WarningMsg" })

	--- Main Syntax
	---------------
	set_hl("Tag", { fg = utils.mix(palette.blue, palette.cyan, 0.5), bold = true })
	set_hl("Link", { fg = palette.green, underline = true })
	set_hl("URL", { link = "Link" })
	set_hl("Underlined", { fg = utils.mix(palette.blue, palette.cyan, 0.5), underline = true })

	set_hl("Comment", { fg = dark_theme and palette.base5 or palette.base4, italic = config.ui.italic_comments })
	set_hl("CommentBold", { fg = dark_theme and palette.base5 or palette.base4, bold = true })
	set_hl("SpecialComment", { fg = dark_theme and palette.base7 or palette.base5, bold = true })

	set_hl("Macro", { fg = palette.violet })
	set_hl("Define", { fg = palette.violet, bold = true })
	set_hl("Include", { fg = palette.violet, bold = true })
	set_hl("PreProc", { fg = palette.violet, bold = true })
	set_hl("PreCondit", { fg = palette.violet, bold = true })

	set_hl("Label", { fg = dark_theme and palette.blue or palette.red })
	set_hl("Repeat", { fg = dark_theme and palette.blue or palette.red })
	set_hl("Keyword", { fg = dark_theme and palette.blue or palette.red })
	set_hl("Operator", { fg = dark_theme and palette.blue or palette.red })
	set_hl("Delimiter", { fg = dark_theme and palette.blue or palette.red })
	set_hl("Statement", { fg = dark_theme and palette.blue or palette.red })
	set_hl("Exception", { fg = dark_theme and palette.blue or palette.red })
	set_hl("Conditional", { fg = dark_theme and palette.blue or palette.red })

	set_hl("Variable", { fg = utils.darken(palette.magenta, 0.36) })
	set_hl("VariableBuiltin", { fg = palette.magenta, bold = true })
	set_hl("Constant", { fg = palette.violet, bold = true })

	set_hl("Number", { fg = palette.orange })
	set_hl("Float", { link = "Number" })
	set_hl("Boolean", { fg = palette.orange, bold = true })
	set_hl("Enum", { fg = palette.orange })

	set_hl("Character", { fg = palette.violet, bold = true })
	set_hl(
		"SpecialChar",
		{ fg = dark_theme and utils.darken(palette.violet, 0.15) or utils.lighten(palette.violet, 0.26), bold = true }
	)
	set_hl("String", { fg = palette.green })
	set_hl("StringDelimiter", { link = "String" })

	set_hl("Special", { fg = palette.violet })
	set_hl("SpecialBold", { fg = palette.violet, bold = true })

	set_hl("Field", { fg = palette.violet })
	set_hl(
		"Argument",
		{ fg = dark_theme and utils.lighten(palette.magenta, 0.4) or utils.darken(palette.magenta, 0.36) }
	)
	set_hl(
		"Attribute",
		{ fg = dark_theme and utils.lighten(palette.magenta, 0.4) or utils.darken(palette.magenta, 0.36) }
	)
	set_hl(
		"Identifier",
		{ fg = dark_theme and utils.lighten(palette.magenta, 0.4) or utils.darken(palette.magenta, 0.36) }
	)
	set_hl("Property", { fg = palette.magenta })
	set_hl("Function", { fg = palette.magenta })
	set_hl("FunctionBuiltin", {
		fg = dark_theme and utils.lighten(palette.magenta, 0.4) or utils.darken(palette.magenta, 0.2),
		bold = true,
	})
	set_hl("KeywordFunction", { fg = dark_theme and palette.blue or palette.red, bold = true })
	set_hl("Method", { fg = dark_theme and palette.violet or palette.cyan })

	set_hl("Type", { fg = palette.yellow })
	set_hl("Typedef", { fg = dark_theme and palette.blue or palette.red })
	set_hl("TypeBuiltin", { fg = palette.yellow, bold = true })
	set_hl("Class", { fg = dark_theme and palette.blue or palette.red })
	set_hl("StorageClass", { fg = dark_theme and palette.blue or palette.red })
	set_hl("Structure", { fg = dark_theme and palette.blue or palette.red })

	set_hl("Regexp", { fg = "#dd0093" })
	set_hl("RegexpSpecial", { fg = "#a40073" })
	set_hl("RegexpDelimiter", { fg = "#540063", bold = true })
	set_hl("RegexpKey", { fg = "#5f0041", bold = true })

	set_hl("CommentURL", { link = "URL" })
	set_hl("CommentLabel", { link = "CommentBold" })
	set_hl("CommentSection", { link = "CommentBold" })
	set_hl("Noise", { link = "Comment" })

	--- Diff
	--------
	set_hl("DiffAddedGutter", { fg = palette.green, bold = true })
	set_hl("DiffModifiedGutter", { fg = palette.orange, bold = true })
	set_hl("DiffRemovedGutter", { fg = palette.red, bold = true })

	set_hl("DiffAddedGutterLineNr", { fg = palette.grey })
	set_hl("DiffModifiedGutterLineNr", { fg = palette.grey })
	set_hl("DiffRemovedGutterLineNr", { fg = palette.grey })

	set_hl("DiffAdd", { link = "DiffAddedGutter" })
	set_hl("DiffChange", { link = "DiffModifiedGutter" })
	set_hl("DiffDelete", { link = "DiffRemovedGutter" })

	--- Markdown
	------------
	set_hl("markdownCode", { link = "Comment" })
	set_hl("markdownCodeBlock", { link = "markdownCode" })
	set_hl("markdownH1", { bold = true })
	set_hl("markdownH2", { bold = true })
	set_hl("markdownLinkText", { underline = true })

	--- LSP
	------------
	if config.ui.diagnostics_text_color then
	  set_hl("ErrorMsgUnderline", { fg = palette.red, underline = true })
	  set_hl("WarningMsgUnderline", { fg = palette.yellow, underline = true })
	  set_hl("MoreMsgUnderline", { fg = palette.blue, underline = true })
	  set_hl("MsgUnderline", { fg = palette.green, underline = true })
	else
	  set_hl("ErrorMsgUnderline", { sp = palette.red, underline = true })
	  set_hl("WarningMsgUnderline", { sp = palette.yellow, underline = true })
	  set_hl("MoreMsgUnderline", { sp = palette.blue, underline = true })
	  set_hl("MsgUnderline", { sp = palette.green, underline = true })
	end

	set_hl("LspHighlight", { bg = palette.bg_alt, bold = true })
	set_hl("LspSignatureActiveParameter", { fg = palette.violet })
	set_hl("DiagnosticFloatingError", { link = "ErrorMsg" })
	set_hl("DiagnosticFloatingWarn", { link = "WarningMsg" })
	set_hl("DiagnosticFloatingInfo", { link = "MoreMsg" })
	set_hl("DiagnosticFloatingHint", { link = "Msg" })
	set_hl("DiagnosticDefaultError", { link = "ErrorMsg" })
	set_hl("DiagnosticDefaultWarn", { link = "WarningMsg" })
	set_hl("DiagnosticDefaultInfo", { link = "MoreMsg" })
	set_hl("DiagnosticDefaultHint", { link = "Msg" })
	set_hl("DiagnosticVirtualTextError", { link = "ErrorMsg" })
	set_hl("DiagnosticVirtualTextWarn", { link = "WarningMsg" })
	set_hl("DiagnosticVirtualTextInfo", { link = "MoreMsg" })
	set_hl("DiagnosticVirtualTextHint", { link = "Msg" })
	set_hl("DiagnosticUnderlineError", { link = "ErrorMsgUnderline" })
	set_hl("DiagnosticUnderlineWarn", { link = "WarningMsgUnderline" })
	set_hl("DiagnosticUnderlineInfo", { link = "MoreMsgUnderline" })
	set_hl("DiagnosticUnderlineHint", { link = "MsgUnderline" })
	set_hl("DiagnosticSignError", { link = "ErrorMsg" })
	set_hl("DiagnosticSignWarning", { link = "WarningMsg" })
	set_hl("DiagnosticSignInformation", { link = "MoreMsg" })
	set_hl("DiagnosticSignHint", { link = "Msg" })
	set_hl("DiagnosticVirtualTextError", { link = "ErrorMsg" })
	set_hl("DiagnosticVirtualTextWarn", { link = "WarningMsg" })
	set_hl("DiagnosticVirtualTextInfo", { link = "MoreMsg" })
	set_hl("DiagnosticVirtualTextHint", { link = "TextMuted" })
	set_hl("LspReferenceText", { link = "LspHighlight" })
	set_hl("LspReferenceRead", { link = "LspHighlight" })
	set_hl("LspReferenceWrite", { link = "LspHighlight" })

	--- Tree-Sitter
	---------------
	if config.ui.enable_treesitter then
		set_hl("TSStrike", {
			fg = dark_theme and utils.darken(palette.violet, 0.2) or utils.lighten(palette.violet, 0.26),
			strikethrough = true,
		})

		set_hl("TSException", { link = "Exception" })
		set_hl("TSAnnotation", { link = "PreProc" })
		set_hl("TSAttribute", { link = "Attribute" })
		set_hl("TSConditional", { link = "Conditional" })
		set_hl("TSComment", { link = "Comment" })
		set_hl("TSConstructor", { link = "Structure" })
		set_hl("TSConstant", { link = "Constant" })
		set_hl("TSConstBuiltin", { link = "Constant" })
		set_hl("TSConstMacro", { link = "Macro" })
		set_hl("TSError", { link = "Error" })
		set_hl("TSField", { link = "Field" })
		set_hl("TSFloat", { link = "Float" })
		set_hl("TSFunction", { link = "Function" })
		set_hl("TSFuncBuiltin", { link = "FunctionBuiltin" })
		set_hl("TSFuncMacro", { link = "Macro" })
		set_hl("TSInclude", { link = "Include" })
		set_hl("TSKeyword", { link = "Keyword" })
		set_hl("TSKeywordFunction", { link = "KeywordFunction" })
		set_hl("TSLabel", { link = "Label" })
		set_hl("TSMath", { link = "Special" })
		set_hl("TSMethod", { link = "Method" })
		set_hl("TSNamespace", { link = "Directory" })
		set_hl("TSNumber", { link = "Number" })
		set_hl("TSOperator", { link = "Operator" })
		set_hl("TSParameter", { link = "Argument" })
		set_hl("TSParameterReference", { link = "Argument" })
		set_hl("TSProperty", { link = "Property" })
		set_hl("TSPunctDelimiter", { link = "Delimiter" })
		set_hl("TSPunctBracket", { link = "Delimiter" })
		set_hl("TSPunctSpecial", { link = "Delimiter" })
		set_hl("TSRepeat", { link = "Repeat" })
		set_hl("TSString", { link = "String" })
		set_hl("TSStringRegex", { link = "StringDelimiter" })
		set_hl("TSStringEscape", { link = "StringDelimiter" })
		set_hl("TSTag", { link = "Tag" })
		set_hl("TSTagDelimiter", { link = "Delimiter" })
		set_hl("TSStrong", { link = "Bold" })
		set_hl("TSURI", { link = "URL" })
		set_hl("TSWarning", { link = "WarningMsg" })
		set_hl("TSDanger", { link = "ErrorMsg" })
		set_hl("TSType", { link = "Type" })
		set_hl("TSTypeBuiltin", { link = "TypeBuiltin" })
		set_hl("TSVariable", { link = "None" })
		set_hl("TSVariableBuiltin", { link = "VariableBuiltin" })
	end

	--- NetRW
	---------
	set_hl("netrwClassify", { fg = palette.blue })
	set_hl("netrwDir", { link = "Directory" })
	set_hl("netrwExe", { fg = palette.green, bold = true })
	set_hl("netrwMakefile", { fg = palette.yellow, bold = true })
	set_hl("netrwTreeBar", { link = "Comment" })

	--- Terminal colors
	-------------------
	if config.ui.terminal_colors then
		vim.g.terminal_color_0 = palette.bg
		vim.g.terminal_color_1 = palette.red
		vim.g.terminal_color_2 = palette.green
		vim.g.terminal_color_3 = palette.yellow
		vim.g.terminal_color_4 = palette.blue
		vim.g.terminal_color_5 = palette.violet
		vim.g.terminal_color_6 = palette.cyan
		vim.g.terminal_color_7 = palette.fg
		vim.g.terminal_color_8 = palette.grey
		vim.g.terminal_color_9 = palette.red
		vim.g.terminal_color_10 = palette.green
		vim.g.terminal_color_11 = palette.orange
		vim.g.terminal_color_12 = palette.blue
		vim.g.terminal_color_13 = palette.violet
		vim.g.terminal_color_14 = palette.cyan
		vim.g.terminal_color_15 = palette.white
		vim.g.terminal_color_background = palette.bg_alt
		vim.g.terminal_color_foreground = palette.fg_alt
	end

	--- Plugins integrations
	------------------------
	if config.plugins.indent_blankline then
		set_hl("IndentBlanklineChar", { fg = palette.base4, nocombine = true })
		set_hl("IndentBlanklineContextChar", { fg = dark_theme and palette.blue or palette.orange, nocombine = true })
		set_hl("IndentBlanklineSpaceChar", { link = "IndentBlanklineChar" })
		set_hl("IndentBlanklineSpaceCharBlankline", { link = "IndentBlanklineChar" })
	end

	if config.plugins.neorg then
		set_hl("NeorgMarkupVerbatim", { link = "Comment" })

		-- Headers and their prefix icon
		set_hl("NeorgHeading1Title", { link = "TSAttribute" })
		set_hl("NeorgHeading2Title", { link = "TSLabel" })
		set_hl("NeorgHeading3Title", { link = "TSMath" })
		set_hl("NeorgHeading4Title", { link = "TSString" })
		set_hl("NeorgHeading5Title", { link = "TSType" })
		set_hl("NeorgHeading6Title", { link = "TSNumber" })
		set_hl("NeorgHeading1Prefix", { link = "TSAttribute" })
		set_hl("NeorgHeading2Prefix", { link = "TSLabel" })
		set_hl("NeorgHeading3Prefix", { link = "TSMath" })
		set_hl("NeorgHeading4Prefix", { link = "TSString" })
		set_hl("NeorgHeading5Prefix", { link = "TSType" })
		set_hl("NeorgHeading6Prefix", { link = "TSNumber" })

		-- Colors are for nested quotes
		set_hl("Blue", { fg = palette.blue })
		set_hl("Yellow", { fg = palette.yellow })
		set_hl("Red", { fg = palette.red })
		set_hl("Green", { fg = palette.green })
		set_hl("Brown", { fg = palette.orange })

    -- Headlines support
    -- NOTE: requires custom highlight groups in headlines setup!
    set_hl("Headline1", { bg = utils.blend(utils.get_hl("NeorgHeading1Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline2", { bg = utils.blend(utils.get_hl("NeorgHeading2Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline3", { bg = utils.blend(utils.get_hl("NeorgHeading3Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline4", { bg = utils.blend(utils.get_hl("NeorgHeading4Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline5", { bg = utils.blend(utils.get_hl("NeorgHeading5Title", "foreground"), palette.bg, 0.18) })
    set_hl("Headline6", { bg = utils.blend(utils.get_hl("NeorgHeading6Title", "foreground"), palette.bg, 0.18) })
	end

	if config.plugins.vim_illuminate then
		set_hl("illuminatedWord", { underline = true })
	end

	if config.plugins.barbar then
		set_hl("BufferCurrent", { bg = "bg", fg = dark_theme and palette.base8 or palette.base0 })
		set_hl("BufferCurrentIndex", { bg = "bg", fg = palette.base6 })
		set_hl("BufferCurrentMod", { bg = "bg", fg = palette.yellow })
		set_hl("BufferCurrentSign", { bg = "bg", fg = palette.blue })
		set_hl("BufferCurrentTarget", { bg = "bg", fg = palette.red, bold = true })

		set_hl("BufferVisible", { fg = palette.base7, bg = "bg" })
		set_hl("BufferVisibleIndex", { fg = palette.base6, bg = "bg" })
		set_hl("BufferVisibleMod", { fg = palette.yellow, bg = "bg" })
		set_hl("BufferVisibleSign", { fg = palette.base4, bg = "bg" })
		set_hl("BufferVisibleTarget", { fg = palette.red, bg = "bg", bold = true })

		set_hl("BufferInactive", { fg = palette.base6, bg = dark_theme and palette.base1 or palette.base8 })
		set_hl("BufferInactiveIndex", { fg = palette.base6, bg = dark_theme and palette.base1 or palette.base8 })
		set_hl("BufferInactiveMod", { fg = palette.yellow, bg = dark_theme and palette.base1 or palette.base8 })
		set_hl("BufferInactiveSign", { fg = palette.base4, bg = dark_theme and palette.base1 or palette.base8 })
		set_hl(
			"BufferInactiveTarget",
			{ fg = palette.red, bg = dark_theme and palette.base1 or palette.base8, bold = true }
		)

		set_hl("BufferTabpages", { fg = palette.blue, bg = palette.bg_alt, bold = true })
		set_hl(
			"BufferTabpageFill",
			{ fg = palette.base4, bg = dark_theme and palette.base1 or palette.base8, bold = true }
		)

		set_hl("BufferPart", { fg = palette.fg_alt, bg = palette.bg_alt, bold = true })
	end

	if config.plugins.telescope then
		set_hl("TelescopeNormal", { fg = "fg" })
		set_hl("TelescopeBorder", { fg = dark_theme and palette.blue or palette.red })
		set_hl("TelescopePrompt", { link = "TelescopeNormal" })
		set_hl("TelescopePromptBorder", { link = "TelescopeBorder" })
		set_hl("TelescopePromptPrefix", { fg = dark_theme and palette.blue or palette.red })
		set_hl("TelescopeResultsBorder", { link = "TelescopeBorder" })
		set_hl("TelescopePreviewBorder", { link = "TelescopeBorder" })
		set_hl("TelescopeMatching", { fg = palette.violet, bold = true })
		set_hl("TelescopeSelection", { link = "VisualBold" })
		set_hl("TelescopeSelectionCaret", { fg = dark_theme and palette.blue or palette.red })
	end

	if config.plugins.neogit then
		set_hl("NeogitDiffAdd", { bg = "#e9f1e8", fg = "#40803f" })
		set_hl("NeogitDiffAddHighlight", { bg = "#d8e8d7", fg = palette.green, bold = true })
		set_hl("NeogitDiffDelete", { bg = "#f7e9e8", fg = "#cc5655" })
		set_hl("NeogitDiffDeleteHighlight", { bg = "#f5d9d6", fg = palette.red, bold = true })
		set_hl("NeogitDiffContext", { bg = "bg", fg = palette.fg_alt })
		set_hl("NeogitDiffContextHighlight", { bg = palette.bg_alt, fg = "fg", bold = true })
		set_hl(
			"NeogitHunkHeader",
			{ bg = dark_theme and utils.darken(palette.violet, 0.2) or utils.lighten(palette.violet, 0.16), fg = "bg" }
		)
		set_hl("NeogitHunkHeaderHighlight", { bg = palette.violet, fg = palette.bg_alt, bold = true })
		set_hl("NeogitStagedChanges", { fg = dark_theme and palette.blue or palette.orange, bold = true })
		set_hl("NeogitStagedChangesRegion", { bg = palette.bg_alt })
		set_hl("NeogitStashes", { fg = dark_theme and palette.blue or palette.orange, bold = true })
		set_hl("NeogitUnstagedChanges", { fg = dark_theme and palette.blue or palette.orange, bold = true })
		set_hl("NeogitUntrackedfiles", { fg = dark_theme and palette.blue or palette.orange, bold = true })
	end

	if config.plugins.dashboard then
		set_hl("dashboardHeader", { fg = palette.grey })
		set_hl("dashboardFooter", { link = "dashboardHeader" })
		set_hl("dashboardCenter", { fg = dark_theme and palette.blue or palette.orange })
		set_hl("dashboardShortcut", { fg = palette.violet })
	end

	if config.plugins.startify then
		set_hl("StartifyHeader", { fg = palette.fg_alt })
		set_hl("StartifyBracket", { fg = palette.grey })
		set_hl("StartifyNumber", { fg = dark_theme and palette.blue or palette.orange })
		set_hl("StartifyPath", { fg = palette.violet })
		set_hl("StartifySlash", { link = "StartifyPath" })
		set_hl("StartifyFile", { fg = palette.green })
	end

	if config.plugins.whichkey then
		set_hl("WhichKey", { fg = dark_theme and palette.blue or palette.red })
		set_hl("WhichKeyGroup", { fg = palette.magenta })
		set_hl("WhichKeyDesc", { fg = palette.magenta })
		set_hl("WhichKeySeparator", { link = "Separator" })
		set_hl("WhichKeyFloat", { fg = dark_theme and palette.base2 or palette.base6 })
		set_hl("WhichKeyValue", { fg = palette.grey })
	end

	if config.plugins.nvim_tree then
		set_hl("NvimTreeFolderName", { fg = dark_theme and palette.blue or palette.base8, bold = true })
		set_hl("NvimTreeRootFolder", { fg = palette.green })
		set_hl("NvimTreeEmptyFolderName", { fg = palette.fg_alt, bold = true })
		set_hl("NvimTreeSymlink", { fg = "fg", underline = true })
		set_hl("NvimTreeExecFile", { fg = palette.green, bold = true })
		set_hl("NvimTreeImageFile", { fg = dark_theme and palette.blue or palette.red })
		set_hl("NvimTreeOpenedFile", { fg = palette.fg_alt })
		set_hl("NvimTreeSpecialFile", { fg = "fg", underline = true })
		set_hl("NvimTreeMarkdownFile", { fg = "fg", underline = true })

		set_hl("NvimTreeGitDirty", { link = "DiffModifiedGutter" })
		set_hl("NvimTreeGitStaged", { link = "DiffModifiedGutter" })
		set_hl("NvimTreeGitMerge", { link = "DiffModifiedGutter" })
		set_hl("NvimTreeGitRenamed", { link = "DiffModifiedGutter" })
		set_hl("NvimTreeGitNew", { link = "DiffAddedGutter" })
		set_hl("NvimTreeGitDeleted", { link = "DiffRemovedGutter" })

		set_hl("NvimTreeIndentMarker", { link = "IndentGuide" })
		set_hl("NvimTreeOpenedFolderName", { link = "NvimTreeFolderName" })
	end

	if config.plugins.lspsaga then
		set_hl("SagaShadow", { bg = "bg" })
		set_hl("LspSagaDiagnosticHeader", { fg = palette.red })

		set_hl("LspSagaDiagnosticBorder", { link = "Normal" })
		set_hl("LspSagaDiagnosticTruncateLine", { link = "Normal" })
		set_hl("LspFloatWinBorder", { link = "Normal" })
		set_hl("LspSagaBorderTitle", { link = "Title" })
		set_hl("TargetWord", { link = "Error" })
		set_hl("ReferencesCount", { link = "Title" })
		set_hl("ReferencesIcon", { link = "Special" })
		set_hl("DefinitionCount", { link = "Title" })
		set_hl("TargetFileName", { link = "Comment" })
		set_hl("DefinitionIcon", { link = "Special" })
		set_hl("ProviderTruncateLine", { link = "Normal" })
		set_hl("LspSagaFinderSelection", { link = "Search" })
		set_hl("DiagnosticTruncateLine", { link = "Normal" })
		set_hl("DefinitionPreviewTitle", { link = "Title" })
		set_hl("LspSagaShTruncateLine", { link = "Normal" })
		set_hl("LspSagaDocTruncateLine", { link = "Normal" })
		set_hl("LineDiagTuncateLine", { link = "Normal" })
		set_hl("LspSagaCodeActionTitle", { link = "Title" })
		set_hl("LspSagaCodeActionTruncateLine", { link = "Normal" })
		set_hl("LspSagaCodeActionContent", { link = "Normal" })
		set_hl("LspSagaRenamePromptPrefix", { link = "Normal" })
		set_hl("LspSagaRenameBorder", { link = "Bold" })
		set_hl("LspSagaHoverBorder", { link = "Bold" })
		set_hl("LspSagaSignatureHelpBorder", { link = "Bold" })
		set_hl("LspSagaCodeActionBorder", { link = "Bold" })
		set_hl("LspSagaDefPreviewBorder", { link = "Bold" })
		set_hl("LspLinesDiagBorder", { link = "Bold" })
	end
end

return doom_one
