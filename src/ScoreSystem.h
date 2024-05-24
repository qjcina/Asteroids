#pragma once

#include <QObject>
#include <QtQmlIntegration>

class ScoreSystem : public QObject {
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(qint32 currentScore READ currentScore NOTIFY currentScoreChanged)
public:
    explicit ScoreSystem(QObject* parent = nullptr);

    Q_INVOKABLE void increaseScore();
    qint32 currentScore() const;

signals:
    void currentScoreChanged();

private:
    qint32 m_CurrentScore;
};
