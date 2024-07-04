(in-package :gtk-test)

(def-suite gtk-column-view-row :in gtk-suite)
(in-suite gtk-column-view-row)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkColumnViewRow

(test gtk-column-view-row-class
  ;; Check type
  (is (g:type-is-object "GtkColumnViewRow"))
  ;; Check registered name
  (is (eq 'gtk:column-view-row
          (glib:symbol-for-gtype "GtkColumnViewRow")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkColumnViewRow")
          (g:gtype (cffi:foreign-funcall "gtk_column_view_row_get_type"
                                         :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkColumnViewRow")))
  ;; Check children
  (is (equal '()
             (gtk-test:list-children "GtkColumnViewRow")))
  ;; Check interfaces
  (is (equal '()
             (gtk-test:list-interfaces "GtkColumnViewRow")))
  ;; Check properties
  (is (equal '("accessible-description" "accessible-label" "activatable"
               "focusable" "item" "position" "selectable" "selected")
             (gtk-test:list-properties "GtkColumnViewRow")))
  ;; Check signals
  (is (equal '()
             (gtk-test:list-signals "GtkColumnViewRow")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-G-OBJECT-CLASS "GtkColumnViewRow"
                                             GTK-COLUMN-VIEW-ROW
                               (:SUPERCLASS G-OBJECT :EXPORT T :INTERFACES NIL
                                :TYPE-INITIALIZER
                                "gtk_column_view_row_get_type")
                               ((ACCESSIBLE-DESCRIPTION
                                 GTK-COLUMN-VIEW-ROW-ACCESSIBLE-DESCRIPTION
                                 "accessible-description" "gchararray" T T)
                                (ACCESSIBLE-LABEL
                                 GTK-COLUMN-VIEW-ROW-ACCESSIBLE-LABEL
                                 "accessible-label" "gchararray" T T)
                                (ACTIVATABLE GTK-COLUMN-VIEW-ROW-ACTIVATABLE
                                 "activatable" "gboolean" T T)
                                (FOCUSABLE GTK-COLUMN-VIEW-ROW-FOCUSABLE
                                 "focusable" "gboolean" T T)
                                (ITEM GTK-COLUMN-VIEW-ROW-ITEM "item" "GObject"
                                 T NIL)
                                (POSITION GTK-COLUMN-VIEW-ROW-POSITION
                                          "position" "guint" T NIL)
                                (SELECTABLE GTK-COLUMN-VIEW-ROW-SELECTABLE
                                 "selectable" "gboolean" T T)
                                (SELECTED GTK-COLUMN-VIEW-ROW-SELECTED
                                 "selected" "gboolean" T NIL)))
             (gobject:get-g-type-definition "GtkColumnViewRow"))))

;;; --- Properties -------------------------------------------------------------

;;;     accessible-description
;;;     accessible-label
;;;     activatable
;;;     focusable
;;;     item
;;;     position
;;;     selectable
;;;     selected

(test gtk-column-view-row-properties
  (let ((row (make-instance 'gtk:column-view-row)))
    (is-false (gtk:column-view-row-accessible-description row))
    (is-false (gtk:column-view-row-accessible-label row))
    (is-true (gtk:column-view-row-activatable row))
    (is-true (gtk:column-view-row-focusable row))
    (is-false (gtk:column-view-row-item row))
    (is (= gtk:+invalid-list-position+ (gtk:column-view-row-position row)))
    (is-true (gtk:column-view-row-selectable row))
    (is-false (gtk:column-view-row-selected row))))

;;; 2024-7-4

