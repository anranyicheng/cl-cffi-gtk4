(in-package :gtk-test)

(def-suite gtk-im-context-simple :in gtk-suite)
(in-suite gtk-im-context-simple)

;;; --- Types and Values -------------------------------------------------------

;;;     GTK_MAX_COMPOSE_LEN

;;;     GtkIMContextSimple

(test gtk-im-context-simple-class
  ;; Check type
  (is (g:type-is-object "GtkIMContextSimple"))
  ;; Check registered name
  (is (eq 'gtk:im-context-simple
          (glib:symbol-for-gtype "GtkIMContextSimple")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkIMContextSimple")
          (g:gtype (cffi:foreign-funcall "gtk_im_context_simple_get_type"
                                         :size))))
  ;; Check parent
  (is (eq (g:gtype "GtkIMContext")
          (g:type-parent "GtkIMContextSimple")))
  ;; Check children
  #-windows
  (is (equal '("GtkIMContextBroadway" "GtkIMContextWayland")
             (gtk-test:list-children "GtkIMContextSimple")))
  #+windows
  (is (equal '()
             (gtk-test:list-children "GtkIMContextSimple")))
  ;; Check interfaces
  (is (equal '()
             (gtk-test:list-interfaces "GtkIMContextSimple")))
  ;; Check class properties
  (is (equal '()
             (gtk-test:list-properties "GtkIMContextSimple")))
  ;; Check signals
  (is (equal '()
             (gtk-test:list-signals "GtkIMContextSimple")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-G-OBJECT-CLASS "GtkIMContextSimple"
                                             GTK-I-M-CONTEXT-SIMPLE
                       (:SUPERCLASS GTK-I-M-CONTEXT :EXPORT T :INTERFACES NIL)
                       NIL)
             (gobject:get-g-type-definition "GtkIMContextSimple"))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_im_context_simple_new

(test gtk-im-context-simple-new
  (let ((method (gtk:im-context-simple-new)))
    (is (typep method 'gtk:im-context-simple))
    (is (equal '() (gtk:im-context-input-hints method)))
    (is (eq :free-form (gtk:im-context-input-purpose method)))))

;;;     gtk_im_context_simple_add_table
;;;     gtk_im_context_simple_add_compose_file

;;; 2024-7-4
