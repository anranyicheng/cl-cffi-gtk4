;;;; Example Simple Box - 2022-11-11
;;;;
;;;; The example shows three buttons with colored labels. The red button
;;;; shows the start position in the box, the green button the end position,
;;;; and the yellow button is a center widget.
;;;;
;;;; In addition, this example demonstrate how to use CSS style information to
;;;; change the appearance of a widget.

(in-package :gtk4-example)

(defparameter +css-button+
"button {
   padding: 3px; }
 button > label {
   color: black;
   background-color: yellow; }
 button:first-child > label {
   background-color: red; }
 button:last-child > label {
   background-color : green; }")

(defun do-box-center (&optional application)
  (let* (;; Create a center box
         (box (make-instance 'gtk:center-box
                             :orientation :horizontal
                             :homogeneous nil
                             :spacing 0
                             :margin-bottom 12
                             :margin-end 12
                             :margin-start 12
                             :margin-top 12
                             :halign :fill
                             :valign :center
                             :width-request 480))
         ;; Create a toplevel window
         (window (make-instance 'gtk:window
                                :child box
                                :application application
                                :title "Center Box"))
         (provider (make-instance 'gtk:css-provider)))
    ;; Add Start button
    (let ((button (make-instance 'gtk:button
                                 :label "START")))
      (setf (gtk:widget-width-request (gtk:button-child button)) 120)
      (setf (gtk:widget-height-request (gtk:button-child button)) 120)
      (setf (gtk:center-box-start-widget box) button))
    ;; Add Center button
    (let ((button (make-instance 'gtk:button
                                 :label "CENTER")))
      (setf (gtk:widget-width-request (gtk:button-child button)) 80)
      (setf (gtk:center-box-center-widget box) button))
    ;; Add End button
    (let ((button (make-instance 'gtk:button
                                  :label "END")))
      (setf (gtk:widget-width-request (gtk:button-child button)) 60)
      (setf (gtk:center-box-end-widget box) button))

    ;; Load CSS from data into the provider
    (gtk:css-provider-load-from-data provider +css-button+)
    ;; Apply CSS to the widgets
    (apply-css-to-widget provider box)
    ;; Show the window.
    (gtk:widget-show window)))
