using UnityEngine;
using System.Collections;
using AForge.Video.Kinect;

public class MotorController : MonoBehaviour {


	void Start(){

		Kinect kinectboi = kinect.GetDevice(0);
		kinectboi.LedColor = LedColorOption.Yellow;
		
	}

}