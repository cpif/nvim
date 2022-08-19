ipsum = {
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur adipiscing elit duis tristique sollicitudin nibh. Elementum pulvinar etiam non quam. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque. Eget dolor morbi non arcu risus quis varius. Etiam tempor orci eu lobortis elementum. Ultricies integer quis auctor elit sed. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras. Viverra suspendisse potenti nullam ac tortor vitae purus faucibus ornare. Faucibus a pellentesque sit amet porttitor eget dolor. Urna condimentum mattis pellentesque id nibh.',
'',
'Ridiculus mus mauris vitae ultricies leo integer malesuada. Sed odio morbi quis commodo odio aenean sed adipiscing diam. Felis imperdiet proin fermentum leo vel. Sed arcu non odio euismod lacinia at quis risus. Morbi quis commodo odio aenean. Sociis natoque penatibus et magnis dis parturient montes nascetur. Sed blandit libero volutpat sed cras ornare. Vitae sapien pellentesque habitant morbi tristique. In mollis nunc sed id semper risus. Iaculis urna id volutpat lacus laoreet non curabitur gravida. Tincidunt augue interdum velit euismod in pellentesque massa. Ac felis donec et odio pellentesque diam volutpat commodo sed. Quis ipsum suspendisse ultrices gravida dictum fusce ut. Elementum tempus egestas sed sed. Quam viverra orci sagittis eu volutpat. Maecenas pharetra convallis posuere morbi leo urna molestie at.',
}

function lorem()
  vim.api.nvim_buf_set_lines(0, 0, -1, true, ipsum)
end
