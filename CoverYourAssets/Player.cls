 
 /*------------------------------------------------------------------------
    File        : Player
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : zdelcoco
    Created     : Fri Jun 17 13:54:17 CDT 2022
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Player: 
  
  DEFINE PROPERTY iPlayerID AS INTEGER NO-UNDO
    GET.
    PRIVATE SET.
    
  DEFINE PROPERTY cPlayerName AS CHARACTER NO-UNDO
    GET.
    SET(INPUT cText AS CHARACTER):
      // capitalizes first letter of each 'word' in player's name
      DEFINE VARIABLE itx AS INTEGER NO-UNDO.
      DEFINE VARIABLE cOutput AS CHARACTER NO-UNDO.
      DO itx = 1 TO NUM-ENTRIES(cText," "):
        cOutput = cOutput +
                  CAPS(SUBSTRING(ENTRY(itx,cText, " "),1,1)) +
                  LOWER(SUBSTRING(ENTRY(itx,cText," "),2,LENGTH(ENTRY(itx,cText," ")))) +
                  " ".
      END.
      cPlayerName = cOutput.
    END SET.
    
  DEFINE PUBLIC VARIABLE oPlayerHand  AS CLASS Hand NO-UNDO.
  DEFINE PUBLIC VARIABLE oPlayerStack AS CLASS AssetPile NO-UNDO.

  CONSTRUCTOR PUBLIC Player(INPUT ipiPlayerID AS INTEGER):
    SUPER ().   
    THIS-OBJECT:iPlayerID = ipiPlayerID. 
  END CONSTRUCTOR.                                   

  DESTRUCTOR PUBLIC Player ( ):
  END DESTRUCTOR.

END CLASS.