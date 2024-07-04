(in-package :gtk-test)

(def-suite gtk-tooltip :in gtk-suite)
(in-suite gtk-tooltip)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkTooltip

(test gtk-tooltip-class
  ;; Check type
  (is (g:type-is-object "GtkTooltip"))
  ;; Check registered name
  (is (eq 'gtk:tooltip
          (glib:symbol-for-gtype "GtkTooltip")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkTooltip")
          (g:gtype (cffi:foreign-funcall "gtk_tooltip_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkTooltip")))
  ;; Check children
  (is (equal '()
             (gtk-test:list-children "GtkTooltip")))
  ;; Check interfaces
  (is (equal '()
             (gtk-test:list-interfaces "GtkTooltip")))
  ;; Check class properties
  (is (equal '()
             (gtk-test:list-properties "GtkTooltip")))
  ;; Check signals
  (is (equal '()
             (gtk-test:list-signals "GtkTooltip")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-G-OBJECT-CLASS "GtkTooltip" GTK-TOOLTIP
                       (:SUPERCLASS G-OBJECT :EXPORT T :INTERFACES NIL
                        :TYPE-INITIALIZER "gtk_tooltip_get_type")
                       NIL)
             (gobject:get-g-type-definition "GtkTooltip"))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_tooltip_set_markup
;;;     gtk_tooltip_set_text
;;;     gtk_tooltip_set_icon
;;;     gtk_tooltip_set_icon_from_icon_name
;;;     gtk_tooltip_set_icon_from_gicon
;;;     gtk_tooltip_set_custom
;;;     gtk_tooltip_set_tip_area

;;; 2024-2-21
