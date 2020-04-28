# Newman–Shanks–Williams prime
Recurrence relation for Newman–Shanks–Williams prime is:

S_0 = 1
S_1 = 1
S_n = 2*S_{n-1} + S{n-2} 
The first few terms of the sequence are 1, 1, 3, 7, 17, 41, 99, ….



Examples:

Input : n = 3
Output : 7

Input : n = 4
Output : 17
# FSMD
Basic Finite State Machine with Datapath (FSMD) example to find the nth term in Moser-de Bruijn sequence.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/NewmanShanksWilliams.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd NewmanShanksWilliams
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if n = 3, then y = 7:

    ```sh
    $ vsim work.tb
    ```
