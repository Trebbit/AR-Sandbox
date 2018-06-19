using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ColorStatistics : MonoBehaviour {
	public static ColorStatistics instance;
	
	public int [] colorAmmounts;
	public float waterLevel;
	public float layerSize;
	public int numberOfLayers;
	public int testInt = 0;

	void Awake()
	{
		if(instance == null)
		{
			instance = this;
		}
		else
		{
			Destroy(this);
		}
	}

	void Start()
	{
		colorAmmounts = new int [numberOfLayers];
		Clear();
	}

	public void Clear()
	{
		for(int i=0; i<colorAmmounts.Length; i++)
		{
			colorAmmounts[i]=0;
		}
	}

	public void Add(float zVal)
	{
		int layer = (int) Mathf.Floor((zVal + waterLevel)/layerSize);
		if (layer > 100)
		{
			colorAmmounts[0]++;
			//testInt++;
		}
		else if(layer > 0 && layer < colorAmmounts.Length)
		{
			colorAmmounts[layer]++;
			//Debug.Log("zVal: " + zVal);
			//Debug.Log("z-Value" + zVal + "Layer: " + layer);
		}
			Debug.Log("zVal: " + zVal + " layer: " + layer);
	}

	public void Frame()
	{
		// send this to a webthingemajig
	}
}