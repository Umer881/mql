
#property version   "1.00"
#property description ""
#property indicator_separate_window
#include <stdlib.mqh>
#include <stderror.mqh>
 string tempFileName="Trend.txt";
#property indicator_maximum 6
#property indicator_minimum 2

//--- indicator settings

#property indicator_buffers 2

 
#property indicator_type1 DRAW_ARROW
#property indicator_width1 3
#property indicator_color1 0x15FF00
#property indicator_label1 "Buy"

#property indicator_type2 DRAW_ARROW
#property indicator_width2 3
#property indicator_color2 0x0000FF
#property indicator_label2 "Sell"
double divider = 0.0;
double nxttf,iii;
int nextf; 
datetime Time_alert; //used when sending alert

 input int MaxBars=1000;
//--- indicator buffers
double Buffer1[];
double Buffer2[];
string var1;
  //used when sending alert
bool Audible_Alerts = true;
bool Push_Notifications = true;
double myPoint; //initialized in OnInit
int timefr ;  int bari=-1; int curday;
datetime wst,timee;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

    
  ObjectsDeleteAll();
//--- indicator buffers mapping

   if(Period()<=60 )
     {
                 wst=iTime(_Symbol, PERIOD_D1, 0);

                    for(int i=0;i<50;i++)
                     { 
                      if(Time[i]>=wst )
                         {
                          bari= bari+1;
                         }
                        else
                          {
                           break;
                          }
                     }
     }
   
   else if(Period()==240)
          {
               wst=iTime(Symbol(), PERIOD_W1, 0);
 
                  
                    for(int  li=0;li<50;li++)
                     {
                       
                      if(Time[li]>=wst )
                         {
                          bari= bari+1;
                            //Print(3);
                            //Print(bari); 
                         }
                        else
                          {
                           break;
                          }
                     }
          }
   
    else if(Period()==1440)
          {
                    curday=TimeMonth(TimeCurrent());
       bari=-1;
       for(int mi=0;mi<31;mi++)
         {
             timee= TimeMonth(Time[mi]);    
           if(timee == curday)
             {
              bari= bari+1;
             }
            else
              {
              break;
              // i = 33;
              }
         }
          }  
   
      else if(Period()==10080)
          {
                    curday=TimeYear(TimeCurrent());
         bari=-1;
       for(int ni=0;ni<55;ni++)
         {
             timee= TimeYear(Time[ni]);    
           if(timee ==curday)
             {
              bari= bari+1;
             }
            else
              {
               break;
              }
         }
          }
  
  
  
  
  
  
  
  
   IndicatorBuffers(2);
   SetIndexBuffer(0, Buffer1);
   SetIndexEmptyValue(0, EMPTY_VALUE);
   SetIndexArrow(0, 241);
   SetIndexBuffer(1, Buffer2);
   SetIndexEmptyValue(1, EMPTY_VALUE);
   SetIndexArrow(1, 242);
//--- indicator buffers mapping
   ObjectsDeleteAll();
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
  
  
     int limit = rates_total - prev_calculated;
   //--- counting from 0 to rates_total
   ArraySetAsSeries(Buffer1, true);
   ArraySetAsSeries(Buffer2, true);
   //--- initial zero
   if(prev_calculated < 1)
     {
      ArrayInitialize(Buffer1, EMPTY_VALUE);
      ArrayInitialize(Buffer2, EMPTY_VALUE);
     }
   else
      limit++;
   
   IndicatorSetInteger(INDICATOR_LEVELS,1);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,4.5);
 
  
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
      if(Close[1]> High[i] && Open[1]<High[i])
       
      { //second if bracket start
         timed =Time[i];
         var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bull-1-"+i,OBJ_HLINE,0,i,Low[i]);
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
      if(Close[1]> High[i] && Open[1]<High[i])
       
      { //second if bracket start
         timed =Time[i];
         var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bull-2-"+i,OBJ_HLINE,0,i,Low[i]);
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
      if(Close[1]> High[i] && Open[1]<High[i])
       
      { //second if bracket start
         timed =Time[i];
         var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bull-3-"+i,OBJ_HLINE,0,i,Low[i]);
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
      if(Close[1]> High[i] && Open[1]<High[i])
       
      { //second if bracket start
         timed =Time[i];
         var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bear-1-"+i,OBJ_HLINE,0,i,Low[i]);
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
      if(Close[1]> High[i] && Open[1]<High[i])
       
      { //second if bracket start
         timed =Time[i];
         var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bear-2-"+i,OBJ_HLINE,0,i,Low[i]);
                  ObjectSetInteger(0,"Bear-2-"+i,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,"Bear-2-"+i,OBJPROP_BACK,True); 
                  ObjectSetInteger(0,"Bear-2-"+i,OBJPROP_SELECTABLE,False); 
                  ObjectSetInteger(0,"Bear-2-"+i,OBJPROP_HIDDEN,True); 
                  ObjectSetString (0,"Bear-2-"+i,OBJPROP_TEXT,var1);
               
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

   iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",5,i)!= EMPTY_VALUE    
   
   )
   { // if  bracker start 
      if(Close[1]> High[i] && Open[1]<High[i])
       
      { //second if bracket start
         timed =Time[i];
         var1=TimeToString(timed);             
         if(ObjectFind(0,var1)<0)
         
         { //third if bracket start
            
                  ObjectCreate    (0,"Bear-3-"+i,OBJ_HLINE,0,i,Low[i]);
                  ObjectSetInteger(0,"Bear-3-"+i,OBJPROP_COLOR,clrNONE);
                  ObjectSetInteger(0,"Bear-3-"+i,OBJPROP_BACK,True); 
                  ObjectSetInteger(0,"Bear-3-"+i,OBJPROP_SELECTABLE,False); 
                  ObjectSetInteger(0,"Bear-3-"+i,OBJPROP_HIDDEN,True); 
                  ObjectSetString (0,"Bear-3-"+i,OBJPROP_TEXT,var1);
               
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
        if(Close[1]<objpric && Open[1]>objpric)
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
         
         
         Alert (" Symbol: ",Symbol(), " ", Period(),"| Stop Hunt Low | Candle Time: " ,TimeToString(timeforcid), " High: " , hii," Low: ",  loo, " | 50% " , Retracement  );
         
         

          
         SendNotification(" Symbol: " + Symbol()+ " "+ Period()+"| Stop Hunt Low | Candle Time: " +TimeToString(timeforcid)+ " High: " + hii+" Low: "+  loo+ " | 50% " + Retracement );
         ObjectSetText(objname,"strrrDone",10,"Times New Roman",Green);
         
         
         string name = TimeToString(timeforcid);
         name = StringConcatenate(name,"arrowm");
         ObjectCreate(name ,OBJ_ARROW_UP,1, Time[candleid],3);
         ObjectSet(name ,OBJPROP_COLOR,clrLime);
         ObjectSet(name,OBJPROP_WIDTH,4.5);
         }
      }

   }
  
} 
  
  
  
 
 
     
       for(int ki = MaxBars-1;ki >= 0;ki--)
     
     
  {
      if (ki >= MathMin(5000-1, rates_total-1-50)) continue; //omkit some old rates to prevent "Array out of range" or slow calculatkion   
      
 //kindkicator Buffer 1
      if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",2,ki+1)!= EMPTY_VALUE || 
      
         (iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",4,ki+1)!= EMPTY_VALUE && iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",0,ki+1)!= EMPTY_VALUE ) ||
            
            (iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",5,ki+1)!= EMPTY_VALUE && iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",0,ki+1)!= EMPTY_VALUE )
      )
        
        
          {
          
               if(Open[ki]>Close [ki+1] && Open[ki]<Close[ki])
            {
        if(iCustom(NULL,PERIOD_CURRENT,"mtf",1,ki)== 5.0)
          {
           Buffer1[ki] = 5; //Set kindkicator value at Candlestkick Low
               if(ki == 1 && Time_alert!= Time[1] ) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;Time_alert= Time[1]; } //kinstant alert, only once per bar
           
          }
                }
            
            else
              {
               
              }
         
          }
       
      else
        {
         Buffer1[ki] = EMPTY_VALUE;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      //kindkicator Buffer 2
if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",3,ki+1)!= EMPTY_VALUE || 
      
         (iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",4,ki+1)!= EMPTY_VALUE && iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",1,ki+1)!= EMPTY_VALUE ) ||
            
            (iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",5,ki+1)!= EMPTY_VALUE && iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",1,ki+1)!= EMPTY_VALUE )
      )
        
        
          {
          
               if(Open[ki]<Close [ki+1] && Open[ki]>Close[ki])
            {
        if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,ki)== 5.0)
          {
            Buffer2[ki] = 5; //Set kindkicator value at Candlestkick Low
                if(ki == 1 && Time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;Time_alert= Time[1]; } //kinstant alert, only once per bar
           
          }
          
          
          
          
          
          
          
          
          
           else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,ki+1)== 5.0)
                   {
                    Buffer2[ki] = 5; //Set kindkicator value at Candlestkick Low
                if(ki == 1 && Time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;Time_alert= Time[1]; } 
               }
            else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,ki+2)== 5.0)
                   {
                    Buffer2[ki] = 5; //Set kindkicator value at Candlestkick Low
                     if(ki == 1 && Time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;Time_alert= Time[1]; }  
                   }
                   else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,ki+3)== 5.0)
                   {
                    Buffer2[ki] = 5; //Set kindkicator value at Candlestkick Low
                     if(ki == 1 && Time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;Time_alert= Time[1]; } 
                   }
                   else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,ki+4)== 5.0)
                   {
                    Buffer2[ki] = 5; //Set kindkicator value at Candlestkick Low
                     if(ki == 1 && Time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;Time_alert= Time[1]; } 
         }
            else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,ki+5)== 5.0)
                   {
                    Buffer2[ki] = 5; //Set kindkicator value at Candlestkick Low
                     if(ki == 1 && Time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;Time_alert= Time[1]; } 
                   }
                   else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,ki+6)== 5.0)
                   {
                    Buffer2[ki] = 5; //Set kindkicator value at Candlestkick Low
                     if(ki == 1 && Time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;Time_alert= Time[1]; } 
                     }
          
          
          
          
          
          
          
          
          
          

           }
            
          }
       
      else
        {
         Buffer2[ki] = EMPTY_VALUE;
        }
        
     } 
        
      
     
     
  }   
    BarsCount = Bars;   
  
   
  }
  
  
else
  {
   Alert ("Password incorrect");
  } 
   
   

   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
