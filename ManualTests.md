# Manual Tests for SqueakKara

Most of these should come up when using the project normally. This document is more of a concise overview over (mostly UI) functionalities that are not yet being tested and in most cases are difficult to test for.

## Block UI
- [ ] Block UI should have a consistent layout in all Squeak-internal scale factors
  - [ ] all BlockParts should always be fully contained by their parent Block
  - [ ] the BlockEditor Window should never exceed the full screen size
  - [ ] e.g. when changing from Scale 100 % to 300 % all sizes (borderWidth, minHeight, etc.) should be 3-times higher

### SKBlockSource
- [ ] Categories should be displayed and expandable
- [ ] Blocks can be copied from the BlockSource by dragging
- [ ] Values are not editable in the BlockSource
- [ ] Blocks can not be connected to other Blocks still in the BlockSource

### SKBlockEditor
- [ ] Block Previews appear whenever a Block can snap to another Block
- [ ] specific Block Previews disappear whenever the dragged Block is moved out of that 'snapRadius'
- [ ] when dropping a Block in the BlockEditor such that it would exceed the Editors bounds it is visually clipped
  - [ ] if necessary the Editor grows to fit the new block such that the dropped block is completely viewable by scrolling

### SKTextSlotPart
- [ ] either accepts all characters or only accepts numeric inputs
  - [ ] when corners are only rounded 'a bit' it should accept/display all characters and not accept Integer Value blocks (like ()=())
  - [ ] when corners are fully round it should accept/display only numeric inputs and accept Integer Value blocks
- [ ] should release focus on enter, esc, end
- [ ] should accept normal editing inputs (such as arrow keys and backspace, delete)

### SKBlock
- [ ] Blocks (apart from the 'Start of Script') can be moved by dragging
- [ ] Blocks snap together correctly
  - [ ] there are no visible Gaps between one Block and another Block connected to it
  - [ ] the 'Tabs' of connected ActionBlocks align
  - [ ] Blocks grow around other Blocks dropped into their BlockGap(s)
  - [ ] connected Blocks follow a dragged block that is higher in the connected 'stack'
  - [ ] if the shape of one Block A can not fit any gap in another Block B, A can also not be dropped into B
- [ ] Number Inputs should not change width when typing a one-character number and a two-character number
