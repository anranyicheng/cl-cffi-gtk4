(in-package :gtk-test)

(def-suite gtk-text :in gtk-suite)
(in-suite gtk-text)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkText

(test gtk-text-class
  ;; Check type
  (is (g:type-is-object "GtkText"))
  ;; Check registered name
  (is (eq 'gtk:text
          (glib:symbol-for-gtype "GtkText")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkText")
          (g:gtype (cffi:foreign-funcall "gtk_text_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GtkWidget")
          (g:type-parent "GtkText")))
  ;; Check children
  (is (equal '()
             (gtk-test:list-children "GtkText")))
  ;; Check interfaces
  (is (equal '("GtkAccessible" "GtkBuildable" "GtkConstraintTarget"
               "GtkEditable" "GtkAccessibleText")
             (gtk-test:list-interfaces "GtkText")))
  ;; Check class properties
  (is (equal '("activates-default" "attributes" "buffer" "cursor-position"
               "editable" "enable-emoji-completion" "enable-undo" "extra-menu"
               "im-module" "input-hints" "input-purpose" "invisible-char"
               "invisible-char-set" "max-length" "max-width-chars"
               "overwrite-mode" "placeholder-text" "propagate-text-width"
               "scroll-offset" "selection-bound" "tabs" "text"
               "truncate-multiline" "visibility" "width-chars" "xalign")
             (gtk-test:list-properties "GtkText")))
  ;; Check signals
  (is (equal '("activate" "backspace" "copy-clipboard" "cut-clipboard"
               "delete-from-cursor" "insert-at-cursor" "insert-emoji"
               "move-cursor" "paste-clipboard" "preedit-changed"
               "toggle-overwrite")
             (gtk-test:list-signals "GtkText")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-G-OBJECT-CLASS "GtkText" GTK-TEXT
                       (:SUPERCLASS GTK-WIDGET :EXPORT T :INTERFACES
                        ("GtkAccessible" "GtkAccessibleText" "GtkBuildable"
                         "GtkConstraintTarget" "GtkEditable")
                        :TYPE-INITIALIZER "gtk_text_get_type")
                       ((ACTIVATES-DEFAULT GTK-TEXT-ACTIVATES-DEFAULT
                         "activates-default" "gboolean" T T)
                        (ATTRIBUTES GTK-TEXT-ATTRIBUTES "attributes"
                         "PangoAttrList" T T)
                        (BUFFER GTK-TEXT-BUFFER "buffer" "GtkEntryBuffer" T T)
                        (ENABLE-EMOJI-COMPLETION
                         GTK-TEXT-ENABLE-EMOJI-COMPLETION
                         "enable-emoji-completion" "gboolean" T T)
                        (EXTRA-MENU GTK-TEXT-EXTRA-MENU "extra-menu"
                         "GMenuModel" T T)
                        (IM-MODULE GTK-TEXT-IM-MODULE "im-module" "gchararray"
                         T T)
                        (INPUT-HINTS GTK-TEXT-INPUT-HINTS "input-hints"
                         "GtkInputHints" T T)
                        (INPUT-PURPOSE GTK-TEXT-INPUT-PURPOSE "input-purpose"
                         "GtkInputPurpose" T T)
                        (INVISIBLE-CHAR GTK-TEXT-INVISIBLE-CHAR
                         "invisible-char" "guint" T T)
                        (INVISIBLE-CHAR-SET GTK-TEXT-INVISIBLE-CHAR-SET
                         "invisible-char-set" "gboolean" T T)
                        (MAX-LENGTH GTK-TEXT-MAX-LENGTH "max-length" "gint" T
                         T)
                        (OVERWRITE-MODE GTK-TEXT-OVERWRITE-MODE
                         "overwrite-mode" "gboolean" T T)
                        (PLACEHOLDER-TEXT GTK-TEXT-PLACEHOLDER-TEXT
                         "placeholder-text" "gchararray" T T)
                        (PROPAGATE-TEXT-WIDTH GTK-TEXT-PROPAGATE-TEXT-WIDTH
                         "propagate-text-width" "gboolean" T T)
                        (SCROLL-OFFSET GTK-TEXT-SCROLL-OFFSET "scroll-offset"
                         "gint" T NIL)
                        (TABS GTK-TEXT-TABS "tabs" "PangoTabArray" T T)
                        (TRUNCATE-MULTILINE GTK-TEXT-TRUNCATE-MULTILINE
                         "truncate-multiline" "gboolean" T T)
                        (VISIBILITY GTK-TEXT-VISIBILITY "visibility" "gboolean"
                         T T)))
             (gobject:get-g-type-definition "GtkText"))))

;;; --- Properties -------------------------------------------------------------

(test gtk-text-properties
  (let ((text (make-instance 'gtk:text)))
    (is-false (gtk:text-activates-default text))
    (is-false (gtk:text-attributes text))
    (is (typep (gtk:text-buffer text) 'gtk:entry-buffer))
    (is-false (gtk:text-enable-emoji-completion text))
    (is-false (gtk:text-extra-menu text))
    (is-false (gtk:text-im-module text))
    (is-false (gtk:text-input-hints text))
    (is (eq :free-form (gtk:text-input-purpose text)))
    (is (= 0 (gtk:text-invisible-char text)))
    (is-false (gtk:text-invisible-char-set text))
    (is (= 0 (gtk:text-max-length text)))
    (is-false (gtk:text-overwrite-mode text))
    (is-false (gtk:text-placeholder-text text))
    (is-false (gtk:text-propagate-text-width text))
    (is (= 0 (gtk:text-scroll-offset text)))
    (is-false (gtk:text-tabs text))
    (is-false (gtk:text-truncate-multiline text))
    (is-true (gtk:text-visibility text))))

;;; --- Signals ----------------------------------------------------------------

;;;     activate

(test gtk-text-activate-signal
  (let* ((name "activate") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '()
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     backspace

(test gtk-text-backspace-signal
  (let* ((name "backspace") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '()
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     copy-clipboard

(test gtk-text-copy-clipboard-signal
  (let* ((name "copy-clipboard") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '()
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     cut-clipboard

(test gtk-text-cut-clipboard-signal
  (let* ((name "cut-clipboard") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '()
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     delete-from-cursor

(test gtk-text-delete-from-cursor-signal
  (let* ((name "delete-from-cursor") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '("GtkDeleteType" "gint")
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     insert-at-cursor

(test gtk-text-insert-at-cursor-signal
  (let* ((name "insert-at-cursor") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '("gchararray")
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     insert-emoji

(test gtk-text-insert-emoji-signal
  (let* ((name "insert-emoji") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '()
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     move-cursor

(test gtk-text-move-cursor-signal
  (let* ((name "move-cursor") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '("GtkMovementStep" "gint" "gboolean")
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     paste-clipboard

(test gtk-text-paste-clipboard-signal
  (let* ((name "paste-clipboard") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '()
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     preedit-changed

(test gtk-text-preedit-changed-signal
  (let* ((name "preedit-changed") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '("gchararray")
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;;     toggle-overwrite

(test gtk-text-toggle-overwrite-signal
  (let* ((name "toggle-overwrite") (gtype "GtkText")
         (query (g:signal-query (g:signal-lookup name gtype))))
    ;; Retrieve name and gtype
    (is (string= name (g:signal-query-signal-name query)))
    (is (string= gtype (g:type-name (g:signal-query-owner-type query))))
    ;; Check flags
    (is (equal '(:ACTION :RUN-LAST)
               (sort (g:signal-query-signal-flags query) #'string<)))
    ;; Check return type
    (is (string= "void" (g:type-name (g:signal-query-return-type query))))
    ;; Check parameter types
    (is (equal '()
               (mapcar #'g:type-name (g:signal-query-param-types query))))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_text_new

(test gtk-text-new
  (let (text)
    (is (typep (setf text (gtk:text-new)) 'gtk:text))
    (is (typep (gtk:text-buffer text) 'gtk:entry-buffer))))

;;;     gtk_text_new_with_buffer

(test gtk-text-new-with-buffer
  (let ((buffer (gtk:entry-buffer-new))
        text)
    (is (typep (setf text (gtk:text-new-with-buffer buffer)) 'gtk:text))
    (is (typep (gtk:text-buffer text) 'gtk:entry-buffer))
    (is (eq buffer (gtk:text-buffer text)))))

;;;     gtk_text_unset_invisible_char

(test gtk-text-unset-invisible-char
  (let ((text (gtk:text-new)))
    (is (= 0 (gtk:text-invisible-char text)))
    (is-false (gtk:text-invisible-char-set text))
    (is (= 43 (setf (gtk:text-invisible-char text) (char-code #\+))))
    (is (= 43 (gtk:text-invisible-char text)))
    (is-true (gtk:text-invisible-char-set text))
    (is-false (gtk:text-unset-invisible-char text))
    ;; Default char is #\BULLET and not \*
    #-windows
    (is (= (char-code #\BULLET) (gtk:text-invisible-char text)))
    #+windows
    (is (= (char-code #\BLACK_CIRCLE) (gtk:text-invisible-char text)))
    (is-false (gtk:text-invisible-char-set text))))

;;;     gtk_text_get_text_length

(test gtk-text-text-length
  (let* ((buffer (gtk:entry-buffer-new "Ägypen"))
         (text (gtk:text-new-with-buffer buffer)))
    (is (= 6 (gtk:text-text-length text)))
    (is (= (gtk:entry-buffer-length (gtk:text-buffer text))
           (gtk:text-text-length text)))
    (is (= (gtk:entry-buffer-length buffer) (gtk:text-text-length text)))))

;;;     gtk_text_grab_focus_without_selecting

;;;     gtk_text_compute_cursor_extents

(test gtk-text-compute-cursor-extents.1
  (let* ((buffer (gtk:entry-buffer-new "Ägypten"))
         (text (gtk:text-new-with-buffer buffer)))
    (graphene:with-rects (strong weak)
      (is-false (gtk:text-compute-cursor-extents text 2 strong weak))
      ;; Check strong values
      #-windows
      (is (= 18.0 (graphene:rect-x strong)))
      (is (= -8.0 (graphene:rect-y strong)))
      (is (=  0.0 (graphene:rect-width strong)))
      (is (= 17.0 (graphene:rect-height strong)))
      ;; Check weak values
      #-windows
      (is (= 18.0 (graphene:rect-x weak)))
      (is (= -8.0 (graphene:rect-y weak)))
      (is (=  0.0 (graphene:rect-width weak)))
      (is (= 17.0 (graphene:rect-height weak))))))

(test gtk-text-compute-cursor-extents.2
  (let* ((buffer (gtk:entry-buffer-new "Ägypten"))
         (text (gtk:text-new-with-buffer buffer)))
    (graphene:with-rect (strong)
      (is-false (gtk:text-compute-cursor-extents text 2 strong nil))
      #-windows
      (is (= 18.0 (graphene:rect-x strong)))
      (is (= -8.0 (graphene:rect-y strong)))
      (is (=  0.0 (graphene:rect-width strong)))
      (is (= 17.0 (graphene:rect-height strong))))))

(test gtk-text-compute-cursor-extents.3
  (let* ((buffer (gtk:entry-buffer-new "Ägypten"))
         (text (gtk:text-new-with-buffer buffer)))
    (graphene:with-rect (weak)
      (is-false (gtk:text-compute-cursor-extents text 2 nil weak))
      #-windows
      (is (= 18.0 (graphene:rect-x weak)))
      (is (= -8.0 (graphene:rect-y weak)))
      (is (=  0.0 (graphene:rect-width weak)))
      (is (= 17.0 (graphene:rect-height weak))))))

;;; 2024-7-3
