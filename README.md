# SqueakKara
SqueakKara

## How To Use

To start the game, open a workspace and run 'SKLandingPage new.'. Then you can select a new project or a level from the LandingPage and start playing!

## Hints 

Kara has following methods you can use:
  - move
  - turn
  - trunkAhead
  - onCloverleaf

## Architecture

![image](https://github.com/hpi-swa-teaching/SqueakKara/assets/149858749/286cde60-77bf-498b-af44-65e80f10baff)

The LandingPage opens the Environment, which consists of the Grid, Workspace and the Executer. The grid owns every object and allows interactions between them. The workspace owns kara and allows the do-it and print-it-statements. You can write code in the Workspace and execute it with the executer through the execute commands above the grid. There you can start, pause and terminate a process and toggle the speed. THe executer uses a kara decorator to allow stepping through the code. 

