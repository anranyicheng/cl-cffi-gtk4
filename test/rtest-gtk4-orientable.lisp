(in-package :gtk-test)

(def-suite gtk-orientable :in gtk-interfaces)
(in-suite gtk-orientable)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkOrientable

(test gtk-orientable-interface
  ;; Check type
  (is (g:type-is-interface "GtkOrientable"))
  ;; Check registered name
  (is (eq 'gtk:orientable
          (glib:symbol-for-gtype "GtkOrientable")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkOrientable")
          (g:gtype (cffi:foreign-funcall "gtk_orientable_get_type" :size))))
  ;; Check interface prerequisites
  (is (equal '("GObject")
             (glib-test:list-interface-prerequisites "GtkOrientable")))
  ;; Check interface properties
  (is (equal '("orientation")
             (glib-test:list-interface-properties "GtkOrientable")))
  ;; Check interface signals
  (is (equal '()
             (glib-test:list-signals "GtkOrientable")))
  ;; Check interface definition
  (is (equal '(GOBJECT:DEFINE-GINTERFACE "GtkOrientable" GTK:ORIENTABLE
                       (:EXPORT T
                        :TYPE-INITIALIZER "gtk_orientable_get_type")
                       (ORIENTATION ORIENTABLE-ORIENTATION
                        "orientation" "GtkOrientation" T T))
             (gobject:get-gtype-definition "GtkOrientable"))))

;;; --- Properties -------------------------------------------------------------

;;;     gtk:orientable-orientation

(test gtk-orientable-orientation
  (let ((orientable (make-instance 'gtk:box)))
    (is (eq :horizontal
            (gtk:orientable-orientation orientable)))
    (is (eq :vertical
            (setf (gtk:orientable-orientation orientable) :vertical)))
    (is (eq :vertical
            (gtk:orientable-orientation orientable)))))

;;; 2024-9-26
