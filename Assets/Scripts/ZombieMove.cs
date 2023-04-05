using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class ZombieMove : MonoBehaviour
{
    private bool changeDirection = false;
    public float speed=2f;

    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Obstacle"))
        {
            transform.Rotate(0f, 180f, 0f);
        }
    }
}