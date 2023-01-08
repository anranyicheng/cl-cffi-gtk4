(in-package :gtk-test)

(def-suite gtk-style-context :in gtk-suite)
(in-suite gtk-style-context)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkStyleContextPrintFlags

(test style-context-print-flags
  ;; Check the type
  (is (g:type-is-flags "GtkStyleContextPrintFlags"))
  ;; Check the registered name
  (is (eq 'gtk:style-context-print-flags
          (gobject:symbol-for-gtype "GtkStyleContextPrintFlags")))
  ;; Check the type initializer
  (is (eq (g:gtype "GtkStyleContextPrintFlags")
          (g:gtype (foreign-funcall "gtk_style_context_print_flags_get_type"
                                    :size))))
  ;; Check the names
  (is (equal '("GTK_STYLE_CONTEXT_PRINT_NONE" "GTK_STYLE_CONTEXT_PRINT_RECURSE"
               "GTK_STYLE_CONTEXT_PRINT_SHOW_STYLE"
               "GTK_STYLE_CONTEXT_PRINT_SHOW_CHANGE")
             (mapcar #'gobject:flags-item-name
                     (gobject:get-flags-items "GtkStyleContextPrintFlags"))))
  ;; Check the values
  (is (equal '(0 1 2 4)
             (mapcar #'gobject:flags-item-value
                     (gobject:get-flags-items "GtkStyleContextPrintFlags"))))
  ;; Check the nick names
  (is (equal '("none" "recurse" "show-style" "show-change")
             (mapcar #'gobject:flags-item-nick
                     (gobject:get-flags-items "GtkStyleContextPrintFlags"))))
  ;; Check the flags definition
  (is (equal '(DEFINE-G-FLAGS "GtkStyleContextPrintFlags"
                              GTK-STYLE-CONTEXT-PRINT-FLAGS
                              (:EXPORT T
                               :TYPE-INITIALIZER
                               "gtk_style_context_print_flags_get_type")
                              (:NONE 0)
                              (:RECURSE 1)
                              (:SHOW-STYLE 2)
                              (:SHOW-CHANGE 4))
             (gobject:get-g-type-definition "GtkStyleContextPrintFlags"))))

;;;     GtkBorder

(test border-struct
  ;; Type check
  (is (g:type-is-a (g:gtype "GtkBorder") +g-type-boxed+))
  ;; Check the type initializer
  (is (eq (g:gtype "GtkBorder")
          (g:gtype (foreign-funcall "gtk_border_get_type" :size)))))

(test border-properties
  (let ((border (gtk:border-new)))
    (is (= 0 (gtk:border-left border)))
    (is (= 0 (gtk:border-right border)))
    (is (= 0 (gtk:border-top border)))
    (is (= 0 (gtk:border-bottom border)))))

(test border-new/copy
  (let* ((border1 (gtk:border-new :left 10 :right 20 :top 30 :bottom 40))
         (border2 (gtk:border-copy border1)))
    (is (= 10 (gtk:border-left border2)))
    (is (= 20 (gtk:border-right border2)))
    (is (= 30 (gtk:border-top border2)))
    (is (= 40 (gtk:border-bottom border2)))))

;;;     GtkStyleContext

(test style-context-class
  ;; Type check
  (is (g:type-is-object "GtkStyleContext"))
  ;; Check the registered name
  (is (eq 'gtk:style-context
          (gobject:symbol-for-gtype "GtkStyleContext")))
  ;; Check the type initializer
  (is (eq (g:gtype "GtkStyleContext")
          (g:gtype (foreign-funcall "gtk_style_context_get_type" :size))))
  ;; Check the parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkStyleContext")))
  ;; Check the children
  (is (equal '()
             (list-children "GtkStyleContext")))
  ;; Check the interfaces
  (is (equal '()
             (list-interfaces "GtkStyleContext")))
  ;; Check the properties
  (is (equal '("display")
             (list-properties "GtkStyleContext")))
  ;; Check the signals
  (is (equal '()
             (list-signals "GtkStyleContext")))
  ;; Check the class definition
  (is (equal '(DEFINE-G-OBJECT-CLASS "GtkStyleContext" GTK-STYLE-CONTEXT
                       (:SUPERCLASS G-OBJECT :EXPORT T :INTERFACES NIL
                        :TYPE-INITIALIZER "gtk_style_context_get_type")
                       ((DISPLAY GTK-STYLE-CONTEXT-DISPLAY "display"
                         "GdkDisplay" T T)))
             (gobject:get-g-type-definition "GtkStyleContext"))))

;;; --- Properties -------------------------------------------------------------

;;;     display

(test style-context-properties
  (let ((context (gtk:widget-style-context (make-instance 'gtk:box))))
    (is (typep (gtk:style-context-display context) 'gdk:display))))

;;; --- Signals ----------------------------------------------------------------

;;;     changed

;;; --- Functions --------------------------------------------------------------

;;;     gtk_style_context_add_provider
;;;     gtk_style_context_add_provider_for_display
;;;     gtk_style_context_get_state
;;;     gtk_style_context_set_state
;;;     gtk_style_context_get_color
;;;     gtk_style_context_get_border
;;;     gtk_style_context_get_padding
;;;     gtk_style_context_get_margin
;;;     gtk_style_context_lookup_color
;;;     gtk_style_context_remove_provider
;;;     gtk_style_context_remove_provider_for_display
;;;     gtk_style_context_restore
;;;     gtk_style_context_save
;;;     gtk_style_context_add_class
;;;     gtk_style_context_remove_class
;;;     gtk_style_context_has_class
;;;     gtk_style_context_set_scale
;;;     gtk_style_context_get_scale
;;;     gtk_style_context_to_string

;;;     gtk_render_activity
;;;     gtk_render_arrow
;;;     gtk_render_background
;;;     gtk_render_check
;;;     gtk_render_expander
;;;     gtk_render_focus
;;;     gtk_render_frame
;;;     gtk_render_handle
;;;     gtk_render_icon
;;;     gtk_render_layout
;;;     gtk_render_line
;;;     gtk_render_option

;;; 2022-11-9
