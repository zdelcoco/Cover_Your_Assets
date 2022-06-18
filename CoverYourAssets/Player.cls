 
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
  
  DEFINE PUBLIC VARIABLE oPlayerHand  AS CLASS Hand NO-UNDO.
  DEFINE PUBLIC VARIABLE oPlayerStack AS CLASS AssetPile EXTENT 55 NO-UNDO.
  
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
    
  DEFINE PROPERTY iNumberOfValidStacks AS INTEGER NO-UNDO
    GET():
      DEFINE VARIABLE itx AS INTEGER NO-UNDO.
      iNumberOfValidstacks = 0.
      DO itx = 1 TO EXTENT(oPlayerStack):
        IF oPlayerStack[itx]:oPileOfCards[1]:cType <> "Empty" THEN 
          iNumberOfValidStacks = iNumberOfValidStacks + 1.
      END.
      RETURN iNumberOfValidStacks.
    END GET.
    PRIVATE SET. 
        
  DEFINE PROPERTY iTopOfStackAsset AS INTEGER NO-UNDO
    GET():
      DEFINE VARIABLE itx AS INTEGER NO-UNDO.
      DO itx = 1 TO EXTENT(oPlayerStack):
        IF oPlayerStack[itx]:oPileOfCards[1]:cType <> "Empty" THEN NEXT.
        iTopOfStackAsset = itx.
        RETURN iTopOfStackAsset.
      END.
    END GET.
    PRIVATE SET.     
    
  CONSTRUCTOR PUBLIC Player(INPUT ipiPlayerID AS INTEGER):
    DEFINE VARIABLE itx AS INTEGER NO-UNDO.
    SUPER ().   
    THIS-OBJECT:iPlayerID = ipiPlayerID. 
    DO itx = 1 TO EXTENT(oPlayerStack):
      oPlayerStack[itx] = NEW AssetPile(2). // create empty stack array
    END.
  END CONSTRUCTOR.
  
  METHOD PUBLIC VOID addStack(ipoAssetPile AS AssetPile):
    THIS-OBJECT:oPlayerStack[iTopOfStackAsset] = ipoAssetPile.
  END.                                   

  DESTRUCTOR PUBLIC Player ( ):
  END DESTRUCTOR.

END CLASS.