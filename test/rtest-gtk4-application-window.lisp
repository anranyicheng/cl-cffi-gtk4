(in-package :gtk-test)

(def-suite gtk-application-window :in gtk-application-support)
(in-suite gtk-application-window)

;;; --- GtkApplicationWindow ---------------------------------------------------

(test gtk-application-window-class
  ;; Check type
  (is (g:type-is-object "GtkApplicationWindow"))
  ;; Check registered name
  (is (eq 'gtk:application-window
          (glib:symbol-for-gtype "GtkApplicationWindow")))
  ;; Check parent
  (is (eq (g:gtype "GtkWindow")
          (g:type-parent "GtkApplicationWindow")))
  ;; Check children
  (is (equal '()
             (glib-test:list-children "GtkApplicationWindow")))
  ;; Check interfaces
  (is (equal '("GtkAccessible" "GtkBuildable" "GtkConstraintTarget" "GtkNative"
               "GtkShortcutManager" "GtkRoot" "GActionGroup" "GActionMap")
             (glib-test:list-interfaces "GtkApplicationWindow")))
  ;; Check class properties
  (is (equal '("show-menubar")
             (glib-test:list-properties "GtkApplicationWindow")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkApplicationWindow")))
  ;; Check CSS name
  (is (string= "window"
               (gtk:widget-class-css-name "GtkApplicationWindow")))
  ;; Check accessible role
  #-gtk-4-18
  (is (eq :application
          (gtk:widget-class-accessible-role "GtkApplicationWindow")))
  #+gtk-4-18
  (is (eq :window
          (gtk:widget-class-accessible-role "GtkApplicationWindow")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkApplicationWindow" GTK:APPLICATION-WINDOW
                      (:SUPERCLASS GTK:WINDOW
                       :EXPORT T
                       :INTERFACES
                       ("GActionGroup" "GActionMap" "GtkAccessible"
                        "GtkBuildable" "GtkConstraintTarget" "GtkNative"
                        "GtkRoot" "GtkShortcutManager")
                       :TYPE-INITIALIZER "gtk_application_window_get_type")
                      ((SHOW-MENUBAR APPLICATION-WINDOW-SHOW-MENUBAR
                        "show-menubar" "gboolean" T T)))
             (gobject:get-gtype-definition "GtkApplicationWindow"))))

;;; --- Properties and Accessors -----------------------------------------------

;;;     gtk:application-window-show-menubar

(test gtk-application-window-show-menubar
  (glib-test:with-check-memory (window)
    (is (typep (setf window
                     (make-instance 'gtk:application-window))
               'gtk:application-window))
    ;; Default value is false
    (is-false  (gtk:application-window-show-menubar window))
    ;; Set show-menubar property to true
    (is-true (setf (gtk:application-window-show-menubar window) t))
    (is-true (gtk:application-window-show-menubar window))
    ;; Check memory management
    (is-false (gtk:window-destroy window))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_application_window_new

(test gtk-application-window-new.1
  (glib-test:with-check-memory (window)
    ;; Create with constructor function
    (is (typep (setf window
                     (gtk:application-window-new)) 'gtk:application-window))
    (is (= 2 (g:object-ref-count window)))
    (is-false (gtk:window-destroy window))
    (is (= 1 (g:object-ref-count window)))

    ;; Create with MAKE-INSTANCE
    (is (typep (setf window
                     (make-instance 'gtk:application-window))
               'gtk:application-window))
    (is (= 2 (g:object-ref-count window)))
    (is-false (gtk:window-destroy window))
    (is (= 1 (g:object-ref-count window)))

    ;; Create with G:OBJECT-NEW
    (is (typep (setf window
                     (g:object-new "GtkApplicationWindow"))
               'gtk:application-window))
    (is (= 2 (g:object-ref-count window)))
    (is-false (gtk:window-destroy window))
    (is (= 1 (g:object-ref-count window)))))

;; Initialize an application window with an application

;; FIXME: We get critical errors from this test
;; GLib-CRITICAL : g_atomic_rc_box_release_full:
;;                 assertion 'real_box->magic == G_BOX_MAGIC' failed
;;
;; GLib-CRITICAL : g_atomic_rc_box_release_full:
;;                 assertion 'real_box->magic == G_BOX_MAGIC' failed

#+nil
(test gtk-application-window-new.2
  (glib-test:with-check-memory (application)
    (let (message)
      (is (typep (setf application
                       (make-instance 'gtk:application)) 'gtk:application))
      ;; Connect signal "activate"
      (g:signal-connect application "activate"
          (lambda (app)
            (g:application-hold app)
            (let ((window (gtk:application-window-new app)))
              (setf message "in activate")
              (is (typep window 'gtk:application-window))
              (is (= 2 (g:object-ref-count window)))
              (is (eq app (gtk:window-application window)))
              (is (= 1 (gtk:application-window-id window)))
              ;; Remove the window, this shuts down the application
              (is-false (gtk:application-remove-window app window))
              (is-false (gtk:window-destroy window))
              (is (= 1 (g:object-ref-count window))))
            (g:application-release app)))
      ;; Run the application
      (g:application-run application nil)
      ;; Check if the "activate" signal is executed
      (is (string= "in activate" message)))))

;;;     gtk_application_window_id

(test gtk-application-window-id
  (glib-test:with-check-memory (window)
    (is (typep (setf window
                     (make-instance 'gtk:application-window))
               'gtk:application-window))
    ;; Zero if the window is not added to a GtkApplication
    (is (= 0 (gtk:application-window-id window)))
    ;; Check memory management
    (is-false (gtk:window-destroy window))))

;;;     gtk_application_window_set_help_overlay
;;;     gtk_application_window_get_help_overlay

;; FIXME: This test crashes the testsuite
;; GLib-GObject-CRITICAL: instance with invalid (NULL) class pointer
;; GLib-GObject-CRITICAL: g_signal_handler_disconnect:
;;                        assertion 'G_TYPE_CHECK_INSTANCE (instance)' failed
;;
;; The test will work when we add a reference to the passed in shortcuts-window.
;; But then the memory management is no longer correct.

#+nil
(test gtk-application-window-help-overlay
  (glib-test:with-check-memory (window help-overlay)
    (setf window (make-instance 'gtk:application-window))
    (setf help-overlay (make-instance 'gtk:shortcuts-window))
    ;; A new shortcuts window has two references
    (is (= 2 (g:object-ref-count help-overlay)))
    (is (= 2 (g:object-ref-count window)))
    ;; The shortcuts window is member of the list of toplevels
    (is (member help-overlay (gtk:window-list-toplevels) :test #'eq))
    ;; Default value is nil
    (is-false (gtk:application-window-help-overlay window))
    ;; Set a GtkShortcutsWindow
    (is (eq help-overlay
            (setf (gtk:application-window-help-overlay window) help-overlay)))
    ;; A third reference, because WINDOW holds the shortcuts window
    (is (= 3 (g:object-ref-count help-overlay)))
    (is (= 3 (g:object-ref-count (gtk:application-window-help-overlay window))))
    ;; Retrieve the GtkShortcutsWindow
    (is (eq help-overlay
            (gtk:application-window-help-overlay window)))
    ;; Remove references
    (is-false (setf (gtk:application-window-help-overlay window) nil))
    (is-false (gtk:window-destroy window))
    (is (= 1 (g:object-ref-count help-overlay)))))

;;; 2025-3-31
