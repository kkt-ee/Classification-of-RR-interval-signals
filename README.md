## The codes are part of the conference paper entitled "Recurrence Quantification Analysis of RR Interval Signals of Female Smokers and Non-smokers during Different Phases of Menstrual Cycle" published at IEEE INDICON 2018.  

--------

### DATASET: 
A: ECG signal (single channel) of 11 female volunteers (smokers) captured at follicular, ovulation and leutal phases of their ovarian cycle.
B: ECG signal (single channel) of 11 female volunteers (non-smokers) captured at follicular, ovulation and leutal phases of their ovarian cycle.

-------

### Step1_RRI 
The RR interval is extracted from the ECG signals using modified Pan-Tompkins algorithm.

#### Preprocessing
The ECG signals were preprocessed using Poincaré plot.


### Step2_RQA 	
13 features are extacted from each RR interval data using recurrence quantification analysis.


### Step3_FeatureReduction 	
Feature reduction using Classification & regression Tree (CART), Boosted Tree (BT), Random Forest (RF) algorithms.


### Step4_NeuralNetwork
Multi Layer Perceptron (MLP) based neural network classification of smokers and non-smokers data obtained from step 3.

----

### Result
A significant difference is observed for all the three phases of ovarian cycle.
