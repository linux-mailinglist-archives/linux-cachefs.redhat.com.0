Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 198B12B0628
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Nov 2020 14:20:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-hto4ZLjeNkChl-em_pupUw-1; Thu, 12 Nov 2020 08:20:04 -0500
X-MC-Unique: hto4ZLjeNkChl-em_pupUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2B53809DE2;
	Thu, 12 Nov 2020 13:20:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B09976198C;
	Thu, 12 Nov 2020 13:20:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B0CB181A06C;
	Thu, 12 Nov 2020 13:20:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AA7Y7cB022731 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 02:34:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF803200E211; Tue, 10 Nov 2020 07:34:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA43F205EB12
	for <linux-cachefs@redhat.com>; Tue, 10 Nov 2020 07:34:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7367B1021F8C
	for <linux-cachefs@redhat.com>; Tue, 10 Nov 2020 07:34:05 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-213-DEGjUs40Me2B_O0Hf9q9Wg-1; Tue, 10 Nov 2020 02:34:00 -0500
X-MC-Unique: DEGjUs40Me2B_O0Hf9q9Wg-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CVfk20J50zkYVw;
	Tue, 10 Nov 2020 15:33:46 +0800 (CST)
Received: from [10.174.179.106] (10.174.179.106) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 10 Nov 2020 15:33:54 +0800
To: <dhowells@redhat.com>
References: <20201110071126.2990722-1-yangerkun@huawei.com>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <f71f08d3-de6f-2d73-9062-30039f386e69@huawei.com>
Date: Tue, 10 Nov 2020 15:33:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20201110071126.2990722-1-yangerkun@huawei.com>
X-Originating-IP: [10.174.179.106]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AA7Y7cB022731
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:19:57 -0500
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH] fscache: add leave debug tracing in
	fscache_submit_op
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"

U29tZSBvdGhlciBwbGFjZSBtYXkgZXhpc3QgdGhpcyBwcm9ibGVtIHRvby4gV2lsbCBzZW5kIHRo
ZW0gdG9nZXRoZXIgbGF0dGVyLgoKVGhhbmtzLApLdW4uCgrU2iAyMDIwLzExLzEwIDE1OjExLCB5
YW5nZXJrdW4g0LS1wDoKPiBUaGVyZSBpcyBhIGVudGVyIHRyYWNpbmcgaW4gZnNjYWNoZV9zdWJt
aXRfb3Agd2l0aG91dCBhIGxlYXZlIHRyYWNpbmcuCj4gVGhpcyBtYXkgY29uZnVzZSBzb21lb25l
IHdoZW4gcmVhZCB0aGUgZGVidWcgbG9nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IHlhbmdlcmt1biA8
eWFuZ2Vya3VuQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBmcy9mc2NhY2hlL29wZXJhdGlvbi5jIHwg
MSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZnMvZnNjYWNoZS9vcGVyYXRpb24uYyBiL2ZzL2ZzY2FjaGUvb3BlcmF0aW9uLmMKPiBpbmRleCA0
YTU2NTFkNDkwNGUuLjAwY2M2YjA0MjBjYiAxMDA2NDQKPiAtLS0gYS9mcy9mc2NhY2hlL29wZXJh
dGlvbi5jCj4gKysrIGIvZnMvZnNjYWNoZS9vcGVyYXRpb24uYwo+IEBAIC0zMDksNiArMzA5LDcg
QEAgaW50IGZzY2FjaGVfc3VibWl0X29wKHN0cnVjdCBmc2NhY2hlX29iamVjdCAqb2JqZWN0LAo+
ICAgCX0KPiAgIAo+ICAgCXNwaW5fdW5sb2NrKCZvYmplY3QtPmxvY2spOwo+ICsJX2xlYXZlKCIg
PSAlZCIsIHJldCk7Cj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiAgIAo+IAoKCi0tCkxpbnV4LWNh
Y2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcw==

