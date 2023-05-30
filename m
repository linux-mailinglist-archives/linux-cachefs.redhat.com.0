Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8E27162D3
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 May 2023 15:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685455140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+bsGs3G9Fv2RuoXG7lUlhxrHtbthn8VmdWdyupw+/9I=;
	b=CGe4z76zkPyWPeLaZHhgSsBRF2uQRmkJUhzgIMyf25VNL7usFn9stW2TMUN9wcEy+XLrxl
	cUN9ZC/M0dQq9S0ved2iPk9IticWlOVyI1HEy/pMw1hi8vDXawN/97d0HKcSTLSdJsNZmT
	EOQm1ussCuoUXbiGFNRJRk9q2rKBiOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-s40eWVaKP2aDUFmkHax57Q-1; Tue, 30 May 2023 09:58:57 -0400
X-MC-Unique: s40eWVaKP2aDUFmkHax57Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2659C811E88;
	Tue, 30 May 2023 13:58:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D5D740CFD45;
	Tue, 30 May 2023 13:58:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3E30819465A8;
	Tue, 30 May 2023 13:58:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 839B11946595 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 30 May 2023 13:58:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 60F88492B0B; Tue, 30 May 2023 13:58:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59639492B0A
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 13:58:54 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AFB73C11A14
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 13:58:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-cGJl7GoiMpaesfDPtVLVVw-1; Tue, 30 May 2023 09:58:49 -0400
X-MC-Unique: cGJl7GoiMpaesfDPtVLVVw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 688B862676;
 Tue, 30 May 2023 13:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8179C433EF;
 Tue, 30 May 2023 13:58:38 +0000 (UTC)
Date: Tue, 30 May 2023 15:58:35 +0200
From: Christian Brauner <brauner@kernel.org>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Message-ID: <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
MIME-Version: 1.0
In-Reply-To: <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH -next 0/2] lsm: Change inode_setattr()
 to take struct
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
Cc: mortonm@chromium.org, rafael@kernel.org, roberto.sassu@huawei.com,
 linux-unionfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-cifs@vger.kernel.org, paul@paul-moore.com, miklos@szeredi.hu,
 mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, tom@talpey.com,
 linux-fsdevel@vger.kernel.org, wangweiyang2@huawei.com,
 viro@zeniv.linux.org.uk, dchinner@redhat.com, eparis@parisplace.org,
 hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com, linux-nfs@vger.kernel.org,
 john.johansen@canonical.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, casey@schaufler-ca.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMDY6MzM6MDVQTSArMDIwMCwgTWlja2HDq2wgU2FsYcO8
biB3cm90ZToKPiAKPiBPbiAxNS8wNS8yMDIzIDE3OjEyLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90
ZToKPiA+IE9uIEZyaSwgTWF5IDA1LCAyMDIzIGF0IDA0OjExOjU4UE0gKzA4MDAsIFhpdSBKaWFu
ZmVuZyB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+ID4gPiBJIGFtIHdvcmtpbmcgb24gYWRkaW5n
IHhhdHRyL2F0dHIgc3VwcG9ydCBmb3IgbGFuZGxvY2sgWzFdLCBzbyB3ZSBjYW4KPiA+ID4gY29u
dHJvbCBmcyBhY2Nlc3NlcyBzdWNoIGFzIGNobW9kLCBjaG93biwgdXB0aW1lcywgc2V0eGF0dHIs
IGV0Yy4uIGluc2lkZQo+ID4gPiBsYW5kbG9jayBzYW5kYm94LiB0aGUgTFNNIGhvb2tzIGFzIGZv
bGxvd2luZyBhcmUgaW52b3ZlZDoKPiA+ID4gMS5pbm9kZV9zZXRhdHRyCj4gPiA+IDIuaW5vZGVf
c2V0eGF0dHIKPiA+ID4gMy5pbm9kZV9yZW1vdmV4YXR0cgo+ID4gPiA0Lmlub2RlX3NldF9hY2wK
PiA+ID4gNS5pbm9kZV9yZW1vdmVfYWNsCj4gPiA+IHdoaWNoIGFyZSBjb250cm9sbGVkIGJ5IExB
TkRMT0NLX0FDQ0VTU19GU19XUklURV9NRVRBREFUQS4KPiA+ID4gCj4gPiA+IGFuZAo+ID4gPiAx
Lmlub2RlX2dldGF0dHIKPiA+ID4gMi5pbm9kZV9nZXRfYWNsCj4gPiA+IDMuaW5vZGVfZ2V0eGF0
dHIKPiA+ID4gNC5pbm9kZV9saXN0eGF0dHIKPiA+ID4gd2hpY2ggYXJlIGNvbnRyb2xsZWQgYnkg
TEFORExPQ0tfQUNDRVNTX0ZTX1JFQURfTUVUQURBVEEKPiA+IAo+ID4gSXQgd291bGQgYmUgaGVs
cGZ1bCB0byBnZXQgdGhlIGNvbXBsZXRlLCBmdWxsIHBpY3R1cmUuCj4gPiAKPiA+IFBpZWNlbWVh
bCBleHRlbmRpbmcgdmZzIGhlbHBlcnMgd2l0aCBzdHJ1Y3QgcGF0aCBhcmd1bWVudHMgaXMgY29z
dGx5LAo+ID4gd2lsbCBjYXVzZSBhIGxvdCBvZiBjaHVybiBhbmQgd2lsbCByZXF1aXJlIGEgbG90
IG9mIHJldmlldyB0aW1lIGZyb20gdXMuCj4gPiAKPiA+IFBsZWFzZSBnaXZlIHVzIHRoZSBsaXN0
IG9mIGFsbCBzZWN1cml0eSBob29rcyB0byB3aGljaCB5b3Ugd2FudCB0byBwYXNzCj4gPiBhIHN0
cnVjdCBwYXRoIChpZiB0aGVyZSBhcmUgbW9yZSB0byBjb21lIGFwYXJ0IGZyb20gdGhlIG9uZXMg
bGlzdGVkCj4gPiBoZXJlKS4gVGhlbiBwbGVhc2UgZm9sbG93IGFsbCBjYWxsY2hhaW5zIGFuZCBp
ZGVudGlmeSB0aGUgdmZzIGhlbHBlcnMKPiA+IHRoYXQgd291bGQgbmVlZCB0byBiZSB1cGRhdGVk
LiBUaGVuIHBsZWFzZSBmaWd1cmUgb3V0IHdoZXJlIHRob3NlCj4gPiB2ZnMgaGVscGVycyBhcmUg
Y2FsbGVkIGZyb20gYW5kIGZvbGxvdyBhbGwgY2FsbGNoYWlucyBmaW5kaW5nIGFsbAo+ID4gaW5v
ZGVfb3BlcmF0aW9ucyB0aGF0IHdvdWxkIGhhdmUgdG8gYmUgdXBkYXRlZCBhbmQgcGFzc2VkIGEg
c3RydWN0IHBhdGgKPiA+IGFyZ3VtZW50LiBTbyB1bHRpbWF0ZWx5IHdlJ2xsIGVuZCB1cCB3aXRo
IGEgbGlzdCBvZiB2ZnMgaGVscGVycyBhbmQKPiA+IGlub2RlX29wZXJhdGlvbnMgdGhhdCB3b3Vs
ZCBoYXZlIHRvIGJlIGNoYW5nZWQuCj4gPiAKPiA+IEknbSB2ZXJ5IHJlbHVjdGFudCB0byBzZWUg
YW55dGhpbmcgbWVyZ2VkIHdpdGhvdXQga25vd2luZyBfZXhhY3RseV8gd2hhdAo+ID4geW91J3Jl
IGdldHRpbmcgdXMgaW50by4KPiAKPiBVbHRpbWF0ZWx5IHdlJ2QgbGlrZSB0aGUgcGF0aC1iYXNl
ZCBMU01zIHRvIHJlYWNoIHBhcml0eSB3aXRoIHRoZQo+IGlub2RlLWJhc2VkIExTTXMuIFRoaXMg
cHJvcG9zYWwncyBnb2FsIGlzIHRvIHByb3ZpZGUgdXNlcnMgdGhlIGFiaWxpdHkgdG8KPiBjb250
cm9sIChpbiBhIGNvbXBsZXRlIGFuZCBlYXN5IHdheSkgZmlsZSBtZXRhZGF0YSBhY2Nlc3MuIEZv
ciB0aGVzZSB3ZSBuZWVkCj4gdG8gZXh0ZW5kIHRoZSBpbm9kZV8qYXR0ciBob29rcyBhbmQgaW5v
ZGVfKmFjbCBob29rcyB0byBoYW5kbGUgcGF0aHMuIFRoZQo+IGNob3duL2NobW9kIGhvb2tzIGFy
ZSBhbHJlYWR5IGdvb2QuCj4gCj4gSW4gdGhlIGZ1dHVyZSwgSSdkIGFsc28gbGlrZSB0byBiZSBh
YmxlIHRvIGNvbnRyb2wgZGlyZWN0b3J5IHRyYXZlcnNhbHMKPiAoZS5nLiBjaGRpciksIHdoaWNo
IGN1cnJlbnRseSBvbmx5IGNhbGxzIGlub2RlX3Blcm1pc3Npb24oKS4KPiAKPiBXaGF0IHdvdWxk
IGJlIHRoZSBiZXN0IHdheSB0byByZWFjaCB0aGlzIGdvYWw/CgpUaGUgbWFpbiBjb25jZXJuIHdo
aWNoIHdhcyBleHByZXNzZWQgb24gb3RoZXIgcGF0Y2hzZXRzIGJlZm9yZSBpcyB0aGF0Cm1vZGlm
eWluZyBpbm9kZSBvcGVyYXRpb25zIHRvIHRha2Ugc3RydWN0IHBhdGggaXMgbm90IHRoZSB3YXkg
dG8gZ28uClBhc3Npbmcgc3RydWN0IHBhdGggaW50byBpbmRpdmlkdWFsIGZpbGVzeXN0ZW1zIGlz
IGEgY2xlYXIgbGF5ZXJpbmcKdmlvbGF0aW9uIGZvciBtb3N0IGlub2RlIG9wZXJhdGlvbnMsIHNv
bWV0aW1lcyBkb3ducmlnaHQgbm90IGZlYXNpYmxlLAphbmQgaW4gZ2VuZXJhbCBleHBvc2luZyBz
dHJ1Y3QgdmZzbW91bnQgdG8gZmlsZXN5c3RlbXMgaXMgYSBoYXJkIG5vLiBBdApsZWFzdCBhcyBm
YXIgYXMgSSdtIGNvbmNlcm5lZC4KClNvIHRoZSBiZXN0IHdheSB0byBhY2hpZXZlIHRoZSBsYW5k
bG9jayBnb2FsIG1pZ2h0IGJlIHRvIGFkZCBuZXcgaG9va3MKaW4gY2FzZXMgd2hlcmUgeW91IHdv
dWxkIGJlIHJlcXVpcmVkIHRvIG1vZGlmeSBpbm9kZSBvcGVyYXRpb25zCm90aGVyd2lzZS4gVGFr
aW5nIHRoZSBjaGRpcigpIGNhc2UgYXMgYW4gZXhhbXBsZS4gVGhhdCBjYWxscwpwYXRoX3Blcm1p
c3Npb24oKS4gU2luY2UgaW5vZGVfcGVybWlzc2lvbigpIGFuZCBnZW5lcmljX3Blcm1pc3Npb24o
KSBhcmUKY2FsbGVkIGluIGEgbG90IG9mIHBsYWNlcyB3aGVyZSBub3QgZXZlbiBhIGRlbnRyeSBt
aWdodCBiZSByZWFkaWx5CmF2YWlsYWJsZSB3ZSB3aWxsIG5vdCBleHRlbmQgdGhlbSB0byB0YWtl
IGEgc3RydWN0IHBhdGggYXJndW1lbnQuIFRoaXMKd291bGQgYWxzbyBpbnZvbHZlIGV4dGVuZGlu
ZyB0aGUgaW5vZGUgLT5wZXJtaXNzaW9uKCkgbWV0aG9kIHdoaWNoIGlzIGEKbm8gZ28uIFRoYXQn
cyBuZWl0aGVyIGZlYXNpYmxlIGFuZCB3b3VsZCBpbnZvbHZlIG1vZGlmeWluZyBhIGdvb2QgY2h1
bmsKb2YgY29kZSBmb3IgdGhlIHNvbGUgcHVycG9zZSBvZiBhbiBMU00uCgpTbyBpbiBwYXRoX3Bl
cm1pc3Npb24oKSB5b3UgbWlnaHQgaGF2ZSB0aGUgcG90ZW50aWFsIHRvIGFkZCBhbiBMU00gaG9v
ay4KT3IgaWYgeW91IG5lZWQgdG8ga25vdyB3aGF0IHN5c2NhbGwgdGhpcyB3YXMgY2FsbGVkIGZv
ciB5b3UgbWlnaHQgaGF2ZQp0byBhZGQgYSBob29rIGludG8gY2hkaXIoKSBpdHNlbGYuIFRoYXQg
aXMgc3RpbGwgdW5wbGVhc2FudCBidXQgc2luY2UKdGhlIGFsdGVybmF0aXZlIHRvIGFkZGluZyBu
ZXcgTFNNIGhvb2tzIG1pZ2h0IGJlIGVuZGxlc3MgbGF5ZXJpbmcKdmlvbGF0aW9ucyB0aGF0J3Mg
YSBjb21wcm9taXNlIHRoYXQgYXQgbGVhc3QgSSBjYW4gbGl2ZSB3aXRoLiBVbHRpbWF0ZWx5Cnlv
dSBoYXZlIHRvIGNvbnZpbmNlIG1vcmUgcGVvcGxlLgoKU29tZSBjb25jZXJucyBhcm91bmQgcGFz
c2luZyBzdHJ1Y3QgcGF0aCB0byBMU00gaG9va3MgaW4gZ2VuZXJhbCB0aGF0IEkKd291bGQgbGlr
ZSB0byBqdXN0IHBvaW50IG91dCBhbmQgYXNrIHlvdSB0byBrZWVwIGluIG1pbmQ6IEFzIHNvb24g
YXMKdGhlcmUncyBhbiBMU00gaG9vayB0aGF0IHRha2VzIGEgcGF0aCBhcmd1bWVudCBpdCBtZWFu
cyBhbGwgTFNNcyBoYXZlCmFjY2VzcyB0byBhIHN0cnVjdCBwYXRoLiBBdCB0aGF0IHBvaW50IHZp
c2liaWxpdHkgaW50byB3aGF0J3MgYmVlbiBkb25lCnRvIHRoYXQgc3RydWN0IHBhdGggaXMgbG9z
dCBmb3IgdGhlIGZzIGxheWVyLgoKT25lIHRoZSBvbmUgaGFuZCB0aGF0J3MgZmluZSBvbiB0aGUg
b3RoZXIgaGFuZCBzb29uZXIgb3IgbGF0ZXIgc29tZSBMU00Kd2lsbCB0cnkgdG8gZ2V0IGNyZWF0
aXZlIGFuZCBkbyB0aGluZ3MgbGlrZSBzdGFydGluZyB0byBpbmZlcgpyZWxhdGlvbnNoaXBzIGJl
dHdlZW4gbW91bnRzIHdpdGhvdXQgdW5kZXJzdGFuZGluZyBtb3VudCBwcm9wZXJ0eSBhbmQKbW91
bnQgaGFuZGxpbmcgZW5vdWdoLCBvciBzdGFydCB0cnlpbmcgdG8gaW5mZXIgdGhlIHBhcmVudCBv
ZiBhIHBhdGggYW5kCnBlcmZvcm0gcGVybWlzc2lvbiBjaGVja3Mgb24gaXQgaW4gd2F5cyB0aGF0
IGFyZW4ndCBzYW5lLiBBbmQgdGhhdCBzdWNrcwpiZWNhdXNlIHRoaXMgb25seSBiZWNvbWVzIG9i
dmlvdXMgd2hlbiBmcyB3aWRlIGNoYW5nZXMgYXJlIGRvbmUgdGhhdAphZmZlY3QgTFNNIGhvb2tz
IGFzIHdlbGwuCgpBbmQgdGhhdCdzIHRoZSBvdGhlciB0aGluZy4gVGhlIG1vcmUgb2JqZWN0cyB0
aGUgTFNNIGxheWVyIGdldHMgYWNjZXNzCnRvIHRoZSBncmVhdGVyIHRoZSBjb3N0IHRvIGRvIGZz
IHdpZGUgY2hhbmdlcyBiZWNhdXNlIHRoZSBmcyBsYXllciBpcwpub3cgZXZlbiBjbG9zZXIgZW50
YW5nbGVkIHdpdGggdGhlIExTTSBsYXllci4gRm9yIGV4YW1wbGUsIGV2ZW4gc2ltcGxlCnRoaW5n
cyBsaWtlIHJlbW92aW5nIElPUF9YQVRUUiAtIGV2ZW4ganVzdCBmb3IgUE9TSVggQUNMcyAtIHN1
ZGRlbmx5CmJlY29tZSBjb21wbGljYXRlZCBub3QgYmVjYXVzZSBvZiB0aGUgZnMgbGF5ZXIgYnV0
IGJlY2F1c2Ugb2YgaG93IHRoZQpMU00gbGF5ZXIgbWFrZXMgdXNlIG9mIGl0LiBJdCBtaWdodCBz
dGFydCByZWx5aW5nIG9uIGludGVybmFsIGZsYWdzIHRoYXQKd291bGQgYmUgcmV2b2tlZCBsYXRl
ciBhbmQgc28gb24uIFRoYXQgYWxzbyBnb2VzIGZvciBzdHJ1Y3QgdmZzbW91bnQuIFNvCml0IG1l
YW5zIGdvaW5nIHRocm91Z2ggZXZlcnkgTFNNIHRyeWluZyB0byBmaWd1cmUgb3V0IGlmIGEgY2hh
bmdlIGlzIG9rCm9yIG5vdC4gQW5kIHdlIGtlZXAgYWRkaW5nIG5ldyBMU01zIHdpdGhvdXQgZGVw
cmVjYXRpbmcgb2xkZXIgb25lcyAoQQpwcm9ibGVtIHdlIGFsc28gZmFjZSBpbiB0aGUgZnMgbGF5
ZXIuKSBhbmQgdGhlbiB0aGV5IHNpdCBhcm91bmQgYnV0CnN0aWxsIG5lZWQgdG8gYmUgdGFrZW4g
aW50byBhY2NvdW50IHdoZW4gZG9pbmcgY2hhbmdlcy4KCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGlu
ZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

