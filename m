Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE6619614
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Nov 2022 13:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667564421;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FpS+Td7e2NXMd4dmRzR4D7tftGdh/8Gaj2Okdtim8Ps=;
	b=a3S9OftmHi4t7o2t2BtSVl3oZpmDVFI7gTL6fEN7TPE83Z3GvoJ7DYMHXcAr+I3clcOoab
	m3M7Jfi8e6fdRU1RunuFYI306mngH4uFISguVv4ICITjSqSQFaYO1bI9q3bqM/ebyrmPd/
	XCOhEXYjaXhCun8QMCXa0xXOZK7ioI8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-RQpU8BjYN1OjNr66dd1jiQ-1; Fri, 04 Nov 2022 08:20:18 -0400
X-MC-Unique: RQpU8BjYN1OjNr66dd1jiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55366857D0E;
	Fri,  4 Nov 2022 12:20:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45FB740C835A;
	Fri,  4 Nov 2022 12:20:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 10F4B1946594;
	Fri,  4 Nov 2022 12:20:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D549C1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B90B61402C01; Fri,  4 Nov 2022 12:20:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B17BB140EBF5
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 12:20:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96C9F811E7A
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 12:20:16 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-508-CdxvhqeUNwuJ3_w-IBcjAg-1; Fri, 04 Nov 2022 08:20:14 -0400
X-MC-Unique: CdxvhqeUNwuJ3_w-IBcjAg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R671e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VTxExbC_1667564409
Received: from 30.221.128.121(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTxExbC_1667564409) by smtp.aliyun-inc.com;
 Fri, 04 Nov 2022 20:20:11 +0800
Message-ID: <6064150a-7517-c0e1-72bb-e1a8adcfae74@linux.alibaba.com>
Date: Fri, 4 Nov 2022 20:20:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Jeff Layton <jlayton@kernel.org>, dhowells@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org
References: <20221104072637.72375-1-jefflexu@linux.alibaba.com>
 <20221104072637.72375-3-jefflexu@linux.alibaba.com>
 <2e2eceeb11972462bb9161a73c00a9c77f8af8d2.camel@kernel.org>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <2e2eceeb11972462bb9161a73c00a9c77f8af8d2.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH 2/2] erofs: switch to
 prepare_ondemand_read() in fscache mode
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CgpPbiAxMS80LzIyIDc6NDYgUE0sIEplZmYgTGF5dG9uIHdyb3RlOgo+IE9uIEZyaSwgMjAyMi0x
MS0wNCBhdCAxNToyNiArMDgwMCwgSmluZ2JvIFh1IHdyb3RlOgo+PiBTd2l0Y2ggdG8gcHJlcGFy
ZV9vbmRlbWFuZF9yZWFkKCkgaW50ZXJmYWNlIGFuZCBhIHNlbGYtY29udGFpbmVkIHJlcXVlc3QK
Pj4gY29tcGxldGlvbiB0byBnZXQgcmlkIG9mIG5ldGZzX2lvX1tyZXF1ZXN0fHN1YnJlcXVlc3Rd
Lgo+Pgo+PiBUaGUgd2hvbGUgcmVxdWVzdCB3aWxsIHN0aWxsIGJlIHNwbGl0IGludG8gc2xpY2Vz
IChzdWJyZXF1ZXN0KSBhY2NvcmRpbmcKPj4gdG8gdGhlIGNhY2hlIHN0YXRlIG9mIHRoZSBiYWNr
aW5nIGZpbGUuICBBcyBsb25nIGFzIG9uZSBvZiB0aGUKPj4gc3VicmVxdWVzdHMgZmFpbHMsIHRo
ZSB3aG9sZSByZXF1ZXN0IHdpbGwgYmUgbWFya2VkIGFzIGZhaWxlZC4gQmVzaWRlcwo+PiBpdCB3
aWxsIG5vdCByZXRyeSBmb3Igc2hvcnQgcmVhZC4gIFNpbWlsYXJseSB0aGUgd2hvbGUgcmVxdWVz
dCB3aWxsIGZhaWwKPj4gaWYgdGhhdCByZWFsbHkgaGFwcGVucy7CoAo+Pgo+IAo+IFRoYXQncyBz
b3J0IG9mIG5hc3R5LiBUaGUga2VybmVsIGNhbiBnZW5lcmFsbHkgZ2l2ZSB5b3UgYSBzaG9ydCBy
ZWFkIGZvcgo+IGFsbCBzb3J0cyBvZiByZWFzb25zLCBzb21lIG9mIHdoaWNoIG1heSBoYXZlIG5v
dGhpbmcgdG8gZG8gd2l0aCB0aGUKPiB1bmRlcmx5aW5nIGZpbGUgb3IgZmlsZXN5c3RlbS4KPiAK
PiBQYXNzaW5nIGFuIGVycm9yIGJhY2sgdG8gYW4gYXBwbGljYXRpb24gb24gYSBzaG9ydCByZWFk
IGlzIHByb2JhYmx5IG5vdAo+IHdoYXQgeW91IHdhbnQgdG8gZG8gaGVyZS4gVGhlIHVzdWFsIHRo
aW5nIHRvIGRvIGlzIGp1c3QgdG8gcmV0dXJuIHdoYXQKPiB5b3UgY2FuLCBhbmQgbGV0IHRoZSBh
cHBsaWNhdGlvbiByZWRyaXZlIHRoZSByZXF1ZXN0IGlmIGl0IHdhbnRzLgo+IAoKWWVhaCwgdGhh
bmtzIGZvciB5b3VyIGNvbW1lbnQuIFdlIGNhbiBmaXggdGhpcyBlaXRoZXIgaW4gY3VycmVudApw
YXRjaHNldCBvciBhIHNlcGFyYXRlIHNlcmllcy4gQXMgd2UganVzdCBkaXNjdXNzZWQgb24gSVJD
LCB3ZSB3aWxsIGZpeAppbiB0aGUgZm9sbG93aW5nIHNlcmllcy4KCgoKLS0gClRoYW5rcywKSmlu
Z2JvCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNo
ZWZzCg==

