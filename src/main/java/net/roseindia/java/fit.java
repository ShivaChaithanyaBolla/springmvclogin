package net.roseindia.java;


import jxl.*;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.stage.Stage;  

import java.io.*;
import java.util.*;
public class fit extends Application{
 
static ArrayList<Dataset> set;
 @Override public void start(Stage stage) {
        stage.setTitle("Bar Chart Sample");
        final CategoryAxis xAxis = new CategoryAxis();
        final NumberAxis yAxis = new NumberAxis();
        final BarChart<String,Number> bc = 
            new BarChart<String,Number>(xAxis,yAxis);
        bc.setTitle("Room Fit Percentage");
        xAxis.setLabel("Room");       
        yAxis.setLabel("Fit");
		XYChart.Series<String,Number> series1 = new XYChart.Series<String,Number>();
        series1.setName("First Floor");  
        System.out.println(set.size());
        for(int i=0;i<set.size();i++){
        series1.getData().add(new XYChart.Data<String, Number>(Integer.toString(set.get(i).room), set.get(i).match*100));
        } 
        Scene scene  = new Scene(bc,800,600);
        bc.getData().add(series1);
        stage.setScene(scene);
        stage.show();
 }
 public ArrayList<Dataset> bayesian(ArrayList<Dataset> list,int param,String request){
  System.out.println("in");
	for(int i=0;i<list.size();i++){
    int param1=0;
   if(list.get(i).desc.contains(request))
     param1++;
   list.get(i).match=param1/param;
   System.out.println(list.get(i).room+" "+list.get(i).desc+" "+list.get(i).match);
  }
  return list;
 }
 public void call(){
  int parameters=1;
  Workbook wb=null;
     Sheet st=null;
     Cell c=null;
     int i=0;
     ArrayList<Dataset>sets=new ArrayList<Dataset>();
  while(true){
   try{
    wb=Workbook.getWorkbook(new File("C:/Users/S_Chaitu/workspace_SSDI_project/Fit Graph/src/DataSet.xls"));
    st=wb.getSheet("Sheet1");
    Dataset obj=new Dataset();
    c=st.getCell(0, i);
    obj.room=Integer.parseInt(c.getContents());
    c=st.getCell(1,i);
    obj.desc=c.getContents();
    i+=1;
    sets.add(obj);
   }
   catch(Exception e){
    break;
   }
  }
  System.out.println(sets.size());
  sets=bayesian(sets,parameters,"Gynecology");
  set=sets;
  System.out.println(set.size()+parameters);
  Application.launch();

 }
}
