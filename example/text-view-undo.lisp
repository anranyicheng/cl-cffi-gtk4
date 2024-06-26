;;;; Undo and Redo
;;;;
;;;; The <tt>GtkTextView</tt> widget supports undo and redo through the use of a
;;;; <tt>GtkTextBuffer</tt> object. You can enable or disable undo support using
;;;; the <tt>gtk:text-buffer-enable-undo} function. Use <tt>Control+z</tt> to
;;;; undo and <tt>Control+Shift+z</tt> or <tt>Control+y</tt> to redo previously
;;;; undone operations.
;;;;
;;;; 2024-4-6

(in-package :gtk4-example)

(defun do-text-view-undo (&optional application)
  (let* ((buffer (make-instance 'gtk:text-buffer
                                :enable-undo t))
         (view (make-instance 'gtk:text-view
                              :buffer buffer
                              :wrap-mode :word
                              :pixels-below-lines 10
                              :left-margin 20
                              :right-margin 20
                              :top-margin 20
                              :bottom-margin 20))
         (scrolled (make-instance 'gtk:scrolled-window
                                  :child view
                                  :hscrollbar-policy :automatic
                                  :vscrollbar-policy :automatic))
         (window (make-instance 'gtk:window
                                :application application
                                :child scrolled
                                :title "Text View Undo and Redo"
                                :resizable nil
                                :default-width 330
                                :default-height 330)))
    (gtk:text-buffer-begin-irreversible-action buffer)
    (gtk:text-buffer-insert buffer
                            (gtk:text-buffer-start-iter buffer)
                            (format nil
        "The GtkTextView widget supports undo and redo through the ~
         use of a GtkTextBuffer object. You can enable or disable ~
         undo support using  the gtk:text-buffer-enable-undo function.~%~
         Type to add more text.~%~
         Use Control+z to undo and Control+Shift+z or Control+y to ~
         redo previously undone operations.~%"))
    (gtk:text-buffer-end-irreversible-action buffer)
    (gtk:window-present window)))
