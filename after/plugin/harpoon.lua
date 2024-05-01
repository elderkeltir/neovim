local harpoon = require("harpoon")

local global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = true,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
}

-- REQUIRED
harpoon:setup({
    global_settings
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>oh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "H", function() harpoon:list():select(1) end)
vim.keymap.set("n", "J", function() harpoon:list():select(2) end)
vim.keymap.set("n", "K", function() harpoon:list():select(3) end)
vim.keymap.set("n", "L", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)


---returns a harpoon icon if the current file is marked in Harpoon. Does not
---`require` Harpoon itself (allowing harpoon to still be lazy-loaded)
local function readFile(filePath)
    local file = io.open(filePath, "r")
    if file then
        local content = file:read("*a")
        file:close()
        return content
    else
        return nil
    end
end

local fn = vim.fn
local function updateHarpoonIndicator()
	vim.b.harpoonMark = "" -- empty by default
	local harpoonJsonPath = fn.stdpath("data") .. "/harpoon.json"
	local fileExists = fn.filereadable(harpoonJsonPath) ~= 0
	if not fileExists then return end
	local harpoonJson = readFile(harpoonJsonPath)
	if not harpoonJson then return end

	local harpoonData = vim.json.decode(harpoonJson)
	local pwd = vim.loop.cwd()
	if not pwd or not harpoonData then return end

    local currentProject = harpoonData[pwd]
    if not currentProject or not currentProject.__harpoon_files then return end
    local markedFiles = currentProject.__harpoon_files
    local currentFile = fn.expand("%:p:t")

    for _, fileData in ipairs(markedFiles) do
        local file = vim.fn.json_decode(fileData)
        if file.value and file.context then
            local filename = vim.fn.fnamemodify(file.value, ":t") -- Get the filename without the path
            if filename == currentFile then
                vim.b.harpoonMark = "󰛢" -- Set a custom Unicode symbol for marked files

                break
            end
        end
    end

end

vim.api.nvim_create_autocmd({ "BufReadPost", "UiEnter" }, {
	pattern = "*",
	callback = updateHarpoonIndicator,
})
