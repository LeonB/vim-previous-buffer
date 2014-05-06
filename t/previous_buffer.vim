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
        " Create a vertical split
        wincmd v

        " Open two buffers in window 1
        1wincmd w
        e w1-test1.vim
        e w1-test2.vim

        " Open two buffers in window 3
        2wincmd w
        e w2-test1.vim
        e w2-test2.vim

        " Jump to window 1 and test the previous buffer
        1wincmd w
        PreviousBuffer
        Expect bufname('%') == 'w1-test1.vim'

        " Jump to window 2 and test the previous buffer
        2wincmd w
        PreviousBuffer
        Expect bufname('%') == 'w2-test1.vim'
    end

    it 'ignores windows based on a user defined regex'
        TODO
    end
end
