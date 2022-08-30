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
## 7. PHYSICAL DESIGN 
### 7.1 Openlane
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.

Find more details for OpenLane at https://github.com/The-OpenROAD-Project/OpenLane
### 7.2 Installation instructions 
```
$   apt install -y build-essential python3 python3-venv python3-pip
```
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

### 7.3 Magic
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.

Find more details of magic at http://opencircuitdesign.com/magic/index.html

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
**To install magic**
goto home directory

```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install
```
type **magic** terminal to check whether it installed succesfully or not. type **exit** to exit magic.

### 7.4 Invoking OpenLANE and Design Preparation
Openlane can be invoked using docker command followed by opening an interactive session. flow.tcl is a script that specifies details for openLANE flow.
```
docker
./flow.tcl -interactive
package require openlane 0.9
```
```
prep -design iiitb_piso
```
![image](https://user-images.githubusercontent.com/110079774/187422828-69958262-6542-40b9-809e-21409ffd1cea.png)

![image](https://user-images.githubusercontent.com/110079774/187422710-77cc79bc-87e2-46e5-b72f-394689d7eba5.png)

```
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs
```
![image](https://user-images.githubusercontent.com/110079774/187423179-7b0eed6d-348a-4330-9065-80deed8fe418.png)


### 7.5 Synthesis:

Synthesis is the process of creating a gate level description of the blocks that are described behaviorally in verilog and prepairing the complete design for the place and route process.

** Physical Cells**
![image](https://user-images.githubusercontent.com/110079774/187433669-50351b86-832c-4702-b912-74565169a67a.png)

Write the command for synthesis:
```run_synthesis
```
![image](https://user-images.githubusercontent.com/110079774/187423297-f06590fb-7bd5-4a42-8883-51344469a07f.png)

### 7.6 Floorplanning:
Floor plan determines the size of the design cell (or die), creates the boundary and core area, and creates wire tracks for placement of standard cells. It is also a process of positioning blocks or macros on the die.

To run the iiitb_piso floorplan in openLANE:
```
run_floorplan
```
![image](https://user-images.githubusercontent.com/110079774/187423434-a0ceacf5-ba6e-4576-b0a2-af2622be7859.png)


Post the floorplan run, a .def file will have been created within the results/floorplan directory. We may review floorplan files by checking the floorplan.tcl. The system defaults will have been overriden by switches set in conifg.tcl and further overriden by switches set in sky130A_sky130_fd_sc_hd_config.tcl.

To view the floorplan, Magic is invoked after moving to the results/floorplan directory:
```
magic -T /home/karam/vsdflow/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.max.lef read iiitb_piso.def
```
![image](https://user-images.githubusercontent.com/110079774/187432460-3eede667-1096-4882-9bf2-0633bb8984d0.png)

- One can zoom into Magic layout by selecting an area with left and right mouse click followed by pressing "z" key.</br>
- Various components can be identified by using the what command in tkcon window after making a selection on the component.</br>
- Zooming in also provides a view of decaps present in johnson's counter chip.</br>
- The standard cell can be found at the bottom left corner.</br>

### 7.7 Placement:
Placement can be done in four phases:

I. Pre-placement optimization: In this process optimization happens before netlist is placed. In this process high-fan out nets are collapsed downsizing the cells.</br>

II. In placement optimization: In this process logic is re-optimized according to the VR. Cell bypassing, cell moving, gate duplication, buffer insertion, etc. can be performed in this step.</br>

III. Post Placement optimization: Netlist is optimized with ideal clocks before CTS. It can fix setup, hold violations. Optimization is done based on global routing.</br>

IV. Post placement optimization after CTS optimization: Optimization is performed after the CTS optimization is done using propagated clock. It tries to preserve the clock skew.</br>

Command to run placement process:
```
run_placement
```
![image](https://user-images.githubusercontent.com/110079774/187423785-c500d1ec-f357-46ce-9670-46d2c0033333.png)
The objective of placement is the convergence of overflow value. If overflow value progressively reduces during the placement run it implies that the design will converge and placement will be successful. Post placement, the design can be viewed on magic within results/placement directory:
```
 magic -T /home/karam/vsdflow/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.max.lef read iiitb_jc.def
```


Placement results:
![image](https://user-images.githubusercontent.com/110079774/187433012-3b505b4f-b0b2-405a-b531-7a1052e3fb32.png)


![magicpiso](https://user-images.githubusercontent.com/110079774/187410858-3374aed0-eac5-40f1-8765-8a84b91c058a.png)


![vsdinv](https://user-images.githubusercontent.com/110079774/187410889-3111500f-cbdd-4776-b64e-7bf5facdb5bb.png)

### 7.8 Clock Tree Synthesis (CTS):
The purpose of building a clock tree is enable the clock input to reach every element and to ensure a zero clock skew. H-tree is a common methodology followed in CTS. Before attempting a CTS run in TritonCTS tool, if the slack was attempted to be reduced in previous run, the netlist may have gotten modified by cell replacement techniques. Therefore, the verilog file needs to be modified using the write_verilog command. Then, the synthesis, floorplan and placement is run again. To run CTS use the below command:

```
run_cts
```
![image](https://user-images.githubusercontent.com/110079774/187424331-b901737f-932a-43dc-ab2d-12e55825e985.png)


### 7.9 Routing:

The overall routing job is executed in three steps which are

- **Global Routing** – In this stage, the whole design is first partitioned in small routing region into tiles/rectangles. Also, region to region paths are decided in a way to optimize the wire lengths and timing. This stage is actually the planning stage and no actual routing is done.</br>
    
- **Track Assignment** – In this stage, the routing tracks assigned by the global stage are replaced by the metal layers. Tracks are assigned in horizontal and vertical direction. If overlapping is occurred then rerouting is done.</br>
    
- **Detailed Routing** – Even if the metal layers are laid, the path may exists which can violate the setup and hold criteria In this stage, the critical paths are searched and fixed in many iterations until fixed.</br>

Write the command to run routing:
```
run_routing
```
![image](https://user-images.githubusercontent.com/110079774/187424709-e892ef96-d58d-4f11-97ef-e6ec0f4846d5.png)

The results after the routing are:
![image](https://user-images.githubusercontent.com/110079774/187440601-094732e9-2594-4ba4-b71d-2f6270eb5ec4.png)
![image](https://user-images.githubusercontent.com/110079774/187440831-8f071cd8-8adc-4b66-9dd4-af21f4e17daa.png)


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



