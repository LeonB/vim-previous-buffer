# A 'jump to previous buffer' command that behaves as you would expect

This plugin adds a command to easily jump back to a previous buffer. It's better
than the built in `:bn` or `CTRL-6` because it ignores :nobuflisted buffers so
you don't jump back to [Unite's](https://github.com/Shougo/unite.vim) buffers,
Netrw buffers et cetera.  Additionaly you can also provide a regex to ignore
buffers by name.  The previous buffer is getting tracked on a per window basis
so even in the case of a multi-window setup you jump back to the right place.

## Installation

I recommend using Tim Pope's pathogen plugin, Shougo's NeoBundle plugin or
Gmarik's Vundle plugin to install this.

## Usage

The plugin provides a :PreviousBuffer command but it would be a lot easier to
configure a mapping for it. I use this:

```
nmap <leader>bn :PreviousBuffer<CR>
```

## Configuration

You can configure the plugin to ignore additional buffers (that have buflisted
set) by setting the variable `g:previous_buffer_ignore_pattern`. The variable
string is treated as a regex when it is matched against the buffer name.
`bufname()` is used for the match.

```
let g:previous_buffer_ignore_pattern = 'test_dir'
```

The default value of `g:previous_buffer_ignore_pattern` = '' so by default only
`nobuflisted` buffers are ignored.

## License

Same terms as Vim itself (see `license`)
