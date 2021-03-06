 
 /*------------------------------------------------------------------------
    File        : testCard
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : zdelcoco
    Created     : Tue Jun 14 09:24:29 CDT 2022
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS testCard:   
  
  DEFINE PRIVATE VARIABLE oCard AS CLASS Card NO-UNDO.

  @Before.
  METHOD PUBLIC VOID setUpBeforeClass(): 
    oCard = NEW Card("TEST",1234).           
  END METHOD.     
 
  @After.
  METHOD PUBLIC VOID tearDownAfterClass():        
    IF VALID-OBJECT(oCard) THEN DELETE OBJECT oCard.
  END METHOD.
  
  @Test.
  METHOD PUBLIC VOID blankCardExists():      
    OPENEDGE.CORE.ASSERT:EQUALS(TRUE,VALID-OBJECT(oCard)).
  END METHOD.   
  
  @Test.
  METHOD PUBLIC VOID cardNamesAreEqual():
    DEFINE VARIABLE oCompareCard AS CLASS Card NO-UNDO.    
    oCompareCard = NEW Card("TEST",5555).    
    OPENEDGE.CORE.ASSERT:EQUALS(TRUE,oCard:compareCardName(oCompareCard)).    
  END METHOD. 
  
  @Test.
  METHOD PUBLIC VOID goldCardTypeIsWild():
    DEFINE VARIABLE oGoldCard AS CLASS Card NO-UNDO.
    oGoldCard = NEW Card("Gold",50000).
    OPENEDGE.CORE.ASSERT:EQUALS("Wild",oGoldCard:cType). 
  END.
       
END CLASS.