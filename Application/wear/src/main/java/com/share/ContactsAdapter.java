package com.share;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;

/**
 * Created by james on 11/28/15.
 */
public class ContactsAdapter extends BaseAdapter {
    private Context ctx = null;
    private String[] contacts = { "Bob", "Joe",
            "Sarah", "James", "John", "Jacqueline", "Diane", "Janet", "George"};

    public ContactsAdapter(Context context) {
        this.ctx = context;
    }

    @Override
    public int getCount() {
        return contacts.length;
    }

    @Override
    public View getView(int arg0, View arg1, ViewGroup arg2) {
        ImageView imgView = new ImageView(this.ctx);
        imgView.setScaleType(ImageView.ScaleType.FIT_END);
        imgView.setPadding(8, 8, 8, 8);
        imgView.setImageResource(R.drawable.face4);
        imgView.setAdjustViewBounds(Boolean.TRUE);
        imgView.setContentDescription(contacts[arg0]);
        imgView.setMaxHeight(100);
        imgView.setMaxWidth(100);

        return imgView;
    }

    @Override
    public long getItemId(int arg0) {
       return R.drawable.face4;
    }

    @Override
    public Object getItem(int arg0) {
        return contacts[arg0];
    }
}
