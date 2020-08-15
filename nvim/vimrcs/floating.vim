function! s:get_border_lines(title, width, height) abort
    " width and height is that of content inside (inclusive of padding)
    let top = g:floaterm_borderchars[4] .
                \ repeat(g:floaterm_borderchars[0], a:width) .
                \ g:floaterm_borderchars[5]
    let mid = g:floaterm_borderchars[3] .
                \ repeat(' ', a:width) .
                \ g:floaterm_borderchars[1]
    let bot = g:floaterm_borderchars[7] .
                \ repeat(g:floaterm_borderchars[2], a:width) .
                \ g:floaterm_borderchars[6]
    let top = floaterm#util#string_compose(top, 1, a:title)
    let lines = [top] + repeat([mid], a:height) + [bot]
    return lines
endfunction

function! s:draw_border(title, opts) abort
    " pad 1 column on left and right
    let lines = s:get_border_lines(a:title, a:opts.width + 2, a:opts.height)

    let opts = { 
                \ 'relative': a:opts.relative, 
                \ 'width': a:opts.width + 4,
                \ 'height': a:opts.height + 2,
                \ 'row': a:opts.row - 1,
                \ 'col': a:opts.col - 2,
                \ 'style': 'minimal',
                \ 'focusable': v:false,
                \ }

    let buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(buf, 0, -1, v:true, lines)
    let border_winid = nvim_open_win(buf, v:false, opts)
    call nvim_win_set_option(border_winid, 'winhl', 'Normal:FloatermBorder')
    return buf
endfunction

function! CreateFloatingWindow(buffer, opts, title) abort
    let border_buf = s:draw_border(a:title, a:opts)
    let winid = nvim_open_win(a:buffer, v:true, a:opts)
    let s:bw_cmd = 'bw ' . border_buf
    au BufWipeout <buffer> exe s:bw_cmd
    call nvim_win_set_option(winid, 'winhl', 'Normal:Floaterm,NormalNC:FloatermNC')
endfunction
