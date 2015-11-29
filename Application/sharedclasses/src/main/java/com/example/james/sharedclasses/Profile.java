package com.example.james.sharedclasses;

import android.graphics.Bitmap;

import java.io.Serializable;

/**
 * Created by Sneha on 11/19/15.
 */
public class Profile implements Serializable {
    private String name;
    private String email;
    private String occupation;
    private String phoneNumber;
    private Bitmap profilePicture;

    public Profile (String name, String occupation) {
        this.name = name;
        this.occupation = occupation;
    }
    public String getName() {
        return this.name;
    }
    public String getOccupation() {
        return this.occupation;
    }

}
