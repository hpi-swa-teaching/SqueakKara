### SqueakKara 🐞
When you want coding to be as simple as collecting a cloverleaf. 

## How To Use 🍀

To start the game, open a workspace and run 'SKLandingPage new.'. Then you can select an interface and a level from the LandingPage and start playing! Currently, you can 
start coding by writing classy smalltalk, creating blocks like in Scratch and by creating Mealy state machines. A game window and a interface corresponding to the selected interface will appear.


## What to do 🎱

When you just want to experiment open a blank project. 

To solve problems open one of the example projects. The first 2 are completed when you reach the cloverleaf. The 3rd one is a bit trickier, there you have to make Kara stop moving at the start or the end of the tunnel.

To add your own projects you can modify the challenge functions in the SKGrid and the SKEnvironment class. 

## Blocks
When selecting Blocks, a BlockEditor and a GameWindow pops up. Start dragging predefined blocks into the window. You are only allowed a limited number of blocks, so define variables and functions to solve the level within the limit.

## Code
When selecting Code, a SKWorkspace and a GameWindow pops up. Start writing your solution in the Workspace and execute in in the GameWindow. Write full code in the SKWorkspace, **save the code** and use the **execute controls** above the SKGrid. You can also reset the level if Kara gets stuck. 

## Mealy
When selecting Mealy, a StateMachineEditor and a GameWindow pops up. Start creating Nodes and connect them with edges. Each edge has a certain condition to be met to walk along it and an "output - an action kara does. 

## Hints 💡

Kara has following methods you can use:
  - move
  - turn: left/right
  - trunkAhead
  - onCloverleaf

And remember to use Squeak Syntax.

### Example solution for "1-3 Spiral Garden" 👨‍💻

```squeak
[kara onCloverleaf not]
	whileTrue: [
		kara trunkAhead 
			ifTrue: [kara turn: right]
			ifFalse: [kara move]]
```

You can use the slider in the middle to change the speed of the code execution.

If you have moved Kara in a tricky spot or mushrooms in a corner, you can always use the reset button inbetween the 'stop execution' and 'spawn another kara' button. 

You can also run code by using the "do it" command `CTRL+D`. If you find yourself stuck in an infinite loop (Squeak might get unresponsive), just press `ALT+.` to interrupt the code execution.

## Architecture 🌇

<img width="2042" height="1129" alt="Architecture SWT drawio" src="https://github.com/user-attachments/assets/1a2de416-e460-4377-ba50-9eb6d89c3a1c" />


The LandingPage opens the Environment, which consists of the Grid, Workspace and the Executer. The grid owns every object and allows interactions between them. The workspace owns Kara and allows the do-it and print-it-statements. 

You can write code in the Workspace and execute it with the executer through the execute commands above the grid. There you can start, pause and terminate a process and toggle the speed. The executer uses a Kara decorator to allow stepping through the code. 

