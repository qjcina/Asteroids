#pragma once

#include "ScoreSystem.h"
#include <QObject>

class HighscoresSystem : public QAbstractListModel {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    using Highscore = QPair<QString, qint32>;
    using ScoresVector = QVector<Highscore>;
    enum Roles { Name = Qt::UserRole, Score };

    explicit HighscoresSystem(QObject* parent = nullptr);

    Q_INVOKABLE void saveScore(ScoreSystem* scoreSystem, const QString& name);

    qint32 rowCount(const QModelIndex& parent) const override;
    QVariant data(const QModelIndex& index, qint32 role) const override;
    QHash<qint32, QByteArray> roleNames() const override;

private:
    void saveHighscores();
    void readHighscores();

    ScoresVector m_Scores;
    QSettings m_SavedScores;
};
