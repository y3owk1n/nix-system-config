// A very tridactyl-esque config file.

// Compatibility Prefix
const {
  Clipboard,
  Front,
  Hints,
  Normal,
  RUNTIME,
  Visual,
  aceVimMap,
  addSearchAlias,
  cmap,
  getClickableElements,
  imap,
  imapkey,
  iunmap,
  map,
  mapkey,
  readText,
  removeSearchAlias,
  tabOpenLink,
  unmap,
  unmapAllExcept,
  vmapkey,
  vunmap,
} = api;

// ---- Settings ----
Hints.setCharacters("htnsgcrl");

settings.hintAlign = "left";
settings.omnibarPosition = "bottom";
settings.focusFirstCandidate = false;
settings.focusAfterClosed = "last";
settings.scrollStepSize = 200;
settings.tabsThreshold = 0;
settings.modeAfterYank = "Normal";

map("u", "e");
map("P", "cc");
map("gi", "i");
map("F", "gf");
map("gf", "w");
map("`", "'");
// save default key `t` to temp key `>_t`
map(">_t", "t");
// create a new key `t` for default key `on`
map("t", "on");
// create a new key `o` for saved temp key `>_t`
map("o", ">_t");
map("H", "S");
map("L", "D");
map("gt", "R");
map("gT", "E");
map("K", "R");
map("J", "E");
// Next/Prev Page
map("K", "[[");
map("J", "]]");

// ---- Unmap -----
// Proxy Stuff
unmap("spa");
unmap("spb");
unmap("spc");
unmap("spd");
unmap("sps");
unmap("cp");
unmap(";cp");
unmap(";ap");

// Emoji
iunmap(":");

// Misc
unmap(";t");
unmap("si");
unmap("ga");
unmap("gc");
unmap("gn");
unmap("gr");
unmap("ob");
unmap("og");
unmap("od");
unmap("oy");

// ---- Search Engines -----
removeSearchAlias("b", "s");
removeSearchAlias("d", "s");
removeSearchAlias("g", "s");
removeSearchAlias("h", "s");
removeSearchAlias("w", "s");
removeSearchAlias("y", "s");
removeSearchAlias("s", "s");
