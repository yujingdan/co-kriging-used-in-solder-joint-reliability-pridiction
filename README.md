# multi-fidelity used to optimize solder joints size
 This code realizes the construction of cokriging model, which is used for the structural size design of solder joints. The input is the radius, height and spacing, and the output is the maximum equivalent stress and life of solder joints
firstly, the FEA analysis are performed, the Temperature cycle load:
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/Temperature%20cycle%20load.jpg)
some results:
Maximum stress under temperature cycle
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/Maximum%20stress%20under%20temperature%20cycle.png)
 Solder joint stress distribution cloud diagram
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/Solder%20joint%20stress%20distribution%20cloud%20diagram.png)
Accumulative plastic strain
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/Accumulative%20plastic%20strain.png)
Convergence test of meshing scheme
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/Convergence%20test%20of%20meshing%20scheme.png)
secondly, after the FEA analysis, the sample points are designed and the multi-fidelty model, neural network model and kriging model are constructed
sample points:
nest:
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/Design%20sample%20point%20(nest).png)
not nest:
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/Design%20sample%20point%20(not%20nest).png)
performence of sevaral models:
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/results.png)
optimization performance:
![image](https://github.com/yujingdan/multi-fidelity-used-to-optimize-solder-joints-size/blob/main/picture/results2.png)
