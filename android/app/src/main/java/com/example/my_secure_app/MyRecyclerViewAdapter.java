package com.example.my_secure_app;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;

class MyRecyclerViewAdapter extends RecyclerView.Adapter<MyRecyclerViewAdapter.ViewHolder> {

   private List<String> mData;
   private LayoutInflater mInflater;

   // data is passed into the constructor
   MyRecyclerViewAdapter(Context context, List<String> data) {
       this.mInflater = LayoutInflater.from(context);
       this.mData = data;
   }

   // inflates the row layout from xml when needed


   @NonNull
   @Override
   public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
       View view = mInflater.inflate(R.layout.sample, parent, false);
       return new ViewHolder(view);
   }

   // binds the data to the TextView in each row
   @Override
   public void onBindViewHolder(ViewHolder holder, int position) {
       String animal = mData.get(position);
       holder.myTextView.setText(animal);
   }

   // total number of rows
   @Override
   public int getItemCount() {
       return mData.size();
   }

   public void updateData(ArrayList<String> viewModels) {
       mData.clear();
       mData.addAll(viewModels);
       notifyDataSetChanged();
   }


   // stores and recycles views as they are scrolled off screen
   public class ViewHolder extends RecyclerView.ViewHolder {
       TextView myTextView;

       ViewHolder(View itemView) {
           super(itemView);
           myTextView = itemView.findViewById(R.id.tvAnimalName);
       }

   }

   // convenience method for getting data at click position
   String getItem(int id) {
       return mData.get(id);
   }


}