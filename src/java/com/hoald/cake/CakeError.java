/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cake;

/**
 *
 * @author dell
 */
public class CakeError {
    private String idError;
    private String nameError;
    private String imagePathError;
    private String priceError;
    private String createDateError;
    private String expirationError;
    private String quantityError;
    private String statusError;

    public CakeError(String idError, String nameError, String imagePathError, String priceError, String createDateError, String expirationError, String quantityError, String statusError) {
        this.idError = idError;
        this.nameError = nameError;
        this.imagePathError = imagePathError;
        this.priceError = priceError;
        this.createDateError = createDateError;
        this.expirationError = expirationError;
        this.quantityError = quantityError;
        this.statusError = statusError;
    }

    public CakeError() {
    }

    public String getIdError() {
        return idError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getImagePathError() {
        return imagePathError;
    }

    public void setImagePathError(String imagePathError) {
        this.imagePathError = imagePathError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getCreateDateError() {
        return createDateError;
    }

    public void setCreateDateError(String createDateError) {
        this.createDateError = createDateError;
    }

    public String getExpirationError() {
        return expirationError;
    }

    public void setExpirationError(String expirationError) {
        this.expirationError = expirationError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }
}
