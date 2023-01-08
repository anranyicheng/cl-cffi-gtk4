(def-suite gtk-combo-box :in gtk-suite)
(in-suite gtk-combo-box)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkSensitivityType

(test gtk-sensitivity-type
  ;; Check the type
  (is (g-type-is-enum "GtkSensitivityType"))
  ;; Check the type initializer
  (is (eq (gtype "GtkSensitivityType")
          (gtype (foreign-funcall "gtk_sensitivity_type_get_type" g-size))))
  ;; Check the registered name
  (is (eq 'gtk-sensitivity-type
          (gobject:symbol-for-gtype "GtkSensitivityType")))
  ;; Check the names
  (is (equal '("GTK_SENSITIVITY_AUTO" "GTK_SENSITIVITY_ON"
               "GTK_SENSITIVITY_OFF")
             (mapcar #'enum-item-name
                     (get-enum-items "GtkSensitivityType"))))
  ;; Check the values
  (is (equal '(0 1 2)
             (mapcar #'enum-item-value
                     (get-enum-items "GtkSensitivityType"))))
  ;; Check the nick names
  (is (equal '("auto" "on" "off")
             (mapcar #'enum-item-nick
                     (get-enum-items "GtkSensitivityType"))))
  ;; Check the enum definition
  (is (equal '(DEFINE-G-ENUM "GtkSensitivityType"
                             GTK-SENSITIVITY-TYPE
                             (:EXPORT T
                              :TYPE-INITIALIZER "gtk_sensitivity_type_get_type")
                             (:AUTO 0)
                             (:ON 1)
                             (:OFF 2))
             (get-g-type-definition "GtkSensitivityType"))))

;;;     GtkComboBox

(test gtk-combo-box-class
  ;; Type check
  (is (g:type-is-object "GtkComboBox"))
  ;; Check the registered name
  (is (eq 'gtk-combo-box
          (gobject:symbol-for-gtype "GtkComboBox")))
  ;; Check the type initializer
  (is (eq (gtype "GtkComboBox")
          (gtype (foreign-funcall "gtk_combo_box_get_type" g-size))))
  ;; Check the parent
  (is (eq (gtype "GtkWidget") (g-type-parent "GtkComboBox")))
  ;; Check the children
  (is (equal '("GtkComboBoxText")
             (mapcar #'g-type-name (g-type-children "GtkComboBox"))))
  ;; Check the interfaces
  (is (equal '("GtkAccessible" "GtkBuildable" "GtkConstraintTarget"
               "GtkCellLayout" "GtkCellEditable")
             (mapcar #'g-type-name (g-type-interfaces "GtkComboBox"))))
  ;; Check the class properties
  (is (equal '("active" "active-id" "button-sensitivity" "child"
               "editing-canceled" "entry-text-column" "has-entry" "has-frame"
               "id-column" "model" "popup-fixed-width" "popup-shown")
             (list-class-property-names "GtkComboBox")))
  ;; Check the list of signals
  (is (equal '("activate" "changed" "format-entry-text" "move-active" "popdown"
               "popup")
             (sort (mapcar #'g-signal-name
                           (g-signal-list-ids "GtkComboBox"))
                   #'string<)))
  ;; CSS information
  (is (string= "combobox"
               (gtk-widget-class-css-name "GtkComboBox")))
  (is (string=
"combobox:dir(ltr)
  box.horizontal.linked:dir(ltr)
    button.combo:dir(ltr)
      box.horizontal:dir(ltr)
        cellview:dir(ltr)
        arrow:dir(ltr)
  [popover.background.menu:dir(ltr)]
    contents:dir(ltr)
      stack:dir(ltr)
    arrow:dir(ltr)
"
               (gtk-style-context-to-string
                   (gtk-widget-style-context (make-instance 'gtk-combo-box))
                   :none)))
  ;; Check the class definition
  (is (equal '(DEFINE-G-OBJECT-CLASS "GtkComboBox" GTK-COMBO-BOX
                       (:SUPERCLASS GTK-WIDGET :EXPORT T :INTERFACES
                        ("GtkAccessible" "GtkBuildable" "GtkCellEditable"
                         "GtkCellLayout" "GtkConstraintTarget")
                        :TYPE-INITIALIZER "gtk_combo_box_get_type")
                       ((ACTIVE GTK-COMBO-BOX-ACTIVE "active" "gint" T T)
                        (ACTIVE-ID GTK-COMBO-BOX-ACTIVE-ID "active-id"
                         "gchararray" T T)
                        (BUTTON-SENSITIVITY GTK-COMBO-BOX-BUTTON-SENSITIVITY
                         "button-sensitivity" "GtkSensitivityType" T T)
                        (CHILD GTK-COMBO-BOX-CHILD "child" "GtkWidget" T T)
                        (ENTRY-TEXT-COLUMN GTK-COMBO-BOX-ENTRY-TEXT-COLUMN
                         "entry-text-column" "gint" T T)
                        (HAS-ENTRY GTK-COMBO-BOX-HAS-ENTRY "has-entry"
                         "gboolean" T NIL)
                        (HAS-FRAME GTK-COMBO-BOX-HAS-FRAME "has-frame"
                         "gboolean" T T)
                        (ID-COLUMN GTK-COMBO-BOX-ID-COLUMN "id-column" "gint" T
                         T)
                        (MODEL GTK-COMBO-BOX-MODEL "model" "GtkTreeModel" T T)
                        (POPUP-FIXED-WIDTH GTK-COMBO-BOX-POPUP-FIXED-WIDTH
                         "popup-fixed-width" "gboolean" T T)
                        (POPUP-SHOWN GTK-COMBO-BOX-POPUP-SHOWN "popup-shown"
                         "gboolean" T NIL)))
             (get-g-type-definition "GtkComboBox"))))

;;; --- Properties -------------------------------------------------------------

;;;     active
;;;     active-id
;;;     button-sensitivity
;;;     child
;;;     entry-text-column
;;;     has-entry
;;;     has-frame
;;;     id-column
;;;     model
;;;     popup-fixed-width
;;;     popup-shown

;;; --- Signals ----------------------------------------------------------------

;;;     activate                                           Since 4.6
;;;     changed
;;;     format-entry-text
;;;     move-active
;;;     popdown
;;;     popup

;;; --- Functions --------------------------------------------------------------

;;;     gtk_combo_box_new
;;;     gtk_combo_box_new_with_entry
;;;     gtk_combo_box_new_with_model
;;;     gtk_combo_box_new_with_model_and_entry
;;;     gtk_combo_box_get_active_iter
;;;     gtk_combo_box_set_active_iter
;;;     gtk_combo_box_popup
;;;     gtk_combo_box_popup_for_device
;;;     gtk_combo_box_popdown
;;;     gtk_combo_box_get_row_separator_func
;;;     gtk_combo_box_set_row_separator_func

;;; 2022-9-6
