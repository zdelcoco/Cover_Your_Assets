@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
 
 /*------------------------------------------------------------------------
    File        : Card
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : zdelcoco
    Created     : Tue Jun 14 09:26:02 CDT 2022
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Card: 
  
  DEFINE PROPERTY cType AS CHARACTER NO-UNDO 
    GET. 
    PRIVATE SET.
    
  DEFINE PROPERTY cName AS CHARACTER NO-UNDO 
    GET. 
    PRIVATE SET.
    
  DEFINE PROPERTY iValue AS INTEGER NO-UNDO
    GET.
    PRIVATE SET.

  CONSTRUCTOR PUBLIC Card(INPUT ipcName AS CHARACTER, INPUT ipiValue AS INTEGER):
    SUPER().    
    THIS-OBJECT:cName  = ipcName.
    THIS-OBJECT:iValue = ipiValue.
    
    THIS-OBJECT:cType  = IF THIS-OBJECT:cName = "Gold" OR
                            THIS-OBJECT:cName = "Silver" THEN
                           "Wild"
                         ELSE IF THIS-OBJECT:cName = "" THEN
                           "Empty"
                         ELSE
                           "Standard".
  END CONSTRUCTOR.
  
  METHOD PUBLIC LOGICAL compareCardName(INPUT ipoCard AS CLASS Card):
    RETURN THIS-OBJECT:cName = ipoCard:cName.
  END METHOD.
  
  METHOD PUBLIC VOID clearCard():
    THIS-OBJECT:cName  = "".
    THIS-OBJECT:iValue = 0.
    THIS-OBJECT:cType  = "Empty".
  END.

  DESTRUCTOR PUBLIC Card():
  END DESTRUCTOR.

END CLASS.