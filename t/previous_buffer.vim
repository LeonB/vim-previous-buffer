runtime! autoload/previous_buffer.vim

describe 'previous_buffer'
    before
    end

    after
        bufdo bdelete!
    end

    it 'provides the :PreviousBuffer command'
        Expect exists(':PreviousBuffer') to_be_true
    end

    it "stays in the file when i'ts the first file edited"
        e test1.vim
        PreviousBuffer
        Expect bufname('%') == 'test1.vim'
    end

    it 'jumps back to the previous file when both are normal'
        e test1.vim
        e test2.vim
        PreviousBuffer
        Expect bufname('%') == 'test1.vim'

        e test1.vim
        e test2.vim
        e test1.vim
        PreviousBuffer
        Expect bufname('%') == 'test2.vim'
    end

    it 'ignores buffers with nobuflisted set'
        e test1.vim
        e test2.vim
        e hidden.vim
        set nobuflisted
        PreviousBuffer
        Expect bufname('%') == 'test2.vim'

        e test1.vim
        e test2.vim
        e hidden.vim
        set nobuflisted
        e test2.vim
        PreviousBuffer
        Expect bufname('%') == 'test1.vim'

        e test1.vim
        e test2.vim
        e hidden.vim
        set nobuflisted
        e test1.vim
        PreviousBuffer
        Expect bufname('%') == 'test2.vim'
    end

    it 'keeps a separate jumplist per window'
        wincmd v
        1wincmd w
        Expect winnr() == 1

        2wincmd w
        Expect winnr() == 2
        TODO
    end
end
