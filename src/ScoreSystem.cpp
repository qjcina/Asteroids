#include "ScoreSystem.h"

ScoreSystem::ScoreSystem(QObject* parent)
    : QObject(parent)
    , m_CurrentScore(0)
{
}

void ScoreSystem::increaseScore()
{
    m_CurrentScore++;
    emit currentScoreChanged();
}

qint32 ScoreSystem::currentScore() const
{
    return m_CurrentScore;
}
