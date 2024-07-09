# SqueakKara 🐞
When you want coding to be as simple a collecting a cloverleaf. 

## How To Use 🍀

To start the game, open a workspace and run 'SKLandingPage new.'. Then you can select a new project or a level from the LandingPage and start playing!

You see it opened 2 windows SKGrid and SKWorkspace. 

You have 2 options to execute code: either you use the *"Do It!"* or the *"Print It!"* commands in the newly opened SKWorkspace for instant feedback. OR you write full code in the SKWorkspace, **save the code** and use the **execute controls** above the SKGrid.

## What to do 🎱

When you just want to experiment open a blank project. 

To solve problems open one of the example projects. The first 2 are completed when you reach the cloverleaf. The 3rd one is a bit trickier, there you have to make Kara stop moving at the start or the end of the tunnel.

To add your own projects you can modify the challenge functions in the SKGrid and the SKEnvironment class. 

## Hints 💡

Kara has following methods you can use:
  - move
  - turn: left/right
  - trunkAhead
  - onCloverleaf

And remember to use Squeak Syntax.

### Example Code 👨‍💻

```squeak
[kara onCloverleaf not]
	whileTrue: [
		kara trunkAhead 
			ifTrue: [kara turn: left]
			ifFalse: [kara move]]
```

You can use the slider in the middle to change the speed of the code execution.

If you have moved Kara in a tricky spot you can always change its position in the grid via the Squeak Halo.

## Architecture 🌇

![image](https://github.com/hpi-swa-teaching/SqueakKara/assets/149858749/286cde60-77bf-498b-af44-65e80f10baff)

The LandingPage opens the Environment, which consists of the Grid, Workspace and the Executer. The grid owns every object and allows interactions between them. The workspace owns Kara and allows the do-it and print-it-statements. 

You can write code in the Workspace and execute it with the executer through the execute commands above the grid. There you can start, pause and terminate a process and toggle the speed. The executer uses a Kara decorator to allow stepping through the code. 

