return {
	"ton/vim-bufsurf",
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- import nvim-autopairs
		local keymap = vim.keymap

		keymap.set("n", "bp", ":BufSurfBack<CR>", { desc = "Back to prev buffer" })
		keymap.set("n", "bn", ":BufSurfForward<CR>", { desc = "Go to next buffer" })

		-- configure autopairs
	end,
}
