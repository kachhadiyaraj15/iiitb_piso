# iiitb_piso - Parallel input Serial output Shift register
## Introduction
The information stored within these registers can be transferred with the help of shift registers. Shift Register is a group of flip flops used to store multiple bits of data. The bits stored in such registers can be made to move within the registers and in/out of the registers by applying clock pulses. An n-bit shift register can be formed by connecting n flip-flops where each flip flop stores a single bit of data.
The registers which will shift the bits to left are called “Shift left registers”.
The registers which will shift the bits to right are called “Shift right registers”.
  
## Circuit diagram details
A Register is a device which is used to store such
information. It is a group of flip flops connected in series used
to store multiple bits of data. The information stored within
these registers can be transferred with the help of shift register.
The bits stored in such registers can be made to move within
the registers and in/out of the registers by applying clock
pules.

Shift registers are basically of 4 types. These are:
1. Serial In Serial Out register
2. Serial In Parallel Out register
3. Parallel In Serial Out shift register
4. Parallel In Parallel Out shift register

Here PISO shift register work in two mode, shift mode and
load mode. In load mode we load the data simultaneously in
each flip flop. Here data is load in flipflop when shift input
value is zero. And when shift input value is one so data
transfer serially from flip 1 to 2 and so on.

When shift input is zero at that time directly connected AND
gate with shift input output becomes zero so data will load in flip
flops and if the shift input value is one at that time AND gate
output is zero which is connected with inverted shift input. So
flip flop1 output will become flip flop2 input and same as in flip
flop 2, flip flop 3, and flip flop 4. And data will transfer serially
clockwise. Here in fig.1 circuit diagram of PISO is defined and
in Fig.2 output of PISO.

#### Circuit Diagram
![PISO circuit diagram](https://user-images.githubusercontent.com/110079774/181258398-bcaf944e-b764-455b-be0d-bc982edd157f.jpg)
Fig.2 Circuit Diagram

## About iverilog 
Icarus Verilog is an implementation of the Verilog hardware description language.

## About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog VCD/EVCD files and allows their viewing

## Functionality Simulation 
#### How to download github repo file in your ubuntu?</br>
Enter this command line in your command line terminal </br>
```
  $ git clone https://github.com/kachhadiyaraj15/iiitb_piso
```

Once download this file from repo now we run that file in iverilog using below command </br>
Here all file save in `gitgub` folder
```
  $ cd github
  $ iverilog iiitb_piso.v iiitb_piso_tb.v
  $ ./a.out
  $ gtkwave dump.vcd
 ```
![RUN terminal PISO ](https://user-images.githubusercontent.com/110079774/181263695-7e2905ea-8f60-40c2-9d4f-4fcc90d178a1.png)
Command for run synthesis file:

![synth_output_wave_command](https://user-images.githubusercontent.com/110079774/184916226-05309073-691c-4462-b388-828bf498f45d.png)



## GTKWAVE Output:
Simulation results 
![GTKWAVE PISO OUTPUT](https://user-images.githubusercontent.com/110079774/181261100-65c84f4a-a20c-4fe3-87c9-3bafc7222e33.png)
![GTKWAVE PISO OUTPUT1](https://user-images.githubusercontent.com/110079774/181261645-8668ccc8-d78f-41d5-9d5a-f9625419de7d.png)
![GTKWAVE PISO OUTPUT2](https://user-images.githubusercontent.com/110079774/181261765-424b7989-e7e0-4062-9c26-f6912ba6d487.png)
![GTKWAVE PISO OUTPUT3](https://user-images.githubusercontent.com/110079774/181261780-eddddd84-6fc8-4abc-aa63-649f58b1ab98.png)
The gate level simulation waveform matches with the RTL simulation waveform.
![synth_output_wave](https://user-images.githubusercontent.com/110079774/184916203-9e189257-ebd2-40d8-bc76-6b14b8c4fe69.png)

## PHYSICAL DESIGN

**Openlane**<br>

OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.<br>

more at https://github.com/The-OpenROAD-Project/OpenLane

**Installation instructions**<br>

``` $   apt install -y build-essential python3 python3-venv python3-pip ```

Docker installation process: https://docs.docker.com/engine/install/ubuntu/

goto home directory->
``` 
$   git clone https://github.com/The-OpenROAD-Project/OpenLane.git
$   cd OpenLane/
$   sudo make 
```
To test the open lane
``` 
$ sudo make test
```
It takes approximate time of 5min to complete. After 43 steps, if it ended with saying **Basic test passed** then open lane installed succesfully.

**Magic**
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.

More about magic at http://opencircuitdesign.com/magic/index.html

Run following commands one by one to fulfill the system requirement.
```
$   sudo apt-get install m4
$   sudo apt-get install tcsh
$   sudo apt-get install csh
$   sudo apt-get install libx11-dev
$   sudo apt-get install tcl-dev tk-dev
$   sudo apt-get install libcairo2-dev
$   sudo apt-get install mesa-common-dev libglu1-mesa-dev
$   sudo apt-get install libncurses-dev
```
**To install magic** goto home directory
```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install
```
type **magic** terminal to check whether it installed succesfully or not. type exit to exit magic.

**Generating Layout**

Open terminal in home directory
```
$   cd OpenLane/
$   cd designs/
$   mkdir iiitb_piso
$   cd iiitb_piso/
$   wget https://raw.githubusercontent.com/sanampudig/iiitb_piso/main/config.json
$   mkdir src
$   cd src/
$   wget https://raw.githubusercontent.com/sanampudig/iiitb_piso/main/iiitb_piso.v
$   cd ../../../
$   sudo make mount
$   ./flow.tcl -design iiitb_piso
```

To see the layout we use a tool called magic which we installed earlier.

open terminal in home directory

```
$   cd OpenLane/designs/iiitb_piso/run
$   ls
```
select most run directoy from list
```
$  cd RUN_2022.08.24_18.20.10
```
run following instruction
```
$   cd results/final/def
```
update the highlited text with appropriate path
![path_for_physical_design](https://user-images.githubusercontent.com/110079774/186657674-9d03b896-64e1-4a88-989d-8da43ad5a204.png)


layout will be open in new window

**layout**
![magicpiso](https://user-images.githubusercontent.com/110079774/187410858-3374aed0-eac5-40f1-8765-8a84b91c058a.png)


![vsdinv](https://user-images.githubusercontent.com/110079774/187410889-3111500f-cbdd-4776-b64e-7bf5facdb5bb.png)


## Future work:
working on GLS for post-layout netlist.


## Contributors
+ Rajkumar Manishbhai Kachhadiya
+ Kunal Ghosh

## Acknowledgments
+ Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
+ MADHAV RAO , Associate Professor, iM.Tech Coordinator and Faculty in-charge-Labs

## Contact Information
+ Rajkumar Manishbhai Kachhadiya, Postgraduate Student, International Institute of Information Technology, Bangalore raj.kachhadiya15@gmail.com
+ Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com

## Reference
https://www.ti.com/lit/ds/symlink/sn74hc165.pdf?ts=1658811599345&ref_url=https%253A%252F%252Fwww.ti.com%252Fsitesearch%252Fen-us%252Fdocs%252Funiversalsearch.tsp%253FlangPref%253Den-US%2526searchTerm%253Dsn74hc165dr%2526nr%253D12



