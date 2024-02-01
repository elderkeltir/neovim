local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
    return
end

local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
    local version = vim.version()
    local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
    local datetime = os.date('%Y/%m/%d %H:%M:%S')

    return print_version .. ' - ' .. datetime
end

-- Banner
local banner = {
    "                                                    ",
    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                    ",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
    dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
    dashboard.button('f', '  Find file', ':NvimTreeOpen<CR>'),
    dashboard.button('r', "  Recent"   , ':Telescope oldfiles<CR>'),
    dashboard.button('c', '  Configuration', ':e $MYVIMRC<CR>'),
    dashboard.button('l', '⟲  Open last session', ':SessionManager load_last_session<CR>'),
    dashboard.button('s', '  Open sessions', ':SessionManager load_session<CR>'),
    dashboard.button('d', '  Delete sessions', ':SessionManager delete_session<CR>'),
    dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
