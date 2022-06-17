 
 /*------------------------------------------------------------------------
    File        : Hand
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : zdelcoco
    Created     : Wed Jun 15 15:15:13 CDT 2022
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Hand INHERITS CardPile:
  
  DEFINE PRIVATE VARIABLE oTempCard AS CLASS Card NO-UNDO.

  CONSTRUCTOR PUBLIC Hand(ipiNumCards AS INTEGER):
    SUPER(ipiNumCards).       
  END CONSTRUCTOR.
  
  METHOD PUBLIC Card discard(INPUT ipoCardToDiscard AS Card):
    DEFINE VARIABLE itx AS INTEGER NO-UNDO.
    
    IF ipoCardToDiscard:cType = "Empty" THEN
      RETURN ?.
      
    oTempCard = NEW Card(ipoCardToDiscard:cName,
                         ipoCardToDiscard:iValue).
                         
    DO itx = 1 TO EXTENT(oPileOfCards):                              
      IF ipoCardToDiscard:cName  = oPileOfCards[itx]:cName AND
         ipoCardToDiscard:cType  = oPileOfCards[itx]:cType AND
         ipoCardToDiscard:iValue = oPileOfCards[itx]:iValue THEN
      DO:
        oPileOfCards[itx]:clearCard().
        RETURN oTempCard.
      END.
    END.    
  END METHOD. 
  
  METHOD PUBLIC Card discard(INPUT ipiHandIndex AS INTEGER):
    IF THIS-OBJECT:oPileOfCards[ipiHandIndex]:cType = "Empty" THEN
      RETURN ?.
      
    oTempCard = NEW Card(THIS-OBJECT:oPileOfCards[ipiHandIndex]:cName,
                         THIS-OBJECT:oPileOfCards[ipiHandIndex]:iValue).      
    oPileOfCards[ipiHandIndex]:clearCard().
    
    RETURN oTempCard.
  END METHOD.

  DESTRUCTOR PUBLIC Hand():  
    IF VALID-OBJECT(oTempCard) THEN DELETE OBJECT oTempCard.  
  END DESTRUCTOR.

END CLASS.