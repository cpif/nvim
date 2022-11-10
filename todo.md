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
- [x] I also would like double and single quotes to be more
  consistent across files -- why haven't I dont that anyway?
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
- [ ] It's possible that it would be better to declare a buffer
  number for each floating-point window -- though I don't think
  it matters that you're creating new buffers every time you open
  one during an editing session, it's also not a particularly
  clean way of doing business. And I don't think it'd hurt
  anything to reserve a certain buffer number per three unique
  files -- so long as they are in the buf list and won't be
  otherwise employed.
