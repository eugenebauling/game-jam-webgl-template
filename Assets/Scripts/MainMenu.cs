using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public class MainMenu : MonoBehaviour
{
    [SerializeField]
    private TMP_Text hiScoreText;

    private void Start() 
    {
        int currentHiScore = PlayerPrefs.GetInt(ScoreSystem.HiScoreKey, 0);
        hiScoreText.text = $"High score: {currentHiScore.ToString()}";   
    }

    public void Play() 
    {
        SceneManager.LoadScene(1);
    }
}