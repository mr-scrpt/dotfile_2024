return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.0.0",
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		require("telescope").load_extension("live_grep_args")

		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-a>"] = actions.smart_send_to_qflist, -- not work
						["<c-x>"] = actions.delete_buffer,
					},
				},
			},
		})

		-- telescope.load_extension("fzf")
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		-- keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		-- keymap.set("n", "<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
		-- keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
		-- keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		-- keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find recent files" })
		-- keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		-- vim.keymap.set("n", "<leader>si", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S] Find existing [B]uffers" })
		keymap.set(
			"n",
			"<leader>/",
			builtin.current_buffer_fuzzy_find,
			{ desc = "[/] Fuzzily search in current buffer" }
		)

		-- Slightly advanced example of overriding default behavior and theme
		-- vim.keymap.set("n", "<leader>/", function()
		-- 	-- You can pass additional configuration to telescope to change theme, layout, etc.
		-- 	builtin.current_buffer_fuzzy_find()
		-- end, { desc = "[/] Fuzzily search in current buffer" })
	end,
}
