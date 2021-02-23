
#property version   "1.00"
#property description ""
 string tempFileName="Trend.txt";
#include <stdlib.mqh>
#include <stderror.mqh>
#property indicator_maximum 7
#property indicator_minimum 3
//--- indicator settings
#property indicator_separate_window
#property indicator_buffers 2

#property indicator_type1 DRAW_ARROW
#property indicator_width1 3
#property indicator_color1 0x15FF00
#property indicator_label1 "Buy"

#property indicator_type2 DRAW_ARROW
#property indicator_width2 3
#property indicator_color2 0x0000FF
#property indicator_label2 "Sell"

 
input int MaxBars=12000;
//--- indicator buffers
double Buffer1[];
double Buffer2[];
int lastb=0;
datetime time_alert; //used when sending alert
bool Audible_Alerts = true;
bool Push_Notifications = true;
double myPoint; //initialized in OnInit



//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {   
   IndicatorBuffers(2);
   SetIndexBuffer(0, Buffer1);
   SetIndexEmptyValue(0, EMPTY_VALUE);
   SetIndexArrow(0, 241);
   SetIndexBuffer(1, Buffer2);
   SetIndexEmptyValue(1, EMPTY_VALUE);
   SetIndexArrow(1, 242);
   //initialize myPoint
   myPoint = Point();
   if(Digits() == 5 || Digits() == 3)
     {
      myPoint *= 10;
     }
     
     
    
     
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime& time[],
                const double& open[],
                const double& high[],
                const double& low[],
                const double& close[],
                const long& tick_volume[],
                const long& volume[],
                const int& spread[])
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
   
  
                                                  
  
int BarsCount = 0;
if (Bars>BarsCount) {


  


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
     
     
       for(int i = MaxBars-1; i >= 0; i--)
     {
      if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
 //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",2,i+1)!= EMPTY_VALUE || 
      
         (iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",4,i+1)!= EMPTY_VALUE && iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",0,i+1)!= EMPTY_VALUE ) ||
            
            (iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",5,i+1)!= EMPTY_VALUE && iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",0,i+1)!= EMPTY_VALUE )
      )
        
        
          {
          
               if(Open[i]>Close [i+1] && Open[i]<Close[i])
            {
        if(iCustom(NULL,PERIOD_CURRENT,"mtf",1,i)== 5.0)
          {
           Buffer1[i] = 5; //Set indicator value at Candlestick Low
               if(i == 1 && time_alert!= Time[1] ) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;time_alert= Time[1]; } //Instant alert, only once per bar
           
          }
                }
            
            else
              {
               
              }
         
          }
       
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      //Indicator Buffer 2
if(iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",3,i+1)!= EMPTY_VALUE || 
      
         (iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",4,i+1)!= EMPTY_VALUE && iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",1,i+1)!= EMPTY_VALUE ) ||
            
            (iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",5,i+1)!= EMPTY_VALUE && iCustom(NULL,PERIOD_CURRENT,"PZ_TrendTrading_36dfbf04bb",1,i+1)!= EMPTY_VALUE )
      )
        
        
          {
          
               if(Open[i]<Close [i+1] && Open[i]>Close[i])
            {
        if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,i)== 5.0)
          {
            Buffer2[i] = 5; //Set indicator value at Candlestick Low
                if(i == 1 && time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;time_alert= Time[1]; } //Instant alert, only once per bar
           
          }
          
          
          
          
          
          
          
          
          
           else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,i+1)== 5.0)
                   {
                    Buffer2[i] = 5; //Set indicator value at Candlestick Low
                if(i == 1 && time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;time_alert= Time[1]; } 
               }
            else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,i+2)== 5.0)
                   {
                    Buffer2[i] = 5; //Set indicator value at Candlestick Low
                     if(i == 1 && time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;time_alert= Time[1]; }  
                   }
                   else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,i+3)== 5.0)
                   {
                    Buffer2[i] = 5; //Set indicator value at Candlestick Low
                     if(i == 1 && time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;time_alert= Time[1]; } 
                   }
                   else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,i+4)== 5.0)
                   {
                    Buffer2[i] = 5; //Set indicator value at Candlestick Low
                     if(i == 1 && time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;time_alert= Time[1]; } 
         }
            else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,i+5)== 5.0)
                   {
                    Buffer2[i] = 5; //Set indicator value at Candlestick Low
                     if(i == 1 && time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;time_alert= Time[1]; } 
                   }
                   else if(iCustom(NULL,PERIOD_CURRENT,"mtf",0,i+6)== 5.0)
                   {
                    Buffer2[i] = 5; //Set indicator value at Candlestick Low
                     if(i == 1 && time_alert!= Time[1]) {  Alert(" Symbol: ",Symbol(), " TF: ", Period()) ;time_alert= Time[1]; } 
                     }
          
          
          
          
          
          
          
          
          
          

           }
            
          }
       
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
        
     } 
     
     
     
     
    } 
   
else
  {
   Alert ("Password incorrect" );
  }
  
  
}BarsCount = Bars;

   //--- main loop

   return(rates_total);
  }
//+------------------------------------------------------------------+