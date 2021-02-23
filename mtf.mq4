 
#property version   "1.00"
#property description ""
#property indicator_maximum 5
#property indicator_minimum 3

#include <stdlib.mqh>
#include <stderror.mqh>

//--- indicator settings
#property indicator_separate_window
#property indicator_buffers 2

#property indicator_type1 DRAW_HISTOGRAM
#property indicator_style1 STYLE_SOLID
#property indicator_width1 3
#property indicator_color1 0xFFAA00
#property indicator_label1 "Buy"

#property indicator_type2 DRAW_HISTOGRAM
#property indicator_style2 STYLE_SOLID
#property indicator_width2 3
#property indicator_color2 0x0000FF
#property indicator_label2 "Sell"

//--- indicator buffers
double Buffer1[];
double Buffer2[];

double myPoint; //initialized in OnInit

void myAlert(string type, string message)
  {
   if(type == "print")
      Print(message);
   else if(type == "error")
     {
      Print(type+" | joe tes @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
     }
   else if(type == "order")
     {
     }
   else if(type == "modify")
     {
     }
  }

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {   
   IndicatorBuffers(2);
   SetIndexBuffer(0, Buffer1);
   SetIndexEmptyValue(0, EMPTY_VALUE);
   SetIndexBuffer(1, Buffer2);
   SetIndexEmptyValue(1, EMPTY_VALUE);
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
   //--- initial zero
   if(prev_calculated < 1)
     {
      ArrayInitialize(Buffer1, EMPTY_VALUE);
     }
   else
      limit++;
   int barshift_H4;
   //--- main loop
   for(int i = limit-1; i >= 0; i--)
     {

WindowRedraw( );


if(Period ()== 1)
  {
         if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
        barshift_H4 = iBarShift(Symbol(), PERIOD_M5, Time[i]);
      if(barshift_H4 < 0) continue;
      
      
      
      
      //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_M5,"PZ_TrendTrading_36dfbf04bb",0,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer1[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
              if(iCustom(NULL,PERIOD_M5,"PZ_TrendTrading_36dfbf04bb",1,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer2[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
  }



if(Period ()== 5)
  {
         if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
        barshift_H4 = iBarShift(Symbol(), PERIOD_M15, Time[i]);
      if(barshift_H4 < 0) continue;
      
      
      
      
      //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_M15,"PZ_TrendTrading_36dfbf04bb",0,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer1[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
              if(iCustom(NULL,PERIOD_M15,"PZ_TrendTrading_36dfbf04bb",1,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer2[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
  }











if(Period ()== 15)
  {
         if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
        barshift_H4 = iBarShift(Symbol(), PERIOD_M30, Time[i]);
      if(barshift_H4 < 0) continue;
      
      
      
      
      //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_M30,"PZ_TrendTrading_36dfbf04bb",0,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer1[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
              if(iCustom(NULL,PERIOD_M30,"PZ_TrendTrading_36dfbf04bb",1,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer2[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
  }
















if(Period ()== 30)
  {
         if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
        barshift_H4 = iBarShift(Symbol(), PERIOD_H1, Time[i]);
      if(barshift_H4 < 0) continue;
      
      
      
      
      //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_H1,"PZ_TrendTrading_36dfbf04bb",0,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer1[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
              if(iCustom(NULL,PERIOD_H1,"PZ_TrendTrading_36dfbf04bb",1,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer2[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
  }








if(Period ()== 60)
  {
         if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
        barshift_H4 = iBarShift(Symbol(), PERIOD_H4, Time[i]);
      if(barshift_H4 < 0) continue;
      
      
      
      
      //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_H4,"PZ_TrendTrading_36dfbf04bb",0,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer1[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
              if(iCustom(NULL,PERIOD_H4,"PZ_TrendTrading_36dfbf04bb",1,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer2[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
  }







if(Period ()== 240)
  {
         if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
        barshift_H4 = iBarShift(Symbol(), PERIOD_D1, Time[i]);
      if(barshift_H4 < 0) continue;
      
      
      
      
      //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_D1,"PZ_TrendTrading_36dfbf04bb",0,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer1[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
              if(iCustom(NULL,PERIOD_D1,"PZ_TrendTrading_36dfbf04bb",1,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer2[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
  }







if(Period ()== 1440)
  {
         if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
        barshift_H4 = iBarShift(Symbol(), PERIOD_W1, Time[i]);
      if(barshift_H4 < 0) continue;
      
      
      
      
      //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_W1,"PZ_TrendTrading_36dfbf04bb",0,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer1[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
              if(iCustom(NULL,PERIOD_W1,"PZ_TrendTrading_36dfbf04bb",1,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer2[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
  }












if(Period ()== 10080)
  {
         if (i >= MathMin(5000-1, rates_total-1-50)) continue; //omit some old rates to prevent "Array out of range" or slow calculation   
      
        barshift_H4 = iBarShift(Symbol(), PERIOD_MN1, Time[i]);
      if(barshift_H4 < 0) continue;
      
      //Indicator Buffer 1
      if(iCustom(NULL,PERIOD_H4,"PZ_TrendTrading_36dfbf04bb",0,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer1[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
        
        
        
              if(iCustom(NULL,PERIOD_H4,"PZ_TrendTrading_36dfbf04bb",1,barshift_H4)!= EMPTY_VALUE  //Force Index is not equal to fixed value
      )
        {
         Buffer2[i] = 5; //Set indicator value at Candlestick Low
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
  }




































     }
   return(rates_total);
  }
//+------------------------------------------------------------------+