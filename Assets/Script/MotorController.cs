using UnityEngine;
using System.Collections;
using AForge.Video.Kinect;
using Kinect;

public class MotorController : MonoBehaviour {

	long kinectAngle;

	void Start(){

		kinectAngle = 0;
		//NativeMethods.NuiCameraSetAngle(kinectAngle);
		
	}

	void Update(){

		float v = Input.GetAxis("Vertical");
		if(v > 0)
		{
			kinectAngle ++;
			NativeMethods.NuiCameraSetAngle(kinectAngle);

		}
		else if (v < 0)
		{
			kinectAngle--;
			NativeMethods.NuiCameraSetAngle(kinectAngle);

		}
		if(Input.GetKeyDown(KeyCode.Space)){kinectAngle = 0; NativeMethods.NuiCameraSetAngle(kinectAngle);}

	}

}