;;; ----------------------------------------------------------------------------
;;; gtk4.drag-source.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.16 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2022 - 2024 Dieter Kaiser
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
;;; GtkDragSource
;;;
;;;     Event controller to initiate DND operations
;;;
;;; Types and Values
;;;
;;;     GtkDragSource
;;;
;;; Accessors
;;;
;;;     gtk_drag_source_set_actions
;;;     gtk_drag_source_get_actions
;;;     gtk_drag_source_set_content
;;;     gtk_drag_source_get_content
;;;
;;; Functions
;;;
;;;     gtk_drag_source_new
;;;     gtk_drag_source_set_icon
;;;     gtk_drag_source_drag_cancel
;;;     gtk_drag_source_get_drag
;;;
;;;     gtk_drag_check_threshold
;;;
;;; Properties
;;;
;;;     actions
;;;     content
;;;
;;; Signals
;;;
;;;     drag-begin
;;;     drag-cancel
;;;     drag-end
;;;     prepare
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GtkEventController
;;;         ╰── GtkGesture
;;;             ╰── GtkGestureSingle
;;;                 ╰── GtkDragSource
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; GtkDragSource
;;; ----------------------------------------------------------------------------

(gobject:define-gobject "GtkDragSource" drag-source
  (:superclass gesture-single
   :export t
   :interfaces ()
   :type-initializer "gtk_drag_source_get_type")
  ((actions
    drag-source-actions
    "actions" "GdkDragAction" t t)
   (content
    drag-source-content
    "content" "GdkContentProvider" t t)))

#+liber-documentation
(setf (documentation 'drag-source 'type)
 "@version{2024-11-2}
  @begin{short}
    The @class{gtk:drag-source} object is an auxiliary object that is used to
    initiate Drag and Drop operations.
  @end{short}
  It can be set up with the necessary ingredients for a DND operation ahead of
  time. This includes the source for the data that is being transferred, in the
  form of a @class{gdk:content-provider} object, the desired action, and the
  icon to use during the drag operation. After setting it up, the drag source
  must be added to a widget as an event controller, using the
  @fun{gtk:widget-add-controller} function.

  Setting up the content provider and icon ahead of time only makes sense when
  the data does not change. More commonly, you will want to set them up just in
  time. To do so, the @class{gtk:drag-source} object has @code{\"prepare\"} and
  @code{\"drag-begin\"} signals. The @code{\"prepare\"} signal is emitted before
  a drag is started, and can be used to set the content provider and actions
  that the drag should be started with. The @code{\"drag-begin\"} signal is
  emitted after the @class{gdk:drag} object has been created, and can be used
  to set up the drag icon.

  During the DND operation, the @class{gtk:drag-source} object emits signals
  that can be used to obtain updates about the status of the operation, but it
  is not normally necessary to connect to any signals, except for one case.
  When the supported actions include the @code{:move} value of the
  @symbol{gdk:drag-action} flags, you need to listen for the \"drag-end\"
  signal and delete the data after it has been transferred.
  @begin[Signal Details]{dictionary}
    @subheading{The \"drag-begin\" signal}
      @begin{pre}
lambda (source drag)    :run-last
      @end{pre}
      @begin[code]{table}
        @entry[source]{The @class{gtk:drag-source} object.}
        @entry[drag]{The @class{gdk:drag} object.}
      @end{table}
      The signal is emitted on the drag source when a drag is started. It can
      be used to, for example, set a custom drag icon with the
      @fun{gtk:drag-source-set-icon} function.
    @subheading{The \"drag-cancel\" signal}
      @begin{pre}
lambda (source drag reason)    :run-last
      @end{pre}
      @begin[code]{table}
        @entry[source]{The @class{gtk:drag-source} object.}
        @entry[drag]{The @class{gdk:drag} object.}
        @entry[reason]{The @symbol{gdk:drag-cancel-reason} value with the
          information on why the drag failed.}
        @entry[Returns]{@em{True} if the failed drag operation has been already
          handled.}
      @end{table}
      The signal is emitted on the drag source when a drag has failed. The
      signal handler may handle a failed drag operation based on the type of
      error. It should return @em{true} if the failure has been handled and the
      default \"drag operation failed\" animation should not be shown.
    @subheading{The \"drag-end\" signal}
      @begin{pre}
lambda (source drag delete)    :run-last
      @end{pre}
      @begin[code]{table}
        @entry[source]{The @class{gtk:drag-source} object.}
        @entry[drag]{The @class{gdk:drag} object.}
        @entry[delete]{@em{True} if the drag was performing @code{:move}, and
        the data should be deleted.}
        @entry[Returns]{@em{True} if the failed drag operation has been already
          handled.}
      @end{table}
      The signal is emitted on the drag source when a drag is finished. A
      typical reason to connect to this signal is to undo things done in the
      @code{\"prepare\"} or @code{\"drag-begin\"} handler.
    @subheading{The \"prepare\" signal}
      @begin{pre}
lambda (source x y)    :run-last
      @end{pre}
      @begin[code]{table}
        @entry[source]{The @class{gtk:drag-source} object.}
        @entry[x]{The double float with the x coordinate of the drag starting
          point.}
        @entry[y]{The double float with the y coordinate of the drag starting
          point.}
        @entry[Returns]{The @class{gdk:content-provider} object, or @code{nil}.}
      @end{table}
      The signal is emitted when a drag is about to be initiated. It returns
      the @class{gdk:content-provider} object to use for the drag that is about
      to start. The default handler for this signal returns the value of the
      @slot[gtk:drag-source]{content} property, so if you set up that property
      ahead of time, you do not need to connect to this signal.
  @end{dictionary}
  @see-slot{gtk:drag-source-actions}
  @see-slot{gtk:drag-source-content}
  @see-constructor{gtk:drag-source-new}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- gtk:drag-source-actions ------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "actions" 'drag-source) t)
 "The @code{actions} property of type @symbol{gdk:drag-action} (Read / Write)
  @br{}
  The actions that are supported by drag operations from the source. Note that
  you must handle the @code{\"drag-end\"} signal if the actions include
  @code{:move}. @br{}
  Default value: @code{:copy}")

#+liber-documentation
(setf (liber:alias-for-function 'drag-source-actions)
      "Accessor"
      (documentation 'drag-source-actions 'function)
 "@version{2024-11-2}
  @syntax{(gtk:drag-source-actions object) => actions}
  @syntax{(setf (gtk:drag-source-actions object) actions)}
  @argument[object]{a @class{gtk:drag-source} object}
  @argument[actions]{a @symbol{gdk:drag-action} value with the actions to offer}
  @begin{short}
    Accessor of the @slot[gtk:drag-source]{actions} slot of the
    @class{gtk:drag-source} class.
  @end{short}
  The @fun{gtk:drag-source-actions} function gets the actions that are
  currently set on the @class{gtk:drag-source} object. The
  @setf{gtk:drag-source-actions} function sets the actions.

  During a DND operation, the actions are offered to potential drop targets.
  If @arg{actions} include @code{:move}, you need to listen to the
  @code{\"drag-end\"} signal and handle the @arg{delete} argument being
  @em{true}.

  This function can be called before a drag is started, or in a handler for
  the @code{\"prepare\"} signal.
  @see-class{gtk:drag-source}
  @see-symbol{gdk:drag-action}")

;;; --- gtk:drag-source-content ------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "content" 'drag-source) t)
 "The @code{content} property of type @class{gdk:content-provider}
  (Read / Write) @br{}
  The data that is offered by drag operations from this source, in the form
  of a @class{gdk:content-provider} object.")

#+liber-documentation
(setf (liber:alias-for-function 'drag-source-content)
      "Accessor"
      (documentation 'drag-source-content 'function)
 "@version{2024-11-2}
  @syntax{(gtk:drag-source-content object) => content}
  @syntax{(setf (gtk:drag-source-content object) content)}
  @argument[object]{a @class{gtk:drag-source} object}
  @argument[content]{a @class{gdk:content-provider} object of @arg{source},
    or @code{nil}}
  @begin{short}
    Accessor of the @slot[gtk:drag-source]{content} slot of the
    @class{gtk:drag-source} class.
  @end{short}
  The @fun{gtk:drag-source-content} function gets the current content provider
  of a @class{gtk:drag-source} object. The @setf{gtk:drag-source-content}
  function sets a content provider. When the data is requested in the cause of
  a DND operation, it will be obtained from the content provider.

  This function can be called before a drag is started, or in a handler for the
  @code{\"prepare\"} signal. You may consider setting the content provider back
  to @code{nil} in a @code{\"drag-end\"} signal handler.
  @see-class{gtk:drag-source}
  @see-class{gdk:content-provider}")

;;; ----------------------------------------------------------------------------
;;; gtk_drag_source_new
;;; ----------------------------------------------------------------------------

(declaim (inline drag-source-new))

(defun drag-source-new ()
 #+liber-documentation
 "@version{2024-11-2}
  @return{The new @class{gtk:drag-source} object}
  @short{Creates a new drag source.}
  @see-class{gtk:drag-source}"
  (make-instance 'drag-source))

(export 'drag-source-new)

;;; ----------------------------------------------------------------------------
;;; gtk_drag_source_set_icon
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_drag_source_set_icon" drag-source-set-icon) :void
 #+liber-documentation
 "@version{#2023-7-31}
  @argument[source]{a @class{gtk:drag-source} object}
  @argument[paintable]{a @class{gdk:paintable} object to use as icon, or
    @code{nil}}
  @argument[xhot]{an integer with the hotspot x coordinate on the icon}
  @argument[yhot]{an integer with the hotspot y coordinate on the icon}
  @begin{short}
    Sets a paintable to use as icon during DND operations.
  @end{short}
  The hotspot coordinates determine the point on the icon that gets aligned
  with the hotspot of the cursor. If @arg{paintable} is @code{nil}, a default
  icon is used.

  This function can be called before a drag is started, or in a
  @code{\"prepare\"} or @code{\"drag-begin\"} signal handler.
  @see-class{gtk:drag-source}
  @see-class{gdk:paintable}"
  (source (g:object drag-source))
  (paintable (g:object gdk:paintable))
  (xhot :int)
  (yhot :int))

(export 'drag-source-set-icon)

;;; ----------------------------------------------------------------------------
;;;gtk_drag_source_drag_cancel
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_drag_source_drag_cancel" drag-source-drag-cancel) :void
 #+liber-documentation
 "@version{#2023-7-31}
  @argument[source]{a @class{gtk:drag-source} object}
  @short{Cancels a currently ongoing drag operation.}
  @see-class{gtk:drag-source}"
  (source (g:object drag-source)))

(export 'drag-source-drag-cancel)

;;; ----------------------------------------------------------------------------
;;; gtk_drag_source_get_drag
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_drag_source_get_drag" drag-source-drag) (g:object gdk:drag)
 #+liber-documentation
 "@version{#2023-7-31}
  @argument[source]{a @class{gtk:drag-source} object}
  @return{The @class{gdk:drag} object of the current drag operation, or
    @code{nil}.}
  @short{Returns the underlying @class{gdk:drag} object for an ongoing drag.}
  @see-class{gtk:drag-source}
  @see-class{gdk:drag}"
  (source (g:object drag-source)))

(export 'drag-source-drag)

;;; ----------------------------------------------------------------------------
;;; gtk_drag_check_threshold
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_drag_check_threshold" drag-check-threshold) :boolean
 #+liber-documentation
 "@version{#2023-7-31}
  @argument[source]{a @class{gtk:drag-source} object}
  @argument[xstart]{an integer with the x coordinate of start of drag}
  @argument[ystart]{an integer with the y coordinate of start of drag}
  @argument[xcurrent]{an integer with the current x coordinate}
  @argument[ycurrent]{an integer with the current y coordinate}
  @return{@em{True} if the drag threshold has been passed.}
  @begin{short}
    Checks to see if a mouse drag starting at @code{(xstart, ystart)} and
    ending at @code{(xcurrent, ycurrent)} has passed the GTK drag threshold,
    and thus should trigger the beginning of a drag-and-drop operation.
  @end{short}
  @see-class{gtk:drag-source}"
  (widget (g:object widget))
  (xstart :int)
  (ystart :int)
  (xcurrent :int)
  (ycurrent :int))

(export 'drag-check-threshold)

;;; --- End of file gtk4.drag-source.lisp --------------------------------------
