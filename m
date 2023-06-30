Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA0743329
	for <lists+linux-cachefs@lfdr.de>; Fri, 30 Jun 2023 05:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688095590;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uWcT2O3U9+vSUN39UJkgABBiVnIFk8OQHA6zGLdF5wY=;
	b=X3NjKOYB2UxYBYJcasVANkCF+lBawRBi29HA7DTw2Co6yR1tUH6bwyfiSd9zAO7smIovGF
	rTkjbIgKcvyBEnpfkRw0WVPrn/7/LwDQ9lDuzgu8nP9Cuq07Xjce4S6QnvFgDK1u3R8o8t
	KaSO/OLpYzthRqi1BKY1w5YwZV8J1bA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-oKoF4P7_NsO322CoKHp5bw-1; Thu, 29 Jun 2023 23:26:24 -0400
X-MC-Unique: oKoF4P7_NsO322CoKHp5bw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25CE481D9EC;
	Fri, 30 Jun 2023 03:26:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02B982166B25;
	Fri, 30 Jun 2023 03:26:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5BAA51946A41;
	Fri, 30 Jun 2023 03:26:22 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AFC921946595 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 30 Jun 2023 03:26:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 583CA48FB01; Fri, 30 Jun 2023 03:26:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5069F492B02
 for <linux-cachefs@redhat.com>; Fri, 30 Jun 2023 03:26:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8ECF38041CF
 for <linux-cachefs@redhat.com>; Fri, 30 Jun 2023 03:26:20 +0000 (UTC)
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-8-1xpQD9YLMRS1L8PyHrYNkw-1; Thu, 29 Jun 2023 23:26:15 -0400
X-MC-Unique: 1xpQD9YLMRS1L8PyHrYNkw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=22; SR=0;
 TI=SMTPD_---0VmGYo1U_1688095261
Received: from 30.13.161.45(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VmGYo1U_1688095261) by smtp.aliyun-inc.com;
 Fri, 30 Jun 2023 11:21:02 +0800
Message-ID: <bc37b040-701d-3b5a-5cf2-370c320affbb@linux.alibaba.com>
Date: Fri, 30 Jun 2023 11:20:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Xiubo Li <xiubli@redhat.com>, David Howells <dhowells@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230628104852.3391651-1-dhowells@redhat.com>
 <20230628104852.3391651-3-dhowells@redhat.com>
 <41e1c831-29de-8494-d925-6e2eb379567f@redhat.com>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <41e1c831-29de-8494-d925-6e2eb379567f@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v7 2/2] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 linux-erofs@lists.ozlabs.org, Dominique Martinet <asmadeus@codewreck.org>,
 Jeff Layton <jlayton@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 ceph-devel@vger.kernel.org, linux-cachefs@redhat.com,
 v9fs-developer@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CgpPbiA2LzI5LzIzIDg6MzkgQU0sIFhpdWJvIExpIHdyb3RlOgo+IAo+IE9uIDYvMjgvMjMgMTg6
NDgsIERhdmlkIEhvd2VsbHMgd3JvdGU6Cj4+IEZzY2FjaGUgaGFzIGFuIG9wdGltaXNhdGlvbiBi
eSB3aGljaCByZWFkcyBmcm9tIHRoZSBjYWNoZSBhcmUgc2tpcHBlZAo+PiB1bnRpbAo+PiB3ZSBr
bm93IHRoYXQgKGEpIHRoZXJlJ3MgZGF0YSB0aGVyZSB0byBiZSByZWFkIGFuZCAoYikgdGhhdCBk
YXRhIGlzbid0Cj4+IGVudGlyZWx5IGNvdmVyZWQgYnkgcGFnZXMgcmVzaWRlbnQgaW4gdGhlIG5l
dGZzIHBhZ2VjYWNoZS7CoCBUaGlzIGlzIGRvbmUKPj4gd2l0aCB0d28gZmxhZ3MgbWFuaXB1bGF0
ZWQgYnkgZnNjYWNoZV9ub3RlX3BhZ2VfcmVsZWFzZSgpOgo+Pgo+PiDCoMKgwqDCoGlmICguLi4K
Pj4gwqDCoMKgwqDCoMKgwqAgdGVzdF9iaXQoRlNDQUNIRV9DT09LSUVfSEFWRV9EQVRBLCAmY29v
a2llLT5mbGFncykgJiYKPj4gwqDCoMKgwqDCoMKgwqAgdGVzdF9iaXQoRlNDQUNIRV9DT09LSUVf
Tk9fREFUQV9UT19SRUFELCAmY29va2llLT5mbGFncykpCj4+IMKgwqDCoMKgwqDCoMKgIGNsZWFy
X2JpdChGU0NBQ0hFX0NPT0tJRV9OT19EQVRBX1RPX1JFQUQsICZjb29raWUtPmZsYWdzKTsKPj4K
Pj4gd2hlcmUgdGhlIE5PX0RBVEFfVE9fUkVBRCBmbGFnIGNhdXNlcyBjYWNoZWZpbGVzX3ByZXBh
cmVfcmVhZCgpIHRvCj4+IGluZGljYXRlCj4+IHRoYXQgbmV0ZnNsaWIgc2hvdWxkIGRvd25sb2Fk
IGZyb20gdGhlIHNlcnZlciBvciBjbGVhciB0aGUgcGFnZSBpbnN0ZWFkLgo+Pgo+PiBUaGUgZnNj
YWNoZV9ub3RlX3BhZ2VfcmVsZWFzZSgpIGZ1bmN0aW9uIGlzIGludGVuZGVkIHRvIGJlIGNhbGxl
ZCBmcm9tCj4+IC0+cmVsZWFzZXBhZ2UoKSAtIGJ1dCB0aGF0IG9ubHkgZ2V0cyBjYWxsZWQgaWYg
UEdfcHJpdmF0ZSBvciBQR19wcml2YXRlXzIKPj4gaXMgc2V0IC0gYW5kIGN1cnJlbnRseSB0aGUg
Zm9ybWVyIGlzIGF0IHRoZSBkaXNjcmV0aW9uIG9mIHRoZSBuZXR3b3JrCj4+IGZpbGVzeXN0ZW0g
YW5kIHRoZSBsYXR0ZXIgaXMgb25seSBzZXQgd2hpbHN0IGEgcGFnZSBpcyBiZWluZyB3cml0dGVu
Cj4+IHRvIHRoZQo+PiBjYWNoZSwgc28gc29tZXRpbWVzIHdlIG1pc3MgY2xlYXJpbmcgdGhlIG9w
dGltaXNhdGlvbi4KPj4KPj4gRml4IHRoaXMgYnkgZm9sbG93aW5nIFdpbGx5J3Mgc3VnZ2VzdGlv
blsxXSBhbmQgYWRkaW5nIGFuIGFkZHJlc3Nfc3BhY2UKPj4gZmxhZywgQVNfUkVMRUFTRV9BTFdB
WVMsIHRoYXQgY2F1c2VzIGZpbGVtYXBfcmVsZWFzZV9mb2xpbygpIHRvIGFsd2F5cwo+PiBjYWxs
Cj4+IC0+cmVsZWFzZV9mb2xpbygpIGlmIGl0J3Mgc2V0LCBldmVuIGlmIFBHX3ByaXZhdGUgb3Ig
UEdfcHJpdmF0ZV8yIGFyZW4ndAo+PiBzZXQuCj4+Cj4+IE5vdGUgdGhhdCB0aGlzIHdvdWxkIHJl
cXVpcmUgZm9saW9fdGVzdF9wcml2YXRlKCkgYW5kCj4+IHBhZ2VfaGFzX3ByaXZhdGUoKSB0bwo+
PiBiZWNvbWUgbW9yZSBjb21wbGljYXRlZC7CoCBUbyBhdm9pZCB0aGF0LCBpbiB0aGUgcGxhY2Vz
WypdIHdoZXJlIHRoZXNlIGFyZQo+PiB1c2VkIHRvIGNvbmRpdGlvbmFsaXNlIGNhbGxzIHRvIGZp
bGVtYXBfcmVsZWFzZV9mb2xpbygpIGFuZAo+PiB0cnlfdG9fcmVsZWFzZV9wYWdlKCksIHRoZSB0
ZXN0cyBhcmUgcmVtb3ZlZCB0aGUgdGhvc2UgZnVuY3Rpb25zIGp1c3QKPj4ganVtcGVkIHRvIHVu
Y29uZGl0aW9uYWxseSBhbmQgdGhlIHRlc3QgaXMgcGVyZm9ybWVkIHRoZXJlLgo+Pgo+PiBbKl0g
VGhlcmUgYXJlIHNvbWUgZXhjZXB0aW9ucyBpbiB2bXNjYW4uYyB3aGVyZSB0aGUgY2hlY2sgZ3Vh
cmRzIG1vcmUKPj4gdGhhbgo+PiBqdXN0IGEgY2FsbCB0byB0aGUgcmVsZWFzZXIuwqAgSSd2ZSBh
ZGRlZCBhIGZ1bmN0aW9uLAo+PiBmb2xpb19uZWVkc19yZWxlYXNlKCkKPj4gdG8gd3JhcCBhbGwg
dGhlIGNoZWNrcyBmb3IgdGhhdC4KPj4KPj4gQVNfUkVMRUFTRV9BTFdBWVMgc2hvdWxkIGJlIHNl
dCBpZiBhIG5vbi1OVUxMIGNvb2tpZSBpcyBvYnRhaW5lZCBmcm9tCj4+IGZzY2FjaGUgYW5kIGNs
ZWFyZWQgaW4gLT5ldmljdF9pbm9kZSgpIGJlZm9yZQo+PiB0cnVuY2F0ZV9pbm9kZV9wYWdlc19m
aW5hbCgpCj4+IGlzIGNhbGxlZC4KPj4KPj4gQWRkaXRpb25hbGx5LCB0aGUgRlNDQUNIRV9DT09L
SUVfTk9fREFUQV9UT19SRUFEIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJlZAo+PiBhbmQgdGhlIG9w
dGltaXNhdGlvbiBjYW5jZWxsZWQgaWYgYSBjYWNoZWZpbGVzIG9iamVjdCBhbHJlYWR5IGNvbnRh
aW5zCj4+IGRhdGEKPj4gd2hlbiB3ZSBvcGVuIGl0Lgo+Pgo+PiBGaXhlczogMWY2N2U2ZDBiMTg4
ICgiZnNjYWNoZTogUHJvdmlkZSBhIGZ1bmN0aW9uIHRvIG5vdGUgdGhlIHJlbGVhc2UKPj4gb2Yg
YSBwYWdlIikKPj4gRml4ZXM6IDA0NzQ4N2M5NDdlOCAoImNhY2hlZmlsZXM6IEltcGxlbWVudCB0
aGUgSS9PIHJvdXRpbmVzIikKPj4gUmVwb3J0ZWQtYnk6IFJvaGl0aCBTdXJhYmF0dHVsYSA8cm9o
aXRocy5tc2Z0QGdtYWlsLmNvbT4KPj4gU3VnZ2VzdGVkLWJ5OiBNYXR0aGV3IFdpbGNveCA8d2ls
bHlAaW5mcmFkZWFkLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSG93ZWxscyA8ZGhvd2Vs
bHNAcmVkaGF0LmNvbT4KPj4gY2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3Jn
Pgo+PiBjYzogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+
PiBjYzogU3RldmUgRnJlbmNoIDxzZnJlbmNoQHNhbWJhLm9yZz4KPj4gY2M6IFNoeWFtIFByYXNh
ZCBOIDxuc3BtYW5nYWxvcmVAZ21haWwuY29tPgo+PiBjYzogUm9oaXRoIFN1cmFiYXR0dWxhIDxy
b2hpdGhzLm1zZnRAZ21haWwuY29tPgo+PiBjYzogRGF2ZSBXeXNvY2hhbnNraSA8ZHd5c29jaGFA
cmVkaGF0LmNvbT4KPj4gY2M6IERvbWluaXF1ZSBNYXJ0aW5ldCA8YXNtYWRldXNAY29kZXdyZWNr
Lm9yZz4KPj4gY2M6IElseWEgRHJ5b21vdiA8aWRyeW9tb3ZAZ21haWwuY29tPgo+PiBjYzogbGlu
dXgtY2FjaGVmc0ByZWRoYXQuY29tCj4+IGNjOiBsaW51eC1jaWZzQHZnZXIua2VybmVsLm9yZwo+
PiBjYzogbGludXgtYWZzQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gY2M6IHY5ZnMtZGV2ZWxvcGVy
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBjYzogY2VwaC1kZXZlbEB2Z2VyLmtlcm5lbC5vcmcK
Pj4gY2M6IGxpbnV4LW5mc0B2Z2VyLmtlcm5lbC5vcmcKPj4gY2M6IGxpbnV4LWZzZGV2ZWxAdmdl
ci5rZXJuZWwub3JnCj4+IGNjOiBsaW51eC1tbUBrdmFjay5vcmcKPj4gLS0tCj4+Cj4+IE5vdGVz
Ogo+PiDCoMKgwqDCoCB2ZXIgIzcpCj4+IMKgwqDCoMKgwqAgLSBNYWtlIE5GUyBzZXQgQVNfUkVM
RUFTRV9BTFdBWVMuCj4+IMKgwqDCoMKgIMKgwqDCoMKgIHZlciAjNCkKPj4gwqDCoMKgwqDCoCAt
IFNwbGl0IG91dCBtZXJnaW5nIG9mCj4+IGZvbGlvX2hhc19wcml2YXRlKCkvZmlsZW1hcF9yZWxl
YXNlX2ZvbGlvKCkgY2FsbAo+PiDCoMKgwqDCoMKgwqDCoCBwYWlycyBpbnRvIGEgcHJlY2VkaW5n
IHBhdGNoLgo+PiDCoMKgwqDCoMKgIC0gRG9uJ3QgbmVlZCB0byBjbGVhciBBU19SRUxFQVNFX0FM
V0FZUyBpbiAtPmV2aWN0X2lub2RlKCkuCj4+IMKgwqDCoMKgIMKgwqDCoMKgIHZlciAjMykKPj4g
wqDCoMKgwqDCoCAtIEZpeGVkIG1hcHBpbmdfY2xlYXJfcmVsZWFzZV9hbHdheXMoKSB0byB1c2Ug
Y2xlYXJfYml0KCkgbm90Cj4+IHNldF9iaXQoKS4KPj4gwqDCoMKgwqDCoCAtIE1vdmVkIGEgJyYm
JyB0byB0aGUgY29ycmVjdCBsaW5lLgo+PiDCoMKgwqDCoCDCoMKgwqDCoCB2ZXIgIzIpCj4+IMKg
wqDCoMKgwqAgLSBSZXdyb3RlIGVudGlyZWx5IGFjY29yZGluZyB0byBXaWxseSdzIHN1Z2dlc3Rp
b25bMV0uCj4+Cj4+IMKgIGZzLzlwL2NhY2hlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAr
Kwo+PiDCoCBmcy9hZnMvaW50ZXJuYWwuaMKgwqDCoMKgwqDCoCB8wqAgMiArKwo+PiDCoCBmcy9j
YWNoZWZpbGVzL25hbWVpLmPCoMKgIHzCoCAyICsrCj4+IMKgIGZzL2NlcGgvY2FjaGUuY8KgwqDC
oMKgwqDCoMKgwqAgfMKgIDIgKysKPj4gwqAgZnMvbmZzL2ZzY2FjaGUuY8KgwqDCoMKgwqDCoMKg
IHzCoCAzICsrKwo+PiDCoCBmcy9zbWIvY2xpZW50L2ZzY2FjaGUuYyB8wqAgMiArKwo+PiDCoCBp
bmNsdWRlL2xpbnV4L3BhZ2VtYXAuaCB8IDE2ICsrKysrKysrKysrKysrKysKPj4gwqAgbW0vaW50
ZXJuYWwuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA1ICsrKystCj4+IMKgIDggZmlsZXMgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IEp1c3Qgb25lIHF1ZXN0
aW9uLiBTaG91bGRuJ3QgZG8gdGhpcyBpbiAnZnMvZXJvZnMvZnNjYWNoZS5jJyB0b28gPwo+IAoK
Q3VycmVudGx5IHRoZSByZWFkIG9wdGltaXphdGlvbiBpcyBub3QgdXNlZCBpbiBmc2NhY2hlIG9u
ZGVtYW5kIG1vZGUKKHVzZWQgYnkgZXJvZnMpLCB0aG91Z2ggaXQgbWF5IG5vdCBiZSBpbnRlbmRl
ZC4uLgoKY2FjaGVmaWxlc19vbmRlbWFuZF9jb3BlbgogIGlmIChzaXplKQogICAgY2xlYXJfYml0
KEZTQ0FDSEVfQ09PS0lFX05PX0RBVEFfVE9fUkVBRCwgJmNvb2tpZS0+ZmxhZ3MpOwoKVGhlIHJl
YWQgb3B0aW1pemF0aW9uIGlzIGRpc2FibGVkIGFzIGxvbmcgYXMgdGhlIGJhY2tpbmcgZmlsZSBz
aXplIGlzCm5vdCAwICh3aGljaCBpcyB0aGUgbW9zdCBjYXNlKS4gIEFuZCB0aHVzIGN1cnJlbnRs
eSBlcm9mcyBkb2Vzbid0IG5lZWQKdG8gY2xlYXIgRlNDQUNIRV9DT09LSUVfTk9fREFUQV9UT19S
RUFEIGluIC5yZWxlYXNlX2ZvbGlvKCkuCgotLSAKVGhhbmtzLApKaW5nYm8KCi0tCkxpbnV4LWNh
Y2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3Rt
YW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

