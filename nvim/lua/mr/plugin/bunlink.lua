return {
	"orlp/vim-bunlink",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- import nvim-autopairs
		local keymap = vim.keymap

		keymap.set("n", "<leader>qq", ":Bunlink<CR>", { desc = "Unlink buffer" })

		-- configure autopairs
	end,
}
