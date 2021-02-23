 
#property version   "1.00"
#property strict
#property indicator_separate_window
#property indicator_maximum 6
#property indicator_minimum 2

  string tempFileName="Trend.txt";
input int MaxBars=1000;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
datetime timed ;  




 string strArr[1];

int handle = FileOpen(tempFileName,FILE_READ|FILE_TXT,0,CP_UTF8); 
 
FileSeek(handle,0,SEEK_SET);
int si=0;
while(!FileIsEnding(handle))
{
	if(si>ArraySize(strArr)) { Comment("error: increase size of strArr"); ExpertRemove(); }
	strArr[si] = FileReadString(handle,0);
	si++;
}

FileClose(handle);


// here are variables one after another, order and type are important, triple-check it
string varLotsBuy = (string)strArr[0];



  if(varLotsBuy=="9201015116085")
    {

int BarsCount = 0;
if (Bars>BarsCount) {   
   
for(int i=0;i<MaxBars;i++)
{     //for loop start
   

if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",2,i)!= EMPTY_VALUE)
   { // if  bracker start 
      if(Close[1]< Low[i] && Open[1]>Low[i])
       
      { //second if bracket start
         timed =Time[i];
         string var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bull-1-"+i,OBJ_HLINE,0,i,High[i]);
                  ObjectSetInteger(0,"Bull-1-"+i,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,"Bull-1-"+i,OBJPROP_BACK,True); 
                  ObjectSetInteger(0,"Bull-1-"+i,OBJPROP_SELECTABLE,False); 
                  ObjectSetInteger(0,"Bull-1-"+i,OBJPROP_HIDDEN,True); 
                  ObjectSetString (0,"Bull-1-"+i,OBJPROP_TEXT,var1);
               
                  ObjectCreate(0,var1,OBJ_TEXT,0,Time[11],High[11]);
                  ObjectSetString(0,var1,OBJPROP_TEXT,var1);
                  ObjectSetString(0,var1,OBJPROP_FONT,"Arial");
                  ObjectSetInteger(0,var1,OBJPROP_FONTSIZE,15);
                  ObjectSetInteger(0,var1,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,var1,OBJPROP_BACK,True);
                  ObjectSetInteger(0,var1,OBJPROP_SELECTABLE,False);
                  ObjectSetInteger(0,var1,OBJPROP_HIDDEN,True);
            
         }//third if bracket close 
        
      }//second if bracket close 
     
   }// first if statement close 
   
   
   
   
   
   
   
   
if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",0,i)!= EMPTY_VALUE  &&

   iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",4,i)!= EMPTY_VALUE    
   
   )
   { // if  bracker start 
      if(Close[1]< Low[i] && Open[1]>Low[i])
       
      { //second if bracket start
         timed =Time[i];
         string var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bull-2-"+i,OBJ_HLINE,0,i,High[i]);
                  ObjectSetInteger(0,"Bull-2-"+i,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,"Bull-2-"+i,OBJPROP_BACK,True); 
                  ObjectSetInteger(0,"Bull-2-"+i,OBJPROP_SELECTABLE,False); 
                  ObjectSetInteger(0,"Bull-2-"+i,OBJPROP_HIDDEN,True); 
                  ObjectSetString (0,"Bull-2-"+i,OBJPROP_TEXT,var1);
               
                  ObjectCreate(0,var1,OBJ_TEXT,0,Time[11],High[11]);
                  ObjectSetString(0,var1,OBJPROP_TEXT,var1);
                  ObjectSetString(0,var1,OBJPROP_FONT,"Arial");
                  ObjectSetInteger(0,var1,OBJPROP_FONTSIZE,15);
                  ObjectSetInteger(0,var1,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,var1,OBJPROP_BACK,True);
                  ObjectSetInteger(0,var1,OBJPROP_SELECTABLE,False);
                  ObjectSetInteger(0,var1,OBJPROP_HIDDEN,True);
            
         }//third if bracket close 
        
      }//second if bracket close 
     
   }// first if statement close    
   
   
   
   
   
   
   
   
   
   


if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",0,i)!= EMPTY_VALUE  &&

   iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",5,i)!= EMPTY_VALUE    
   
   )
   { // if  bracker start 
      if(Close[1]< Low[i] && Open[1]>Low[i])
       
      { //second if bracket start
         timed =Time[i];
         string var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bull-3-"+i,OBJ_HLINE,0,i,High[i]);
                  ObjectSetInteger(0,"Bull-3-"+i,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,"Bull-3-"+i,OBJPROP_BACK,True); 
                  ObjectSetInteger(0,"Bull-3-"+i,OBJPROP_SELECTABLE,False); 
                  ObjectSetInteger(0,"Bull-3-"+i,OBJPROP_HIDDEN,True); 
                  ObjectSetString (0,"Bull-3-"+i,OBJPROP_TEXT,var1);
               
                  ObjectCreate(0,var1,OBJ_TEXT,0,Time[11],High[11]);
                  ObjectSetString(0,var1,OBJPROP_TEXT,var1);
                  ObjectSetString(0,var1,OBJPROP_FONT,"Arial");
                  ObjectSetInteger(0,var1,OBJPROP_FONTSIZE,15);
                  ObjectSetInteger(0,var1,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,var1,OBJPROP_BACK,True);
                  ObjectSetInteger(0,var1,OBJPROP_SELECTABLE,False);
                  ObjectSetInteger(0,var1,OBJPROP_HIDDEN,True);
            
         }//third if bracket close 
        
      }//second if bracket close 
     
   }// first if statement close   


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx




if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",3,i)!= EMPTY_VALUE)
   { // if  bracker start 
      if(Close[1]< Low[i] && Open[1]>Low[i])
       
      { //second if bracket start
         timed =Time[i];
         string var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bear-1-"+i,OBJ_HLINE,0,i,High[i]);
                  ObjectSetInteger(0,"Bear-1-"+i,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,"Bear-1-"+i,OBJPROP_BACK,True); 
                  ObjectSetInteger(0,"Bear-1-"+i,OBJPROP_SELECTABLE,False); 
                  ObjectSetInteger(0,"Bear-1-"+i,OBJPROP_HIDDEN,True); 
                  ObjectSetString (0,"Bear-1-"+i,OBJPROP_TEXT,var1);
               
                  ObjectCreate(0,var1,OBJ_TEXT,0,Time[11],High[11]);
                  ObjectSetString(0,var1,OBJPROP_TEXT,var1);
                  ObjectSetString(0,var1,OBJPROP_FONT,"Arial");
                  ObjectSetInteger(0,var1,OBJPROP_FONTSIZE,15);
                  ObjectSetInteger(0,var1,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,var1,OBJPROP_BACK,True);
                  ObjectSetInteger(0,var1,OBJPROP_SELECTABLE,False);
                  ObjectSetInteger(0,var1,OBJPROP_HIDDEN,True);
            
         }//third if bracket close 
        
      }//second if bracket close 
     
   }// first if statement close 
   
   
   
if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",1,i)!= EMPTY_VALUE  &&

   iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",4,i)!= EMPTY_VALUE    
   
   )
   { // if  bracker start 
      if(Close[1]< Low[i] && Open[1]>Low[i])
       
      { //second if bracket start
         timed =Time[i];
         string var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bear-2-"+i,OBJ_HLINE,0,i,High[i]);
                  ObjectSetInteger(0,"Bear-2-"+i,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,"Bear-2-"+i,OBJPROP_BACK,True); 
                  ObjectSetInteger(0,"Bear-2-"+i,OBJPROP_SELECTABLE,False); 
                  ObjectSetInteger(0,"Bear-2-"+i,OBJPROP_HIDDEN,True); 
                  ObjectSetString (0,"Bear-2-"+i,OBJPROP_TEXT,var1);
               
                  ObjectCreate(0,var1,OBJ_TEXT,0,Time[11],Low[11]);
                  ObjectSetString(0,var1,OBJPROP_TEXT,var1);
                  ObjectSetString(0,var1,OBJPROP_FONT,"Arial");
                  ObjectSetInteger(0,var1,OBJPROP_FONTSIZE,15);
                  ObjectSetInteger(0,var1,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,var1,OBJPROP_BACK,True);
                  ObjectSetInteger(0,var1,OBJPROP_SELECTABLE,False);
                  ObjectSetInteger(0,var1,OBJPROP_HIDDEN,True);
            
         }//third if bracket close 
        
      }//second if bracket close 
     
   }// first if statement close    
   
   


if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",1,i)!= EMPTY_VALUE  &&

   iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",5,i)!= EMPTY_VALUE    
   
   )
   { // if  bracker start 
      if(Close[1]< Low[i] && Open[1]>Low[i])
       
      { //second if bracket start
         timed =Time[i];
         string var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bear-3-"+i,OBJ_HLINE,0,i,High[i]);
                  ObjectSetInteger(0,"Bear-3-"+i,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,"Bear-3-"+i,OBJPROP_BACK,True); 
                  ObjectSetInteger(0,"Bear-3-"+i,OBJPROP_SELECTABLE,False); 
                  ObjectSetInteger(0,"Bear-3-"+i,OBJPROP_HIDDEN,True); 
                  ObjectSetString (0,"Bear-3-"+i,OBJPROP_TEXT,var1);
               
                  ObjectCreate(0,var1,OBJ_TEXT,0,Time[11],Low[11]);
                  ObjectSetString(0,var1,OBJPROP_TEXT,var1);
                  ObjectSetString(0,var1,OBJPROP_FONT,"Arial");
                  ObjectSetInteger(0,var1,OBJPROP_FONTSIZE,15);
                  ObjectSetInteger(0,var1,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,var1,OBJPROP_BACK,True);
                  ObjectSetInteger(0,var1,OBJPROP_SELECTABLE,False);
                  ObjectSetInteger(0,var1,OBJPROP_HIDDEN,True);
            
         }//third if bracket close 
        
      }//second if bracket close 
     
   }// first if statement close   
 
   
}//for loop end 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    if(ObjectsTotal()>0)
   {
     for(int j=0;j<ObjectsTotal();j++)
   {
    string objname= ObjectName(j);
    string objectdes = ObjectDescription(objname);
    double objpric= ObjectGet(objname, OBJPROP_PRICE1);  
    if(StringFind(objectdes,"Done")<0 && ObjectType(objname)==OBJ_HLINE)
      {
        if(Close[1]>objpric && Open[1]<objpric)
         {
         
         
         string setupstr = StringSubstr(objname,0,6);
         datetime timeforcid=StringToTime(objectdes);
         int candleid=iBarShift(NULL,PERIOD_CURRENT,timeforcid);
         //Print(candleid,"and", timeforcid);
         
         double Range=High[candleid] - Low[candleid];
         
         double Retracement = Range/2;
         Retracement= Retracement+Low[candleid];
         Retracement= NormalizeDouble(Retracement,Digits);
         double hii = High[candleid];
         double loo = Low[candleid];
         hii = NormalizeDouble(hii,Digits);
         loo = NormalizeDouble(loo,Digits);
         
         Alert (" Symbol: ",Symbol(), " ", Period(),"| Stop Hunt High | Candle Time: " ,timeforcid, " High: " , hii," Low: ",  loo, " | 50% " , Retracement  );
         
     SendNotification(" Symbol: " + Symbol()+ " "+ Period()+"| Stop Hunt High | Candle Time: " +timeforcid+ " High: " + hii+" Low: "+  loo+ " | 50% " + Retracement );
         ObjectSetText(objname,"strrrDone",10,"Times New Roman",Green);
          
         string name = TimeToString(timeforcid);
         name = StringConcatenate(name,"arrown");
         ObjectCreate(name ,OBJ_ARROW_UP,1, Time[candleid],3);
         ObjectSet(name ,OBJPROP_COLOR,clrLime);
         ObjectSet(name,OBJPROP_WIDTH,4.5);
         }
      }

   }
   }
   
   

   
   
   
   
   
   
    BarsCount = Bars;
} 
   
   }
  
  
else
  {
   Alert ("Password incorrect");
  } 
     
   
   

   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
