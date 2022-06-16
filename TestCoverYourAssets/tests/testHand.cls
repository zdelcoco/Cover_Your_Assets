 
 /*------------------------------------------------------------------------
    File        : testHand
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : zdelcoco
    Created     : Wed Jun 15 15:17:29 CDT 2022
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS testHand:

  DEFINE PRIVATE VARIABLE oHand AS CLASS Hand NO-UNDO.

  @Setup.
  METHOD PUBLIC VOID setUp():            
    oHand = NEW Hand().
  END METHOD.    

  @TearDown.
  METHOD PUBLIC VOID tearDown():        
    IF VALID-OBJECT(oHand) THEN DELETE OBJECT oHand.
  END METHOD.
  
  @Test.
  METHOD PUBLIC VOID HandExists():
    OPENEDGE.CORE.ASSERT:EQUALS(TRUE,VALID-OBJECT(oHand)).
  END.   
      
END CLASS.