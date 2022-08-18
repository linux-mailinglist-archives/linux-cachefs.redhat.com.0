Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB15982FC
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 14:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660824951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IIOmbyyrG6uQmvlxahkC12ieKXkyW66+bgQY0gkW8eY=;
	b=Dcx+Ij6Z+Cgr9h/yymRWaMXVTl24ImZJWSJ89RZtp2mM1dfOYIFP9YMlDysWLgEpFeslUe
	dTCwbTcjrp+9/dCPEY4hQou9Jj/abRBTlkfhzIqKwC5H8wNXnsZTiEJepkpzcXMMEG0N1U
	+BHGs6c+HlVixq2wuY1U9IkhCZNoI2A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-lkmAEgn0NoGe0DrYLdD-bw-1; Thu, 18 Aug 2022 08:15:48 -0400
X-MC-Unique: lkmAEgn0NoGe0DrYLdD-bw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D27F294EDF9;
	Thu, 18 Aug 2022 12:15:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79B1E40466A7;
	Thu, 18 Aug 2022 12:15:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4A49C194E12A;
	Thu, 18 Aug 2022 12:15:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC5DE1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 12:15:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD70F2026D07; Thu, 18 Aug 2022 12:15:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9BD82026D4C
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 12:15:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3763294EDF9
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 12:15:45 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-302-0gSjH4r-O2ingDkB4wUXCQ-1; Thu, 18 Aug 2022 08:15:42 -0400
X-MC-Unique: 0gSjH4r-O2ingDkB4wUXCQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VMal8Wq_1660824937
Received: from 30.227.66.106(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VMal8Wq_1660824937) by smtp.aliyun-inc.com;
 Thu, 18 Aug 2022 20:15:38 +0800
Message-ID: <b98cb85c-cac2-9117-12fd-570d246b20d3@linux.alibaba.com>
Date: Thu, 18 Aug 2022 20:15:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Sun Ke <sunke32@huawei.com>, dhowells@redhat.com
References: <20220818111935.1683062-1-sunke32@huawei.com>
 <e4e18421-7820-f1e3-6762-5959c2bd7ea4@linux.alibaba.com>
 <adf4b4c2-75a2-705d-8870-df130fb583fb@huawei.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <adf4b4c2-75a2-705d-8870-df130fb583fb@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Linux-cachefs] [v2] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CgpPbiA4LzE4LzIyIDc6MjcgUE0sIFN1biBLZSB3cm90ZToKPiAKPiAKPiDlnKggMjAyMi84LzE4
IDE5OjE0LCBKZWZmbGVYdSDlhpnpgZM6Cj4+Cj4+Cj4+IE9uIDgvMTgvMjIgNzoxOSBQTSwgU3Vu
IEtlIHdyb3RlOgo+Pj4gSWYgc2l6ZSA8IDA7IG9wZW4gcmVxdWVzdCB3aWxsIGZhaWwsIGJ1dCBj
YWNoZWZpbGVzX29uZGVtYW5kX2NvcGVuCj4+PiByZXR1cm4gMC4KPj4+IEZpeCB0byByZXR1cm4g
YSBuZWdhdGl2ZSBlcnJvciBjb2RlLgo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIGFsc28gdXBkYXRl
IHRoZSBjb21taXQgbG9nPwo+IAo+IFRoZSBjYWNoZV9zaXplIGZpZWxkIG9mIGNvcGVuIGlzIHNw
ZWNpZmllZCBieSB0aGUgdXNlciBkYWVtb24uIElmCj4gY2FjaGVfc2l6ZSA8IDAsIHRoZW4gdGhl
IE9QRU4gcmVxdWVzdCBpcyBleHBlY3RlZCB0byBmYWlsLCB3aGlsZSBjb3Blbgo+IGl0c2VsZiBz
aGFsbCBzdWNjZWVkLiBIb3dldmVyLCByZXR1cm4gMCBpcyBpbmRlZWQgdW5leHBlY3RlZCB3aGVu
CgkJCQkgICBeCgkJCQlyZXR1cm5pbmcKCj4gY2FjaGVfc2l6ZSBpcyBhbiBpbnZhbGlkIGVycm9y
IGNvZGUuCgo+IEZpeCB0byByZXR1cm4gYSBuZWdhdGl2ZSBlcnJvciBjb2RlLgoKRml4IHRoaXMg
YnkgcmV0dXJuaW5nIGVycm9yIHdoZW4gY2FjaGVfc2l6ZSBpcyBhbiBpbnZhbGlkIGVycm9yIGNv
ZGUuCgoKPj4KPj4gT3RoZXJ3aXNlIExHVE0uCj4+Cj4+IFJldmlld2VkLWJ5OiBKaW5nYm8gWHUg
PGplZmZsZXh1QGxpbnV4LmFsaWJhYmEuY29tPgo+Pgo+Pgo+PiBCVFcsIGFsc28gY2MgbGludXgt
ZnNkZXZlbEB2Z2VyLmtlcm5lbC5vcmcKPj4KPj4+Cj4+PiBGaXhlczogYzgzODMwNTQ1MDZjICgi
Y2FjaGVmaWxlczogbm90aWZ5IHRoZSB1c2VyIGRhZW1vbiB3aGVuIGxvb2tpbmcKPj4+IHVwIGNv
b2tpZSIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBTdW4gS2UgPHN1bmtlMzJAaHVhd2VpLmNvbT4KPj4+
IC0tLQo+Pj4gwqAgZnMvY2FjaGVmaWxlcy9vbmRlbWFuZC5jIHwgMiArLQo+Pj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2NhY2hlZmlsZXMvb25kZW1hbmQuYyBiL2ZzL2NhY2hlZmlsZXMvb25kZW1hbmQuYwo+
Pj4gaW5kZXggMWZlZTcwMmQ1NTI5Li5lYThhMWU4MzE3ZDkgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9j
YWNoZWZpbGVzL29uZGVtYW5kLmMKPj4+ICsrKyBiL2ZzL2NhY2hlZmlsZXMvb25kZW1hbmQuYwo+
Pj4gQEAgLTE1OSw3ICsxNTksNyBAQCBpbnQgY2FjaGVmaWxlc19vbmRlbWFuZF9jb3BlbihzdHJ1
Y3QKPj4+IGNhY2hlZmlsZXNfY2FjaGUgKmNhY2hlLCBjaGFyICphcmdzKQo+Pj4gwqDCoMKgwqDC
oCAvKiBmYWlsIE9QRU4gcmVxdWVzdCBpZiBkYWVtb24gcmVwb3J0cyBhbiBlcnJvciAqLwo+Pj4g
wqDCoMKgwqDCoCBpZiAoc2l6ZSA8IDApIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIUlT
X0VSUl9WQUxVRShzaXplKSkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemUgPSAtRUlO
VkFMOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc2l6ZSA9IC1FSU5WQUw7Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVxLT5lcnJvciA9IHNpemU7Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byBvdXQ7Cj4+PiDCoMKgwqDCoMKgIH0KPj4KCi0tIApUaGFua3MsCkppbmdibwoK
LS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0
dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

