Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B7B611884
	for <lists+linux-cachefs@lfdr.de>; Fri, 28 Oct 2022 18:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666976372;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TXFU16gic+oZzLOJpUV5uY42mt0xtyHnBGSWbv8S4HI=;
	b=aX8+HTGeKWHipstbofspOeHd/3ysN46Lu2xcB5nNdHEjcWIgvXP3U2hsG9L7ur4TqVDNOP
	3FeDWgNmwVcPKR4WBRQTR4aIHmK4H+Kpku9fZ4Os/rF9ER/ubi3bxj8YvstJFL7Y8fYkgE
	IJvPZ1IUOoGSG7cUhpVG6H1fQFYZAXA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-28ENqcZ4Mame-_rwCWtLLw-1; Fri, 28 Oct 2022 12:59:29 -0400
X-MC-Unique: 28ENqcZ4Mame-_rwCWtLLw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEAE187B2A0;
	Fri, 28 Oct 2022 16:59:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92CDE492B06;
	Fri, 28 Oct 2022 16:59:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 387A919466DF;
	Fri, 28 Oct 2022 16:59:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E18A11946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 16:59:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CCF694A927C; Fri, 28 Oct 2022 16:59:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C54674A9265
 for <linux-cachefs@redhat.com>; Fri, 28 Oct 2022 16:59:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A250D3C11048
 for <linux-cachefs@redhat.com>; Fri, 28 Oct 2022 16:59:19 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-etYwLh4nOIulUEtAIncwJQ-1; Fri, 28 Oct 2022 12:59:15 -0400
X-MC-Unique: etYwLh4nOIulUEtAIncwJQ-1
Received: by mail-io1-f51.google.com with SMTP id l127so5060937iof.12;
 Fri, 28 Oct 2022 09:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+c0RrXob86GQMOgizni3Jp+3zaFITWpeDgo3UiqSg0=;
 b=TVKiN3K2TBL64UW2CmOkapzIGWpuQbDglTgkhJA4dOifWuSAZWrIzTvWuDL9zGPePS
 oYG3Zfu2tBXux8YYQSm1F9fJWSuXDntQUH47LY7nZr5lJ8z/wgO5s40pwmgifO6uPt+9
 4uqg2oWAc3QGJiaKw5v05YVdPdV7X+8gjFZoYvzO8UhcbmY6s7r6PPEnpokmlZ07vdJe
 iqbmG7q7CeRsryZiAxVhAln7OD+TANzg+MFhe/fFZyhyX+wuuYUZwca4hXrEjUEC+Pm1
 9ycoOJH+3bGNolk/TlxX1lHjw2WgAxVzzkxAtFppD1r5RSpZmvl5PvykUtwCY4nnOdSr
 5X1g==
X-Gm-Message-State: ACrzQf3JnhvotGKtaKcFPmWVmrJk4N/no+uql2sqr7IVPzqEsn8dUwF2
 bbFC7oclbQk3X++kPQsPVM8GsFEHQQ==
X-Google-Smtp-Source: AMsMyM4EzC+N29Wk2WNLPcWAoRAU/08L4/IvIrjOZ/P7COIe2VnCCc8s1RIDFY4Z79lNOQfmTMN20w==
X-Received: by 2002:a02:a1c5:0:b0:372:d180:fbc1 with SMTP id
 o5-20020a02a1c5000000b00372d180fbc1mr211122jah.297.1666976354079; 
 Fri, 28 Oct 2022 09:59:14 -0700 (PDT)
Received: from [192.168.75.138] (50-36-85-28.alma.mi.frontiernet.net.
 [50.36.85.28]) by smtp.gmail.com with ESMTPSA id
 r20-20020a92c5b4000000b002f584a19a79sm1774172ilt.34.2022.10.28.09.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:59:13 -0700 (PDT)
Message-ID: <0676ecb2bb708e6fc29dbbe6b44551d6a0d021dc.camel@kernel.org>
From: Trond Myklebust <trondmy@kernel.org>
To: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 28 Oct 2022 12:59:12 -0400
In-Reply-To: <CALF+zOm+-2QLOMu4J7NAK++xfjZ8SQqmMh8zNFcM2H78_qYAzA@mail.gmail.com>
References: <20221017105212.77588-1-dwysocha@redhat.com>
 <20221017105212.77588-4-dwysocha@redhat.com>
 <870684b35a45b94c426554a62b63f80f421dbb08.camel@kernel.org>
 <CALF+zOm+-2QLOMu4J7NAK++xfjZ8SQqmMh8zNFcM2H78_qYAzA@mail.gmail.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v9 3/5] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
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
Cc: linux-nfs@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIyLTEwLTI4IGF0IDA3OjUwIC0wNDAwLCBEYXZpZCBXeXNvY2hhbnNraSB3cm90
ZToKPiBPbiBUaHUsIE9jdCAyNywgMjAyMiBhdCAzOjE2IFBNIFRyb25kIE15a2xlYnVzdCA8dHJv
bmRteUBrZXJuZWwub3JnPgo+IHdyb3RlOgo+ID4gCj4gPiBPbiBNb24sIDIwMjItMTAtMTcgYXQg
MDY6NTIgLTA0MDAsIERhdmUgV3lzb2NoYW5za2kgd3JvdGU6Cj4gPiA+IENvbnZlcnQgdGhlIE5G
UyBidWZmZXJlZCByZWFkIGNvZGUgcGF0aHMgdG8gY29ycmVzcG9uZGluZyBuZXRmcwo+ID4gPiBB
UElzLAo+ID4gPiBidXQgb25seSB3aGVuIGZzY2FjaGUgaXMgY29uZmlndXJlZCBhbmQgZW5hYmxl
ZC4KPiA+ID4gCj4gPiA+IFRoZSBuZXRmcyBBUEkgZGVmaW5lcyBzdHJ1Y3QgbmV0ZnNfcmVxdWVz
dF9vcHMgd2hpY2ggbXVzdCBiZQo+ID4gPiBmaWxsZWQKPiA+ID4gaW4gYnkgdGhlIG5ldHdvcmsg
ZmlsZXN5c3RlbS7CoCBGb3IgTkZTLCB3ZSBvbmx5IG5lZWQgdG8gZGVmaW5lIDUKPiA+ID4gb2YK
PiA+ID4gdGhlIGZ1bmN0aW9ucywgdGhlIG1haW4gb25lIGJlaW5nIHRoZSBpc3N1ZV9yZWFkKCkg
ZnVuY3Rpb24uCj4gPiA+IFRoZSBpc3N1ZV9yZWFkKCkgZnVuY3Rpb24gaXMgY2FsbGVkIGJ5IHRo
ZSBuZXRmcyBsYXllciB3aGVuIGEKPiA+ID4gcmVhZAo+ID4gPiBjYW5ub3QgYmUgZnVsZmlsbGVk
IGxvY2FsbHksIGFuZCBtdXN0IGJlIHNlbnQgdG8gdGhlIHNlcnZlcgo+ID4gPiAoZWl0aGVyCj4g
PiA+IHRoZSBjYWNoZSBpcyBub3QgYWN0aXZlLCBvciBpdCBpcyBhY3RpdmUgYnV0IHRoZSBkYXRh
IGlzIG5vdAo+ID4gPiBhdmFpbGFibGUpLgo+ID4gPiBPbmNlIHRoZSByZWFkIGZyb20gdGhlIHNl
cnZlciBpcyBjb21wbGV0ZSwgbmV0ZnMgcmVxdWlyZXMgYSBjYWxsCj4gPiA+IHRvCj4gPiA+IG5l
dGZzX3N1YnJlcV90ZXJtaW5hdGVkKCkgd2hpY2ggY29udmV5cyBlaXRoZXIgaG93IG1hbnkgYnl0
ZXMKPiA+ID4gd2VyZQo+ID4gPiByZWFkCj4gPiA+IHN1Y2Nlc3NmdWxseSwgb3IgYW4gZXJyb3Iu
wqAgTm90ZSB0aGF0IGlzc3VlX3JlYWQoKSBpcyBjYWxsZWQgd2l0aAo+ID4gPiBhCj4gPiA+IHN0
cnVjdHVyZSwgbmV0ZnNfaW9fc3VicmVxdWVzdCwgd2hpY2ggZGVmaW5lcyB0aGUgSU8gcmVxdWVz
dGVkLAo+ID4gPiBhbmQKPiA+ID4gY29udGFpbnMgYSBzdGFydCBhbmQgYSBsZW5ndGggKGJvdGgg
aW4gYnl0ZXMpLCBhbmQgYXNzdW1lcyB0aGUKPiA+ID4gdW5kZXJseWluZwo+ID4gPiBuZXRmcyB3
aWxsIHJldHVybiBhIGVpdGhlciBhbiBlcnJvciBvbiB0aGUgd2hvbGUgcmVnaW9uLCBvciB0aGUK
PiA+ID4gbnVtYmVyCj4gPiA+IG9mIGJ5dGVzIHN1Y2Nlc3NmdWxseSByZWFkLgo+ID4gPiAKPiA+
ID4gVGhlIE5GUyBJTyBwYXRoIGlzIHBhZ2UgYmFzZWQgYW5kIHRoZSBtYWluIEFQSXMgYXJlIHRo
ZSBwZ2lvIEFQSXMKPiA+ID4gZGVmaW5lZAo+ID4gPiBpbiBwYWdlbGlzdC5jLsKgIEZvciB0aGUg
cGdpbyBBUElzLCB0aGVyZSBpcyBubyB3YXkgZm9yIHRoZSBjYWxsZXIKPiA+ID4gdG8KPiA+ID4g
a25vdyBob3cgbWFueSBSUENzIHdpbGwgYmUgc2VudCBhbmQgaG93IHRoZSBwYWdlcyB3aWxsIGJl
IGJyb2tlbgo+ID4gPiB1cAo+ID4gPiBpbnRvIHVuZGVybHlpbmcgUlBDcywgZWFjaCBvZiB3aGlj
aCB3aWxsIGhhdmUgdGhlaXIgb3duCj4gPiA+IGNvbXBsZXRpb24KPiA+ID4gYW5kCj4gPiA+IHJl
dHVybiBjb2RlLsKgIEluIGNvbnRyYXN0LCBuZXRmcyBpcyBzdWJyZXF1ZXN0IGJhc2VkLCBhIHNp
bmdsZQo+ID4gPiBzdWJyZXF1ZXN0IG1heSBjb250YWluIG11bHRpcGxlIHBhZ2VzLCBhbmQgYSBz
aW5nbGUgc3VicmVxdWVzdCBpcwo+ID4gPiBpbml0aWF0ZWQgd2l0aCBpc3N1ZV9yZWFkKCkgYW5k
IHRlcm1pbmF0ZWQgd2l0aAo+ID4gPiBuZXRmc19zdWJyZXFfdGVybWluYXRlZCgpLgo+ID4gPiBU
aHVzLCB0byB1dGlsemUgdGhlIG5ldGZzIEFQSXMsIE5GUyBuZWVkcyBzb21lIHdheSB0byBhY2Nv
bW1vZGF0ZQo+ID4gPiB0aGUgbmV0ZnMgQVBJIHJlcXVpcmVtZW50IG9uIHRoZSBzaW5nbGUgcmVz
cG9uc2UgdG8gdGhlIHdob2xlCj4gPiA+IHN1YnJlcXVlc3QsIHdoaWxlIGFsc28gbWluaW1pemlu
ZyBkaXNydXB0aXZlIGNoYW5nZXMgdG8gdGhlIE5GUwo+ID4gPiBwZ2lvIGxheWVyLgo+ID4gPiAK
PiA+ID4gVGhlIGFwcHJvYWNoIHRha2VuIHdpdGggdGhpcyBwYXRjaCBpcyB0byBhbGxvY2F0ZSBh
IHNtYWxsCj4gPiA+IHN0cnVjdHVyZQo+ID4gPiBmb3IgZWFjaCBuZnNfbmV0ZnNfaXNzdWVfcmVh
ZCgpIGNhbGwsIHN0b3JlIHRoZSBmaW5hbCBlcnJvciBhbmQKPiA+ID4gbnVtYmVyCj4gPiA+IG9m
IGJ5dGVzIHN1Y2Nlc3NmdWxseSB0cmFuc2ZlcnJlZCBpbiB0aGUgc3RydWN0dXJlLCBhbmQgdXBk
YXRlCj4gPiA+IHRoZXNlCj4gPiA+IHZhbHVlcwo+ID4gPiBhcyBlYWNoIFJQQyBjb21wbGV0ZXMu
wqAgVGhlIHJlZmNvdW50IG9uIHRoZSBzdHJ1Y3R1cmUgaXMgdXNlZCBhcwo+ID4gPiBhCj4gPiA+
IG1hcmtlcgo+ID4gPiBmb3IgdGhlIGxhc3QgUlBDIGNvbXBsZXRpb24sIGlzIGluY3JlbWVudGVk
IGluCj4gPiA+IG5mc19uZXRmc19yZWFkX2luaXRpYXRlKCksCj4gPiA+IGFuZCBkZWNyZW1lbnRl
ZCBpbnNpZGUgbmZzX25ldGZzX3JlYWRfY29tcGxldGlvbigpLCB3aGVuIGEKPiA+ID4gbmZzX3Bn
aW9faGVhZGVyCj4gPiA+IGNvbnRhaW5zIGEgdmFsaWQgcG9pbnRlciB0byB0aGUgZGF0YS7CoCBP
biB0aGUgZmluYWwgcHV0ICh3aGljaAo+ID4gPiBzaWduYWxzCj4gPiA+IHRoZSBmaW5hbCBvdXRz
dGFuZGluZyBSUEMgaXMgY29tcGxldGUpIGluCj4gPiA+IG5mc19uZXRmc19yZWFkX2NvbXBsZXRp
b24oKSwKPiA+ID4gY2FsbCBuZXRmc19zdWJyZXFfdGVybWluYXRlZCgpIHdpdGggZWl0aGVyIHRo
ZSBmaW5hbCBlcnJvciB2YWx1ZQo+ID4gPiAoaWYKPiA+ID4gb25lIG9yIG1vcmUgUkVBRHMgY29t
cGxldGUgd2l0aCBhbiBlcnJvcikgb3IgdGhlIG51bWJlciBvZiBieXRlcwo+ID4gPiBzdWNjZXNz
ZnVsbHkgdHJhbnNmZXJyZWQgKGlmIGFsbCBSUENzIGNvbXBsZXRlIHN1Y2Nlc3NmdWxseSkuwqAK
PiA+ID4gTm90ZQo+ID4gPiB0aGF0IHdoZW4gYWxsIFJQQ3MgY29tcGxldGUgc3VjY2Vzc2Z1bGx5
LCB0aGUgbnVtYmVyIG9mIGJ5dGVzCj4gPiA+IHRyYW5zZmVycmVkCj4gPiA+IGlzIGNhcHBlZCB0
byB0aGUgbGVuZ3RoIG9mIHRoZSBzdWJyZXF1ZXN0LsKgIENhcHBpbmcgdGhlCj4gPiA+IHRyYW5z
ZmVycmVkCj4gPiA+IGxlbmd0aAo+ID4gPiB0byB0aGUgc3VicmVxdWVzdCBsZW5ndGggcHJldmVu
dHMgIlN1YnJlcSBvdmVycmVhZCIgd2FybmluZ3MgZnJvbQo+ID4gPiBuZXRmcy4KPiA+ID4gVGhp
cyBpcyBkdWUgdG8gdGhlICJhbGlnbmVkX2xlbiIgaW4gbmZzX3BhZ2Vpb19hZGRfcGFnZSgpLCBh
bmQKPiA+ID4gdGhlCj4gPiA+IGNvcm5lciBjYXNlIHdoZXJlIE5GUyByZXF1ZXN0cyBhIGZ1bGwg
cGFnZSBhdCB0aGUgZW5kIG9mIHRoZQo+ID4gPiBmaWxlLAo+ID4gPiBldmVuIHdoZW4gaV9zaXpl
IHJlZmxlY3RzIG9ubHkgYSBwYXJ0aWFsIHBhZ2UgKE5GUyBvdmVycmVhZCkuCj4gPiA+IAo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBEYXZlIFd5c29jaGFuc2tpIDxkd3lzb2NoYUByZWRoYXQuY29tPgo+
ID4gPiBSZXZpZXdlZC1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KPiA+IAo+
ID4gCj4gPiBUaGlzIGlzIG5vdCBkb2luZyB3aGF0IEkgYXNrZWQgZm9yLCB3aGljaCB3YXMgdG8g
c2VwYXJhdGUgb3V0IHRoZQo+ID4gZnNjYWNoZSBmdW5jdGlvbmFsaXR5LCBzbyB0aGF0IHdlIGNh
biBjYWxsIHRoYXQgaWYgYW5kIHdoZW4gaXQgaXMKPiA+IGF2YWlsYWJsZS4KPiA+IAo+IEkgbXVz
dCBoYXZlIG1pc3VuZGVyc3Rvb2QgdGhlbi4KPiAKPiBUaGUgbGFzdCBmZWVkYmFjayBJIGhhdmUg
ZnJvbSB5b3Ugd2FzIHRoYXQgeW91IHdhbnRlZCBpdCB0byBiZQo+IGFuIG9wdC1pbiBmZWF0dXJl
LCBhbmQgaXQgd2FzIGEgY29tbWVudCBvbiBhIHByZXZpb3VzIHBhdGNoCj4gdG8gS2NvbmZpZy7C
oCBJIHdhcyBwcm9jZWVkaW5nIHRoZSBiZXN0IEkga25ldyBob3csIGJ1dAo+IGxldCBtZSB0cnkg
dG8gZ2V0IGJhY2sgb24gdHJhY2suCj4gCj4gPiBJbnN0ZWFkLCBpdCBpcyBqdXN0IHdyYXBwaW5n
IHRoZSBORlMgcmVxdWVzdHMgaW5zaWRlIG5ldGZzCj4gPiByZXF1ZXN0cy4gQXMKPiA+IGl0IHN0
YW5kcywgdGhhdCBtZWFucyBpdCBpcyBqdXN0IGR1cGxpY2F0aW5nIGluZm9ybWF0aW9uLCBhbmQK
PiA+IGFkZGluZwo+ID4gdW5uZWNlc3Nhcnkgb3ZlcmhlYWQgdG8gdGhlIHN0YW5kYXJkIEkvTyBw
YXRoIChleHRyYSBhbGxvY2F0aW9ucywKPiA+IGV4dHJhCj4gPiBpbmRpcmVjdCBjYWxscywgYW5k
IGV4dHJhIGJsb2F0IHRvIHRoZSBpbm9kZSkuCj4gPiAKPiBJIHRoaW5rIEkgdW5kZXJzdGFuZCB3
aGF0IHlvdSdyZSBzYXlpbmcgYnV0IEknbSBub3Qgc3VyZS7CoCBMZXQgbWUKPiBhc2sgc29tZSBj
bGFyaWZ5aW5nIHF1ZXN0aW9ucy4KPiAKPiBBcmUgeW91IG9iamVjdGluZyB0byB0aGUgY29kZSB3
aGVuIENPTkZJR19ORlNfRlNDQUNIRSBpcwo+IGNvbmZpZ3VyZWQ/wqAgT3Igd2hlbiBpdCBpcyBu
b3Q/wqAgT3IgYm90aD/CoCBJIHRoaW5rIHlvdSdyZSBvYmplY3RpbmcKPiB3aGVuIGl0J3MgY29u
ZmlndXJlZCwgYnV0IG5vdCBlbmFibGVkICh3ZSBtb3VudCB3aXRob3V0ICdmc2MnKS4KPiBBbSBJ
IHJpZ2h0Pwo+IAo+IEFsc28sIGFyZSB5b3Ugb2JqZWN0aW5nIHRvIHRoZSBkZXNpZ24gdGhhdCB0
byB1c2UgZmNhY2hlIHdlIG5vdwo+IGhhdmUgdG8gdXNlIG5ldGZzLCBzcGVjaWZpY2FsbHk6Cj4g
LSBjYWxsIGludG8gbmV0ZnMgdmlhIGVpdGhlciBuZXRmc19yZWFkX2ZvbGlvIG9yIG5ldGZzX3Jl
YWRhaGVhZAo+IC0gaWYgZnNjYWNoZSBpcyBlbmFibGVkLCB0aGVuIHRoZSBJTyBjYW4gYmUgc2F0
aXNmaWVkIGZyb20gZnNjYWNoZQo+IC0gaWYgZnNjYWNoZSBpcyBub3QgZW5hYmxlZCwgb3Igc29t
ZSBvZiB0aGUgSU8gY2Fubm90IGJlIHNhdGlzZmllZAo+IGZyb20gdGhlIGNhY2hlLCB0aGVuIE5G
UyBpcyBjYWxsZWQgYmFjayB2aWEgbmV0ZnNfaXNzdWVfcmVhZAo+IGFuZCB3ZSB1c2UgdGhlIG5v
cm1hbCBORlMgcmVhZCBwYWdlaW8gaW50ZXJmYWNlLsKgIFRoaXMgcmVxdWlyZXMKPiB3ZSBjYWxs
IG5ldGZzX3N1YnJlcV90ZXJtaW5hdGVkKCkgd2hlbiBhbGwgdGhlIFJQQ3MgY29tcGxldGUsCj4g
d2hpY2ggaXMgdGhlIHJlYXNvbiBmb3IgdGhlIHNtYWxsIGNoYW5nZXMgdG8gcGFnZWxpc3QuYwoK
SSdtIG9iamVjdGluZyB0byBhbnkgbWlkZGxlIGxheWVyICJzb2x1dGlvbiIgdGhhdCBhZGRzIG92
ZXJoZWFkIHRvIHRoZQpORlMgSS9PIHBhdGhzLgoKSSdtIHdpbGxpbmcgdG8gY29uc2lkZXIgc29s
dXRpb25zIHRoYXQgYXJlIHNwZWNpZmljIG9ubHkgdG8gdGhlIGZzY2FjaGUKdXNlIGNhc2UgKGku
ZS4gd2hlbiB0aGUgJ2ZzYycgbW91bnQgb3B0aW9uIGlzIHNwZWNpZmllZCkuIEhvd2V2ZXIgd2hl
bgpJIHBlcmZvcm0gYSBub3JtYWwgTkZTIG1vdW50LCBhbmQgZG8gSS9PLCB0aGVuIEkgZG9uJ3Qg
d2FudCB0byBzZWUKZXh0cmEgbWVtb3J5IGFsbG9jYXRpb25zLCBleHRyYSBpbmRpcmVjdCBjYWxs
cyBhbmQgbGFyZ2VyIGlub2RlCmZvb3RwcmludHMuCgpJT1c6IEkgd2FudCB0aGUgY29kZSB0byBv
cHRpbWlzZSBmb3IgdGhlIGNhc2Ugb2Ygc3RhbmRhcmQgTkZTLCBub3QgZm9yCnRoZSBjYXNlIG9m
ICdORlMgd2l0aCBjYWNoZWZzIGFkZGl0aW9ucycuCgo+IAo+IENhbiB5b3UgYmUgbW9yZSBzcGVj
aWZpYyBhcyB0byB0aGUgcG9ydGlvbnMgb2YgdGhlIHBhdGNoIHlvdSBkb24ndAo+IGxpa2UKPiBz
byBJIGNhbiBtb3ZlIGl0IGluIHRoZSByaWdodCBkaXJlY3Rpb24/Cj4gCj4gVGhpcyBpcyBmcm9t
IHBhdGNoICMyIHdoaWNoIHlvdSBkaWRuJ3QgY29tbWVudCBvbi7CoCBJJ20gbm90IHN1cmUKPiB5
b3UncmUKPiBvayB3aXRoIGl0IHRob3VnaCwgc2luY2UgeW91IG1lbnRpb24gImV4dHJhIGJsb2F0
IHRvIHRoZSBpbm9kZSIuCj4gRG8geW91IG9iamVjdCB0byB0aGlzIGV2ZW4gdGhvdWdoIGl0J3Mg
d3JhcHBlZCBpbiBhbgo+ICNpZmRlZiBDT05GSUdfTkZTX0ZTQ0FDSEU/wqAgSWYgc28sIGRvIHlv
dSByZXF1aXJlIG5vCj4gZXh0cmEgc2l6ZSBiZSBhZGRlZCB0byBuZnNfaW5vZGU/Cj4gCj4gQEAg
LTIwNCw5ICsyMDgsMTEgQEAgc3RydWN0IG5mc19pbm9kZSB7Cj4gwqDCoMKgwqDCoMKgwqAgX191
NjQgd3JpdGVfaW87Cj4gwqDCoMKgwqDCoMKgwqAgX191NjQgcmVhZF9pbzsKPiDCoCNpZmRlZiBD
T05GSUdfTkZTX0ZTQ0FDSEUKPiAtwqDCoMKgwqDCoMKgIHN0cnVjdCBmc2NhY2hlX2Nvb2tpZcKg
wqAgKmZzY2FjaGU7Cj4gLSNlbmRpZgo+ICvCoMKgwqDCoMKgwqAgc3RydWN0IG5ldGZzX2lub2Rl
wqDCoMKgwqDCoCBuZXRmczsgLyogbmV0ZnMgY29udGV4dCBhbmQgVkZTIGlub2RlCj4gKi8KPiAr
I2Vsc2UKPiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHZmc19pbm9kZTsKPiArI2VuZGlmCj4gKwoKSWRlYWxseSwgSSdkIHByZWZlciBubyBleHRyYSBz
aXplLiBJIGNhbiBsaXZlIHdpdGggaXQgdXAgdG8gYSBjZXJ0YWluCnBvaW50LCBob3dldmVyIGZv
ciBub3cgTkZTIGlzIG5vdCB1bmNvbmRpdGlvbmFsbHkgb3B0aW5nIGludG8gdGhlIG5ldGZzCnBy
b2plY3QuIElmIHdlJ3JlIHRvIGV2ZXIgZG8gdGhhdCwgdGhlbiBJIHdhbnQgdG8gc2VlIHN0cmVh
bWxpbmVkIGNvZGUKZm9yIHRoZSBzdGFuZGFyZCBJL08gY2FzZS4KCj4gCj4gCj4gQXJlIHlvdSBv
ayB3aXRoIHRoZSBzdHViIGZ1bmN0aW9ucyB3aGljaCBhcmUgcGxhY2VkIGluIGZzY2FjaGUuaCwg
YW5kCj4gd2hlbiBDT05GSUdfTkZTX0ZTQ0FDSEUgaXMgbm90IHNldCwgYmVjb21lIGVpdGhlciBh
IG5vLW9wCj4gb3IgYSAxLWxpbmVyIChuZnNfbmV0ZnNfcmVhZHBhZ2VfcmVsZWFzZSk/Cj4gCj4g
wqAjZWxzZSAvKiBDT05GSUdfTkZTX0ZTQ0FDSEUgKi8KPiArc3RhdGljIGlubGluZSB2b2lkIG5m
c19uZXRmc19pbm9kZV9pbml0KHN0cnVjdCBuZnNfaW5vZGUgKm5mc2kpIHt9Cj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBuZnNfbmV0ZnNfaW5pdGlhdGVfcmVhZChzdHJ1Y3QgbmZzX3BnaW9faGVhZGVy
Cj4gKmhkcikge30KPiArc3RhdGljIGlubGluZSB2b2lkIG5mc19uZXRmc19yZWFkX2NvbXBsZXRp
b24oc3RydWN0IG5mc19wZ2lvX2hlYWRlcgo+ICpoZHIpIHt9Cj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBuZnNfbmV0ZnNfcmVhZHBhZ2VfcmVsZWFzZShzdHJ1Y3QgbmZzX3BhZ2UgKnJlcSkKPiArewo+
ICvCoMKgwqDCoMKgwqAgdW5sb2NrX3BhZ2UocmVxLT53Yl9wYWdlKTsKPiArfQo+IMKgc3RhdGlj
IGlubGluZSB2b2lkIG5mc19mc2NhY2hlX3JlbGVhc2Vfc3VwZXJfY29va2llKHN0cnVjdAo+IHN1
cGVyX2Jsb2NrICpzYikge30KPiDCoHN0YXRpYyBpbmxpbmUgdm9pZCBuZnNfZnNjYWNoZV9pbml0
X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUpIHt9Cj4gCj4gCj4gRG8geW91IG9iamVjdCB0byB0
aGUgYmVsb3c/wqAgSWYgc28sIHRoZW4gZG8geW91IHdhbnQKPiAjaWZkZWYgQ09ORklHX05GU19G
U0NBQ0hFIGhlcmU/Cj4gCj4gLS0gYS9mcy9uZnMvaW5vZGUuYwo+ICsrKyBiL2ZzL25mcy9pbm9k
ZS5jCj4gQEAgLTIyNDksNiArMjI0OSw4IEBAIHN0cnVjdCBpbm9kZSAqbmZzX2FsbG9jX2lub2Rl
KHN0cnVjdAo+IHN1cGVyX2Jsb2NrICpzYikKPiDCoCNpZmRlZiBDT05GSUdfTkZTX1Y0XzIKPiDC
oMKgwqDCoMKgwqDCoCBuZnNpLT54YXR0cl9jYWNoZSA9IE5VTEw7Cj4gwqAjZW5kaWYKPiArwqDC
oMKgwqDCoMKgIG5mc19uZXRmc19pbm9kZV9pbml0KG5mc2kpOwo+ICsKPiDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gVkZTX0kobmZzaSk7Cj4gwqB9Cj4gwqBFWFBPUlRfU1lNQk9MX0dQTChuZnNfYWxs
b2NfaQo+IG5vZGUpOwo+IAo+IAo+IERvIHlvdSBvYmplY3QgdG8gdGhlIGNoYW5nZXMgaW4gZnMv
bmZzL3JlYWQuYz/CoCBTcGVjaWZpY2FsbHksCj4gaG93IGFib3V0IHRoZSBiZWxvdyBjYWxscyB0
byBuZXRmcyBmcm9tIG5mc19yZWFkX2ZvbGlvIGFuZAo+IG5mc19yZWFkYWhlYWQgaW50byBlcXVp
dmFsZW50IG5ldGZzIGNhbGxzP8KgIFNvIHdoZW4KPiBORlNfQ09ORklHX0ZTQ0FDSEUgaXMgc2V0
LCBidXQgZnNjYWNoZSBpcyBub3QgZW5hYmxlZAo+ICgnZnNjJyBub3Qgb24gbW91bnQpLCB0aGVz
ZSBuZXRmcyBmdW5jdGlvbnMgZG8gaW1tZWRpYXRlbHkgY2FsbAo+IG5ldGZzX2FsbG9jX3JlcXVl
c3QoKS7CoCBCdXQgSSB3b25kZXIgaWYgd2UgY291bGQgc2ltcGx5IGFkZCBhCj4gY2hlY2sgdG8g
c2VlIGlmIGZzY2FjaGUgaXMgZW5hYmxlZCBvbiB0aGUgbW91bnQsIGFuZCBza2lwCj4gb3ZlciB0
byBzYXRpc2Z5IHdoYXQgeW91IHdhbnQuwqAgQW0gSSB1bmRlcnN0YW5kaW5nIHdoYXQgeW91Cj4g
d2FudD8KClF1aXRlIGZyYW5rbHksIEknZCBwcmVmZXIgdGhhdCB3ZSBqdXN0IHNwbGl0IG91dCB0
aGUgZnVuY3Rpb25hbGl0eSB0aGF0CmlzIG5lZWRlZCBmcm9tIHRoZSBuZXRmcyBjb2RlIHNvIHRo
YXQgaXQgY2FuIGJlIG9wdGltaXNlZC4gSG93ZXZlciBJJ20Kbm90IGludGVyZXN0ZWQgZW5vdWdo
IGluIHRoZSBjYWNoZWZzIGZ1bmN0aW9uYWxpdHkgdG8gd29yayBvbiB0aGF0Cm15c2VsZi4gLi4u
YW5kIGFzIEkgaW5kaWNhdGVkIGFib3ZlLCBJIG1pZ2h0IGJlIE9LIHdpdGggb3B0aW5nIGludG8g
dGhlCm5ldGZzIHByb2plY3QsIG9uY2UgdGhlIG92ZXJoZWFkIGNhbiBiZSBtYWRlIHRvIGRpc2Fw
cGVhci4KCj4gCj4gQEAgLTM1NSw2ICszNDMsMTAgQEAgaW50IG5mc19yZWFkX2ZvbGlvKHN0cnVj
dCBmaWxlICpmaWxlLCBzdHJ1Y3QKPiBmb2xpbyAqZm9saW8pCj4gwqDCoMKgwqDCoMKgwqAgaWYg
KE5GU19TVEFMRShpbm9kZSkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
b3V0X3VubG9jazsKPiAKPiArwqDCoMKgwqDCoMKgIHJldCA9IG5mc19uZXRmc19yZWFkX2ZvbGlv
KGZpbGUsIGZvbGlvKTsKPiArwqDCoMKgwqDCoMKgIGlmICghcmV0KQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+ICsKPiAKPiBAQCAtNDA1LDYgKzM5OSwxMCBAQCB2
b2lkIG5mc19yZWFkYWhlYWQoc3RydWN0IHJlYWRhaGVhZF9jb250cm9sCj4gKnJhY3RsKQo+IMKg
wqDCoMKgwqDCoMKgIGlmIChORlNfU1RBTEUoaW5vZGUpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIG91dDsKPiAKPiArwqDCoMKgwqDCoMKgIHJldCA9IG5mc19uZXRmc19y
ZWFkYWhlYWQocmFjdGwpOwo+ICvCoMKgwqDCoMKgwqAgaWYgKCFyZXQpCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4gKwo+IAo+IAo+IEFuZCBob3cgYWJvdXQgdGhl
c2UgY2FsbHMgZnJvbSBkaWZmZXJlbnQgcG9pbnRzIGluIHRoZSByZWFkCj4gcGF0aCB0byB0aGUg
ZWFybGllciBtZW50aW9uZWQgc3R1YiBmdW5jdGlvbnM/Cj4gCj4gQEAgLTExMCwyMCArMTEwLDEz
IEBAIEVYUE9SVF9TWU1CT0xfR1BMKG5mc19wYWdlaW9fcmVzZXRfcmVhZF9tZHMpOwo+IAo+IMKg
c3RhdGljIHZvaWQgbmZzX3JlYWRwYWdlX3JlbGVhc2Uoc3RydWN0IG5mc19wYWdlICpyZXEsIGlu
dCBlcnJvcikKPiDCoHsKPiAtwqDCoMKgwqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBkX2lu
b2RlKG5mc19yZXFfb3BlbmN0eChyZXEpLT5kZW50cnkpOwo+IMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBwYWdlICpwYWdlID0gcmVxLT53Yl9wYWdlOwo+IAo+IC3CoMKgwqDCoMKgwqAgZHByaW50aygi
TkZTOiByZWFkIGRvbmUgKCVzLyVsbHUgJWRAJWxsZClcbiIsIGlub2RlLT5pX3NiLQo+ID5zX2lk
LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh1bnNpZ25lZCBsb25nIGxvbmcpTkZT
X0ZJTEVJRChpbm9kZSksIHJlcS0+d2JfYnl0ZXMsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKGxvbmcgbG9uZylyZXFfb2Zmc2V0KHJlcSkpOwo+IC0KPiDCoMKgwqDCoMKgwqDCoCBp
ZiAobmZzX2Vycm9yX2lzX2ZhdGFsX29uX3NlcnZlcihlcnJvcikgJiYgZXJyb3IgIT0gLQo+IEVU
SU1FRE9VVCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU2V0UGFnZUVycm9yKHBh
Z2UpOwo+IC3CoMKgwqDCoMKgwqAgaWYgKG5mc19wYWdlX2dyb3VwX3N5bmNfb25fYml0KHJlcSwg
UEdfVU5MT0NLUEFHRSkpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoUGFn
ZVVwdG9kYXRlKHBhZ2UpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBuZnNfZnNjYWNoZV93cml0ZV9wYWdlKGlub2RlLCBwYWdlKTsKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1bmxvY2tfcGFnZShwYWdlKTsKPiAtwqDCoMKgwqDCoMKgIH0K
PiArwqDCoMKgwqDCoMKgIGlmIChuZnNfcGFnZV9ncm91cF9zeW5jX29uX2JpdChyZXEsIFBHX1VO
TE9DS1BBR0UpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5mc19uZXRmc19yZWFk
cGFnZV9yZWxlYXNlKHJlcSk7Cj4gKwoKSSdtIG5vdCBzZWVpbmcgdGhlIHZhbHVlIG9mIHdyYXBw
aW5nIHVubG9ja19wYWdlKCksIG5vLi4uIFRoYXQgY29kZSBpcwpnb2luZyB0byBuZWVkIHRvIGNo
YW5nZSB3aGVuIHdlIG1vdmUgaXQgdG8gdXNlIGZvbGlvcyBuYXRpdmVseSBhbnl3YXkuCgo+IMKg
wqDCoMKgwqDCoMKgIG5mc19yZWxlYXNlX3JlcXVlc3QocmVxKTsKPiDCoH0KPiAKPiBAQCAtMTc3
LDYgKzE3MCw4IEBAIHN0YXRpYyB2b2lkIG5mc19yZWFkX2NvbXBsZXRpb24oc3RydWN0Cj4gbmZz
X3BnaW9faGVhZGVyICpoZHIpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5mc19s
aXN0X3JlbW92ZV9yZXF1ZXN0KHJlcSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG5mc19yZWFkcGFnZV9yZWxlYXNlKHJlcSwgZXJyb3IpOwo+IMKgwqDCoMKgwqDCoMKgIH0KPiAr
wqDCoMKgwqDCoMKgIG5mc19uZXRmc19yZWFkX2NvbXBsZXRpb24oaGRyKTsKPiArCj4gwqBvdXQ6
Cj4gwqDCoMKgwqDCoMKgwqAgaGRyLT5yZWxlYXNlKGhkcik7Cj4gwqB9Cj4gQEAgLTE4Nyw2ICsx
ODIsNyBAQCBzdGF0aWMgdm9pZCBuZnNfaW5pdGlhdGVfcmVhZChzdHJ1Y3QKPiBuZnNfcGdpb19o
ZWFkZXIgKmhkciwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBycGNfdGFza19zZXR1cCAqdGFza19zZXR1cF9kYXRhLAo+
IGludCBob3cpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqAgcnBjX29wcy0+cmVhZF9zZXR1cChoZHIs
IG1zZyk7Cj4gK8KgwqDCoMKgwqDCoCBuZnNfbmV0ZnNfaW5pdGlhdGVfcmVhZChoZHIpOwo+IMKg
wqDCoMKgwqDCoMKgIHRyYWNlX25mc19pbml0aWF0ZV9yZWFkKGhkcik7Cj4gwqB9Cj4gCj4gCj4g
QXJlIHlvdSBvayB3aXRoIHRoZXNlIGFkZGl0aW9ucz/CoCBTb21ldGhpbmcgbGlrZSB0aGlzIHdv
dWxkCj4gYmUgcmVxdWlyZWQgaW4gdGhlIGNhc2Ugb2YgZnNjYWNoZSBjb25maWd1cmVkIGFuZCBl
bmFibGVkLAo+IGJlY2F1c2Ugd2UgY291bGQgaGF2ZSBzb21lIG9mIHRoZSBkYXRhIGluIGEgcmVh
ZCBpbgo+IGZzY2FjaGUsIGFuZCBzb21lIG5vdC7CoCBUaGF0IGlzIHRoZSByZWFzb24gZm9yIHRo
ZSBuZXRmcwo+IGRlc2lnbiwgYW5kIHdoeSB3ZSBuZWVkIHRvIGJlIGFibGUgdG8gY2FsbCB0aGUg
bm9ybWFsCj4gTkZTIHJlYWQgSU8gcGF0aCAobmV0ZnMgY2FsbHMgaW50byBpc3N1ZV9yZWFkLCBh
bmQgd2UgY2FsbAo+IGJhY2sgdmlhIG5ldGZzX3N1YnJlcV90ZXJtaW5hdGVkKT8KPiAKPiBAQCAt
MTAxLDYgKzEwMSw5IEBAIHN0cnVjdCBuZnNfcGFnZWlvX2Rlc2NyaXB0b3Igewo+IMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCBwbmZzX2xheW91dF9zZWdtZW50ICpwZ19sc2VnOwo+IMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBuZnNfaW9fY29tcGxldGlvbiAqcGdfaW9fY29tcGxldGlvbjsKPiDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgbmZzX2RpcmVjdF9yZXHCoMKgICpwZ19kcmVxOwo+ICsjaWZkZWYgQ09O
RklHX05GU19GU0NBQ0hFCj4gK8KgwqDCoMKgwqDCoCB2b2lkwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKnBnX25ldGZzOwo+ICsjZW5kaWYKPiAKPiBAQCAtMTYxOSw2ICsx
NjE5LDkgQEAgc3RydWN0IG5mc19wZ2lvX2hlYWRlciB7Cj4gwqDCoMKgwqDCoMKgwqAgY29uc3Qg
c3RydWN0IG5mc19yd19vcHMgKnJ3X29wczsKPiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbmZzX2lv
X2NvbXBsZXRpb24gKmlvX2NvbXBsZXRpb247Cj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IG5mc19k
aXJlY3RfcmVxwqDCoCAqZHJlcTsKPiArI2lmZGVmIENPTkZJR19ORlNfRlNDQUNIRQo+ICvCoMKg
wqDCoMKgwqAgdm9pZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICpuZXRm
czsKPiArI2VuZGlmCj4gCj4gCj4gQW5kIHRoZXNlIGFkZGl0aW9ucyB0byBwYWdlbGlzdC5jPwo+
IAo+IEBAIC02OCw2ICs2OSwxMCBAQCB2b2lkIG5mc19wZ2hlYWRlcl9pbml0KHN0cnVjdAo+IG5m
c19wYWdlaW9fZGVzY3JpcHRvciAqZGVzYywKPiDCoMKgwqDCoMKgwqDCoCBoZHItPmdvb2RfYnl0
ZXMgPSBtaXJyb3ItPnBnX2NvdW50Owo+IMKgwqDCoMKgwqDCoMKgIGhkci0+aW9fY29tcGxldGlv
biA9IGRlc2MtPnBnX2lvX2NvbXBsZXRpb247Cj4gwqDCoMKgwqDCoMKgwqAgaGRyLT5kcmVxID0g
ZGVzYy0+cGdfZHJlcTsKPiArI2lmZGVmIENPTkZJR19ORlNfRlNDQUNIRQo+ICvCoMKgwqDCoMKg
wqAgaWYgKGRlc2MtPnBnX25ldGZzKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhk
ci0+bmV0ZnMgPSBkZXNjLT5wZ19uZXRmczsKPiArI2VuZGlmCgpXaHkgdGhlIGNvbmRpdGlvbmFs
PwoKPiAKPiAKPiBAQCAtODQ2LDYgKzg1MSw5IEBAIHZvaWQgbmZzX3BhZ2Vpb19pbml0KHN0cnVj
dCBuZnNfcGFnZWlvX2Rlc2NyaXB0b3IKPiAqZGVzYywKPiDCoMKgwqDCoMKgwqDCoCBkZXNjLT5w
Z19sc2VnID0gTlVMTDsKPiDCoMKgwqDCoMKgwqDCoCBkZXNjLT5wZ19pb19jb21wbGV0aW9uID0g
TlVMTDsKPiDCoMKgwqDCoMKgwqDCoCBkZXNjLT5wZ19kcmVxID0gTlVMTDsKPiArI2lmZGVmIENP
TkZJR19ORlNfRlNDQUNIRQo+ICvCoMKgwqDCoMKgwqAgZGVzYy0+cGdfbmV0ZnMgPSBOVUxMOwo+
ICsjZW5kaWYKPiAKPiAKPiBAQCAtMTM2MCw2ICsxMzY5LDkgQEAgaW50IG5mc19wYWdlaW9fcmVz
ZW5kKHN0cnVjdAo+IG5mc19wYWdlaW9fZGVzY3JpcHRvciAqZGVzYywKPiAKPiDCoMKgwqDCoMKg
wqDCoCBkZXNjLT5wZ19pb19jb21wbGV0aW9uID0gaGRyLT5pb19jb21wbGV0aW9uOwo+IMKgwqDC
oMKgwqDCoMKgIGRlc2MtPnBnX2RyZXEgPSBoZHItPmRyZXE7Cj4gKyNpZmRlZiBDT05GSUdfTkZT
X0ZTQ0FDSEUKPiArwqDCoMKgwqDCoMKgIGRlc2MtPnBnX25ldGZzID0gaGRyLT5uZXRmczsKPiAr
I2VuZGlmCgpUaG9zZSBhbGwgbmVlZCB3cmFwcGVyIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIGVtYmVk
ZGluZyAjaWZkZWZzLgoKPiAKPiAKPiA+IE15IGV4cGVjdGF0aW9uIGlzIHRoYXQgdGhlIHN0YW5k
YXJkIEkvTyBwYXRoIHNob3VsZCBoYXZlIG1pbmltYWwKPiA+IG92ZXJoZWFkLCBhbmQgc2hvdWxk
IGNlcnRhaW5seSBub3QgaW5jcmVhc2UgdGhlIG92ZXJoZWFkIHRoYXQgd2UKPiA+IGFscmVhZHkg
aGF2ZS4gV2lsbCB0aGlzIGJlIGFkZHJlc3NlZCBpbiBmdXR1cmUgaXRlcmF0aW9ucyBvZiB0aGVz
ZQo+ID4gcGF0Y2hlcz8KPiA+IAo+IAo+IEkgd2lsbCBkbyB3aGF0IEkgY2FuIHRvIHNhdGlzZnkg
d2hhdCB5b3Ugd2FudCwgZWl0aGVyIGJ5IGZpeGluZyB1cAo+IHRoaXMgcGF0Y2ggb3IgZm9sbG93
LW9uIHBhdGNoZXMuwqAgSG9wZWZ1bGx5IHRoZSBhYm92ZSBxdWVzdGlvbnMKPiB3aWxsIGNsYXJp
ZnkgdGhlIG5leHQgc3RlcHMuCj4gCgotLSAKVHJvbmQgTXlrbGVidXN0CkxpbnV4IE5GUyBjbGll
bnQgbWFpbnRhaW5lciwgSGFtbWVyc3BhY2UKdHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNv
bQoKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNv
bQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hl
ZnMK

