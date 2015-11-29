package com.share;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.example.james.sharedclasses.Profile;

/**
 * Created by Sneha on 11/26/15.
 */
public class FileFragment extends Fragment {
    Profile p;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle args = getArguments();
        p = (Profile)args.get("files");
    }

    @Override
    public View onCreateView(LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        // The last two arguments ensure LayoutParams are inflated
        // properly.
        View rootView = inflater.inflate(R.layout.contact_profile, container, false);

        ((TextView) rootView.findViewById(R.id.name)).setText(p.getName());
        //Integer.toString(args.getInt(ARG_OBJECT)));
        return rootView;
    }
}
