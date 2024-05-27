#include "HighscoresSystem.h"

namespace {
constexpr qint32 kMaxHighscores = 5;
constexpr QStringView kScoresToken = u"Scores";
constexpr QStringView kNameToken = u"Name";
constexpr QStringView kScoreToken = u"Score";
const HighscoresSystem::Highscore kBlankHighscore = qMakePair("---", 0);
}

HighscoresSystem::HighscoresSystem(QObject* parent)
    : QAbstractListModel(parent)
    , m_SavedScores(QSettings::UserScope)
{
    readHighscores();
}

void HighscoresSystem::saveScore(ScoreSystem* scoreSystem, const QString& name)
{
    const auto score = scoreSystem->currentScore();

    m_Scores.push_back(qMakePair(name, score));
    std::sort(m_Scores.begin(), m_Scores.end(),
              [](const auto& lhs, const auto& rhs) { return lhs.second > rhs.second; });
    if (m_Scores.size() > kMaxHighscores) {
        m_Scores.removeLast();
    }

    saveHighscores();
}

qint32 HighscoresSystem::rowCount(const QModelIndex& parent) const
{
    return kMaxHighscores;
}

QVariant HighscoresSystem::data(const QModelIndex& index, qint32 role) const
{
    const Highscore& highscore = m_Scores.size() > index.row() ? m_Scores.at(index.row()) : kBlankHighscore;
    switch (role) {
    case Roles::Name:
        return highscore.first;
    case Roles::Score:
        return highscore.second;
    default:
        return QVariant();
    }
}

QHash<qint32, QByteArray> HighscoresSystem::roleNames() const
{
    return { { Roles::Name, "rName" }, { Roles::Score, "rScore" } };
}

void HighscoresSystem::saveHighscores()
{
    QJsonArray array;
    std::transform(m_Scores.begin(), m_Scores.end(), std::back_inserter(array), [](const Highscore& highscore) {
        return QJsonObject(
            { { kNameToken.toString(), highscore.first }, { kScoreToken.toString(), highscore.second } });
    });
    m_SavedScores.setValue(kScoresToken, array);
}

void HighscoresSystem::readHighscores()
{
    const auto scores = m_SavedScores.value(kScoresToken);
    if (scores.isValid()) {
        for (const auto& highscore : scores.toJsonArray()) {
            if (!highscore.isObject()) {
                continue;
            }

            const auto highscoreObject = highscore.toObject();
            m_Scores.push_back(
                qMakePair(highscoreObject.value(kNameToken).toString(), highscoreObject.value(kScoreToken).toInt()));
        }
    }
}
