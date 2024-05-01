(in-package :gtk-test)

(def-suite gdk-display :in gdk-suite)
(in-suite gdk-display)

;;; --- Types and Values -------------------------------------------------------

;;;     GdkDisplay

(test gdk-display-class
  ;; Check type
  (is (g:type-is-object "GdkDisplay"))
  ;; Check registered name
  (is (eq 'gdk:display
          (glib:symbol-for-gtype "GdkDisplay")))
  ;; Check type initializer
  (is (eq (g:gtype "GdkDisplay")
          (g:gtype (cffi:foreign-funcall "gdk_display_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GdkDisplay")))
  ;; Check children
  #-windows
  (if *first-run-gtk-test*
      (is (equal '("GdkWaylandDisplay" "GdkX11Display")
                 (list-children "GdkDisplay"))))
  #+windows
  (is (equal '("GdkWin32Display")
             (list-children "GdkDisplay")))
  ;; Check interfaces
  (is (equal '()
             (list-interfaces "GdkDisplay")))
  ;; Check properties
  (is (equal '("composited" "input-shapes" "rgba")
             (list-properties "GdkDisplay")))
  ;; Check signals
  (is (equal '("closed" "opened" "seat-added" "seat-removed" "setting-changed")
             (list-signals "GdkDisplay")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-G-OBJECT-CLASS "GdkDisplay" GDK-DISPLAY
                       (:SUPERCLASS G-OBJECT :EXPORT T :INTERFACES NIL
                        :TYPE-INITIALIZER "gdk_display_get_type")
                       ((COMPOSITED GDK-DISPLAY-COMPOSITED "composited"
                         "gboolean" T NIL)
                        (INPUT-SHAPES GDK-DISPLAY-INPUT-SHAPES "input-shapes"
                         "gboolean" T NIL)
                        (RGBA GDK-DISPLAY-RGBA "rgba" "gboolean" T NIL)))
             (gobject:get-g-type-definition "GdkDisplay"))))

;;; --- Properties -------------------------------------------------------------

(test gdk-display-properties
  (let ((display (gdk:display-default)))
    (is-true (gdk:display-composited display))
    (is-true (gdk:display-input-shapes display))
    (is-true (gdk:display-rgba display))))

;;; --- Signals ----------------------------------------------------------------

(test gdk-display-closed-signal
  (let ((query (g:signal-query (g:signal-lookup "closed" "GdkDisplay"))))
    (is (string= "closed" (g:signal-query-signal-name query)))
    (is (string= "GdkDisplay" (g:type-name (g:signal-query-owner-type query))))
    (is (equal '(:RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    (is (equal '("gboolean")
               (mapcar #'g:type-name (g:signal-query-param-types query))))
    (is-false (g:signal-query-signal-detail query))))

(test gdk-display-opened-signal
  (let ((query (g:signal-query (g:signal-lookup "opened" "GdkDisplay"))))
    (is (string= "opened" (g:signal-query-signal-name query)))
    (is (string= "GdkDisplay" (g:type-name (g:signal-query-owner-type query))))
    (is (equal '(:RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    (is (equal '()
               (mapcar #'g:type-name (g:signal-query-param-types query))))
    (is-false (g:signal-query-signal-detail query))))

(test gdk-display-seat-added-signal
  (let ((query (g:signal-query (g:signal-lookup "seat-added" "GdkDisplay"))))
    (is (string= "seat-added" (g:signal-query-signal-name query)))
    (is (string= "GdkDisplay" (g:type-name (g:signal-query-owner-type query))))
    (is (equal '(:RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    (is (equal '("GdkSeat")
               (mapcar #'g:type-name (g:signal-query-param-types query))))
    (is-false (g:signal-query-signal-detail query))))

(test gdk-display-seat-removed-signal
  (let ((query (g:signal-query (g:signal-lookup "seat-removed" "GdkDisplay"))))
    (is (string= "seat-removed" (g:signal-query-signal-name query)))
    (is (string= "GdkDisplay" (g:type-name (g:signal-query-owner-type query))))
    (is (equal '(:RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    (is (equal '("GdkSeat")
               (mapcar #'g:type-name (g:signal-query-param-types query))))
    (is-false (g:signal-query-signal-detail query))))

(test gdk-display-setting-changed-signal
  (let ((query (g:signal-query (g:signal-lookup "setting-changed" "GdkDisplay"))))
    (is (string= "setting-changed" (g:signal-query-signal-name query)))
    (is (string= "GdkDisplay" (g:type-name (g:signal-query-owner-type query))))
    (is (equal '(:RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    (is (equal '("gchararray")
               (mapcar #'g:type-name (g:signal-query-param-types query))))
    (is-false (g:signal-query-signal-detail query))))

;;; --- Functions --------------------------------------------------------------

;;;     gdk_display_open

#-windows
(test gdk-display-open
  (let ((name (uiop:getenv "DISPLAY")))
    (is (typep (gdk:display-open name) 'gdk:display))))

#+windows
(test gdk-display-open
  (is (typep (gdk:display-open "1\\WinSta0\\Default") 'gdk:display)))

;;;     gdk_display_get_default

(test gdk-display-default
  (is (typep (gdk:display-default) 'gdk:display)))

;;;     gdk_display_get_name

#-windows
(test gdk-display-name
  (let ((name "wayland-0")
        (display (gdk:display-default)))
    (is (string= name (gdk:display-name display)))))

#+windows
(test gdk-display-name
  (let ((display (gdk:display-default)))
    (is (string= "1\\WinSta0\\Default" (gdk:display-name display)))))

;;;     gdk_display_device_is_grabbed

(test gdk-display-device-is-grabbed
  (let* ((display (gdk:display-default))
         (seat (gdk:display-default-seat display))
         (device (gdk:seat-pointer seat)))
    (is-false (gdk:display-device-is-grabbed display device))))

;;;     gdk_display_beep

(test gdk-display-beep
  (let ((display (gdk:display-default)))
    (is-false (gdk:display-beep display))))

;;;     gdk_display_sync
;;;     gdk_display_flush
;;;     gdk_display_is_closed

(test gdk-display-sync/flush/is-closed
  (let ((display (gdk:display-default)))
    (is-false (gdk:display-sync display))
    (is-false (gdk:display-flush display))
    (is-false (gdk:display-is-closed display))))

;;;     gdk_display_close

;; Do not close the default display.

;;;     gdk_display_is_rgba
;;;     gdk_display_is_composited
;;;     gdk_display_supports_input_shapes

(test gdk-display-is-rgba/composited/supports-input-shapes
  (let ((display (gdk:display-default)))
    (is-true (gdk:display-is-rgba display))
    (is-true (gdk:display-is-composited display))
    (is-true (gdk:display-supports-input-shapes display))))

;;;     gdk_display_get_app_launch_context

(test gdk-display-app-launch-context
  (let ((display (gdk:display-default)))
    (is (typep (gdk:display-app-launch-context display)
               'gdk:app-launch-context))))

;;;     gdk_display_notify_startup_complete                Deprecated 4.10

;;;     gdk_display_get_default_seat

(test gdk-display-default-seat
  (let ((display (gdk:display-default)))
    (is (typep (gdk:display-default-seat display) 'gdk:seat))))

;;;     gdk_display_list_seats

(test gdk-display-list-seats
  (let ((display (gdk:display-default)))
    (is (every (lambda (x) (typep x 'gdk:seat))
               (gdk:display-list-seats display)))))

;;;     gdk_display_get_monitors

(test gdk-display-monitors
  (let ((display (gdk:display-default)))
    (is (every (lambda (x) (typep x 'gdk:monitor))
               (gdk:display-monitors display)))))

;;;     gdk_display_get_monitor_at_surface

;;;     gdk_display_get_clipboard

(test gdk-display-clipboard
  (let ((display (gdk:display-default)))
    (is (typep (gdk:display-clipboard display) 'gdk:clipboard))))

;;;     gdk_display_get_primary_clipboard

(test gdk-display-primary-clipboard
  (let ((display (gdk:display-default)))
    (is (typep (gdk:display-primary-clipboard display) 'gdk:clipboard))))

;;;     gdk_display_get_setting

(test gdk-display-setting
  (let ((display (gdk:display-default)))
    (is (= (gtk:settings-gtk-double-click-time (gtk:settings-default))
           (gdk:display-setting display "gtk-double-click-time" "gint")))))

;;;     gdk_display_get_startup_notification_id            Deprecated 4.10

#+nil
(test gdk-display-startup-notification-id
  (let ((display (gdk:display-default)))
    (is-false (gdk:display-startup-notification-id display))))

;;;     gdk_display_put_event                              Deprecated 4.10

;;;     gdk_display_map_keyval

#-windows
(test gdk-display-map-keyval
  (let ((display (gdk:display-default)))
    (is (equal '((38 0 0) (38 1 0)) (gdk:display-map-keyval display 97)))
    (is (equal '((38 0 1) (38 1 1)) (gdk:display-map-keyval display 65)))))

#+windows
(test gdk-display-map-keyval
  (let ((display (gdk:display-default)))
    (is (equal '((65 0 0)
                 (65 0 3)
                 (65 0 15)
                 (65 0 2)) (gdk:display-map-keyval display 97)))
    (is (equal '((65 0 1)
                 (65 0 4)
                 (65 0 15)
                 (65 0 5)) (gdk:display-map-keyval display 65)))))

;;;     gdk_display_map_keycode

;; TODO: Check this more carefully. What is expected!?

#-windows
(test gdk-display-map-keycode
  (let ((display (gdk:display-default)))
    (is (equal '((97 38 0 0)
                 (65 38 0 1)
                 (230 38 0 2)
                 (198 38 0 3)
                 (97 38 1 0)
                 (65 38 1 1)
                 (230 38 1 2)
                 (198 38 1 3)) (gdk:display-map-keycode display 38)))))

#+windows
(test gdk-display-map-keycode
  (let ((display (gdk:display-default)))
    (is (equal '((65362 38 0 0)) (gdk:display-map-keycode display 38)))))

;;;     gdk_display_translate_key

#-windows
(test gdk-display-translate-key
  (let ((display (gdk:display-default)))
    (is (= 97 (gdk:display-translate-key display 38 :none 0)))
    (is (= 65 (gdk:display-translate-key display 38 :shift-mask 0)))))

#+windows
(test gdk-display-translate-key
  (let ((display (gdk:display-default)))
    (is (= 65362 (gdk:display-translate-key display 38 :none 0)))
    (is (= 65362 (gdk:display-translate-key display 38 :shift-mask 0)))))

;;;     gdk_display_prepare_gl                             Since 4.4
;;;     gdk_display_create_gl_context                      Since 4.6

;;; 2024-4-30
