local M = {
    diagnostics = {
        Error = ' ',
        Warn = ' ',
        Info = ' ',
        Hint = ' ',
    },
    git = {
        added = '',
        changed = '',
        deleted = '',
        branch = '',
        branch2 = '',
    },
    dap = {
        Stopped = {'󰁕 ', 'DiagnosticSignWarn', 'DapStoppedLine'},
        Breakpoint = {' ', 'DiagnosticSignInfo'},
        BreakpointCondition = {' ', 'DiagnosticSignHint'},
        BreakpointRejected = {' ', 'DiagnosticSignError'},
        LogPoint = '.>',
    },
    misc = {
        folder = '',
        folder_outline = '',
        file = '',
        file2 = '',
        file_outline = '󰧮',
        search = '',
    },
}

return M
