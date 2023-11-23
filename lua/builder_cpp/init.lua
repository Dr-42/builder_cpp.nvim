local M = {
}

local function cmd_run(cmd)
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")
	local win_height = math.ceil(height * 0.8 - 4)
	local win_width = math.ceil(width * 0.8)
	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

	local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
	}

	-- create preview buffer and set local options
	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	vim.api.nvim_win_set_option(win, "winblend", 0)
	local term_channel = vim.api.nvim_open_term(buf, {})
	vim.fn.jobstart(cmd, {
		on_stdout = function(_, data)
			vim.api.nvim_chan_send(term_channel, data)
		end,
		on_stderr = function(_, data)
			vim.fn.chansend(term_channel, data)
		end,
		on_exit = function(_, _, _)
			vim.fn.chansend(term_channel, "exit")
			vim.defer_fn(function()
				vim.api.nvim_win_close(win, true)
			end, 4000)
		end,
	})
end

function M.build()
	print("builder_cpp Building...")
	cmd_run('builder_cpp -b')
end

function M.run()
	print("builder_cpp Running...")
	cmd_run("builder_cpp -r")
end

function M.clean()
	print("builder_cpp Cleaning...")
	cmd_run("builder_cpp -c")
end

function M.build_run()
	print("builder_cpp Building and Running...")
	cmd_run("builder_cpp -br")
end

function M.build_clean()
	print("builder_cpp Building and Cleaning...")
	cmd_run("builder_cpp -bc")
end

function M.cleaan_build_run()
	print("builder_cpp Clean Build and Running...")
	cmd_run("builder_cpp -cbr")
end

return M
