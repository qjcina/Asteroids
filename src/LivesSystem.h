#pragma once

#include "ScoreSystem.h"
#include <QObject>

class LivesSystem : public QObject {
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(qint32 lives READ lives NOTIFY livesChanged)
    Q_PROPERTY(ScoreSystem* scoreSystem READ scoreSystem WRITE setScoreSystem CONSTANT)
public:
    explicit LivesSystem(QObject* parent = nullptr);

    qint32 lives() const;
    Q_INVOKABLE void decreaseLives();

    ScoreSystem* scoreSystem();
    void setScoreSystem(ScoreSystem* scoreSystem);

signals:
    void livesChanged();

private:
    void updateScore();

    qint32 m_Lives;
    QPointer<ScoreSystem> m_ScoreSystem;
};
