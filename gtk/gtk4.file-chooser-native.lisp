;;; ----------------------------------------------------------------------------
;;; gtk4.file-chooser-native.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.10 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2022 - 2023 Dieter Kaiser
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
;;; GtkFileChooserNative
;;;
;;;     A native file chooser dialog, suitable for “File Open” or “File Save”
;;;     commands
;;;
;;; Types and Values
;;;
;;;     GtkFileChooserNative
;;;
;;; Accessors
;;;
;;;     gtk_file_chooser_native_get_accept_label
;;;     gtk_file_chooser_native_set_accept_label
;;;     gtk_file_chooser_native_get_cancel_label
;;;     gtk_file_chooser_native_set_cancel_label
;;;
;;; Functions
;;;
;;;     gtk_file_chooser_native_new
;;;
;;; Properties
;;;
;;;     accept-label
;;;     cancel-label
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GtkNativeDialog
;;;         ╰── GtkFileChooserNative
;;;
;;; Implemented Interfaces
;;;
;;;     GtkFileChooser
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; GtkFileChooserNative
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkFileChooserNative" file-chooser-native
  (:superclass native-dialog
   :export t
   :interfaces ("GtkFileChooser")
   :type-initializer "gtk_file_chooser_native_get_type")
  ((accept-label
    file-chooser-native-accept-label
    "accept-label" "gchararray" t t)
   (cancel-label
    file-chooser-native-cancel-label
    "cancel-label" "gchararray" t t)))

#+liber-documentation
(setf (documentation 'file-chooser-native 'type)
 "@version{2023-5-5}
  @begin{short}
    The @sym{gtk:file-chooser-native} class is an abstraction of a dialog box
    suitable for use with \"File Open\" or \"File Save as\" commands.
  @end{short}
  By default, this just uses a @class{gtk:file-chooser-dialog} widget to
  implement the actual dialog. However, on certain platforms, such as Windows
  and macOS, the native platform file chooser is used instead. When the
  application is running in a sandboxed environment without direct filesystem
  access such as Flatpak, the @sym{gtk:file-chooser-native} object may call the
  proper APIs (portals) to let the user choose a file and make it available to
  the application.

  While the API of @sym{gtk:file-chooser-native} object closely mirrors the
  @class{gtk:file-chooser-dialog} widget, the main difference is that there is
  no access to any @class{gtk:window} or @class{gtk:widget} widget for the
  dialog. This is required, as there may not be one in the case of a platform
  native dialog.

  Showing, hiding and running the dialog is handled by the
  @class{gtk:native-dialog} functions.

  @subheading{Typical usage}
  In the simplest of cases, you can the following code to use the
  @class{gtk:file-chooser-dialog} widget to select a file for opening:
  @begin{pre}
static void
on_response (GtkNativeDialog *native,
             int              response)
{
  if (response == GTK_RESPONSE_ACCEPT)
    {
      GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
      GFile *file = gtk_file_chooser_get_file (chooser);

      open_file (file);

      g_object_unref (file);
    @}

  g_object_unref (native);
@}

  // ...
  GtkFileChooserNative *native;
  GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;

  native = gtk_file_chooser_native_new (\"Open File\",
                                        parent_window,
                                        action,
                                        \"_Open\",
                                        \"_Cancel\");

  g_signal_connect (native, \"response\", G_CALLBACK (on_response), NULL);
  gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
  @end{pre}
  To use a dialog for saving, you can use this:
  @begin{pre}
static void
on_response (GtkNativeDialog *native,
             int              response)
{
  if (response == GTK_RESPONSE_ACCEPT)
    {
      GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
      GFile *file = gtk_file_chooser_get_file (chooser);

      save_to_file (file);

      g_object_unref (file);
    @}

  g_object_unref (native);
@}

  // ...
  GtkFileChooserNative *native;
  GtkFileChooser *chooser;
  GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;

  native = gtk_file_chooser_native_new (\"Save File\",
                                        parent_window,
                                        action,
                                        \"_Save\",
                                        \"_Cancel\");
  chooser = GTK_FILE_CHOOSER (native);

  if (user_edited_a_new_document)
    gtk_file_chooser_set_current_name (chooser, _(\"Untitled document\"));
  else
    gtk_file_chooser_set_file (chooser, existing_file, NULL);

  g_signal_connect (native, \"response\", G_CALLBACK (on_response), NULL);
  gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
  @end{pre}
  For more information on how to best set up a file dialog, see the
  @class{gtk:file-chooser-dialog} widget.

  @subheading{Response Codes}
  The @sym{gtk:file-chooser-native} class inherits from the
  @class{gtk:native-dialog} class, which means it will return the @code{:accept}
  value if the user accepted, and the @code{:cancel} value if he pressed cancel.
  It can also return the @code{:delete-event} value if the window was
  unexpectedly closed.

  @subheading{Differences from GtkFileChooserDialog}
  There are a few things in the @class{gtk:file-chooser} API that are not
  possible to use with the @sym{gtk:file-chooser-native} class, as such use
  would prohibit the use of a native dialog.

  No operations that change the dialog work while the dialog is visible. Set
  all the properties that are required before showing the dialog.

  @subheading{Win32 details}
  On windows the @code{IFileDialog} implementation, added in Windows Vista, is
  used. It supports many of the features that the
  @class{gtk:file-chooser-dialog} widget does, but there are some things it
  does not handle:
  @begin{itemize}
    @item{Any GtkFileFilter added using a mimetype.}
  @end{itemize}
  If any of these features are used the regular @class{gtk:file-chooser-dialog}
  widget will be used in place of the native one.

  @subheading{Portal details}
  When the @file{org.freedesktop.portal.FileChooser} portal is available on the
  session bus, it is used to bring up an out-of-process file chooser. Depending
  on the kind of session the application is running in, this may or may not be
  a GTK file chooser.

  @subheading{macOS details}
  On macOS the @code{NSSavePanel} and @code{NSOpenPanel} classes are used to
  provide native file chooser dialogs. Some features provided by the
  @class{gtk:file-chooser-dialog} widget are not supported:
  @begin{itemize}
    @item{Shortcut folders.}
  @end{itemize}
  @begin[Warning]{dictionary}
    The @sym{gtk:file-chooser-native} implementation is deprecated since 4.10.
    Use the @class{gtk:file-dialog} implementation instead.
  @end{dictionary}
  @see-constructor{gtk:file-chooser-native-new}
  @see-slot{gtk:file-chooser-native-accept-label}
  @see-slot{gtk:file-chooser-native-cancel-label}
  @see-class{gtk:file-chooser}
  @see-class{gtk:native-dialog}
  @see-class{gtk:file-chooser-dialog}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- file-chooser-native-accept-label ---------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "accept-label"
                                               'file-chooser-native) t)
 "The @code{accept-label} property of type @code{:string} (Read / Write) @br{}
  The text used for the label on the accept button in the dialog, or @code{nil}
  to use the default text. @br{}
  Default value: @code{nil}")

#+liber-documentation
(setf (liber:alias-for-function 'file-chooser-native-accept-label)
      "Accessor"
      (documentation 'file-chooser-native-accept-label 'function)
 "@version{2023-5-5}
  @syntax[]{(gtk:file-chooser-native-accept-label object) => label}
  @syntax[]{(setf (gtk:file-chooser-native-accept-label object) label)}
  @argument[object]{a @class{gtk:file-chooser-native} object}
  @argument[label]{a string with the custom label or @code{nil} for the default}
  @begin{short}
    Accessor of the @slot[gtk:file-chooser-native]{accept-label} slot of the
    @class{gtk:file-chooser-native} interface.
  @end{short}
  The @sym{gtk:file-chooser-navtive-accept-label} function retrieves the custom
  label text for the accept button. The
  @sym{(setf gtk:file-chooser-native-accept-label)} function sets the custom
  label text.

  If characters in label are preceded by an underscore, they are underlined. If
  you need a literal underscore character in a label, use \"__\" (two
  underscores). The first underlined character represents a keyboard accelerator
  called a mnemonic. Pressing @kbd{Alt} and that key activates the button.
  @see-class{gtk:file-chooser-native}")

;;; --- file-chooser-native-cancel-label ---------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "cancel-label"
                                               'file-chooser-native) t)
 "The @code{cancel-label} property of type @code{:string} (Read / Write) @br{}
  The text used for the label on the cancel button in the dialog, or @code{nil}
  to use the default text. @br{}
  Default value: @code{nil}")

#+liber-documentation
(setf (liber:alias-for-function 'file-chooser-native-cancel-label)
      "Accessor"
      (documentation 'file-chooser-native-cancel-label 'function)
 "@version{2023-5-5}
  @syntax[]{(gtk:file-chooser-native-cancel-label object) => label}
  @syntax[]{(setf (gtk:file-chooser-native-cancel-label object) label)}
  @argument[object]{a @class{gtk:file-chooser-native} object}
  @argument[label]{a string with the custom label or @code{nil} for the default}
  @begin{short}
    Accessor of the @slot[gtk:file-chooser-native]{cancel-label} slot of the
    @class{gtk:file-chooser-native} interface.
  @end{short}
  The @sym{gtk:file-chooser-navtive-accept-label} function retrieves the custom
  label text for the cancel button. The
  @sym{(setf gtk:file-chooser-native-accept-label)} function sets the custom
  label text.

  If characters in label are preceded by an underscore, they are underlined. If
  you need a literal underscore character in a label, use \"__\" (two
  underscores). The first underlined character represents a keyboard accelerator
  called a mnemonic. Pressing @kbd{Alt} and that key activates the button.
  @see-class{gtk:file-chooser-native}")

;;; ----------------------------------------------------------------------------
;;; gtk_file_chooser_native_new ()
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_file_chooser_native_new" file-chooser-native-new)
    (g:object file-chooser-native)
 #+liber-documentation
 "@version{2023-5-5}
  @argument[title]{a string with the title of the native file chooser}
  @argument[parent]{a @class{gtk:window} transient parent window}
  @argument[action]{a @symbol{gtk:file-chooser-action} value}
  @argument[accept-label]{a string with the text to go in the accept button,
    or @code{nil} for the default}
  @argument[cancel-label]{a string with the text to go in the cancel button,
    or @code{nil} for the default}
  @return{A new @class{gtk:file-chooser-native} object.}
  @short{Creates a new @class{gtk:file-chooser-native} object.}
  @see-class{gtk:file-chooser-native}
  @see-class{gtk:window}
  @see-symbol{gtk:file-chooser-action}"
  (title :string)
  (parent (g:object window))
  (action gtk:file-chooser-action)
  (accept-label :string)
  (cancel-label :string))

(export 'file-chooser-native-new)

;;; --- End of file gtk4.file-chooser-native.lisp ------------------------------
