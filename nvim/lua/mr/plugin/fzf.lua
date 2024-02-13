return {
	"junegunn/fzf",
	-- dir = "/opt/homebrew/bin/fzf",
	name = "fzf",
	build = "./install --all",
	-- event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"junegunn/fzf.vim",
	},

	config = function()
		vim.keymap.set("n", "<space>gb", ":Buffers<CR>")
	end,
}
