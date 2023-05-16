Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E88705717
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 May 2023 21:29:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684265395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Mj6mFj7Pfywv+xd1nKHVNb99HN3qvYcQ4r2AlCEn74=;
	b=TnT+VDIkwGriM/GHrHSuSXFd4CbLDgKEXqI1PmZ2dyrc7kEJiXsqj/MabNFBuEDpdfXdjv
	c+i9OH6DLIEIXl6T0xjOgBIdCV0JyWYQrZMgydPYIcTyh8LGcnkNngsrktQOzRULuij71L
	Bbe1tuO1vWb8oXis/r1atp3psKe3Qd4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-7Olcj_YHPuCHgcJ6KugTnw-1; Tue, 16 May 2023 15:29:53 -0400
X-MC-Unique: 7Olcj_YHPuCHgcJ6KugTnw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A25188CC40;
	Tue, 16 May 2023 19:29:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 734754021CD;
	Tue, 16 May 2023 19:29:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1EDDC19465B1;
	Tue, 16 May 2023 19:29:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F3B919465A3 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 16 May 2023 19:29:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4029B1121315; Tue, 16 May 2023 19:29:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 399221121314
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 19:29:50 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F401101A552
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 19:29:50 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-p-ZBR-0KNauuRXhE_aVdcQ-1; Tue, 16 May 2023 15:29:46 -0400
X-MC-Unique: p-ZBR-0KNauuRXhE_aVdcQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-25338b76f79so7605a91.3
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 12:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684265386; x=1686857386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t9UrkqIYKxvK9jQQrJXRaqEAIFWUC38gkJPtkDfF+s0=;
 b=Q+AuNyq58ShHcQVWFcofC4bQd24HOxVqDhWPsuzfmbkZr+qles01L9eUv66fqwXHxw
 6siAjqGgUbfWHBdVdI1aM2rbG/xKtansBXtKNaGdyAM0GaKnvx7mERh3Ihv+dhle/p5h
 loyOCYTbulZX7PUhoHq9mkAlj8Ws8+dn/ki/5henvRo/bVtK62yv873bP3ZkgLVxM59p
 sL9ACbNYB/H0qZQjwzamovGuTTJPQdhsBI9LgeF3DF8lRQ3Q5KNZgJj/s9bPFNf+wCCo
 T9hNDzA183Qed6DuoUpQW3ILAeT08mCbmDA8vymvEk9T4EqQ/wkIHGWanJX9uGAHlYth
 5bRA==
X-Gm-Message-State: AC+VfDzhlwUew9zLhwrZ4MfdKhW5Jm3MBypY3lQORuPBru1YR5iL7g9R
 d/7OeDmtPZbNRzx/Su6/uvsl0jxKdxVvwx5tVx/2auAKL5lIUXx22ZBLgkUwkwB7zTlw4cr9uBZ
 v9i9OFr2DO+lqGRXI4ZtZ/Ky0WxGHhMEl1mdZeg==
X-Received: by 2002:a17:90a:8049:b0:24d:e929:56cf with SMTP id
 e9-20020a17090a804900b0024de92956cfmr37452325pjw.39.1684265385701; 
 Tue, 16 May 2023 12:29:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gBFGff4dAZMhxmbGkiocJy63rZyONMUQ6rm3VRtZFYy02jZIS98cu+nLLPRraC5I03lzcx85+v3rvPJQsVd4=
X-Received: by 2002:a17:90a:8049:b0:24d:e929:56cf with SMTP id
 e9-20020a17090a804900b0024de92956cfmr37452303pjw.39.1684265385415; Tue, 16
 May 2023 12:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230216150701.3654894-1-dhowells@redhat.com>
In-Reply-To: <20230216150701.3654894-1-dhowells@redhat.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 16 May 2023 15:29:09 -0400
Message-ID: <CALF+zO=w2Gyz6JtzEoFgTVjH67-_CuTaK7e+2yoHEwXZ8bPx_A@mail.gmail.com>
To: David Howells <dhowells@redhat.com>, Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v6 0/2] mm, netfs,
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMTA6MDfigK9BTSBEYXZpZCBIb3dlbGxzIDxkaG93ZWxs
c0ByZWRoYXQuY29tPiB3cm90ZToKPgo+IEhpIFdpbGx5LAo+Cj4gSXMgdGhpcyBva2F5IGJ5IHlv
dT8gIFlvdSBzYWlkIHlvdSB3YW50ZWQgdG8gbG9vayBhdCB0aGUgcmVtYWluaW5nIHVzZXMgb2YK
PiBwYWdlX2hhc19wcml2YXRlKCksIG9mIHdoaWNoIHRoZXJlIGFyZSB0aGVuIHRocmVlIGFmdGVy
IHRoZXNlIHBhdGNoZXMsIG5vdAo+IGNvdW50aW5nIGZvbGlvX2hhc19wcml2YXRlKCk6Cj4KPiAg
ICAgICAgIGFyY2gvczM5MC9rZXJuZWwvdXYuYzogICAgICAgICAgaWYgKHBhZ2VfaGFzX3ByaXZh
dGUocGFnZSkpCj4gICAgICAgICBtbS9raHVnZXBhZ2VkLmM6ICAgICAgICAgICAgICAgICAgICAx
ICsgcGFnZV9tYXBjb3VudChwYWdlKSArIHBhZ2VfaGFzX3ByaXZhdGUocGFnZSkpIHsKPiAgICAg
ICAgIG1tL21pZ3JhdGVfZGV2aWNlLmM6ICAgICAgICAgICAgZXh0cmEgKz0gMSArIHBhZ2VfaGFz
X3ByaXZhdGUocGFnZSk7Cj4KPiAtLQo+IEkndmUgc3BsaXQgdGhlIGZvbGlvX2hhc19wcml2YXRl
KCkvZmlsZW1hcF9yZWxlYXNlX2ZvbGlvKCkgY2FsbCBwYWlyCj4gbWVyZ2luZyBpbnRvIGl0cyBv
d24gcGF0Y2gsIHNlcGFyYXRlIGZyb20gdGhlIGFjdHVhbCBidWdmaXggYW5kIHB1bGxlZCBvdXQK
PiB0aGUgZm9saW9fbmVlZHNfcmVsZWFzZSgpIGZ1bmN0aW9uIGludG8gbW0vaW50ZXJuYWwuaCBh
bmQgbWFkZQo+IGZpbGVtYXBfcmVsZWFzZV9mb2xpbygpIHVzZSBpdC4gIEkndmUgYWxzbyBnb3Qg
cmlkIG9mIHRoZSBiaXQgY2xlYXJhbmNlcwo+IGZyb20gdGhlIG5ldHdvcmsgZmlsZXN5c3RlbSBl
dmljdF9pbm9kZSBmdW5jdGlvbnMgYXMgdGhleSBkb2Vzbid0IHNlZW0gdG8KPiBiZSBuZWNlc3Nh
cnkuCj4KPiBOb3RlIHRoYXQgdGhlIGxhc3QgdmVzdGlnZXMgb2YgdHJ5X3RvX3JlbGVhc2VfcGFn
ZSgpIGdvdCBzd2VwdCBhd2F5LCBzbyBJCj4gcmViYXNlZCBhbmQgZGVhbHQgd2l0aCB0aGF0LiAg
T25lIGNvbW1lbnQgcmVtYWluZWQsIHdoaWNoIGlzIHJlbW92ZWQgYnkgdGhlCj4gZmlyc3QgcGF0
Y2guCj4KPiBEYXZpZAo+Cj4gQ2hhbmdlczoKPiA9PT09PT09PQo+IHZlciAjNikKPiAgLSBEcm9w
IHRoZSB0aGlyZCBwYXRjaCB3aGljaCByZW1vdmVzIGEgZHVwbGljYXRlIGNoZWNrIGluIHZtc2Nh
bigpLgo+Cj4gdmVyICM1KQo+ICAtIFJlYmFzZWQgb24gbGludXMvbWFzdGVyLiAgdHJ5X3RvX3Jl
bGVhc2VfcGFnZSgpIGhhcyBub3cgYmVlbiBlbnRpcmVseQo+ICAgIHJlcGxhY2VkIGJ5IGZpbGVt
YXBfcmVsZWFzZV9mb2xpbygpLCBiYXJyaW5nIG9uZSBjb21tZW50Lgo+ICAtIENsZWFuZWQgdXAg
c29tZSBwYWlycyBpbiBleHQ0Lgo+Cj4gdmVyICM0KQo+ICAtIFNwbGl0IGhhc19wcml2YXRlL3Jl
bGVhc2UgY2FsbCBwYWlycyBpbnRvIG93biBwYXRjaC4KPiAgLSBNb3ZlZCBmb2xpb19uZWVkc19y
ZWxlYXNlKCkgdG8gbW0vaW50ZXJuYWwuaCBhbmQgcmVtb3ZlZCBvcGVuLWNvZGVkCj4gICAgdmVy
c2lvbiBmcm9tIGZpbGVtYXBfcmVsZWFzZV9mb2xpbygpLgo+ICAtIERvbid0IG5lZWQgdG8gY2xl
YXIgQVNfUkVMRUFTRV9BTFdBWVMgaW4gLT5ldmljdF9pbm9kZSgpLgo+ICAtIEFkZGVkIGV4cGVy
aW1lbnRhbCBwYXRjaCB0byByZWR1Y2Ugc2hyaW5rX2ZvbGlvX2xpc3QoKS4KPgo+IHZlciAjMykK
PiAgLSBGaXhlZCBtYXBwaW5nX2NsZWFyX3JlbGVhc2VfYWx3YXlzKCkgdG8gdXNlIGNsZWFyX2Jp
dCgpIG5vdCBzZXRfYml0KCkuCj4gIC0gTW92ZWQgYSAnJiYnIHRvIHRoZSBjb3JyZWN0IGxpbmUu
Cj4KPiB2ZXIgIzIpCj4gIC0gUmV3cm90ZSBlbnRpcmVseSBhY2NvcmRpbmcgdG8gV2lsbHkncyBz
dWdnZXN0aW9uWzFdLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9ZazlWLzAz
d2dkWWk2NUxiQGNhc3Blci5pbmZyYWRlYWQub3JnLyBbMV0KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzE2NDkyODYzMDU3Ny40NTcxMDIuODUxOTI1MTE3OTMyNzYwMTE3OC5zdGdp
dEB3YXJ0aG9nLnByb2N5b24ub3JnLnVrLyAjIHYxCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8xNjY4NDQxNzQwNjkuMTEyNDUyMS4xMDg5MDUwNjM2MDk3NDE2OTk5NC5zdGdpdEB3
YXJ0aG9nLnByb2N5b24ub3JnLnVrLyAjIHYyCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8xNjY4Njk0OTUyMzguMzcyMDQ2OC40ODc4MTUxNDA5MDg1MTQ2NzY0LnN0Z2l0QHdhcnRo
b2cucHJvY3lvbi5vcmcudWsvICMgdjMKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzE0NTkxNTIuMTY2OTIwODU1MEB3YXJ0aG9nLnByb2N5b24ub3JnLnVrLyAjIHYzIGFsc28KPiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzE2NjkyNDM3MDUzOS4xNzcyNzkzLjEzNzMw
Njk4MzYwNzcxODIxMzE3LnN0Z2l0QHdhcnRob2cucHJvY3lvbi5vcmcudWsvICMgdjQKPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzE2NzE3MjEzMTM2OC4yMzM0NTI1Ljg1Njk4MDg5
MjU2ODc3MzE5Mzcuc3RnaXRAd2FydGhvZy5wcm9jeW9uLm9yZy51ay8gIyB2NQo+IC0tLQo+ICUo
c2hvcnRsb2cpcwo+ICUoZGlmZnN0YXQpcwo+Cj4gRGF2aWQgSG93ZWxscyAoMik6Cj4gICBtbTog
TWVyZ2UgZm9saW9faGFzX3ByaXZhdGUoKS9maWxlbWFwX3JlbGVhc2VfZm9saW8oKSBjYWxsIHBh
aXJzCj4gICBtbSwgbmV0ZnMsIGZzY2FjaGU6IFN0b3AgcmVhZCBvcHRpbWlzYXRpb24gd2hlbiBm
b2xpbyByZW1vdmVkIGZyb20KPiAgICAgcGFnZWNhY2hlCj4KPiAgZnMvOXAvY2FjaGUuYyAgICAg
ICAgICAgfCAgMiArKwo+ICBmcy9hZnMvaW50ZXJuYWwuaCAgICAgICB8ICAyICsrCj4gIGZzL2Nh
Y2hlZmlsZXMvbmFtZWkuYyAgIHwgIDIgKysKPiAgZnMvY2VwaC9jYWNoZS5jICAgICAgICAgfCAg
MiArKwo+ICBmcy9jaWZzL2ZzY2FjaGUuYyAgICAgICB8ICAyICsrCj4gIGZzL2V4dDQvbW92ZV9l
eHRlbnQuYyAgIHwgMTIgKysrKy0tLS0tLS0tCj4gIGZzL3NwbGljZS5jICAgICAgICAgICAgIHwg
IDMgKy0tCj4gIGluY2x1ZGUvbGludXgvcGFnZW1hcC5oIHwgMTYgKysrKysrKysrKysrKysrKwo+
ICBtbS9maWxlbWFwLmMgICAgICAgICAgICB8ICAyICsrCj4gIG1tL2h1Z2VfbWVtb3J5LmMgICAg
ICAgIHwgIDMgKy0tCj4gIG1tL2ludGVybmFsLmggICAgICAgICAgIHwgMTEgKysrKysrKysrKysK
PiAgbW0va2h1Z2VwYWdlZC5jICAgICAgICAgfCAgMyArLS0KPiAgbW0vbWVtb3J5LWZhaWx1cmUu
YyAgICAgfCAgOCArKystLS0tLQo+ICBtbS9taWdyYXRlLmMgICAgICAgICAgICB8ICAzICstLQo+
ICBtbS90cnVuY2F0ZS5jICAgICAgICAgICB8ICA2ICsrLS0tLQo+ICBtbS92bXNjYW4uYyAgICAg
ICAgICAgICB8ICA4ICsrKystLS0tCj4gIDE2IGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMo
KyksIDI5IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiBMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdAo+
IExpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQo+IGh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo+CgpXaWxseSwgYW5kIERhdmlkLAoKQ2FuIHRo
aXMgc2VyaWVzIG1vdmUgZm9yd2FyZD8KVGhpcyBqdXN0IGdvdCBtZW50aW9uZWQgYWdhaW4gWzFd
IGFmdGVyIENocmlzIHRlc3RlZCB0aGUgTkZTIG5ldGZzCnBhdGNoZXMgdGhhdCB3ZXJlIG1lcmdl
ZCBpbiA2LjQtcmMxCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbmZzL0NBQW1i
ay1mX1U4Q1BjVFFNODY2TDU3MnVVSGRLNHA1aVdLblVRczRyOGZrVz02Ulc5Z0BtYWlsLmdtYWls
LmNvbS8KCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0
LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNh
Y2hlZnMK

