REPORT ymbh_abstract_factory_sample.

INTERFACE lif_writer.
  METHODS write_file
    IMPORTING iv_path TYPE string.
ENDINTERFACE.

INTERFACE lif_executer.
  METHODS execute_app.
ENDINTERFACE.

INTERFACE lif_factory.
  METHODS get_writer
    RETURNING
      VALUE(ro_writer) TYPE REF TO lif_writer.
  METHODS get_executer
    RETURNING
      VALUE(ro_executor) TYPE REF TO lif_executer.
ENDINTERFACE.

CLASS lcl_win_writer DEFINITION.

  PUBLIC SECTION.
    INTERFACES lif_writer.
    METHODS windows_specific_stuff.

ENDCLASS.

CLASS lcl_win_writer IMPLEMENTATION.

  METHOD windows_specific_stuff.
    "Some code
  ENDMETHOD.

  METHOD lif_writer~write_file.
    "Code to validate folder
    "Code to write file (Dataset)
  ENDMETHOD.

ENDCLASS.

CLASS lcl_unix_writer DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_writer.
    METHODS unix_specific_stuff.
ENDCLASS.

CLASS lcl_unix_writer IMPLEMENTATION.

  METHOD unix_specific_stuff.
    "Some code for Unix specific stuff
  ENDMETHOD.

  METHOD lif_writer~write_file.
    "Some code for CHMOD
    "Some code for Dataset
  ENDMETHOD.

ENDCLASS.

CLASS lcl_win_executer DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_executer.
ENDCLASS.

CLASS lcl_win_executer IMPLEMENTATION.

  METHOD lif_executer~execute_app.
    "Some win executing code to run an .exe file
  ENDMETHOD.

ENDCLASS.

CLASS lcl_unix_executer DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_executer.
    METHODS enter_admin_mode.
ENDCLASS.

CLASS lcl_unix_executer IMPLEMENTATION.

  METHOD lif_executer~execute_app.
    "Some code to run sh command
  ENDMETHOD.

  METHOD enter_admin_mode.
    "Some code for admin stuff
  ENDMETHOD.

ENDCLASS.

CLASS lcl_win_factory DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_factory.
ENDCLASS.

CLASS lcl_win_factory IMPLEMENTATION.

  METHOD lif_factory~get_executer.
    ro_executor = new lcl_win_executer( ).
  ENDMETHOD.

  METHOD lif_factory~get_writer.
    ro_writer = new lcl_win_writer( ).
  ENDMETHOD.

ENDCLASS.

class lcl_unix_factory DEFINITION.
    PUBLIC SECTION.
    INTERFACES lif_factory.
ENDCLASS.

CLASS lcl_unix_factory IMPLEMENTATION.

  METHOD lif_factory~get_executer.
    ro_executor = new lcl_unix_executer( ).
  ENDMETHOD.

  METHOD lif_factory~get_writer.
    ro_writer = new lcl_unix_writer( ).
  ENDMETHOD.

ENDCLASS.
