最后加入

========================================================================


.method private setGeoDescription(Lcom/android/internal/telephony/CallerInfo;)V
    .locals 3
    .parameter "info"

    .prologue
    const/16 v2, 0x8

    .line 36
    if-nez p1, :cond_1

    .line 51
    :cond_0
    :goto_0
    return-void

    .line 38
    :cond_1
    iget-object v0, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-ne v0, v2, :cond_0

    .line 39
    iget-object v0, p1, Lcom/android/internal/telephony/CallerInfo;->geoDescription:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 40
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p1, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/android/internal/telephony/CallerInfo;->updateGeoDescription(Landroid/content/Context;Ljava/lang/String;)V

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/android/internal/telephony/CallerInfo;->geoDescription:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 44
    iget-object v0, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/android/internal/telephony/CallerInfo;->geoDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    iget-object v0, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    iget v1, p0, Lcom/android/phone/CallCard;->mTextColorCallTypeSip:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    iget-object v0, p1, Lcom/android/internal/telephony/CallerInfo;->geoDescription:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method


========================================================================

ics 4.0 的情况----
查找类似（关键字updateSocialStatus）：

invoke-direct {p0, v14, v13, v0}, Lcom/android/phone/CallCard;->updateSocialStatus(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/internal/telephony/Call;)V


========================================================================

后添加两句

========================================================================
        
    move-object/from16 v0, p1
        
    invoke-direct {p0, v0}, Lcom/android/phone/CallCard;->setGeoDescription(Lcom/android/internal/telephony/CallerInfo;)V
	
========================================================================

如果你的手机找到是类似或提示All register args must fit in 4 bits：

	invoke-direct {v0, v1, v2, v3}, Lcom/android/phone/CallCard;->updateSocialStatus(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/internal/telephony/Call;)V

========================================================================
将上面两句改成：

	invoke-direct/range {p0 .. p1}, Lcom/android/phone/CallCard;->setGeoDescription(Lcom/android/internal/telephony/CallerInfo;)V

========================================================================
-------ics 4.0结束---------

========================================================================

-----jb 4.1的情况------
查找类似（关键字updateCallTypeLabel）：


    .line 1372
    :goto_a3
    invoke-direct {p0, p4}, Lcom/android/phone/CallCard;->updateCallTypeLabel(Lcom/android/internal/telephony/Call;)V


========================================================================

后添加一句：

invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->setGeoDescription(Lcom/android/internal/telephony/CallerInfo;)V




========================================================================
