# Nvim Configuration

## Todo

- [ ] Document each file in `lua` (or delete them)
    - [x] checkbox.lua
    - [x] cipher.lua
    - [x] cleanquotes.lua
    - [x] filetypes.lua
    - [ ] floatingwindows.lua
    - [x] floatwin.lua
    - [ ] highlight.lua
    - [x] notepad.lua
    - [x] status.lua
    - [ ] strings.lua
    - [x] todo.lua
- [ ] Write about `init.lua`
- [ ] Add comments to the floating-window data structures
- [ ] Compare `highlight.lua` to `floatingwindows.lua`. They come
  from similar impetuses but have been handled very differently
  -- which is better?
- [ ] Similarly, check out `strings.lua`, which uses folds like
  `highlight.lua`
- [x] Some floating windows (currently to-do list and the
  scratchpad) should set textwidth. They don't, but I think they
  used to.
- [ ] Write a helpful readme once you figure out what this file
  is good for -- which, honestly, you should once you're done
  with all this.
- [ ] In `floatingwindows`, scratch/write is redundant (?) --
  don't they mean the same thing? Backwards, of course -- if you
  write it's *not* scratch, and vice versa.
- [x] You could make a *subtable* in the floating windows data
  structure! And iterate over it, setting buffer-local options in
  the function that makes the window. **kaboom**.
