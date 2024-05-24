#include "LivesSystem.h"

namespace {
constexpr qint32 kStartingLives = 3;
constexpr qint32 kExtraLifeScore = 15;
}

LivesSystem::LivesSystem(QObject* parent)
    : QObject(parent)
    , m_Lives(kStartingLives)
{
}

qint32 LivesSystem::lives() const
{
    return m_Lives;
}

void LivesSystem::decreaseLives()
{
    m_Lives--;
    emit livesChanged();
}

ScoreSystem* LivesSystem::scoreSystem()
{
    return m_ScoreSystem.data();
}

void LivesSystem::setScoreSystem(ScoreSystem* scoreSystem)
{
    if (m_ScoreSystem) {
        disconnect(m_ScoreSystem, nullptr, this, nullptr);
    }
    m_ScoreSystem = scoreSystem;
    if (m_ScoreSystem) {
        connect(m_ScoreSystem, &ScoreSystem::currentScoreChanged, this, &LivesSystem::updateScore);
    }
}

void LivesSystem::updateScore()
{
    const qint32 score = m_ScoreSystem->currentScore();
    if (score % kExtraLifeScore == 0) {
        m_Lives++;
        emit livesChanged();
    }
}
