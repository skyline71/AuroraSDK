#ifndef MANDELBROT_H
#define MANDELBROT_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>
#include "renderthread.h"

class Mandelbrot : public QQuickPaintedItem
{
    Q_OBJECT
public:
    explicit Mandelbrot(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;
    //ToDo: Add 6 methods for moving up, down, left, right, increase and decrease a zoom level.
    Q_INVOKABLE void moveUp();
    Q_INVOKABLE void moveDown();
    Q_INVOKABLE void moveLeft();
    Q_INVOKABLE void moveRight();
    Q_INVOKABLE void zoomIn();
    Q_INVOKABLE void zoomOut();
private slots:
    void updatePixmap(const QImage &image, double scaleFactor);
    void zoom(double zoomFactor);
private:
    void scroll(int deltaX, int deltaY);

    RenderThread thread;
    QPixmap pixmap;
    QPoint pixmapOffset;
    QPoint lastDragPos;
    double centerX;
    double centerY;
    double pixmapScale;
    double curScale;
};

#endif // MANDELBROT_H
