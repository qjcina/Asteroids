import QtQuick

Timer {
    property var asteroidSpeed: ({ min: 75, max: 150 })

    interval: 1000
    running: true
    repeat: true

    onTriggered: {
        const sceneCenter = Qt.point(scene.width / 2,
                                     scene.height / 2);
        const spawnOffset = 100;
        const spawnRadius = Math.max(scene.width, scene.height) / 2 + spawnOffset;
        const positionAngle = Math.random() * 2 * Math.PI;
        const origin = Qt.point(Math.cos(positionAngle) * spawnRadius, Math.sin(positionAngle) * spawnRadius);

        const speed = Math.random() * (asteroidSpeed.max - asteroidSpeed.min) + asteroidSpeed.min;
        const angleVariation = Math.random() * 1 - 0.5;
        const velocityAngle = Math.atan2(-origin.y, -origin.x);
        const velocity = Qt.point(Math.cos(velocityAngle + angleVariation) * speed, Math.sin(velocityAngle + angleVariation) * speed);

        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Asteroid.qml"), {
            x: origin.x + sceneCenter.x,
            y: origin.y + sceneCenter.y,
            velocity: velocity
        });
    }
}
