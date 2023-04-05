using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ScoreSystem : MonoBehaviour
{
    [SerializeField]
    private TMP_Text scoreText;
    [SerializeField]
    private int scoreMultiplyer = 1;
    private float score;
    public const string HiScoreKey = "HighScore";

    // Update is called once per frame
    void Update()
    {
        score += Time.deltaTime * scoreMultiplyer;
        scoreText.text = Mathf.FloorToInt(score).ToString();
    }

    private void OnDestroy()
    {
        int currentHiScore = PlayerPrefs.GetInt(HiScoreKey, 0);

        if (score > currentHiScore)
            PlayerPrefs.SetInt(HiScoreKey, Mathf.FloorToInt(score));
    }
}