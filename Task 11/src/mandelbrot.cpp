#include <QPainter>
#include <qmath.h>
#include <QDebug>

#include "mandelbrot.h"

const double DefaultCenterX = -0.637011f;
const double DefaultCenterY = -0.0395159f;
const double DefaultScale = 0.00403897f;

const double ZoomInFactor = 0.8f;
const double ZoomOutFactor = 1 / ZoomInFactor;
const int ScrollStep = 20;

Mandelbrot::Mandelbrot(QQuickItem *parent) : QQuickPaintedItem(parent)
{
    centerX = DefaultCenterX;
    centerY = DefaultCenterY;
    pixmapScale = DefaultScale;
    curScale = DefaultScale;
    //ToDo: connect thread.renderedImage signal and updatePixmap slot
    QObject::connect(&thread, &RenderThread::renderedImage,
                     this, &Mandelbrot::updatePixmap);
}

void Mandelbrot::paint(QPainter *painter) {
    QRectF r(0,0, width(), height());
    painter->fillRect(r, Qt::black);

    if (pixmap.isNull()) {
        painter->setPen(Qt::white);
        painter->drawText(r, Qt::AlignCenter, tr("Rendering initial image, please wait..."));
        //ToDo: render the image using RenderThread
        QSize size(width(), height());
        thread.render(centerX, centerY, curScale, size);
        return;
    }

    if (curScale == pixmapScale) {
        painter->drawPixmap(pixmapOffset, pixmap);
    } else {
        double scaleFactor = pixmapScale / curScale;
        int newWidth = int(pixmap.width() * scaleFactor);
        int newHeight = int(pixmap.height() * scaleFactor);
        int newX = pixmapOffset.x() + (pixmap.width() - newWidth) / 2;
        int newY = pixmapOffset.y() + (pixmap.height() - newHeight) / 2;

        painter->save();
        painter->translate(newX, newY);
        painter->scale(scaleFactor, scaleFactor);
        QRectF exposed = painter->matrix().inverted().mapRect(r).adjusted(-1, -1, 1, 1);
        painter->drawPixmap(exposed, pixmap, exposed);
        painter->restore();
    }
}

void Mandelbrot::updatePixmap(const QImage &image, double scaleFactor)
{
    pixmap = QPixmap::fromImage(image);
    pixmapOffset = QPoint();
    lastDragPos = QPoint();
    pixmapScale = scaleFactor;
    update();
}
//ToDo: Add 6 methods for moving up, down, left, right, increase and decrease a zoom level.
void Mandelbrot::moveUp()
{
    scroll(0, ScrollStep);
}

void Mandelbrot::moveDown()
{
    scroll(0, -ScrollStep);
}

void Mandelbrot::moveLeft()
{
    scroll(ScrollStep, 0);
}

void Mandelbrot::moveRight()
{
    scroll(-ScrollStep, 0);
}

void Mandelbrot::zoomIn()
{
    zoom(ZoomInFactor);
}

void Mandelbrot::zoomOut()
{
    zoom(ZoomOutFactor);
}

void Mandelbrot::zoom(double zoomFactor)
{
    curScale *= zoomFactor;
    update();
    //ToDo: render the image using RenderThread
    QSize size(width(), height());
    thread.render(centerX, centerY, curScale, size);
}

void Mandelbrot::scroll(int deltaX, int deltaY)
{
    centerX += deltaX * curScale;
    centerY += deltaY * curScale;
    update();
    //ToDo: render the image using RenderThread
    QSize size(width(), height());
    thread.render(centerX, centerY, curScale, size);
}
