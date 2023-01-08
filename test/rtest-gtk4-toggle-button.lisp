(in-package :gtk-test)

(def-suite gtk-toggle-button :in gtk-suite)
(in-suite gtk-toggle-button)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkToggleButton

(test toggle-button-class
  ;; Type check
  (is (g:type-is-object "GtkToggleButton"))
  ;; Check the registered name
  (is (eq 'gtk:toggle-button
          (gobject:symbol-for-gtype "GtkToggleButton")))
  ;; Check the type initializer
  (is (eq (g:gtype "GtkToggleButton")
          (g:gtype (foreign-funcall "gtk_toggle_button_get_type" :size))))
  ;; Check the parent
  (is (eq (g:gtype "GtkButton")
          (g:type-parent "GtkToggleButton")))
  ;; Check the children
  (is (equal '()
             (list-children "GtkToggleButton")))
  ;; Check the interfaces
  (is (equal '("GtkAccessible" "GtkBuildable" "GtkConstraintTarget"
               "GtkActionable")
             (list-interfaces "GtkToggleButton")))
  ;; Check the properties
  (is (equal '("active" "group")
             (list-properties "GtkToggleButton")))
  ;; Check the signals
  (is (equal '("toggled")
             (list-signals "GtkToggleButton")))
  ;; CSS information
  (is (string= "button"
               (gtk:widget-class-css-name "GtkToggleButton")))
  (is (string=
"button.toggle:dir(ltr)
"
               (gtk:style-context-to-string
                   (gtk:widget-style-context (make-instance 'gtk:toggle-button))
                   :none)))
  ;; Check the class definition
  (is (equal '(DEFINE-G-OBJECT-CLASS "GtkToggleButton" GTK-TOGGLE-BUTTON
                       (:SUPERCLASS GTK-BUTTON :EXPORT T :INTERFACES
                        ("GtkAccessible" "GtkActionable" "GtkBuildable"
                         "GtkConstraintTarget")
                        :TYPE-INITIALIZER "gtk_toggle_button_get_type")
                       ((ACTIVE GTK-TOGGLE-BUTTON-ACTIVE "active" "gboolean" T
                         T)
                        (GROUP GTK-TOGGLE-BUTTON-GROUP "group"
                         "GtkToggleButton" NIL T)))
             (gobject:get-g-type-definition "GtkToggleButton"))))

;;; --- Properties -------------------------------------------------------------

;;;     active
;;;     group

;;; --- Signals ----------------------------------------------------------------

;;;     toggled

;;; --- Functions --------------------------------------------------------------

;;;     gtk_toggle_button_new
;;;     gtk_toggle_button_new_with_label
;;;     gtk_toggle_button_new_with_mnemonic
;;;     gtk_toggle_button_toggled

;;; 2022-11-11
