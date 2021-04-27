require 'utils'

local gl = require('galaxyline')
local gls = gl.section

local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local buffer = require('galaxyline.provider_buffer')
local diagnostic = require('galaxyline.provider_diagnostic')
local condition = require('galaxyline.condition')

local palette = vim.fn['sonokai#get_palette'](vim.g.sonokai_style)

local function get_color(key)
    return palette[key][1]
end

gl.short_line_list = { 'fugitive' }

local modes = {
    n =         { 'NORM',   get_color('bg_green') },
    niI =       { 'NORM',   get_color('bg_green') },
    niR =       { 'NORM',   get_color('bg_green') },
    niV =       { 'NORM',   get_color('bg_green') },
    no =        { 'OP-P',   get_color('bg_green') },
    nov =       { 'OP-C',   get_color('bg_green') },
    noV =       { 'OP-L',   get_color('bg_green') },
    ['no'] =  { 'OP-B',   get_color('bg_green') },
    i =         { 'INSR',   get_color('yellow') },
    ic =        { 'INSR',   get_color('yellow') },
    ix =        { 'INSR',   get_color('yellow') },
    v =         { 'VISL',   get_color('purple') },
    V =         { 'V-LN',   get_color('purple') },
    [''] =    { 'V-BL',   get_color('purple') },
    s =         { 'SELC',   get_color('bg_blue') },
    S =         { 'S-LN',   get_color('bg_blue') },
    [''] =    { 'S-BL',   get_color('bg_blue') },
    R =         { 'REPL',   get_color('bg_red') },
    Rc =        { 'REPL',   get_color('bg_red') },
    Rx =        { 'REPL',   get_color('bg_red') },
    Rv =        { 'R-VR',   get_color('bg_red') },
    c =         { 'COMD',   get_color('bg_blue') },
    cv =        { 'COMD',   get_color('bg_blue') },
    ce =        { 'C-EX',   get_color('bg_blue') },
    r =         { '',      get_color('bg4') },
    rm =        { '',      get_color('bg4') },
    ['r?'] =    { '',      get_color('bg4') },
    ['!'] =     { '',      get_color('bg4') },
    t =         { 'TERM',   get_color('bg_blue') },
}

local function make_left_sep(cond, hi_grp)
    return {
        provider = function() return '' end,
        condition = cond,
        highlight = hi_grp
    }
end

local function make_right_sep(cond, hi_grp)
    return {
        provider = function() return ' ' end,
        condition = cond,
        highlight = hi_grp
    }
end

gls.left[1] = { ModeLeftSep = make_left_sep(nil, 'StatusLinePrimarySep') }

gls.left[2] = {
    ViMode = {
        provider = function()
            local mode = vim.fn.mode()
            vim.cmd('hi StatusLinePrimary guibg=' .. modes[mode][2])
            vim.cmd('hi StatusLinePrimarySep guifg=' .. modes[mode][2])
            vim.cmd('hi StatusLineSecondary guifg=' .. modes[mode][2])
            return modes[mode][1]
        end,
        highlight = 'StatusLinePrimary',
        separator = ' ',
        separator_highlight = 'StatusLinePrimarySep',
    }
}

gls.left[3] = { GitLeftSep = make_left_sep(vcs.check_git_workspace, 'StatusLineSecondarySep') }
gls.left[4] = {
    Git = {
        provider = function()
            local branch = vcs.get_git_branch()
            local text = ''
            if branch == nil then
                return text
            else
                return text .. ' ' .. branch
            end
        end,
        condition = condition.check_git_workspace,
        highlight = 'StatusLineSecondary',
        separator = ' ',
        separator_highlight = 'StatusLineSecondarySep',
    }
}

local function unknown_ft()
    return buffer.get_buffer_filetype() == ''
end

local function buf_modified()
    local buffers = vim.fn.getbufinfo(buffer.get_buffer_number())
    return vim.fn.len(buffers) > 0 and buffers[1].changed ~= 0
end

gls.left[5] = {
    FileIcon = {
        provider = 'FileIcon',
        highlight = 'StatusLineCenter',
        condition = function() return not unknown_ft() end,
    }
}

gls.left[6] = {
    FileName = {
        provider = 'FileName',
        highlight = 'StatusLineCenter'
    }
}

gls.left[7] = {
    TreeSitter = {
        provider = function()
            local text = vim.fn['nvim_treesitter#statusline'] {
                indicator_size = vim.fn.winwidth(0) - 90,
                type_patterns = {'class', 'function', 'method'},
                separator = '  '
            }

            if vim.fn.empty(text) then
                return nil
            end

            if vim.fn.len(text) > 0 then
               text = ' ' .. text
            end

            return text
        end,
        condition = function() return packer_plugins['nvim-treesitter'] and packer_plugins['nvim-treesitter'].loaded and condition.hide_in_width() end,
        highlight = 'StatusLineCenter'
    }
}

local function file_info_bubble()
    return condition.hide_in_width() and vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

gls.right[1] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '',
        highlight = 'StatusLineError'
    }
}

gls.right[2] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '',
        highlight = 'StatusLineWarn'
    }
}

gls.right[3] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '',
        highlight = 'StatusLineHint'
    }
}

gls.right[4] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '',
        highlight = 'StatusLineInfo'
    }
}

gls.right[5] = {
    FileType = {
        provider = function()
            if fileinfo.get_file_format() == 'UNIX' then
                return 'lf'
            else
                return 'crlf'
            end
        end,
        highlight = 'StatusLineSecondary',
        condition = file_info_bubble,
        separator = '',
        separator_highlight = 'StatusLineSecondarySep'
    }
}

gls.right[6] = {
    FileEncoding = {
        provider = function () return fileinfo.get_file_encode():lower() end,
        condition = file_info_bubble,
        separator = ' ',
        highlight = 'StatusLineSecondary',
        separator_highlight = 'StatusLineSecondary',
    }
}

gls.right[7] = {
    FileSize = {
        provider = 'FileSize',
        condition = file_info_bubble,
        separator = ' ',
        highlight = 'StatusLineSecondary',
        separator_highlight = 'StatusLineSecondary',
    }
}

gls.right[8] = { FileInfoRightSep = make_right_sep(file_info_bubble, 'StatusLineSecondarySep') }

gls.right[9] = {
    CursorPos = {
        provider = function() return ' ' .. fileinfo.line_column() end,
        highlight = 'StatusLinePrimary',
        separator = '',
        separator_highlight = 'StatusLinePrimarySep'
    }
}
gls.right[10] = { CursorRightSep = make_right_sep(nil, 'StatusLinePrimarySep') }

vim.cmd('hi StatusLinePrimary gui=bold guifg=' .. get_color('black'))
vim.cmd('hi StatusLinePrimarySep gui=bold guibg=' .. get_color('bg4'))
vim.cmd('hi StatusLineSecondary guibg=' .. get_color('bg0'))
vim.cmd('hi StatusLineSecondarySep gui=bold guibg=' .. get_color('bg4') .. ' guifg=' .. get_color('bg0'))
vim.cmd('hi StatusLineCenter guibg=' .. get_color('bg4') .. ' guifg=' .. get_color('fg'))
vim.cmd('hi StatusLineError guibg=' .. get_color('bg4') .. ' guifg=' .. get_color('red'))
vim.cmd('hi StatusLineWarn guibg=' .. get_color('bg4') .. ' guifg=' .. get_color('yellow'))
vim.cmd('hi StatusLineHint guibg=' .. get_color('bg4') .. ' guifg=' .. get_color('purple'))
vim.cmd('hi StatusLineInfo guibg=' .. get_color('bg4') .. ' guifg=' .. get_color('blue'))
vim.cmd('hi StatusLineFileNameModified guibg=' .. get_color('bg4') .. ' guifg=' .. get_color('orange'))
vim.o.showmode = false


gls.short_line_left[1] = {
    InactiveFirstElement = {
        provider = function() return '   ' end,
        highlight = 'StatusLineInactiveFirst'
    }
}

local color_change_event = 'TextChanged,TextChangedI,TextChangedP,BufWritePost'

gls.short_line_left[2] = {
    InactiveFileIconUnmodified = {
        provider = 'FileIcon',
        highlight = 'StatusLineInactive',
        condition = function() return not (buf_modified() or unknown_ft()) end,
        event = color_change_event
    }
}

gls.short_line_left[3] = {
    InactiveFileNameUnmodified = {
        provider = 'FileName',
        highlight = 'StatusLineInactive',
        condition = function() return not buf_modified() end,
        event = color_change_event
    }
}

gls.short_line_left[4] = {
    InactiveFileIconModified = {
        provider = 'FileIcon',
        highlight = 'StatusLineInactiveFileNameModified',
        condition = function() return buf_modified() and (not unknown_ft()) end,
        event = color_change_event
    }
}

gls.short_line_left[5] = {
    InactiveFileNameModified = {
        provider = 'FileName',
        highlight = 'StatusLineInactiveFileNameModified',
        condition = function() return buf_modified() end,
        event = color_change_event
    }
}

gls.short_line_right[1] = {
    InactiveDiagnosticError = {
        provider = 'DiagnosticError',
        icon = '',
        highlight = 'StatusLineInactiveError'
    }
}

gls.short_line_right[2] = {
    InactiveDiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '',
        highlight = 'StatusLineInactiveWarn'
    }
}

gls.short_line_right[3] = {
    InactiveDiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '',
        highlight = 'StatusLineInactiveHint'
    }
}

gls.short_line_right[4] = {
    InactiveDiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '',
        highlight = 'StatusLineInactiveInfo'
    }
}

gls.short_line_right[5] = {
    InactiveLeftSep = {
        provider = function() return ' ' end,
        icon = '·',
        condition = function()
            return (
                (diagnostic.get_diagnostic_error() ~= nil) or
                (diagnostic.get_diagnostic_warn() ~= nil) or
                (diagnostic.get_diagnostic_hint() ~= nil) or
                (diagnostic.get_diagnostic_info() ~= nil)
            )
        end,
        highlight = 'StatusLineInactive'
    }
}

gls.short_line_right[6] = {
    InactiveFileSize = {
        provider = 'FileSize',
        highlight = 'StatusLineInactive'
    }
}

gls.short_line_right[7] = {
    InactiveFileLength = {
        provider = function() return vim.fn.line('$') .. ' lines ' end,
        highlight = 'StatusLineInactive',
        separator = '· ',
        separator_highlight = 'StatusLineInactive',
    }
}

vim.cmd('hi StatusLineInactiveFirst guibg=' .. get_color('black') ..' guifg=' .. get_color('grey'))
vim.cmd('hi StatusLineInactive guibg=' .. get_color('black') ..' guifg=' .. get_color('grey'))
vim.cmd('hi StatusLineInactiveFileNameModified guibg=' .. get_color('black') .. ' guifg=' .. get_color('orange'))
vim.cmd('hi StatusLineInactiveError guibg=' .. get_color('black') .. ' guifg=' .. get_color('red'))
vim.cmd('hi StatusLineInactiveWarn guibg=' .. get_color('black') .. ' guifg=' .. get_color('yellow'))
vim.cmd('hi StatusLineInactiveHint guibg=' .. get_color('black') .. ' guifg=' .. get_color('purple'))
vim.cmd('hi StatusLineInactiveInfo guibg=' .. get_color('black') .. ' guifg=' .. get_color('blue'))
