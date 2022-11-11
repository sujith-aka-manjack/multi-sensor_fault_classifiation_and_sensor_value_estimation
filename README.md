# multi-sensor_fault-classifiation-and-sensor-value-estimation

## Fault classification

Vibrtion data from different types of fault is provided. The data is conditioned and 6 features are extracted from it. The dataset is then reduced to a 2-dimentional dataset througuh Principal Component Analysis (PCA). The fault types where identified using K-nearest Neighbor (KNN) method and the accuracy is test against the truth values.

Run main.m MATLAB script to initiate the program. The 5 fault types are:

bearing

gearmesh

imbalance

misalignment

resonance

## Minimum-Mean Square Estimator (MMSE)

Pitch angle measurements of a wind turbine using an encoder are provided. The following cases of prior knowledge are considered when calculating the estimate.

CASE 1: (MMSE-estimator1.m) assumes a prior knowledge of the angle as uniformly distributed  in the range 0 to 30 degree.

CASE 2: (MMSE-estimator2.m) assumes the prior knowledge to be a Guassian distribution with a mean value of 15 and variance of 4

CASE 3: (MMSE-estimator3.m) assumes the same prior knowledge as CASE 2 but the estimate is made sequentialy with each reading of the encorder

CUSUM.m performs a 2-sided CUSUM test to detect sensor faults based on readings from a strain guage. The normal value is 3000KNm with a variance of 1. Threshold for fault detection was selected as +/-20 (can be varied)
