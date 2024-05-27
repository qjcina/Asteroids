import QtQuick

Timer {
    property var typesToCleanup: ["bullet", "asteroid"]
    property int cleanupDistance: Math.max(scene.width, scene.height)

    interval: 1000
    running: true
    repeat: true

    function cleanupType(type) {
        const entities = entityManager.getEntityArrayByType(type);
        entities.forEach((entity) => {
            const distance = Math.hypot(entity.x - player.x, entity.y - player.y);
            if (distance > cleanupDistance) {
                entity.removeEntity();
            }
        })
    }

    onTriggered: {
        typesToCleanup.forEach((type) => cleanupType(type));
    }
}
