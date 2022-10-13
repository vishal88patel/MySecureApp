package com.example.my_secure_app;

import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.POST;

public interface Api {

    String BASE_URL = "https://adminsecure.thriftyspends.com/api/";
    @POST("linkBank")
    Call<DataResponseModel> getPostCreateBodyResponse(
            @Header("Accept") String accept,
            @Header("Authorization") String authorization,
            @Body RequestBody file
    );

}