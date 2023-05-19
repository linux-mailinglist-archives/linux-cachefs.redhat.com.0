Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4057096D4
	for <lists+linux-cachefs@lfdr.de>; Fri, 19 May 2023 13:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684497267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kbNCrYIV3z6Wf0skpVEK90mtDY7MEeoOyWIOfuTG5nU=;
	b=GTcJorgSQ5WsBiCpP/aNZnLi5paM0ZBCpBrwTBA2KBosIj3X34sBpCcyNuNxJyxi5Vgy/k
	YAIh4H/Y8an2RCDY1S862qDaFMLoAr/BF0p7ggG621V5qknw2VrDI+wpB3viJgRRW/hfgT
	NG6lMHzPj5/1U0KCETGLavYwWiNRozU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-jfCqM-UwPXG1L0KD1XkXRw-1; Fri, 19 May 2023 07:54:24 -0400
X-MC-Unique: jfCqM-UwPXG1L0KD1XkXRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38526185A792;
	Fri, 19 May 2023 11:54:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78B4C140E955;
	Fri, 19 May 2023 11:54:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4218D19465B7;
	Fri, 19 May 2023 11:54:22 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C34DE19465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 19 May 2023 11:54:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8F9DB4F2DE3; Fri, 19 May 2023 11:54:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8766A4F2DDE
 for <linux-cachefs@redhat.com>; Fri, 19 May 2023 11:54:20 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A001185A794
 for <linux-cachefs@redhat.com>; Fri, 19 May 2023 11:54:20 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-Ef5BkOy9MUuk1x6-AjR8Mg-1; Fri, 19 May 2023 07:54:19 -0400
X-MC-Unique: Ef5BkOy9MUuk1x6-AjR8Mg-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1ae408f4c19so20662655ad.2
 for <linux-cachefs@redhat.com>; Fri, 19 May 2023 04:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684497258; x=1687089258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RBx0CIh0/kePn2QF9ragLu/RfwxGJvqVO0V04dbl1dE=;
 b=WpItcZ8Vwyeezz97W7vY5dZ0AXshJ9joIaqKyLPpjQf8pWNUs4JbBgcuIac9owqCix
 keHEPxQaCKylzdDHnIZPU+4bq+3HxsPt8VRrz0ndJQ73x1uzfu2IgFiw7mWkiks4fNtk
 j8IWMiMVutK05YiyovEMOckw47R6DzcnNaAmrMXpc1K93JiiJkJ//QnKBugXXBfp9R1x
 fSQymJIIqgj1ZBlGYAszKfNHYrYBL+LhhIs0CB8FBlNzGlvWts53YAjAvPAyLH4AKikN
 8N4h2Q+XCF4sl/wVJ5h6mKQ4KG/KSE0coOD08pi9rpcMiKE1OnjudnJPl0MbP2CG60AZ
 gjpg==
X-Gm-Message-State: AC+VfDz3bb+GxII7WBznlTpkdIk/r3/wER+GGbIuiSmv9DxSJNrWYsVL
 idCRfwPd2uth8O29mFjXY2DqTY+bridGITt5n/hA+lDbDF56lwd3J3EZIdhpcdPfnPl2FOMJs0V
 WPJPFhzhyxwIqE/+6tG62INH4XDR9D+OAFl2xtA==
X-Received: by 2002:a17:903:1c5:b0:1ae:8a22:d0dd with SMTP id
 e5-20020a17090301c500b001ae8a22d0ddmr818839plh.58.1684497258308; 
 Fri, 19 May 2023 04:54:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79N0vlW/qV83ffVIcIqSM2B8isohuWoPAGdZvEq/o2vzWih+3ZQHmxa5F7RVG0E/bPDqtZ6ziJ1EvSK9Q0X70=
X-Received: by 2002:a17:903:1c5:b0:1ae:8a22:d0dd with SMTP id
 e5-20020a17090301c500b001ae8a22d0ddmr818826plh.58.1684497258028; Fri, 19 May
 2023 04:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
 <CALF+zO=1oASFeb5WOezeZm_fbCuw=L8AL-n-mbCt8A==ZMAy3Q@mail.gmail.com>
 <CAAmbk-cgTR+FxLY2C=upuPBwNaBYff=GHedXyQiFf=Hr5i3G0A@mail.gmail.com>
In-Reply-To: <CAAmbk-cgTR+FxLY2C=upuPBwNaBYff=GHedXyQiFf=Hr5i3G0A@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 19 May 2023 07:53:41 -0400
Message-ID: <CALF+zO=vjPjs8QevssUmGHA_bZaTaF3HcqQa+OQgxegqB5yzmw@mail.gmail.com>
To: Chris Chilvers <chilversc@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [BUG] fscache writing but not reading
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Benjamin Maynard <benmaynard@google.com>, linux-nfs@vger.kernel.org,
 linux-cachefs@redhat.com, brennandoyle@google.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgNDoyMeKAr1BNIENocmlzIENoaWx2ZXJzIDxjaGlsdmVy
c2NAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMTYgTWF5IDIwMjMgYXQgMjA6MjgsIERh
dmlkIFd5c29jaGFuc2tpIDxkd3lzb2NoYUByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBU
dWUsIE1heSAxNiwgMjAyMyBhdCAxMTo0MuKAr0FNIENocmlzIENoaWx2ZXJzIDxjaGlsdmVyc2NA
Z21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gV2hpbGUgdGVzdGluZyB0aGUgZnNjYWNoZSBw
ZXJmb3JtYW5jZSBmaXhlcyBbMV0gdGhhdCB3ZXJlIG1lcmdlZCBpbnRvIDYuNC1yYzEKPiA+ID4g
aXQgYXBwZWFycyB0aGF0IHRoZSBjYWNoaW5nIG5vIGxvbmdlciB3b3Jrcy4gVGhlIGNsaWVudCB3
aWxsIHdyaXRlIHRvIHRoZSBjYWNoZQo+ID4gPiBidXQgbmV2ZXIgcmVhZHMuCj4gPiA+Cj4gPiBU
aGFua3MgZm9yIHRoZSByZXBvcnQuCj4gPgo+ID4gSWYgeW91IHJlYm9vdCBkbyB5b3Ugc2VlIHJl
YWRzIGZyb20gdGhlIGNhY2hlPwo+Cj4gT24gdGhlIGZpcnN0IHJlYWQgYWZ0ZXIgYSByZWJvb3Qg
aXQgdXNlcyB0aGUgY2FjaGUsIGJ1dCBzdWJzZXF1ZW50Cj4gcmVhZHMgZG8gbm90IHVzZSB0aGUg
Y2FjaGUuCj4KPiA+IFlvdSBjYW4gY2hlY2sgaWYgdGhlIGNhY2hlIGlzIGJlaW5nIHJlYWQgZnJv
bSBieSBsb29raW5nIGluCj4gPiAvcHJvYy9mcy9mc2NhY2hlL3N0YXRzCj4gPiBhdCB0aGUgIklP
IiBsaW5lOgo+ID4gIyBncmVwIElPIC9wcm9jL2ZzL2ZzY2FjaGUvc3RhdHMKPiA+IElPICAgICA6
IHJkPTgwMDMwIHdyPTAKPgo+IFJ1bm5pbmcgdGhlIHRlc3RzIDQgdGltZXMgKHR3aWNlIGJlZm9y
ZSByZWJvb3QsIGFuZCB0d2ljZSBhZnRlcikgZ2l2ZQo+IHRoZSBmb2xsb3dpbmcgbWV0cmljczoK
PiBGUy1DYWNoZSBJL08gKGRlbHRhKQo+IFJ1biAgICAgICByZCAgICAgICAgd3IKPiAgMSAgICAg
ICAgIDAgICAgMzksMjUwCj4gIDIgICAgICAgMTMwICAgIDM4LDg5NAo+ICAzICAgIDM5LDAwMCAg
ICAgICAgIDAKPiAgNCAgICAgICAgNzIgICAgMzgsOTkxCj4KPiA+IENhbiB5b3Ugc2hhcmU6Cj4g
PiAxLiBORlMgc2VydmVyIHlvdSdyZSB1c2luZyAoaXMgaXQgbG9jYWxob3N0IG9yIHNvbWV0aGlu
ZyBlbHNlKQo+ID4gMi4gTkZTIHZlcnNpb24KPgo+IFRoZSBORlMgc2VydmVyIGFuZCBjbGllbnQg
YXJlIHNlcGFyYXRlIFZNcyBvbiB0aGUgc2FtZSBuZXR3b3JrLgo+IFNlcnZlciBORlMgdmVyc2lv
bjogVWJ1bnR1IDIyLjA0IGphbW15LCBrZXJuZWwgNS4xNS4wLTEwMjEtZ2NwCj4gQ2xpZW50IE5G
UyB2ZXJzaW9uOiBVYnVudHUgMjIuMDQgamFtbXksIGtlcm5lbCA2LjQuMC0wNjA0MDByYzEtZ2Vu
ZXJpYwo+IChodHRwczovL2tlcm5lbC51YnVudHUuY29tL35rZXJuZWwtcHBhL21haW5saW5lL3Y2
LjQtcmMxLykKPiBDbGllbnQgbmZzLXV0aWxzOiAyLjYuMy1yYzYKPiBDbGllbnQgY2FjaGVmaWxl
c2Q6IDAuMTAuMTAtMC4ydWJ1bnR1MQo+Cj4gPiBJbiBhZGRpdGlvbiB0byBjaGVja2luZyB0aGUg
YWJvdmUgZm9yIHRoZSByZWFkcyBmcm9tIHRoZSBjYWNoZSwgeW91IGNhbiBhbHNvCj4gPiBzZWUg
d2hldGhlciBORlMgcmVhZHMgYXJlIGdvaW5nIG92ZXIgdGhlIHdpcmUgcHJldHR5IGVhc2lseSB3
aXRoIGEgc2ltaWxhcgo+ID4gdGVjaG5pcXVlLgo+ID4KPiA+IENvcHkgL3Byb2Mvc2VsZi9tb3Vu
c3RhdHMgdG8gYSBmaWxlIGJlZm9yZSB5b3VyIHRlc3QsIHRoZW4gbWFrZSBhIHNlY29uZCBjb3B5
Cj4gPiBhZnRlciB0aGUgdGVzdCwgdGhlbiBydW4gbW91bnRzdGF0cyBhcyBmb2xsb3dzOgo+ID4g
bW91bnRzdGF0cyAtUyAvdG1wL21vdW50c3RhdHMuMSAtZiAvdG1wL21vdW50c3RhdHMuMgo+Cj4g
YXBwIHJlYWQgICAgPSBhcHBsaWNhdGlvbnMgcmVhZCBieXRlcyB2aWEgcmVhZCgyKQo+IGNsaWVu
dCByZWFkID0gY2xpZW50IHJlYWQgYnl0ZXMgdmlhIE5GUyBSRUFECj4KPiBSdW4gICAgICAgICAg
IGFwcCByZWFkICAgICAgICBjbGllbnQgcmVhZAo+ICAxICAgICAzMjIsMTIyLDU0NywyMDAgICAg
MzIyLDEyMiw1NDcsMjAwCj4gIDIgICAgIDMyMiwxMjIsNTQ3LDIwMCAgICAzMjEsMDQ4LDgwNSwz
NzYKPiAgMyAgICAgMzIyLDEyMiw1NDcsMjAwICAgICAgICAgICAgICAgICAgMAo+ICA0ICAgICAz
MjIsMTIyLDU0NywyMDAgICAgMzIxLDU5MywwNTMsMTg0Cj4KPiBJJ3ZlIHB1dCB0aGUgZnVsbCBk
YXRhIGluIGEgR2l0SHViIGdpc3QsIGFsb25nIHdpdGggYSBncmFwaCBjb2xsZWN0ZWQKPiBmcm9t
IGEgbWV0cmljcyBhZ2VudDoKPiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9jaGlsdmVyc2MvNTRl
Yjc2MTU1YWQzN2I2NmNiODUxODZlNzQ0OWJlYWEKPiBodHRwczovL2dpc3QuZ2l0aHVidXNlcmNv
bnRlbnQuY29tL2NoaWx2ZXJzYy81NGViNzYxNTVhZDM3YjY2Y2I4NTE4NmU3NDQ5YmVhYS9yYXcv
MDk4MjhjNTk2ZDBjZmM0NGJjMGViNjdmNDBlNDAzM2RiMjAyMzI2ZS9tZXRyaWNzLnBuZwo+CgpU
aGFua3MgQ2hyaXMgZm9yIGFsbCB0aGlzIGluZm8uICBJIHNlZSB5b3UncmUgdXNpbmcgTkZTdjMg
c28gSSdsbApmb2N1cyBvbiB0aGF0LCBhbmQgcmV2aWV3IGFsbCB0aGlzIGluZm8gZm9yIGNsdWVz
LgpJIGFsc28gaGF2ZSBiZWVuIHdvcmtpbmcgb24gc29tZSB1cGRhdGVkIHRlc3QgY2FzZXMgYW5k
IHNlZSBzb21lIHZlcnkKdW51c3VhbCBiZWhhdmlvciBsaWtlIHlvdSdyZSByZXBvcnRpbmcuCgpJ
IGFsc28gY29uZmlybWVkIHRoYXQgYWRkaW5nIHRoZSB0d28gcGF0Y2hlcyBmb3IgIklzc3VlICMx
IiAgb250bwo2LjQtcmMxIHJlc29sdmUgX21vc3RfIG9mIHRoZSBjYWNoaW5nIGlzc3Vlcy4KSG93
ZXZlciwgZXZlbiBhZnRlciB0aG9zZSBwYXRjaGVzLCBpbiBzb21lIGxpbWl0ZWQgaW5zdGFuY2Vz
LCB0aGVyZQphcmUgc3RpbGwgTkZTIHJlYWRzIG92ZXIgdGhlIHdpcmUgd2hlbiB0aGVyZSBzaG91
bGQgb25seSBiZSByZWFkcyBmcm9tCnRoZSBjYWNoZS4KVGhlcmUgbWF5IGJlIG11bHRpcGxlIGJ1
Z3MgaGVyZS4KCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVk
aGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWNhY2hlZnMK

