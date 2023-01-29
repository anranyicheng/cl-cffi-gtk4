;;; ----------------------------------------------------------------------------
;;; gtk4.icon-view.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.6 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2023 Dieter Kaiser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------
;;;
;;; GtkIconView
;;;
;;;     A widget which displays a list of icons in a grid
;;;
;;; Types and Values
;;;
;;;     GtkIconViewDropPosition
;;;     GtkIconView
;;;
;;; Accessors
;;;
;;;     gtk_icon_view_set_activate_on_single_click
;;;     gtk_icon_view_get_activate_on_single_click
;;;     gtk_icon_view_set_column_spacing
;;;     gtk_icon_view_get_column_spacing
;;;     gtk_icon_view_set_columns
;;;     gtk_icon_view_get_columns
;;;     gtk_icon_view_set_item_orientation
;;;     gtk_icon_view_get_item_orientation
;;;     gtk_icon_view_set_item_padding
;;;     gtk_icon_view_get_item_padding
;;;     gtk_icon_view_set_item_width
;;;     gtk_icon_view_get_item_width
;;;     gtk_icon_view_set_margin
;;;     gtk_icon_view_get_margin
;;;     gtk_icon_view_set_markup_column
;;;     gtk_icon_view_get_markup_column
;;;     gtk_icon_view_set_model
;;;     gtk_icon_view_get_model
;;;     gtk_icon_view_set_pixbuf_column
;;;     gtk_icon_view_get_pixbuf_column
;;;     gtk_icon_view_set_reorderable
;;;     gtk_icon_view_get_reorderable
;;;     gtk_icon_view_set_row_spacing
;;;     gtk_icon_view_get_row_spacing
;;;     gtk_icon_view_set_selection_mode
;;;     gtk_icon_view_get_selection_mode
;;;     gtk_icon_view_set_spacing
;;;     gtk_icon_view_get_spacing
;;;     gtk_icon_view_set_text_column
;;;     gtk_icon_view_get_text_column
;;;     gtk_icon_view_set_tooltip_column
;;;     gtk_icon_view_get_tooltip_column
;;;
;;; Functions
;;;
;;;     GtkIconViewForeachFunc
;;;
;;;     gtk_icon_view_new
;;;     gtk_icon_view_new_with_area
;;;     gtk_icon_view_new_with_model
;;;     gtk_icon_view_get_path_at_pos
;;;     gtk_icon_view_get_item_at_pos
;;;     gtk_icon_view_set_cursor
;;;     gtk_icon_view_get_cursor
;;;     gtk_icon_view_selected_foreach
;;;     gtk_icon_view_get_cell_rect
;;;     gtk_icon_view_select_path
;;;     gtk_icon_view_unselect_path
;;;     gtk_icon_view_path_is_selected
;;;     gtk_icon_view_get_selected_items
;;;     gtk_icon_view_select_all
;;;     gtk_icon_view_unselect_all
;;;     gtk_icon_view_item_activated
;;;     gtk_icon_view_scroll_to_path
;;;     gtk_icon_view_get_visible_range
;;;     gtk_icon_view_set_tooltip_item
;;;     gtk_icon_view_set_tooltip_cell
;;;     gtk_icon_view_get_tooltip_context
;;;     gtk_icon_view_get_item_row
;;;     gtk_icon_view_get_item_column
;;;     gtk_icon_view_enable_model_drag_source
;;;     gtk_icon_view_enable_model_drag_dest
;;;     gtk_icon_view_unset_model_drag_source
;;;     gtk_icon_view_unset_model_drag_dest
;;;     gtk_icon_view_set_drag_dest_item
;;;     gtk_icon_view_get_drag_dest_item
;;;     gtk_icon_view_get_dest_item_at_pos
;;;     gtk_icon_view_create_drag_icon
;;;
;;; Properties
;;;
;;;     activate-on-single-click
;;;     cell-area
;;;     column-spacing
;;;     columns
;;;     item-orientation
;;;     item-padding
;;;     item-width
;;;     margin
;;;     markup-column
;;;     model
;;;     pixbuf-column
;;;     reorderable
;;;     row-spacing
;;;     selection-mode
;;;     spacing
;;;     text-column
;;;     tooltip-column
;;;
;;; Signals
;;;
;;;     activate-cursor-item
;;;     item-activated
;;;     move-cursor
;;;     select-all
;;;     select-cursor-item
;;;     selection-changed
;;;     toggle-cursor-item
;;;     unselect-all
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GInitiallyUnowned
;;;         ╰── GtkWidget
;;;             ╰── GtkIconView
;;;
;;; Implemented Interfaces
;;;
;;;     GtkAccessible
;;;     GtkBuildable
;;;     GtkConstraintTarget
;;;     GtkCellLayout
;;;     GtkScrollable
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;; TODO: The API for drag and drop operations must be newly implemented.

;;; ----------------------------------------------------------------------------
;;; enum GtkIconViewDropPosition
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkIconViewDropPosition" icon-view-drop-position
  (:export t
   :type-initializer "gtk_icon_view_drop_position_get_type")
  (:no-drop 0)
  (:drop-into 1)
  (:drop-left 2)
  (:drop-right 3)
  (:drop-above 4)
  (:drop-below 5))

#+liber-documentation
(setf (liber:alias-for-symbol 'icon-view-drop-position)
      "GEnum"
      (liber:symbol-documentation 'icon-view-drop-position)
 "@version{#2020-12-2}
  @short{An enumeration for determining where a dropped item goes.}
  @begin{pre}
(define-g-enum \"GtkIconViewDropPosition\" icon-view-drop-position
  (:export t
   :type-initializer \"gtk_icon_view_drop_position_get_type\")
  (:no-drop 0)
  (:drop-into 1)
  (:drop-left 2)
  (:drop-right 3)
  (:drop-above 4)
  (:drop-below 5))
  @end{pre}
  @begin[code]{table}
    @entry[:no-drop]{No drop possible.}
    @entry[:drop-into]{Dropped item replaces the item.}
    @entry[:drop-left]{Droppped item is inserted to the left.}
    @entry[:drop-right]{Dropped item is inserted to the right.}
    @entry[:drop-above]{Dropped item is inserted above.}
    @entry[:drop-below]{Dropped item is inserted below.}
  @end{table}
  @see-class{gtk:icon-view}")

;;; ----------------------------------------------------------------------------
;;; struct GtkIconView
;;; ----------------------------------------------------------------------------

(define-g-object-class "GtkIconView" icon-view
  (:superclass widget
   :export t
   :interfaces ("GtkAccessible"
                "GtkBuildable"
                "GtkConstraintTarget"
                "GtkCellLayout"
                "GtkScrollable")
   :type-initializer "gtk_icon_view_get_type")
  ((activate-on-single-click
    icon-view-activate-on-single-click
    "activate-on-single-click" "gboolean" t t)
   (cell-area
    icon-view-cell-area
    "cell-area" "GtkCellArea" t t)
   (column-spacing
    icon-view-column-spacing
    "column-spacing" "gint" t t)
   (columns
    icon-view-columns
    "columns" "gint" t t)
   (item-orientation
    icon-view-item-orientation
    "item-orientation" "GtkOrientation" t t)
   (item-padding
    icon-view-item-padding
    "item-padding" "gint" t t)
   (item-width
    icon-view-item-width
    "item-width" "gint" t t)
   (margin
    icon-view-margin
    "margin" "gint" t t)
   (markup-column
    icon-view-markup-column
    "markup-column" "gint" t t)
   (model
    icon-view-model
    "model" "GtkTreeModel" t t)
   (pixbuf-column
    icon-view-pixbuf-column
    "pixbuf-column" "gint" t t)
   (reorderable
    icon-view-reorderable
    "reorderable" "gboolean" t t)
   (row-spacing
    icon-view-row-spacing
    "row-spacing" "gint" t t)
   (selection-mode
    icon-view-selection-mode
    "selection-mode" "GtkSelectionMode" t t)
   (spacing
    icon-view-spacing
    "spacing" "gint" t t)
   (text-column
    icon-view-text-column
    "text-column" "gint" t t)
   (tooltip-column
    icon-view-tooltip-column
    "tooltip-column" "gint" t t)))

#+liber-documentation
(setf (documentation 'icon-view 'type)
 "@version{#2021-3-9}
  @begin{short}
    The @sym{gtk:icon-view} widget provides an alternative view on a
    @class{gtk:tree-model} object.
  @end{short}
  It displays the model as a grid of icons with labels. Like the
  @class{gtk:tree-view} widget, it allows to select one or multiple items,
  depending on the selection mode, see the @fun{gtk:icon-view-selection-mode}
  function. In addition to selection with the arrow keys, the
  @sym{gtk:icon-view} class supports rubberband selection, which is controlled
  by dragging the pointer.

  @image[icon-view]{}

  Note that if the tree model is backed by an actual tree store, as opposed to
  a flat list where the mapping to icons is obvious, the @sym{gtk:icon-view}
  widget will only display the first level of the tree and ignore the tree's
  branches.
  @begin[CSS nodes]{dictionary}
    The @sym{gtk:icon-view} implementation has a single CSS node with name
    @code{iconview} and @code{.view} style class. For rubberband selection, a
    subnode with name @code{rubberband} is used.
  @end{dictionary}
  @begin[Signal Details]{dictionary}
    @subheading{The \"activate-cursor-item\" signal}
      @begin{pre}
lambda (view)    :action
      @end{pre}
      A keybinding signal which gets emitted when the user activates the
      currently focused item. Applications should not connect to it, but may
      emit it with the @fun{g-signal-emit} function if they need to control
      activation programmatically. The default bindings for this signal are the
      @kbd{Space}, @kbd{Return} and @kbd{Enter} keys.
      @begin[code]{table}
        @entry[view]{The @sym{gtk:icon-view} widget on which the signal is
          emitted.}
      @end{table}
    @subheading{The \"item-activated\" signal}
      @begin{pre}
lambda (view path)    :run-last
      @end{pre}
      The signal is emitted when the @fun{gtk:icon-view-item-activated} function
      is called or the user double clicks an item. It is also emitted when a
      non-editable item is selected and one of the @kbd{Space}, @kbd{Return} or
      @kbd{Enter} keys is pressed.
      @begin[code]{table}
        @entry[view]{The @sym{gtk:icon-view} widget on which the signal is
          emitted.}
        @entry[path]{The @class{gtk:tree-path} instance for the activated item.}
      @end{table}
    @subheading{The \"move-cursor\" signal}
      @begin{pre}
lambda (view step count extent modify)    :action
      @end{pre}
      The signal is a keybinding signal which gets emitted when the user
      initiates a cursor movement. Applications should not connect to it, but
      may emit it with the @fun{g-signal-emit} function if they need to control
      the cursor programmatically. The default bindings for this signal include
      @begin{itemize}
        @item{Arrow keys which move by individual steps.}
        @item{@kbd{Home}/@kbd{End} keys which move to the first/last item.}
        @item{@kbd{PageUp}/@kbd{PageDown} which move by \"pages\".}
      @end{itemize}
      All of these will extend the selection when combined with the @kbd{Shift}
      modifier.
      @begin[code]{table}
        @entry[view]{The @sym{gtk:icon-view} widget which received the signal.}
        @entry[step]{The granularity of the move, as a value of the
          @symbol{gtk:movement-step} enumeration.}
        @entry[count]{An integer with the number of step units to move.}
        @entry[extend]{A boolean whether to extend the selection.}
        @entry[modify]{A boolean whether to modify the selection.}
      @end{table}
    @subheading{The \"select-all\" signal}
      @begin{pre}
lambda (view)    :action
      @end{pre}
      A keybinding signal which gets emitted when the user selects all items.
      Applications should not connect to it, but may emit it with the
      @fun{g-signal-emit} function if they need to control selection
      programmatically. The default binding for this signal is the @kbd{Ctrl-a}
      key.
      @begin[code]{table}
        @entry[view]{The @sym{gtk:icon-view} widget on which the signal is
          emitted.}
      @end{table}
    @subheading{The \"select-cursor-item\" signal}
      @begin{pre}
lambda (view)    :action
      @end{pre}
      A keybinding signal which gets emitted when the user selects the item that
      is currently focused. Applications should not connect to it, but may emit
      it with the @fun{g-signal-emit} function if they need to control selection
      programmatically. There is no default binding for this signal.
      @begin[code]{table}
        @entry[view]{The @sym{gtk:icon-view} widget on which the signal is
          emitted.}
      @end{table}
    @subheading{The \"selection-changed\" signal}
      @begin{pre}
lambda (view)    :run-first
      @end{pre}
     The signal is emitted when the selection changes, i.e. the set of selected
     items.
     @begin[code]{table}
       @entry[view]{The @sym{gtk:icon-view} widget on which the signal is
         emitted.}
     @end{table}
    @subheading{The \"toggle-cursor-item\" signal}
      @begin{pre}
lambda (view)    :action
      @end{pre}
      A keybinding signal which gets emitted when the user toggles whether the
      currently focused item is selected or not. The exact effect of this depend
      on the selection mode. Applications should not connect to it, but may emit
      it with the @fun{g-signal-emit} function if they need to control selection
      programmatically. The default binding for this signal is the
      @kbd{Ctrl-Space} key.
      @begin[code]{table}
        @entry[view]{The @sym{gtk:icon-view} widget on which the signal is
          emitted.}
      @end{table}
    @subheading{The \"unselect-all\" signal}
      @begin{pre}
lambda (view)    :action
      @end{pre}
      A keybinding signal which gets emitted when the user unselects all items.
      Applications should not connect to it, but may emit it with the
      @fun{g-signal-emit} function if they need to control selection
      programmatically. The default binding for this signal is the
      @kbd{Ctrl-Shift-a} key.
      @begin[code]{table}
        @entry[view]{The @sym{gtk:icon-view} widget on which the signal is
          emitted.}
      @end{table}
  @end{dictionary}
  @see-slot{gzk-icon-view-activate-on-single-click}
  @see-slot{gtk:icon-view-cell-area}
  @see-slot{gtk:icon-view-column-spacing}
  @see-slot{gtk:icon-view-columns}
  @see-slot{gtk:icon-view-item-orientation}
  @see-slot{gtk:icon-view-item-padding}
  @see-slot{gtk:icon-view-item-width}
  @see-slot{gtk:icon-view-margin}
  @see-slot{gtk:icon-view-markup-column}
  @see-slot{gtk:icon-view-model}
  @see-slot{gtk:icon-view-pixbuf-column}
  @see-slot{gtk:icon-view-reorderable}
  @see-slot{gtk:icon-view-row-spacing}
  @see-slot{gtk:icon-view-selection-mode}
  @see-slot{gtk:icon-view-spacing}
  @see-slot{gtk:icon-view-text-column}
  @see-slot{gtk:icon-view-tooltip-column}
  @see-constructor{gtk:icon-view-new}
  @see-constructor{gtk:icon-view-new-with-area}
  @see-constructor{gtk:icon-view-new-with-model}
  @see-class{gtk:tree-model}
  @see-class{gtk:tree-view}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- icon-view-activate-on-single-click -------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "activate-on-single-click"
                                               'icon-view) t)
 "The @code{activate-on-single-click} property of type @code{:boolean}
  (Read / Write / Construct) @br{}
  Specifies whether the \"item-activated\" signal will be emitted after a
  single click. @br{}
  Default value: @em{false}")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-activate-on-single-click)
      "Accessor"
      (documentation 'icon-view-activate-on-single-click 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-activate-on-single-click object) => setting}
  @syntax[]{(setf (gtk:icon-view-activate-on-single-click object) setting)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[setting]{a boolean that is @em{true} to emit the \"item-activated\"
    signal on a single click}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{activate-on-single-click} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Causes the \"item-activated\" signal to be emitted on a single click instead
  of a double click.
  @see-class{gtk:icon-view}")

;;; --- icon-view-cell-area ----------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "cell-area" 'icon-view) t)
 "The @code{cell-area} property of type @class{gtk:cell-area}
  (Read / Write / Construct) @br{}
  The cell area used to layout cell renderers for this view. If no area is
  specified when creating the icon view a @class{gtk:cell-area-box} object will
  be used.")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-cell-area)
      "Accessor"
      (documentation 'icon-view-cell-area 'function)
 "@version{#2020-12-2}
  @syntax[]{(gtk:icon-view-cell-area object) => area}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[area]{a @class{gtk:cell-area} object used to layout cell renderers}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{cell-area} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  The @class{gtk:cell-area} object used to layout cell renderers for this view.
  If no area is specified when creating the icon view with the
  @fun{gtk:icon-view-new-with-area} function a @class{gtk:cell-area-box} object
  will be used.
  @see-class{gtk:icon-view}
  @see-class{gtk:cell-area}
  @see-class{gtk:cell-area-box}
  @see-function{gtk:icon-view-new-with-area}")

;;; --- icon-view-column-spacing -----------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "column-spacing"
                                               'icon-view) t)
 "The @code{column-spacing} property of type @code{:int} (Read / Write) @br{}
  Specifies the space which is inserted between the columns of the icon view.
  @br{}
  Allowed values: >= 0 @br{}
  Default value: 6")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-column-spacing)
      "Accessor"
      (documentation 'icon-view-column-spacing 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-column-spacing object) => column-spacing}
  @syntax[]{(setf (gtk:icon-view-column-spacing object) column-spacing)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[column-spacing]{an integer with the column spacing}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{column-spacing} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Specifies the space which is inserted between the columns of the icon view.
  @see-class{gtk:icon-view}")

;;; --- icon-ciew-columns ------------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "columns" 'icon-view) t)
 "The @code{columns} property of type @code{:int} (Read / Write) @br{}
  Contains the number of the columns in which the items should be displayed.
  If it is -1, the number of columns will be chosen automatically to fill the
  available area. @br{}
  Allowed values: >= -1 @br{}
  Default value: -1")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-columns)
      "Accessor"
      (documentation 'icon-view-columns 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-columns object) => columns}
  @syntax[]{(setf (gtk:icon-view-columns object) columns)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[columns]{an integer with the number of columns}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{columns} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Determines in how many columns the icons are arranged. If columns is -1, the
  number of columns will be chosen automatically to fill the available area.
  @see-class{gtk:icon-view}")

;;; --- icon-view-item-orientation ---------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "item-orientation"
                                               'icon-view) t)
 "The @code{item-orientation} property of type @symbol{gtk:orientation}
  (Read / Write) @br{}
  Specifies how the cells, i.e. the icon and the text, of the item are
  positioned relative to each other. @br{}
  Default value: @code{:vertical}")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-item-orientation)
      "Accessor"
      (documentation 'icon-view-item-orientation 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-item-orientation object) => orientation}
  @syntax[]{(setf (gtk:icon-view-item-orientation object) orientation)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[orientation]{a value of the @symbol{gtk:orientation} enumeration
    with the relative position of texts and icons}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{item-orientation} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Determines whether the labels are drawn beside the icons instead of below.
  @see-class{gtk:icon-view}
  @see-symbol{gtk:orientation}")

;;; --- icon-view-item-padding -------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "item-padding"
                                               'icon-view) t)
 "The @code{item-padding} property of type @code{:int} (Read / Write) @br{}
  Specifies the padding around each of the icon view's item. @br{}
  Allowed values: >= 0 @br{}
  Default value: 6")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-item-padding)
      "Accessor"
      (documentation 'icon-view-item-padding 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-item-padding object) => item-padding}
  @syntax[]{(setf (gtk:icon-view-item-padding object) item-padding)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[item-padding]{an integer with the item padding}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{item-padding} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Specifies the padding around each of the icon view's items.
  @see-class{gtk:icon-view}")

;;; --- icon-view-item-width ---------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "item-width" 'icon-view) t)
 "The @code{item-width} property of type @code{:int} (Read / Write) @br{}
  Specifies the width to use for each item. If it is set to -1, the icon view
  will automatically determine a suitable item size. @br{}
  Allowed values: >= -1 @br{}
  Default value: -1")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-item-width)
      "Accessor"
      (documentation 'icon-view-item-width 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-item-width object) => item-width}
  @syntax[]{(setf (gtk:icon-view-item-width object) item-width)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[item-width]{an integer with the width for each item}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{item-width} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Specifies the width to use for each item. If it is set to -1, the icon view
  will automatically determine a suitable item size.
  @see-class{gtk:icon-view}")

;;; --- icon-view-margin -------------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "margin" 'icon-view) t)
 "The @code{margin} property of type @code{:int} (Read / Write) @br{}
  Specifies the space which is inserted at the edges of the icon view. @br{}
  Allowed values: >= 0 @br{}
  Default value: 6")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-margin)
      "Accessor"
      (documentation 'icon-view-margin 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-margin object) => margin}
  @syntax[]{(setf (gtk:icon-view-margin object) margin)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[margin]{an integer with the margin}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{margin} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Specifies the space which is inserted at the top, bottom, left and right of
  the icon view.
  @see-class{gtk:icon-view}")

;;; --- icon-view-markup-column ------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "markup-column"
                                               'icon-view) t)
 "The @code{markup-column} property of type @code{:int} (Read / Write) @br{}
  Contains the number of the model column containing markup information to be
  displayed. The markup column must be of type \"gchararray\". If this
  property and the @code{text-column} property are both set to column numbers,
  it overrides the text column. If both are set to -1, no texts are displayed.
  @br{}
  Allowed values: >= -1 @br{}
  Default value: -1")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-markup-column)
      "Accessor"
      (documentation 'icon-view-markup-column 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-markup-column object) => column}
  @syntax[]{(setf (gtk:icon-view-markup-column object) column)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[column]{an integer with a column in the currently used model, or -1
    to display no text}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{markup-column} slot of
    the @class{gtk:icon-view} class.
  @end{short}
  The @sym{gtk:icon-view-markup-column} function returns the column with markup
  text for the icon view. The @sym{(setf gtk:icon-view-markup-column)} function
  sets the column with markup information.

  The markup column must be of type \"gchararray\". If the markup column
  is set to something, it overrides the text column set by the
  @fun{gtk:icon-view-text-column} function.
  @see-class{gtk:icon-view}
  @see-function{gtk:icon-view-text-column}")

;;; --- icon-view-model --------------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "model" 'icon-view) t)
 "The @code{model} property of type @class{gtk:tree-model} (Read / Write) @br{}
  The model for the icon view.")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-model)
      "Accessor"
      (documentation 'icon-view-model 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-model object) => model}
  @syntax[]{(setf (gtk:icon-view-model object) model)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[model]{the @class{gtk:tree-model} object}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{model} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  The @sym{gtk:icon-view-model} function returns the model the
  @class{gtk:icon-view} widget is based on. Returns @code{nil} if the model is
  unset. The @sym{(setf gtk:icon-view-model)} function sets the model.

  If the icon view already has a model set, it will remove it before setting
  the new model. If @arg{model} is @code{nil}, then it will unset the old model.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-model}")

;;; --- icon-view-pixbuf-column ------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "pixbuf-column"
                                               'icon-view) t)
 "The @code{pixbuf-column} property of type @code{:int} (Read / Write) @br{}
  Contains the number of the model column containing the pixbufs which are
  displayed. The pixbuf column must be of type \"GdkPixbuf\". Setting this
  property to -1 turns off the display of pixbufs. @br{}
  Allowed values: >= -1 @br{}
  Default value: -1")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-pixbuf-column)
      "Accessor"
      (documentation 'icon-view-pixbuf-column 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-pixbuf-column object) => column}
  @syntax[]{(setf (gtk:icon-view-pixbuf-column object) column)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[column]{an integer with a column in the currently used model, or
    -1 to disable}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{pixbuf-column} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  The @sym{gtk:icon-view-pixbuf-column} function returns the column with pixbufs
  for the icon view. The @sym{(setf gtk:icon-view-pixbuf-column} function sets
  the column with pixbufs.

  The pixbuf column must be of type \"GdkPixbuf\".
  @see-class{gtk:icon-view}
  @see-class{gdk-pixbuf:pixbuf}")

;;; --- icon-view-reorderable --------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "reorderable" 'icon-view) t)
 "The @code{reorderable} property of type @code{:boolean} (Read / Write) @br{}
  The reorderable property specifies if the items can be reordered by DND. @br{}
  Default value: @em{false}")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-reorderable)
      "Accessor"
      (documentation 'icon-view-reorderable 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-reorderable object) => reorderable}
  @syntax[]{(setf (gtk:icon-view-reorderable object) reorderable)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[reorderable]{@em{true}, if the list of items can be reordered}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{reorderable} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  The @sym{gtk:icon-view-reorderable} function retrieves whether the user can
  reorder the list via drag and drop. The @sym{(setf gtk:icon-view-reorderable)}
  function sets whether the user can reorder the list. This function is a
  convenience function to allow you to reorder models that support the
  @class{gtk:tree-drag-source} and the @class{gtk:tree-drag-dest} interfaces.

  Both @class{gtk:tree-store} and @class{gtk:list-store} objects support these.
  If @arg{reorderable} is @em{true}, then the user can reorder the model by
  dragging and dropping rows. The developer can listen to these changes by
  connecting to the model's \"row-inserted\" and \"row-deleted\" signals. The
  reordering is implemented by setting up the icon view as a drag source and
  destination. Therefore, drag and drop can not be used in a reorderable view
  for any other purpose.

  This function does not give you any degree of control over the order - any
  reordering is allowed. If more control is needed, you should probably handle
  drag and drop manually.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-drag-source}
  @see-class{gtk:tree-drag-dest}
  @see-class{gtk:list-store}
  @see-class{gtk:tree-store}")

;;; --- icon-view-row-spacing --------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "row-spacing" 'icon-view) t)
 "The @code{row-spacing} property of type @code{:int} (Read / Write) @br{}
  Specifies the space which is inserted between the rows of the icon view. @br{}
  Allowed values: >= 0 @br{}
  Default value: 6")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-row-spacing)
      "Accessor"
      (documentation 'icon-view-row-spacing 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-row-spacing object) => row-spacing}
  @syntax[]{(setf (gtk:icon-view-row-spacing object) row-spacing)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[row-spacing]{an integer with the row spacing}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{row-spacing} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Specifies the space which is inserted between the rows of the icon view.
  @see-class{gtk:icon-view}")

;;; --- icon-view-selection-mode -----------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "selection-mode"
                                               'icon-view) t)
 "The @code{selection-mode} property of type @symbol{gtk:selection-mode}
  (Read / Write) @br{}
  Specifies the selection mode of an icon view. If the mode is @code{:multiple},
  rubberband selection is enabled, for the other modes, only keyboard selection
  is possible. @br{}
  Default value: @code{:single}")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-selection-mode)
      "Accessor"
      (documentation 'icon-view-selection-mode 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-selection-mode object) => mode}
  @syntax[]{(setf (gtk:icon-view-selection-mode object) mode)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[mode]{a value of the @symbol{gtk:selection-mode} enumeration}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{selection-mode} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  The @sym{gtk:icon-view-selection-mode} function gets the selection mode of the
  icon view. The @sym{(setf gtk:icon-view-selection-mode)} function sets the
  selection mode.
  @see-class{gtk:icon-view}
  @see-symbol{gtk:selection-mode}")

;;; --- icon-view-spacing ------------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "spacing" 'icon-view) t)
 "The @code{spacing} property of type @code{:int} (Read / Write) @br{}
  Specifies the space which is inserted between the cells, i.e. the icon and
  the text, of an item. @br{}
  Allowed values: >= 0 @br{}
  Default value: 0")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-spacing)
      "Accessor"
      (documentation 'icon-view-spacing 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-spacing object) => spacing}
  @syntax[]{(setf (gtk:icon-view-spacing object) spacing)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[spacing]{an integer with the spacing}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{spacing} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  Specifies the space which is inserted between the cells, i.e. the icon and
  the text, of an item.
  @see-class{gtk:icon-view}")

;;; --- icon-view-text-column --------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "text-column" 'icon-view) t)
 "The @code{text-column} property of type @code{:int} (Read / Write) @br{}
  Contains the number of the model column containing the texts which are
  displayed. The text column must be of type \"gchararray\". If this property
  and the @code{markup-column} property are both set to -1, no texts are
  displayed. @br{}
  Allowed values: >= -1 @br{}
  Default value: -1 ")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-text-column)
      "Accessor"
      (documentation 'icon-view-text-column 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-text-column object) => column}
  @syntax[]{(setf (gtk:icon-view-text-column object) column)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[column]{an integer with a column in the currently used model, or
    -1 to display no text}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{text-column} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  The @sym{gtk:icon-view-text-column} function returns the column with text for
  the icon view. The @sym{(setf gtk:icon-view-text-column)} function sets the
  column. The text column must be of type \"gchararray\".
  @see-class{gtk:icon-view}")

;;; --- icon-view-tooltip-column -----------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "tooltip-column"
                                               'icon-view) t)
 "The @code{tooltip-column} property of type @code{:int} (Read / Write) @br{}
  The column in the model containing the tooltip texts for the items. @br{}
  Allowed values: >= -1 @br{}
  Default value: -1")

#+liber-documentation
(setf (liber:alias-for-function 'icon-view-tooltip-column)
      "Accessor"
      (documentation 'icon-view-tooltip-column 'function)
 "@version{#2021-3-9}
  @syntax[]{(gtk:icon-view-tooltip-column object) => column}
  @syntax[]{(setf (gtk:icon-view-tooltip-column object) column)}
  @argument[object]{a @class{gtk:icon-view} widget}
  @argument[column]{an integer, which is a valid column number for
    @arg{icon-view}'s model}
  @begin{short}
    Accessor of the @slot[gtk:icon-view]{tooltip-column} slot of the
    @class{gtk:icon-view} class.
  @end{short}
  The @sym{gtk:icon-view-tooltip-column} function returns the column of the icon
  view's model which is being used for displaying tooltips on the icon view's
  rows. The @sym{(setf gtk:icon-view-tooltip-column)} function sets the column.

  If you only plan to have simple (text-only) tooltips on full items, you can
  use this function to have the @class{gtk:icon-view} widget handle these
  automatically for you. The argument @arg{column} should be set to the column
  in the icon view's model containing the tooltip texts, or -1 to disable this
  feature.

  When enabled, the @slot[widget]{has-tooltip} property will be set to
  @em{true} and the icon view will connect a \"query-tooltip\" signal handler.
  Note that the signal handler sets the text with the
  @fun{gtk:tooltip-set-markup} function, so &, <, etc have to be escaped in the
  text.
  @see-class{gtk:icon-view}
  @see-function{gtk:tooltip-set-markup}")

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_new ()
;;; ----------------------------------------------------------------------------

(declaim (inline icon-view-new))

(defun icon-view-new ()
 #+liber-documentation
 "@version{#2021-3-9}
  @return{A newly created @class{gtk:icon-view} widget.}
  @begin{short}
    Creates a new icon view.
  @end{short}
  @see-class{gtk:icon-view}
  @see-function{gtk:icon-view-new-with-area}
  @see-function{gtk:icon-view-new-with-model}"
  (make-instance 'icon-view))

(export 'icon-view-new)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_new_with_area ()
;;; ----------------------------------------------------------------------------

(declaim (inline icon-view-new-with-area))

(defun icon-view-new-with-area (area)
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[area]{the @class{gtk:cell-area} object to use to layout cells}
  @return{A newly created @class{gtk:icon-view} widget.}
  @begin{short}
    Creates a new icon view using the specified area to layout cells inside
    the icons.
  @end{short}
  @see-class{gtk:icon-view}
  @see-class{gtk:cell-area}
  @see-function{gtk:icon-view-new}
  @see-function{gtk:icon-view-new-with-model}"
  (make-instance 'icon-view
                 :cell-area area))

(export 'icon-view-new-with-area)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_new_with_model ()
;;; ----------------------------------------------------------------------------

(declaim (inline icon-view-new-with-model))

(defun icon-view-new-with-model (model)
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[model]{the @class{gtk:tree-model} object}
  @return{A newly created @class{gtk:icon-view} widget.}
  @begin{short}
    Creates a new icon view with the model @arg{model}.
  @end{short}
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-model}
  @see-function{gtk:icon-view-new}
  @see-function{gtk:icon-view-new-with-area}"
  (make-instance 'icon-view
                 :model model))

(export 'icon-view-new-with-model)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_path_at_pos () -> icon-view-path-at-pos
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_path_at_pos" icon-view-path-at-pos)
    (g:boxed tree-path :return)
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[x]{an integer with the x position to be identified}
  @argument[y]{an integer with the y position to be identified}
  @begin{return}
    The @class{gtk:tree-path} instance corresponding to the icon or @code{nil}
     if no icon exists at that position.
  @end{return}
  @begin{short}
    Finds the path at the point (x, y), relative to the bin window coordinates.
  @end{short}
  See the @fun{gtk:icon-view-item-at-pos} function, if you are also
  interested in the cell at the specified position. See the
  @fun{gtk:icon-view-convert-widget-to-bin-window-coords} function for
  converting widget coordinates to bin window coordinates.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-function{gtk:icon-view-item-at-pos}
  @see-function{gtk:icon-view-convert-widget-to-bin-window-coords}"
  (view (g:object icon-view))
  (x :int)
  (y :int))

(export 'icon-view-path-at-pos)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_item_at_pos () -> icon-view-item-at-pos
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_item_at_pos" %icon-view-item-at-pos) :boolean
  (view (g:object icon-view))
  (x :int)
  (y :int)
  (path :pointer)
  (cell :pointer))

(defun icon-view-item-at-pos (view x y)
 #+liber-documentation
 "@version{#2023-1-28}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[x]{an integer with the x position to be identified}
  @argument[y]{an integer with the y position to be identified}
  @begin{return}
    @code{path} -- a @class{gtk:tree-path} instance, or @code{nil} @br{}
    @code{cell} -- a @class{gtk:cell-renderer} object responsible for the
    cell at (x, y), or @code{nil} if no item exists at the specified position
  @end{return}
  @begin{short}
    Finds the path at the point (x, y), relative to the window coordinates.
  @end{short}
  In contrast to the @fun{gtk:icon-view-path-at-pos} function, this function
  also obtains the cell at the specified position. See the
  @fun{gtk:icon-view-convert-widget-to-bin-window-coords} function for
  converting widget coordinates to bin window coordinates.
  @see-class{gtk:icon-view}
  @see-function{gtk:icon-view-path-at-pos}
  @see-function{gtk:icon-view-convert-widget-to-bin-window-coords}"
  (with-foreign-objects ((path :pointer) (cell :pointer))
    (when (%icon-view-item-at-pos view x y path cell)
      (values (cffi:mem-ref path '(g:boxed tree-path :return))
              (cffi:mem-ref cell 'g:object)))))

(export 'icon-view-item-at-pos)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_set_cursor ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_set_cursor" icon-view-set-cursor) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{a @class{gtk:tree-path} instance}
  @argument[cell]{one of the @class{gtk:cell-renderer} objects of
    @arg{view}, or @code{nil}}
  @argument[start]{@em{true} if the specified cell should start being edited}
  @begin{short}
    Sets the current keyboard focus to be at @arg{path}, and selects it.
  @end{short}
  This is useful when you want to focus the user's attention on a particular
  item. If @arg{cell} is not @code{nil}, then focus is given to the cell
  specified by it. Additionally, if @arg{start} is @em{true}, then editing
  should be started in the specified cell.

  This function is often followed by a call of the @fun{gtk:widget-grab-focus}
  function in order to give keyboard focus to the widget. Please note that
  editing can only happen when the widget is realized.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-class{gtk:cell-renderer}
  @see-function{gtk:icon-view-get-cursor}
  @see-function{gtk:widget-grab-focus}"
  (view (g:object icon-view))
  (path (g:boxed tree-path))
  (cell (g:object cell-renderer))
  (start :boolean))

(export 'icon-view-set-cursor)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_cursor ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_cursor" %icon-view-get-cursor) :boolean
  (view (g:object icon-view))
  (path :pointer)
  (cell :pointer))

(defun icon-view-get-cursor (view)
 #+liber-documentation
 "@version{#2023-1-28}
  @argument[view]{a @class{gtk:icon-view} widget}
  @begin{return}
    @code{path} -- a current @class{gtk:tree-path} cursor path, or @code{nil}
    @br{}
    @code{cell} -- a current @class{gtk:cell-renderer} focus cell,
    or @code{nil} if the cursor is not set
  @end{return}
  @begin{short}
    Returns the current cursor path and focus cell.
  @end{short}
  If the cursor is not currently set, then @arg{path} will be @code{nil}. If no
  cell currently has focus, then @arg{cell} will be @code{nil}.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-class{gtk:cell-renderer}
  @see-function{gtk:icon-view-set-cursor}"
  (with-foreign-objects ((path :pointer) (cell :pointer))
    (when (%icon-view-get-cursor view path cell)
      (values (cffi:mem-ref path '(g:boxed tree-path :return))
              (cffi:mem-ref cell 'g:object)))))

(export 'icon-view-get-cursor)

;;; ----------------------------------------------------------------------------
;;; GtkIconViewForeachFunc ()
;;; ----------------------------------------------------------------------------

(defcallback icon-view-foreach-func :void
    ((view (g:object icon-view))
     (path (g:boxed tree-path))
     (data :pointer))
  (let ((fn (get-stable-pointer-value data)))
    (restart-case
      (funcall fn view path)
      (return () nil))))

#+liber-documentation
(setf (liber:alias-for-symbol 'icon-view-foreach-func)
      "Callback"
      (liber:symbol-documentation 'icon-view-foreach-func)
 "@version{#2022-7-31}
  @begin{short}
    A callback function used by the @fun{gtk:icon-view-selected-foreach}
    function to map all selected rows.
  @end{short}
  It will be called on every selected row in the view.
  @begin{pre}
lambda (view path)
  @end{pre}
  @begin[code]{table}
    @entry[view]{A @class{gtk:icon-view} widget.}
    @entry[path]{The @class{gtk:tree-path} instance of a selected row.}
  @end{table}
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-function{gtk:icon-view-selected-foreach}")

(export 'icon-view-foreach-func)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_selected_foreach ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_selected_foreach" %icon-view-selected-foreach)
    :void
  (view (g:object icon-view))
  (func :pointer)
  (data :pointer))

(defun icon-view-selected-foreach (view func)
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[func]{the callback function to call for each selected icon}
  @begin{short}
    Calls a function for each selected icon.
  @end{short}
  Note that the model or selection cannot be modified from within this function.
  @see-class{gtk:icon-view}
  @see-symbol{gtk:icon-view-foreach-func}"
  (with-stable-pointer (ptr func)
    (%icon-view-selected-foreach view
                                     (callback icon-view-foreach-func)
                                     ptr)))

(export 'icon-view-selected-foreach)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_cell_rect () -> icon-view-cell-rect
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_cell_rect" %icon-view-cell-rect) :boolean
  (view (g:object icon-view))
  (path (g:boxed tree-path))
  (cell (g:object cell-renderer))
  (rect (g:boxed gdk:rectangle)))

(defun icon-view-cell-rect (view path cell)
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{a @class{gtk:tree-path} instance}
  @argument[cell]{a @class{gtk:cell-renderer} object or @code{nil}}
  @return{A @class{gdk:rectangle} instance with the cell rectangle or
    @code{nil}.}
  @begin{short}
    Returns the bounding rectangle in widget coordinates for the cell specified
    by @arg{path} and @arg{cell}.
  @end{short}
  If @arg{cell} is @code{nil} the main cell area is used. This function is only
  valid if @arg{view} is realized.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-class{gtk:cell-renderer}
  @see-class{gdk:rectangle}"
  (let ((rect (gdk:rectangle-new)))
    (when (%icon-view-cell-rect view path cell rect)
      rect)))

(export 'icon-view-cell-rect)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_select_path ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_select_path" icon-view-select-path) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{a @class{gtk:tree-path} instance to be selected}
  @short{Selects the row at @arg{path}.}
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}"
  (view (g:object icon-view))
  (path (g:boxed tree-path)))

(export 'icon-view-select-path)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_unselect_path ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_unselect_path" icon-view-unselect-path) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{a @class{gtk:tree-path} instance to be unselected}
  @short{Unselects the row at @arg{path}.}
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}"
  (view (g:object icon-view))
  (path (g:boxed tree-path)))

(export 'icon-view-unselect-path)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_path_is_selected ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_path_is_selected" icon-view-path-is-selected)
    :boolean
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{a @class{gtk:tree-path} instance to check selection on}
  @return{@em{True} if @arg{path} is selected.}
  @begin{short}
    Returns @em{true} if the icon pointed to by @arg{path} is currently
    selected.
  @end{short}
  If @arg{path} does not point to a valid location, @code{nil} is returned.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}"
  (view (g:object icon-view))
  (path (g:boxed tree-path)))

(export 'icon-view-path-is-selected)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_selected_items () -> icon-view-selected-items
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_selected_items" icon-view-selected-items)
    (g:list-t (g:boxed tree-path :return))
 #+liber-documentation
 "@version{#2023-1-28}
  @argument[view]{a @class{gtk:icon-view} widget}
  @return{A list containing a @class{gtk:tree-path} instance for each selected
    row.}
  @begin{short}
    Creates a list of paths of all selected items.
  @end{short}
  Additionally, if you are planning on modifying the model after calling this
  function, you may want to convert the returned list into a list of
  @class{gtk:tree-row-reference} instances. To do this, you can use the
  @fun{gtk:tree-row-reference-new} function.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-class{gtk:tree-row-reference}
  @see-function{gtk:tree-row-reference-new}"
  (view (g:object icon-view)))

(export 'icon-view-selected-items)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_select_all ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_select_all" icon-view-select-all) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @begin{short}
    Selects all the icons.
  @end{short}
  The icon view must have its selection mode set to the value @code{:multiple}
  of the @symbol{gtk:selection-mode} enumeration.
  @see-class{gtk:icon-view}
  @see-symbol{gtk:selection-mode}"
  (view (g:object icon-view)))

(export 'icon-view-select-all)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_unselect_all ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_unselect_all" icon-view-unselect-all) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @short{Unselects all the icons.}
  @see-class{gtk:icon-view}"
  (view (g:object icon-view)))

(export 'icon-view-unselect-all)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_item_activated ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_item_activated" icon-view-item-activated) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{a @class{gtk:tree-path} instance to be activated}
  @begin{short}
    Activates the item determined by @arg{path}.
  @end{short}
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}"
  (view (g:object icon-view))
  (path (g:boxed tree-path)))

(export 'icon-view-item-activated)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_scroll_to_path ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_scroll_to_path" %icon-view-scroll-to-path) :void
  (view (g:object icon-view))
  (path (g:boxed tree-path))
  (use-align :boolean)
  (row-align :float)
  (col-align :float))

(defun icon-view-scroll-to-path (view path
                                 &key (row-align 0.5 row-align-p)
                                      (col-align 0.5 col-align-p))
 #+liber-documentation
 "@version{#2023-1-28}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{a @class{gtk:tree-path} instance of the item to move to}
  @argument[row-align]{a float with the vertical alignment of the item
    specified by path}
  @argument[col-align]{a float with the horizontal alignment of the item
    specified by path}
  @begin{short}
    Moves the alignments of @arg{view} to the position specified by @arg{path}.
  @end{short}
  The @arg{row-align} argument determines where the row is placed, and the
  @arg{col-align} argument determines where the column is placed. Both are
  expected to be between 0.0 and 1.0. 0.0 means left/top alignment, 1.0 means
  right/bottom alignment, 0.5 means center. The keyword arguments have the
  default value 0.5.

  If both @arg{row-align} and @arg{col-align} arguments are @code{nil}, then
  the alignment arguments are ignored, and the tree does the minimum amount of
  work to scroll the item onto the screen. This means that the item will be
  scrolled to the edge closest to its current position. If the item is currently
  visible on the screen, nothing is done.

  This function only works if the model is set, and @arg{path} is a valid row
  on the model. If the model changes before the @arg{view} is realized, the
  centered @arg{path} will be modified to reflect this change.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}"
  (%icon-view-scroll-to-path view
                             path
                             (or row-align-p col-align-p)
                             row-align
                             col-align))

(export 'icon-view-scroll-to-path)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_visible_range () -> icon-view-visible-range
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_visible_range" %icon-view-visible-range) :boolean
  (view (g:object icon-view))
  (start :pointer)
  (end :pointer))

(defun icon-view-visible-range (view)
 #+liber-documentation
 "@version{#2023-1-28}
  @argument[view]{a @class{gtk:icon-view} widget}
  @begin{return}
    @code{start} -- a @class{gtk:tree-path} instance with the start of region,
      or @code{nil} @br{}
    @code{end} -- a @class{gtk:tree-path} instance with the end of region,
      or  @code{nil}
  @end{return}
  @begin{short}
    Returns @arg{start} and @arg{end} to be the first and last visible path.
  @end{short}
  Returns @code{nil} if valid paths were not returned in @arg{start} and
  @arg{end}. Note that there may be invisible paths in between.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}"
  (with-foreign-objects ((start :pointer) (end :pointer))
    (when (%icon-view-visible-range view start end)
      (values (cffi:mem-ref start '(g:boxed tree-path :return))
              (cffi:mem-ref end '(g:boxed tree-path :return))))))

(export 'icon-view-visible-range)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_set_tooltip_item ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_set_tooltip_item" icon-view-set-tooltip-item) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[tooltip]{a @class{gtk:tooltip} object}
  @argument[path]{a @class{gtk:tree-path} instance}
  @begin{short}
    Sets the tip area of tooltip to be the area covered by the item at
    @arg{path}.
  @end{short}
  See also the @fun{gtk:icon-view-set-tooltip-column} function for a simpler
  alternative. See also the @fun{gtk:tooltip-set-tip-area} function.
  @see-class{gtk:icon-view}
  @see-function{gtk:icon-view-set-tooltip-column}
  @see-function{gtk:tooltip-set-tip-area}"
  (view (g:object icon-view))
  (tooltip (g:object tooltip))
  (path (g:boxed tree-path)))

(export 'icon-view-set-tooltip-item)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_set_tooltip_cell ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_set_tooltip_cell" icon-view-set-tooltip-cell) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[tooltip]{a @class{gtk:tooltip} object}
  @argument[path]{a @class{gtk:tree-path} instance}
  @argument[cell]{a @class{gtk:cell-renderer} object or @code{nil}}
  @begin{short}
    Sets the tip area of the tooltip to the area which @arg{cell} occupies in
    the item pointed to by @arg{path}.
  @end{short}
  See also the @fun{gtk:tooltip-set-tip-area} function.

  See also the @fun{gtk:icon-view-set-tooltip-column} function for a simpler
  alternative.
  @see-class{gtk:icon-view}
  @see-function{gtk:tooltip-set-tip-area}
  @see-function{gtk:icon-view-set-tooltip-column}"
  (view (g:object icon-view))
  (tooltip (g:object tooltip))
  (path (g:boxed tree-path))
  (cell (g:object cell-renderer)))

(export 'icon-view-set-tooltip-cell)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_tooltip_context () -> icon-view-tooltip-context
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_tooltip_context" %icon-view-tooltip-context)
    :boolean
  (view (g:object icon-view))
  (x (:pointer :int))
  (y (:pointer :int))
  (tip :boolean)
  (model :pointer)
  (path :pointer)
  (iter (g:boxed tree-iter)))

(defun icon-view-tooltip-context (view x y tip)
 #+liber-documentation
 "@version{#2023-1-28}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[x]{an integer with the x coordinate, relative to widget coordinates}
  @argument[y]{an integer with the y coordinate, relative to widget coordinates}
  @argument[tip]{a boolean whether this is a keyboard tooltip or not}
  @begin{return}
    @arg{xx} -- an integer with @arg{x} converted to be relative to the bin
    window of @arg{view} @br{}
    @arg{yy} -- an integer with @arg{y} converted to be relative to the bin
    window of @arg{view} @br{}
    @arg{model} -- a @class{gtk:tree-model} object or @code{nil} @br{}
    @arg{path} -- a @class{gtk:tree-path} instance or @code{nil} @br{}
    @arg{iter} -- a @class{gtk:tree-iter} iterator or @code{nil}
  @end{return}
  @begin{short}
    This function is supposed to be used in a \"query-tooltip\" signal handler
    for a @class{gtk:icon-view} widget.
  @end{short}
  The @arg{x}, @arg{y} and @arg{tip} values which are received in the signal
  handler, should be passed to this function without modification.

  The return value indicates whether there is an icon view item at the given
  coordinates, @em{true}) or not @em{false} for mouse tooltips. For keyboard
  tooltips the item returned will be the cursor item. When @em{true}, then any
  of @arg{model}, @arg{path} and @arg{iter} will be set to point to that row
  and the corresponding model. @arg{x} and @arg{y} will always be converted to
  be relative to the bin window of @arg{view} if @arg{tip} is @em{false}.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-model}
  @see-class{gtk:tree-path}
  @see-class{gtk:tree-iter}"
  (with-foreign-objects ((xx :int)
                         (yy :int)
                         (model :pointer)
                         (path :pointer))
    (setf (cffi:mem-ref xx :int) x
          (cffi:mem-ref yy :int) y)
    (let ((iter (make-tree-iter)))
      (when (%icon-view-tooltip-context view
                                        xx
                                        yy
                                        tip
                                        model
                                        path
                                        iter)
        (values (cffi:mem-ref xx :int)
                (cffi:mem-ref yy :int)
                (cffi:mem-ref model '(g:object tree-model))
                (cffi:mem-ref path '(g:boxed tree-path :return))
                iter)))))

(export 'icon-view-tooltip-context)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_item_row () -> icon-view-item-row
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_item_row" icon-view-item-row) :int
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{the @class{gtk:tree-path} instance of the item}
  @return{An ingeger with the row in which the item is displayed.}
  @begin{short}
    Gets the row in which the item path is currently displayed.
  @end{short}
  Row numbers start at 0.
  @see-class{gtk:icon-view}
  @see-function{gtk:icon-view-item-column}"
  (view (g:object icon-view))
  (path (g:boxed tree-path)))

(export 'icon-view-item-row)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_item_column () -> icon-view-item-column
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_icon_view_get_item_column" icon-view-item-column) :int
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{the @class{gtk:tree-path} instance of the item}
  @return{An integer with the column in which the item is displayed.}
  @begin{short}
    Gets the column in which the item path is currently displayed.
  @end{short}
  Column numbers start at 0.
  @see-class{gtk:icon-view}
  @see-function{gtk:icon-view-item-row}"
  (view (g:object icon-view))
  (path (g:boxed tree-path)))

(export 'icon-view-item-column)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_enable_model_drag_source ()
;;; ----------------------------------------------------------------------------

;; TODO: New implementation needed.

#+nil
(defcfun ("gtk_icon_view_enable_model_drag_source"
          %icon-view-enable-model-drag-source) :void
  (view (g:object icon-view))
  (start-button-mask gdk:modifier-type)
  (targets :pointer)
  (n-targets :int)
  (actions gdk-drag-action))

#+nil
(defun icon-view-enable-model-drag-source (view mask targets actions)
 #+liber-documentation
 "@version{#2021-10-2}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[mask]{the @symbol{gdk:modifier-type} flags of allowed buttons to
    start drag}
  @argument[targets]{a list of target entries that the drag will support}
  @argument[actions]{the @symbol{gdk-drag-action} bitmask of possible actions
    for a drag from this widget}
  @begin{short}
    Turns the icon view into a drag source for automatic DND.
  @end{short}
  Calling this method sets the @slot[gtk:icon-view]{reorderable} property to
  the @em{false} value.
  @see-class{gtk:icon-view}
  @see-symbol{gdk:modifier-type}
  @see-symbol{gdk-drag-action}"
  (let ((n-targets (length targets)))
    (with-foreign-object (targets-ptr '(:struct %target-entry) n-targets)
      (loop for i from 0 below n-targets
            for target-ptr = (mem-aptr targets-ptr
                                       '(:struct %target-entry) i)
            for entry in targets
            do (with-foreign-slots ((target flags info)
                                    target-ptr
                                    (:struct %target-entry))
                 (setf target (first entry))
                 (setf flags (second entry))
                 (setf info (third entry))))
      (%icon-view-enable-model-drag-source view
                                               mask
                                               targets-ptr
                                               n-targets
                                               actions))))

#+nil
(export 'icon-view-enable-model-drag-source)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_enable_model_drag_dest ()
;;; ----------------------------------------------------------------------------

;; TODO: New implementation needed.

#+nil
(defcfun ("gtk_icon_view_enable_model_drag_dest"
          %icon-view-enable-model-drag-dest) :void
  (view (g:object icon-view))
  (targets :pointer)
  (n-targets :int)
  (actions gdk-drag-action))

#+nil
(defun icon-view-enable-model-drag-dest (view targets actions)
 #+liber-documentation
 "@version{#2021-10-2}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[targets]{a list target entries that the drag will support}
  @argument[actions]{the @symbol{gdk-drag-action} bitmask of possible actions
    for a drag to this widget}
  @begin{short}
    Turns the icon view into a drop destination for automatic DND.
  @end{short}
  Calling this method sets the @slot[gtk:icon-view]{reorderable} property to
  the @em{false} value.
  @see-class{gtk:icon-view}
  @see-symbol{gdk-drag-action}"
  (let ((n-targets (length targets)))
    (with-foreign-object (targets-ptr '(:struct %target-entry) n-targets)
      (loop for i from 0 below n-targets
            for target-ptr = (mem-aptr targets-ptr
                                       '(:struct %target-entry) i)
            for entry in targets
            do (with-foreign-slots ((target flags info)
                                    target-ptr
                                    (:struct %target-entry))
                 (setf target (first entry))
                 (setf flags (second entry))
                 (setf info (third entry))))
      (%icon-view-enable-model-drag-dest view
                                             targets-ptr
                                             n-targets
                                             actions))))

#+nil
(export 'icon-view-enable-model-drag-dest)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_unset_model_drag_source ()
;;; ----------------------------------------------------------------------------

#+nil
(defcfun ("gtk_icon_view_unset_model_drag_source"
           icon-view-unset-model-drag-source) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @begin{short}
    Undoes the effect of the @fun{gtk:icon-view-enable-model-drag-source}
    function.
  @end{short}
  Calling this method sets the @slot[gtk:icon-view]{reorderable} property to
  @em{false}.
  @see-class{gtk:icon-view}
  @see-function{gtk:icon-view-enable-model-drag-source}"
  (view (g:object icon-view)))

#+nil
(export 'icon-view-unset-model-drag-source)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_unset_model_drag_dest ()
;;; ----------------------------------------------------------------------------

#+nil
(defcfun ("gtk_icon_view_unset_model_drag_dest"
           icon-view-unset-model-drag-dest) :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @begin{short}
    Undoes the effect of the @fun{gtk:icon-view-enable-model-drag-dest}
    function.
  @end{short}
  Calling this method sets the @slot[gtk:icon-view]{reorderable} property to
  @em{false}.
  @see-class{gtk:icon-view}
  @see-function{gtk:icon-view-enable-model-drag-dest}"
  (view (g:object icon-view)))

#+nil
(export 'icon-view-unset-model-drag-dest)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_set_drag_dest_item ()
;;; ----------------------------------------------------------------------------

#+nil
(defcfun ("gtk_icon_view_set_drag_dest_item" icon-view-set-drag-dest-item)
    :void
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{the @class{gtk:tree-path} instance of the item to highlight,
    or @code{nil}}
  @argument[pos]{specifies where to drop, relative to the item as a value of
    the @symbol{gtk:icon-view-drop-position} enumeration}
  @begin{short}
    Sets the item that is highlighted for feedback.
  @end{short}
  @see-class{gtk:icon-view}
  @see-symbol{gtk:icon-view-drop-position}
  @see-function{gtk:icon-view-get-drag-dest-item}"
  (view (g:object icon-view))
  (path (g:boxed tree-path))
  (pos icon-view-drop-position))

#+nil
(export 'icon-view-set-drag-dest-item)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_drag_dest_item ()
;;; ----------------------------------------------------------------------------

#+nil
(defcfun ("gtk_icon_view_get_drag_dest_item" %icon-view-get-drag-dest-item)
    :void
  (view (g:object icon-view))
  (path :pointer)
  (pos :pointer))

#+nil
(defun icon-view-get-drag-dest-item (view)
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @begin{return}
    @arg{path} -- the @class{gtk:tree-path} instance of the highlighted item,
      or @code{nil} @br{}
    @arg{pos} -- the @symbol{gtk:icon-view-drop-position} drop position, or
      @code{nil}
  @end{return}
  @begin{short}
    Gets information about the item that is highlighted for feedback.
  @end{short}
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-symbol{gtk:icon-view-drop-position}
  @see-function{gtk:icon-view-set-drag-dest-item}"
  (with-foreign-objects ((path :pointer) (pos :pointer))
    (%icon-view-get-drag-dest-item view path pos)
    (values (mem-ref path '(g:boxed tree-path :return))
            (mem-ref pos 'icon-view-drop-position))))

#+nil
(export 'icon-view-get-drag-dest-item)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_get_dest_item_at_pos () -> icon-view-dest-item-at-pos
;;; ----------------------------------------------------------------------------

#+nil
(defcfun ("gtk_icon_view_get_dest_item_at_pos"
          %icon-view-dest-item-at-pos) :boolean
  (view (g:object icon-view))
  (drag-x :int)
  (drag-y :int)
  (path :pointer)
  (pos :pointer))

#+nil
(defun icon-view-dest-item-at-pos (view drag-x drag-y)
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[drag-x]{an integer with the position to determine the destination
    item for}
  @argument[drag-y]{an integer with the position to determine the destination
    item for}
  @begin{return}
    @arg{path} -- the @class{gtk:tree-path} instance of the item @br{}
    @arg{pos} -- a @symbol{gtk:icon-view-drop-position} value
  @end{return}
  @begin{short}
    Determines the destination item for a given position.
  @end{short}
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-symbol{gtk:icon-view-drop-position}"
  (with-foreign-objects ((path :pointer) (pos :pointer))
    (when (%icon-view-dest-item-at-pos view drag-x drag-y path pos)
      (values (mem-ref path '(g:boxed tree-path :return))
              (mem-ref pos 'icon-view-drop-position)))))

#+nil
(export 'icon-view-dest-item-at-pos)

;;; ----------------------------------------------------------------------------
;;; gtk_icon_view_create_drag_icon ()
;;; ----------------------------------------------------------------------------

#+nil
(defcfun ("gtk_icon_view_create_drag_icon" icon-view-create-drag-icon)
    (:pointer (:struct cairo:surface-t))
 #+liber-documentation
 "@version{#2021-3-9}
  @argument[view]{a @class{gtk:icon-view} widget}
  @argument[path]{a @class{gtk:tree-path} instance}
  @return{A newly-allocated @symbol{cairo:surface-t} surface of the drag icon.}
  @begin{short}
    Creates a @symbol{cairo:surface-t} representation of the item at @arg{path}.
  @end{short}
  This image is used for a drag icon.
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-path}
  @see-symbol{cairo:surface-t}"
  (view (g:object icon-view))
  (path (g:boxed tree-path)))

#+nil
(export 'icon-view-create-drag-icon)

;;; --- End of file gtk.icon-view.lisp -----------------------------------------
