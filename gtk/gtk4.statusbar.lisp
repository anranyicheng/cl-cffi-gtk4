;;; ----------------------------------------------------------------------------
;;; gtk4.statusbar.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.12 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2011 - 2024 Dieter Kaiser
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a
;;; copy of this software and associated documentation files (the "Software"),
;;; to deal in the Software without restriction, including without limitation
;;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;;; and/or sell copies of the Software, and to permit persons to whom the
;;; Software is furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in
;;; all copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
;;; THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;;; DEALINGS IN THE SOFTWARE.
;;; ----------------------------------------------------------------------------
;;;
;;; GtkStatusbar
;;;
;;;     Report messages of minor importance to the user
;;;
;;; Types and Values
;;;
;;;     GtkStatusbar
;;;
;;; Functions
;;;
;;;     gtk_statusbar_new
;;;     gtk_statusbar_get_context_id
;;;     gtk_statusbar_push
;;;     gtk_statusbar_pop
;;;     gtk_statusbar_remove
;;;     gtk_statusbar_remove_all
;;;
;;; Signals
;;;
;;;     text-popped
;;;     text-pushed
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GInitiallyUnowned
;;;         ╰── GtkWidget
;;;             ╰── GtkStatusbar
;;;
;;; Implemented Interfaces
;;;
;;;     GtkAccessible
;;;     GtkBuildable
;;;     GtkConstraintTarget
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; GtkStatusbar
;;; ----------------------------------------------------------------------------

(gobject:define-gobject "GtkStatusbar" statusbar
  (:superclass widget
   :export t
   :interfaces ("GtkAccessible"
                "GtkBuildable"
                "GtkConstraintTarget")
   :type-initializer "gtk_statusbar_get_type")
 nil)

#+(and gtk-4-10 gtk-warn-deprecated)
(defmethod initialize-instance :after ((obj statusbar) &key)
  (when gtk-init:*gtk-warn-deprecated*
    (warn "GTK:STATUSBAR is deprecated since 4.10")))

#+liber-documentation
(setf (documentation 'statusbar 'type)
 "@version{2024-5-2}
  @begin{short}
    The @class{gtk:statusbar} widget is usually placed along the bottom of the
    main @class{gtk:window} widget of the application.
  @end{short}
  It may provide a regular commentary of the status of the application as is
  usually the case in a web browser, for example, or may be used to simply
  output a message when the status changes, when an upload is complete in an
  FTP client, for example.

  @image[statusbar]{Figure: GtkStatusbar}

  Statusbars in GTK maintain a stack of messages. The message at the top of
  the stack of the statusbar is the one that will currently be displayed.

  Any messages added to the stack of the statusbar must specify a context ID
  that is used to uniquely identify the source of a message. This context ID can
  be generated by the @fun{gtk:statusbar-context-id} function, given a message
  and the statusbar that it will be added to. Note that messages are stored in
  a stack, and when choosing which message to display, the stack structure is
  adhered to, regardless of the context identifier of a message.

  One could say that a statusbar maintains one stack of messages for display
  purposes, but allows multiple message producers to maintain sub-stacks of
  the messages they produced (via context IDs).

  Statusbars are created using the @fun{gtk:statusbar-new} function.

  Messages are added to the stack of the statusbar with the
  @fun{gtk:statusbar-push} function.

  The message at the top of the stack can be removed using the
  @fun{gtk:statusbar-pop} function. A message can be removed from anywhere in
  the stack if its message ID was recorded at the time it was added. This is
  done using the @fun{gtk:statusbar-remove} function.
  @begin[CSS node]{dictionary}
    The @class{gtk:statusbar} implementation has a single CSS node with name
    @code{statusbar}.
  @end{dictionary}
  @begin[Warning]{dictionary}
    The @class{gtk:statusbar} implementation is deprecated since 4.10. This
    widget will be removed in GTK 5.
  @end{dictionary}
  @begin[Signal Details]{dictionary}
    @subheading{The \"text-popped\" signal}
      @begin{pre}
lambda (statusbar context text)    :run-last
      @end{pre}
      @begin[code]{table}
        @entry[statusbar]{The @class{gtk:statusbar} widget which received the
          signal.}
        @entry[context]{The unsigned integer with the context ID of the
          relevant message/statusbar.}
        @entry[text]{The string with the message that was just popped.}
      @end{table}
      Is emitted whenever a new message is popped off the stack of the status
      bar.
    @subheading{The \"text-pushed\" signal}
      @begin{pre}
lambda (statusbar context text)    :run-last
      @end{pre}
      @begin[code]{table}
        @entry[statusbar]{The @class{gtk:statusbar} widget which received the
          signal.}
        @entry[context]{The unsigned integer with the context ID of the
          relevant message/statusbar.}
        @entry[text]{The string with the message that was pushed.}
      @end{table}
      Is emitted whenever a new message gets pushed onto the stack of the status
      bar.
  @end{dictionary}
  @see-constructor{gtk:statusbar-new}")

;;; ----------------------------------------------------------------------------
;;; gtk_statusbar_new
;;; ----------------------------------------------------------------------------

(declaim (inline statusbar-new))

(defun statusbar-new ()
 #+liber-documentation
 "@version{2024-5-2}
  @return{The new @class{gtk:statusbar} widget.}
  @short{Creates a new statusbar ready for messages.}
  @begin[Warning]{dictionary}
    The @class{gtk:statusbar} implementation is deprecated since 4.10. This
    widget will be removed in GTK 5.
  @end{dictionary}
  @see-class{gtk:statusbar}"
  (make-instance 'statusbar))

(export 'statusbar-new)

;;; ----------------------------------------------------------------------------
;;; gtk_statusbar_get_context_id
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_statusbar_get_context_id" %statusbar-get-context-id) :uint
  (statusbar (g:object statusbar))
  (context-description :string))

(defun statusbar-context-id (statusbar context)
 #+liber-documentation
 "@version{#2024-5-2}
  @argument[statusbar]{a @class{gtk:statusbar} widget}
  @argument[context]{a string with the textual description of what context the
    new message is being used in}
  @return{The integer context ID.}
  @begin{short}
    Returns a new context identifier, given a description of the actual context.
  @end{short}
  Note that the description is not shown in the UI.
  @begin[Warning]{dictionary}
    The @class{gtk:statusbar} implementation is deprecated since 4.10. This
    widget will be removed in GTK 5.
  @end{dictionary}
  @see-class{gtk:statusbar}"
  (etypecase context
    (integer context)
    (string (%statusbar-get-context-id statusbar context))))

(export 'statusbar-context-id)

;;; ----------------------------------------------------------------------------
;;; gtk_statusbar_push
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_statusbar_push" %statusbar-push) :uint
  (statusbar (g:object statusbar))
  (context :uint)
  (text :string))

(defun statusbar-push (statusbar context text)
 #+liber-documentation
 "@version{2023-4-3}
  @argument[statusbar]{a @class{gtk:statusbar} widget}
  @argument[context]{an unsigned integer with the context ID of the message, as
    returned by the @fun{gtk:statusbar-context-id} function}
  @argument[text]{a string with the message to add to @arg{statusbar}}
  @return{The unsigned integer with a message ID that can be used with the
    @fun{gtk:statusbar-remove} function.}
  @begin{short}
    Pushes a new message onto the stack of the statusbar.
  @end{short}
  @begin[Warning]{dictionary}
    The @class{gtk:statusbar} implementation is deprecated since 4.10. This
    widget will be removed in GTK 5.
  @end{dictionary}
  @see-class{gtk:statusbar}
  @see-function{gtk:statusbar-remove}
  @see-function{gtk:statusbar-context-id}"
  (%statusbar-push statusbar context text))

(export 'statusbar-push)

;;; ----------------------------------------------------------------------------
;;; gtk_statusbar_pop
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_statusbar_pop" %statusbar-pop) :void
  (statusbar (g:object statusbar))
  (context :uint))

(defun statusbar-pop (statusbar context)
 #+liber-documentation
 "@version{2023-4-3}
  @argument[statusbar]{a @class{gtk:statusbar} widget}
  @argument[context]{an unsigned integer with a context identifier}
  @begin{short}
    Removes the first message in the stack of the statusbar with the given
    context ID.
  @end{short}
  Note that this may not change the displayed message, if the message at the
  top of the stack has a different context ID.
  @begin[Warning]{dictionary}
    The @class{gtk:statusbar} implementation is deprecated since 4.10. This
    widget will be removed in GTK 5.
  @end{dictionary}
  @see-class{gtk:statusbar}
  @see-function{gtk:statusbar-push}"
  (%statusbar-pop statusbar (statusbar-context-id statusbar context)))

(export 'statusbar-pop)

;;; ----------------------------------------------------------------------------
;;; gtk_statusbar_remove
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_statusbar_remove" %statusbar-remove) :void
  (statusbar (g:object statusbar))
  (context :uint)
  (message :uint))

(defun statusbar-remove (statusbar context message)
 #+liber-documentation
 "@version{#2023-8-24}
  @argument[statusbar]{a @class{gtk:statusbar} widget}
  @argument[context]{an unsigned integer with a context identifier}
  @argument[message]{an unsigned integer with a message identifier, as returned
    by the @fun{gtk:statusbar-push} function}
  @begin{short}
    Forces the removal of a message from the stack of the statusbar.
  @end{short}
  The exact @arg{context} and @arg{message} identifier must be specified.
  @begin[Warning]{dictionary}
    The @class{gtk:statusbar} implementation is deprecated since 4.10. This
    widget will be removed in GTK 5.
  @end{dictionary}
  @see-class{gtk:statusbar}
  @see-function{gtk:statusbar-push}"
  (%statusbar-remove statusbar
                     (statusbar-context-id statusbar context)
                     message))

(export 'statusbar-remove)

;;; ----------------------------------------------------------------------------
;;; gtk_statusbar_remove_all
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_statusbar_remove_all" %statusbar-remove-all) :void
  (statusbar (g:object statusbar))
  (conext :uint))

(defun statusbar-remove-all (statusbar context)
 #+liber-documentation
 "@version{#2023-8-24}
  @argument[statusbar]{a @class{gtk:statusbar} widget}
  @argument[context]{an integer with a context identifier}
  @begin{short}
    Forces the removal of all messages from the stack of the statusbar with the
    exact @arg{context} identifier.
  @end{short}
  @begin[Warning]{dictionary}
    The @class{gtk:statusbar} implementation is deprecated since 4.10. This
    widget will be removed in GTK 5.
  @end{dictionary}
  @see-class{gtk:statusbar}"
  (%statusbar-remove-all statusbar
                         (statusbar-context-id statusbar context)))

(export 'statusbar-remove-all)

;;; --- End of file gtk4.statusbar.lisp ----------------------------------------
