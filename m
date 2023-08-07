Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9967724DD
	for <lists+linux-cachefs@lfdr.de>; Mon,  7 Aug 2023 15:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691413365;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5X5cUumQ8jjaK/zZ+bX2FRL7/TN5nGYa/Z0Yh2JNv3I=;
	b=AXMUOZgUMiLG6aB0SOnLyoDhf63jQEJbyqf/EpUbEc2OTpmPlPS7LKgr+DXa7OnwFrTaGa
	UNLI02birDBh7vbHaqIAGmDUirWWf6x+MQyxcUkckTn9CM5gsXoZVuIdG9pHvF0NGT0SaP
	/Riz+t5E51NgWEPpA0+lrbyvc3qPaqM=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-vuPd7oINP6ylWTOqScGW_g-1; Mon, 07 Aug 2023 09:02:42 -0400
X-MC-Unique: vuPd7oINP6ylWTOqScGW_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B76E13C1392A;
	Mon,  7 Aug 2023 13:02:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB26C15BAE;
	Mon,  7 Aug 2023 13:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 591271946589;
	Mon,  7 Aug 2023 13:02:39 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 07E751946586 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 13:02:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E324F40C2077; Mon,  7 Aug 2023 13:02:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3D740C2076
 for <linux-cachefs@redhat.com>; Mon,  7 Aug 2023 13:02:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A462D185A793
 for <linux-cachefs@redhat.com>; Mon,  7 Aug 2023 13:02:36 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-u7-Gq-I8OiCbdPS8CA8b-A-1; Mon, 07 Aug 2023 09:02:35 -0400
X-MC-Unique: u7-Gq-I8OiCbdPS8CA8b-A-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-268108bc663so3253638a91.0
 for <linux-cachefs@redhat.com>; Mon, 07 Aug 2023 06:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691413354; x=1692018154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUSA/drDlXzaJJxyxnXxIlLWbuHh4t5kfnROUfdbMY4=;
 b=PRjALQbSff2VvsX2XMz+03gqq+ScfLkUSQK9aXwEiSdMP7vUgFRUVoyOp0ILKxd2e/
 Me29Dp/gWx2SycgnCw15+Nujpsfg3yZQjHHUvt+kiYl8JL+8qeXFFntslqL9YA9kOcjj
 YhkuAV6ZX/6k5XSGPP0Vv+767ZkSVQ95MWW2TNw1UsJiYRIiaZuV/MJKtQ7g30XJkAk9
 VTNsLND0gxuSuIbARLjN4FyUMzvI+ZrQFrohIG9FY+ZhDmaHmgODtZZaPEuMBMMAMl70
 y+M8DuIYRvRXanJ5+R3lQqqcRxQREXotZdDenDBSLuT/a1ipxd9zbVQGoJpFA2N8Oy/Q
 FkVg==
X-Gm-Message-State: AOJu0Yx+bWYAHNeoEY+rC25t3IO15tMSK+X+f065Em+wDUvWKPb4ZfIQ
 P1mtUu9eY0pmpuQhvgZMskYWiwWfuOzyo2vrA4ZvpjWkYE+KEcy424sCQIlQSOxnYqoqTHWdgC0
 IWu1K4IevAb5QIh2unzFC+2pSUbnsdIhllPNScIvX669C/Q==
X-Received: by 2002:a17:90a:e605:b0:269:18f5:683e with SMTP id
 j5-20020a17090ae60500b0026918f5683emr8095420pjy.3.1691413353737; 
 Mon, 07 Aug 2023 06:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9uF/8jMUpVkC+hkstlGWNac5P6e0LitYy6svLDaLTca//wZsmZtbcEBh90ywpawPDWdptgbPW2jQ783QKmyI=
X-Received: by 2002:a17:90a:e605:b0:269:18f5:683e with SMTP id
 j5-20020a17090ae60500b0026918f5683emr8095398pjy.3.1691413353380; Mon, 07 Aug
 2023 06:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <4b41feb3-cfa6-6a74-6505-d9a049139eb3@salscheider.org>
 <CALF+zOmrugawBwB7UgOjZweR-Hp9Lotg6nTrPj=f4zvboYBE8w@mail.gmail.com>
 <7d87ade9-a2a4-8265-50cc-c882e9837d1c@salscheider.org>
In-Reply-To: <7d87ade9-a2a4-8265-50cc-c882e9837d1c@salscheider.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 7 Aug 2023 09:01:57 -0400
Message-ID: <CALF+zO=s24ud_EOn40h-t-+O_VmdCn4HKABgN=sCFj8x32BFEA@mail.gmail.com>
To: Ole Salscheider <ole@salscheider.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] Files read from NFS instead of fscache when
 also in pagecache
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA5OjMx4oCvQU0gT2xlIFNhbHNjaGVpZGVyIDxvbGVAc2Fs
c2NoZWlkZXIub3JnPiB3cm90ZToKPgo+Cj4KPiBPbiAwMi4wOC4yMyAxNzowOCwgRGF2aWQgV3lz
b2NoYW5za2kgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAyLCAyMDIzIGF0IDM6MzXigK9BTSBPbGUg
U2Fsc2NoZWlkZXIgPG9sZUBzYWxzY2hlaWRlci5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gSGVsbG8s
Cj4gPj4KPiA+PiBJIG5vdGljZWQgc29tZSBzdHJhbmdlIGJlaGF2aW91ciBvZiBmc2NhY2hlIHdp
dGgga2VybmVsIDYuNC54IGluCj4gPj4gY29tYmluYXRpb24gd2l0aCBORlMgKHY0LjIpIGFuZCB0
aGUgcGFnZWNhY2hlLgo+ID4+Cj4gPj4gSSBoYXZlIG11bHRpcGxlIGNsaWVudHMgbW91bnRpbmcg
YW4gTkZTIHY0LjIgZmlsZSBzeXN0ZW0gZnJvbSBhIHNlcnZlcgo+ID4+IGFuZCBjYWNoaW5nIHRo
ZSBkYXRhIGxvY2FsbHkgdXNpbmcgZnNjYWNoZS4gQWZ0ZXIgYm9vdGluZyB0aGUgY2xpZW50cywK
PiA+PiBtb3N0IGRhdGEgaXMgc2VydmVkIGZyb20gZnNjYWNoZSBhbmQgb25seSBhIGZldyByZXF1
ZXN0cyBoaXQgdGhlIE5GUwo+ID4+IHNlcnZlci4gQnV0IGFmdGVyIHNvbWUgbWludXRlcyBvZiBv
cGVyYXRpb24gKHdoaWNoIHR5cGljYWxseSBpbmNsdWRlcyBhCj4gPj4gbG90IG9mIGN5Y2xpYyBk
YXRhIHJlYWRpbmcgZm9yIHVzKSwgZmV3ZXIgYW5kIGZld2VyIGZpbGVzIGFyZSBzZXJ2ZWQKPiA+
PiBmcm9tIGZzY2FjaGUgYW5kIG1vc3QgYXJlIHNlcnZlZCBieSB0aGUgTkZTIHNlcnZlci4KPiA+
PiBJdCBzZWVtcyB0aGF0IHRoaXMgaGFzIHNvbWV0aGluZyB0byBkbyB3aXRoIHRoZSBmaWxlcyBi
ZWluZyBhbHNvIGluIHRoZQo+ID4+IHBhZ2VjYWNoZS4gSWYgSSBwZXJpb2RjYWxseSBkcm9wIHRo
ZSBwYWdlY2FjaGUgd2l0aCAiZWNobyAzID4KPiA+PiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMi
LCB0aGVuIG1vc3Qgb2YgdGhlIGZpbGVzIGFyZSBzZXJ2ZWQgZnJvbQo+ID4+IGZzY2FjaGUgYWdh
aW4uCj4gPj4KPiA+PiBJcyB0aGlzIGEga25vd24gcHJvYmxlbT8gSWYgbm90LCBkbyB5b3UgaGF2
ZSBhbnkgc3VnZ2VzdGlvbiBob3cgSSBjYW4KPiA+PiB0cnkgdG8gZmluZCB0aGUgcm9vdCBjYXVz
ZT8KPiA+Pgo+ID4KPiA+IFllcyB0aGlzIGlzIG1vc3QgbGlrZWx5IGEga25vd24gcHJvYmxlbSB3
aXRoIGEgZml4IG5vdyBpbiB0aGUKPiA+IG1tLXVuc3RhYmxlIGJyYW5jaCBhdAo+ID4gZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FrcG0vbW0KPiA+IElmIGl0
J3MgdGhlIHNhbWUgcHJvYmxlbSwgdGFrZSB0aGVzZSAzIHBhdGNoZXMgYW5kIHRoYXQgc2hvdWxk
IGZpeCBpdDoKPiA+IDZmYmVmYmUxNzRjYSBtbTogY2FsbCBmb2xpb19tYXBwaW5nKCkgaW5zaWRl
IGZvbGlvX25lZWRzX3JlbGVhc2UoKQo+ID4gMDRjYjhkZGFiOTAyIG1tLCBuZXRmcywgZnNjYWNo
ZTogc3RvcCByZWFkIG9wdGltaXNhdGlvbiB3aGVuIGZvbGlvCj4gPiByZW1vdmVkIGZyb20gcGFn
ZWNhY2hlCj4gPiA4NTRmYzhhNTY3YWIgbW06IG1lcmdlIGZvbGlvX2hhc19wcml2YXRlKCkvZmls
ZW1hcF9yZWxlYXNlX2ZvbGlvKCkgY2FsbCBwYWlycwo+ID4KPiA+IFRoZSBtYWluIHBhdGNoIHRo
YXQgZml4ZXMgaXQgaXMgIjA0Y2I4ZGRhYjkwMiBtbSwgbmV0ZnMsIGZzY2FjaGU6IFN0b3AKPiA+
IHJlYWQgb3B0aW1pc2F0aW9uIHdoZW4gZm9saW8gcmVtb3ZlZCBmcm9tIHBhZ2VjYWNoZSIgYnV0
IHRoZXJlJ3MgYQo+ID4gcHJlcmVxdWlzaXRlIHBhdGNoIGFuZCBhIGZpeHVwIHBhdGNoLgo+Cj4g
SSByYW4gc29tZSB0ZXN0cyB5ZXN0ZXJkYXkgYW5kIHRvZGF5LCBhbmQgaXQgc2VlbXMgdGhhdCB0
aGVzZSBwYXRjaGVzCj4gZml4IHRoZSBwcm9ibGVtIGNvbXBsZXRlbHkuIFRoYW5rcyEKPgoKR3Jl
YXQhICBUaGFuayB5b3UgZm9yIHRoZSByZXBvcnQsIGFuZCBmb2xsb3cgdXAgdmVyaWZpY2F0aW9u
IS4KCj4gPgo+ID4KPiA+PiBUaGFuayB5b3UgaW4gYWR2YW5jZSEKPiA+Pgo+ID4+IEJlc3QgcmVn
YXJkcywKPiA+Pgo+ID4+IE9sZQo+ID4+Cj4gPj4gLS0KPiA+PiBMaW51eC1jYWNoZWZzIG1haWxp
bmcgbGlzdAo+ID4+IExpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQo+ID4+IGh0dHBzOi8vbGlzdG1h
bi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo+ID4+Cj4gPgo+Cgot
LQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

