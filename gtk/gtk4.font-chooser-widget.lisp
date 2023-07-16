;;; ----------------------------------------------------------------------------
;;; gtk4.font-chooser-widget.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.0 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2012 - 2022 Dieter Kaiser
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
;;; GtkFontChooserWidget
;;;
;;;     A widget for selecting fonts
;;;
;;; Types and Values
;;;
;;;     GtkFontChooserWidget
;;;
;;; Functions
;;;
;;;     gtk_font_chooser_widget_new
;;;
;;; Properties
;;;
;;;     tweak-action
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GInitiallyUnowned
;;;         ╰── GtkWidget
;;;             ╰── GtkFontChooserWidget
;;;
;;; Implemented Interfaces
;;;
;;;     GtkAccessible
;;;     GtkBuildable
;;;     GtkConstraintTarget
;;;     GtkFontChooser
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; struct GtkFontChooserWidget
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkFontChooserWidget" font-chooser-widget
  (:superclass widget
   :export t
   :interfaces ("GtkAccessible"
                "GtkBuildable"
                "GtkConstraintTarget"
                "GtkFontChooser")
   :type-initializer "gtk_font_chooser_widget_get_type")
  ((tweak-action
    font-chooser-widget-tweak-action
    "tweak-action" "GAction" t nil)))

#+liber-documentation
(setf (documentation 'font-chooser-widget 'type)
 "@version{#2020-6-6}
  @begin{short}
    The @sym{gtk:font-chooser-widget} widget lists the available fonts, styles
    and sizes, allowing the user to select a font.
  @end{short}
  It is used in the @class{gtk:font-chooser-dialog} widget to provide a dialog
  box for selecting fonts.

  To set or to get the font which is initially selected, use the
  @fun{gtk:font-chooser-font} or @fun{gtk:font-chooser-font-desc} functions.

  To change the text which is shown in the preview area, use the
  @fun{gtk:font-chooser-preview-text} function.
  @begin[CSS nodes]{dictionary}
    The @sym{gtk:font-chooser-widget} class has a single CSS node with name
    @code{fontchooser}.
  @end{dictionary}
  @see-class{gtk:font-chooser-dialog}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- font-chooser-widget-tweak-action -----------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "tweak-action"
                                               'font-chooser-widget) t)
 "The @code{tweak-action} property of type @class{g-action} (Read) @br{}
  A toggle action that can be used to switch to the tweak page of the font
  chooser widget, which lets the user tweak the OpenType features and variation
  axes of the selected font. The action will be enabled or disabled depending
  on whether the selected font has any features or axes.")

#+liber-documentation
(setf (liber:alias-for-function 'font-chooser-widget-tweak-action)
      "Accessor"
      (documentation 'font-chooser-widget-tweak-action 'function)
 "@version{#2020-6-6}
  @syntax[]{(gtk:font-chooser-widget-tweak-action object) => tweak-action}
  @syntax[]{(setf (gtk:font-chooser-widget-tweak-action object) tweak-action)}
  @argument[object]{a @class{gtk:font-chooser-widget} widget}
  @argument[tweak-action]{a @class{g-action} toggle action}
  @begin{short}
    Accessor of the @slot[gtk:font-chooser-widget]{tweak-action} slot of the
    @class{gtk:font-chooser-widget} class.
  @end{short}

  A toggle action that can be used to switch to the tweak page of the font
  chooser widget, which lets the user tweak the OpenType features and variation
  axes of the selected font. The action will be enabled or disabled depending
  on whether the selected font has any features or axes.
  @see-class{gtk:font-chooser-widget}")

;;; ----------------------------------------------------------------------------
;;; gtk_font_chooser_widget_new ()
;;; ----------------------------------------------------------------------------

(declaim (inline font-chooser-widget-new))

(defun font-chooser-widget-new ()
 #+liber-documentation
 "@version{#2020-6-6}
  @return{A new @class{gtk:font-chooser-widget} widget.}
  @short{Creates a new font chooser widget.}
  @see-class{gtk:font-chooser-widget}"
  (make-instance 'font-chooser-widget))

(export 'font-chooser-widget-new)

;;; --- End of file gtk4.font-chooser-widget.lisp ------------------------------
