(in-package :gtk-test)

(def-suite gtk-tree-model-filter :in gtk-suite)
(in-suite gtk-tree-model-filter)

(defun create-and-fill-model ()
  (let ((liststore (make-instance 'gtk:list-store
                                  :column-types
                                  '("gint" "gchararray" "gboolean")))
        (counter 0))
    ;; Fill in external symbols of GTK package
    (do-external-symbols (symbol (find-package "GTK"))
      ;; Add a new row to the model
      (gtk:list-store-set liststore
                          (gtk:list-store-append liststore)
                          (incf counter)
                          (symbol-name symbol)
                          nil))
    ;; Return the new list store
    liststore))

;;; --- Types and Values -------------------------------------------------------

;;;     GtkTreeModelFilter

(test gtk-tree-model-filter-class
  ;; Check type
  (is (g:type-is-object "GtkTreeModelFilter"))
  ;; Check registered name
  (is (eq 'gtk:tree-model-filter
          (glib:symbol-for-gtype "GtkTreeModelFilter")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkTreeModelFilter")
          (g:gtype (cffi:foreign-funcall "gtk_tree_model_filter_get_type"
                                         :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkTreeModelFilter")))
  ;; Check children
  (is (equal '()
             (list-children "GtkTreeModelFilter")))
  ;; Check interfaces
  (is (equal '("GtkTreeModel" "GtkTreeDragSource")
             (list-interfaces "GtkTreeModelFilter")))
  ;; Check properties
  (is (equal '("child-model" "virtual-root")
             (list-properties "GtkTreeModelFilter")))
  ;; Check signals
  (is (equal '()
             (list-signals "GtkTreeModelFilter")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-G-OBJECT-CLASS "GtkTreeModelFilter"
                                             GTK-TREE-MODEL-FILTER
                               (:SUPERCLASS G-OBJECT :EXPORT T :INTERFACES
                                ("GtkTreeDragSource" "GtkTreeModel")
                                :TYPE-INITIALIZER
                                "gtk_tree_model_filter_get_type")
                               ((CHILD-MODEL GTK-TREE-MODEL-FILTER-CHILD-MODEL
                                 "child-model" "GtkTreeModel" T NIL)
                                (VIRTUAL-ROOT
                                 GTK-TREE-MODEL-FILTER-VIRTUAL-ROOT
                                 "virtual-root" "GtkTreePath" T NIL)))
             (gobject:get-g-type-definition "GtkTreeModelFilter"))))

;;; --- Properties -------------------------------------------------------------

(test gtk-tree-model-filter-properties
  (let ((gtk-init:*gtk-warn-deprecated* nil))
    (let ((model (make-instance 'gtk:tree-model-filter)))
      (is-false (gtk:tree-model-filter-child-model model))
      (is-false (gtk:tree-model-filter-virtual-root model)))))

;;; --- Functions --------------------------------------------------------------

;;;     GtkTreeModelFilterModifyFunc

;;;     gtk_tree_model_filter_new

(test gtk-tree-model-filter-new
  (let ((gtk-init:*gtk-warn-deprecated* nil))
    (let* ((child (create-and-fill-model))
           (model (gtk:tree-model-filter-new child nil)))
      (is (typep child 'gtk:tree-model))
      (is (typep model 'gtk:tree-model))
      (is (eq child (gtk:tree-model-filter-child-model model)))
      (is-false (gtk:tree-model-filter-virtual-root model)))))

;;;     GtkTreeModelFilterVisibleFunc
;;;     gtk_tree_model_filter_set_visible_func

;; TODO: More work is needed

(test gtk-tree-model-filter-set-visible-func
  (let ((gtk-init:*gtk-warn-deprecated* nil))
    (let* ((child (create-and-fill-model))
           (model (gtk:tree-model-filter-new child nil)))

      (gtk:tree-model-filter-set-visible-func model
          (lambda (model iter)
            (let ((value (gtk:tree-model-value model iter 1)))
;              (when (search "tree-model-filter" value :test #'char=)
;                (format t "   ~a~%" value))
              (search "tree-model-filter" value :test #'char=))))

       (gtk:tree-model-filter-refilter model)
;      (let ((iter (gtk:tree-model-iter-first model)))
;        (is-false (gtk:tree-model-value model iter 1))
)))

;;;     gtk_tree_model_filter_set_modify_func
;;;     gtk_tree_model_filter_set_visible_column

;;;     gtk_tree_model_filter_get_model

;;;     gtk_tree_model_filter_convert_child_iter_to_iter
;;;     gtk_tree_model_filter_convert_iter_to_child_iter
;;;     gtk_tree_model_filter_convert_child_path_to_path
;;;     gtk_tree_model_filter_convert_path_to_child_path
;;;     gtk_tree_model_filter_refilter
;;;     gtk_tree_model_filter_clear_cache

;;; 2024-4-29
