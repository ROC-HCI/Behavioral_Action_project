Unsupervised Extraction of Human Behavior from MOCAP Signal
-------------------------------------------------------------------------------
    Coded by Md. Iftekhar Tanveer (itanveer@cs.rochester.edu)
    Rochester Human-Computer Interaction (ROCHCI)
    University of Rochester
-------------------------------------------------------------------------------

AUTOMANNER code as it resides in the Behavioral_Action_project in 
Bluehive (University of Rochester Cluster).
It is the latest working snapshot from bluehive. It uses many different
nodes in bluehive for parallel running of the automanner code and getting the best
result. This code is important for running the AutoManner_GUI properly.

OS Compatibility:
================
Code tested in OS X 10, Windows, and Ubuntu

Installation:
============
The code uses python and matplotlib. If you install anaconda (https://www.continuum.io/downloads), all the necessary components for running the main code should be there.

Mayavi (http://docs.enthought.com/mayavi/mayavi/) was used for visualizing the skeletons. If you used anaconda to install python, you can apply the following command to install Mayavi:

conda install mayavi


Usage Instruction
=================
For common usage check runDemo.sh

For details:
===========
M. Iftekhar Tanveer, Ji Liu, M. Ehsan Hoque, "Unsupervised Extraction of Human-Interpretable Nonverbal Behavioral Cues in a Public Speaking Scenario", 23rd ACM Multimedia (ACMMM) Conference, Brisbane, Australia, 2015.

M. Iftekhar Tanveer, Ru Zhao, Kezhen Chen, Zoe Tiet, M. Ehsan Hoque, "AutoManner: An Automated Interface for Making Public Speakers Aware of Their Mannerisms", ACM Intelligent User Interfaces (IUI), Sonoma, CA, USA, 2016.

Requests:
=========
Please cite the papers mentioned above if this code comes to any of your use.

Please share your code if you make any modification to it.
