require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "lua", "rust", "typescript", "javascript", "vim", "vimdoc", "query" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
})
