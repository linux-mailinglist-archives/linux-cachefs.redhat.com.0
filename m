Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBED7562FD
	for <lists+linux-cachefs@lfdr.de>; Mon, 17 Jul 2023 14:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689597879;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4pt+gsRh+hIy2q44EheUMflMxc8RdiuohP8zwa7ybXE=;
	b=M+r7r0rohZum6B/Jc/1b7RG73ogbuDdr/3ZsssRAqDMchd7DM29Q32FnM97PfYnYbUBQjW
	X09dI9Ap4kHllDDvFyAPLDofj68Ri6E3Ymt9qbFzzvRGmOX+UpwLuyqr0p++HCnxN83TdV
	eqvPPlgt3WfL6+Imk3BNg5khnGLAP+8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-xVS7LDkbOAq8tsaXp9QuOA-1; Mon, 17 Jul 2023 08:44:38 -0400
X-MC-Unique: xVS7LDkbOAq8tsaXp9QuOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1D5A1C172A0;
	Mon, 17 Jul 2023 12:44:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D08B0C2C862;
	Mon, 17 Jul 2023 12:44:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A8C9194658F;
	Mon, 17 Jul 2023 12:44:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DFF851946588 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 17 Jul 2023 12:44:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C39AB2166B26; Mon, 17 Jul 2023 12:44:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC10B2166B25
 for <linux-cachefs@redhat.com>; Mon, 17 Jul 2023 12:44:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B8223815EE3
 for <linux-cachefs@redhat.com>; Mon, 17 Jul 2023 12:44:29 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-6zyaghQzMrCYjPB9D3Uqnw-1; Mon, 17 Jul 2023 08:44:28 -0400
X-MC-Unique: 6zyaghQzMrCYjPB9D3Uqnw-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-262d505f44cso1979518a91.1
 for <linux-cachefs@redhat.com>; Mon, 17 Jul 2023 05:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689597867; x=1692189867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPBr5P6RMAc5J6eRrRxygG6j4FumvyTiuWHqCKdLMWY=;
 b=JuFlAWrak5A9/ey8vhSNU/bvHNgcWuqmD3k6zknAY6iT31TRUey0vYk9LEFbnQbUK8
 jPbzTGhcZ0txox07aK58FpXcsiAK3u/ZqZgbKFJ1QOtFUcktu1/fi5ho/F2BMnGZjXcX
 F+FKGs69UhDg8jyDRhfROG+ZrUPSZhKTIQS5tgvCCQlRDQc2H3WNtZFrqgqOFV6s2fjn
 Uqc3eVylTcBH6pe6bYe2PSic/mcemkH9XOHn2OJl9ZD6cCb8LvAgXk4LBigaRqnvjnHP
 gHq00hwufkOmL39vQienSE3fVkDikDfqS/hiFc0z8kU94Tq/VKV8PjPMxRdiQRUUG3EN
 nNIQ==
X-Gm-Message-State: ABy/qLbhWzRlePaKpPxBAma3FVoqclgiEP1YsRYT1UmJ8dICjKpFROA8
 ghlyJAaUdIDztU1gsgrHB1mcyR/U8uQk5BDXcvHO4bYGwiW6fQQE/ki1MEEvzCzKtf5W5esNPUZ
 74OanxZEFC0VEdbTaBu9H3FM89a1K972T9INWyg==
X-Received: by 2002:a17:90a:5902:b0:263:ea6a:1049 with SMTP id
 k2-20020a17090a590200b00263ea6a1049mr10021656pji.2.1689597867202; 
 Mon, 17 Jul 2023 05:44:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHasnKG+SNiDONa+CP1OSdvJTohPXX69WzDE7nIpw5fYJbI1G9ilrC2Cj9qoIe3xkPsQOURqnSvBH8qP+XIJY0=
X-Received: by 2002:a17:90a:5902:b0:263:ea6a:1049 with SMTP id
 k2-20020a17090a590200b00263ea6a1049mr10021649pji.2.1689597866936; Mon, 17 Jul
 2023 05:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230628104852.3391651-3-dhowells@redhat.com>
 <202307171548.7ab20146-oliver.sang@intel.com>
In-Reply-To: <202307171548.7ab20146-oliver.sang@intel.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 17 Jul 2023 08:43:50 -0400
Message-ID: <CALF+zOm5RuFSkd=KNxh+-vF+2SNsgP7s-WVrwHxVxxLrS6NtxQ@mail.gmail.com>
To: kernel test robot <oliver.sang@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: Jeff Layton <jlayton@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
 linux-afs@lists.infradead.org, Shyam Prasad N <nspmangalore@gmail.com>,
 linux-cifs@vger.kernel.org, lkp@intel.com,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 linux-cachefs@redhat.com, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 oe-lkp@lists.linux.dev, ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, linux-erofs@lists.ozlabs.org,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgMzozNeKAr0FNIGtlcm5lbCB0ZXN0IHJvYm90IDxvbGl2
ZXIuc2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4KPgo+IEhlbGxvLAo+Cj4ga2VybmVsIHRlc3Qg
cm9ib3Qgbm90aWNlZCAiY2Fub25pY2FsX2FkZHJlc3MjOiNbIyNdIiBvbjoKPgo+IGNvbW1pdDog
ODMwNTAzNDQwNDQ5MDE0ZGNmMGU0YjBiNmQ5MDVhMWIwYjJjOTJhZCAoIltQQVRDSCB2NyAyLzJd
IG1tLCBuZXRmcywgZnNjYWNoZTogU3RvcCByZWFkIG9wdGltaXNhdGlvbiB3aGVuIGZvbGlvIHJl
bW92ZWQgZnJvbSBwYWdlY2FjaGUiKQo+IHVybDogaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxh
Yi1sa3AvbGludXgvY29tbWl0cy9EYXZpZC1Ib3dlbGxzL21tLU1lcmdlLWZvbGlvX2hhc19wcml2
YXRlLWZpbGVtYXBfcmVsZWFzZV9mb2xpby1jYWxsLXBhaXJzLzIwMjMwNjI4LTE4NTEwMAo+IGJh
c2U6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L2FrcG0vbW0u
Z2l0IG1tLWV2ZXJ5dGhpbmcKPiBwYXRjaCBsaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMzA2MjgxMDQ4NTIuMzM5MTY1MS0zLWRob3dlbGxzQHJlZGhhdC5jb20vCj4gcGF0Y2gg
c3ViamVjdDogW1BBVENIIHY3IDIvMl0gbW0sIG5ldGZzLCBmc2NhY2hlOiBTdG9wIHJlYWQgb3B0
aW1pc2F0aW9uIHdoZW4gZm9saW8gcmVtb3ZlZCBmcm9tIHBhZ2VjYWNoZQo+Cj4gaW4gdGVzdGNh
c2U6IHZtLXNjYWxhYmlsaXR5Cj4gdmVyc2lvbjogdm0tc2NhbGFiaWxpdHkteDg2XzY0LTEuMC0w
XzIwMjIwNTE4Cj4gd2l0aCBmb2xsb3dpbmcgcGFyYW1ldGVyczoKPgo+ICAgICAgICAgcnVudGlt
ZTogMzAwCj4gICAgICAgICB0aHBfZW5hYmxlZDogYWx3YXlzCj4gICAgICAgICB0aHBfZGVmcmFn
OiBhbHdheXMKPiAgICAgICAgIG5yX3Rhc2s6IDMyCj4gICAgICAgICBucl9zc2Q6IDEKPiAgICAg
ICAgIHByaW9yaXR5OiAxCj4gICAgICAgICB0ZXN0OiBzd2FwLXctcmFuZAo+ICAgICAgICAgY3B1
ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKPgo+IHRlc3QtZGVzY3JpcHRpb246IFRoZSBtb3Rp
dmF0aW9uIGJlaGluZCB0aGlzIHN1aXRlIGlzIHRvIGV4ZXJjaXNlIGZ1bmN0aW9ucyBhbmQgcmVn
aW9ucyBvZiB0aGUgbW0vIG9mIHRoZSBMaW51eCBrZXJuZWwgd2hpY2ggYXJlIG9mIGludGVyZXN0
IHRvIHVzLgo+IHRlc3QtdXJsOiBodHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2Vy
bmVsL2dpdC93Zmcvdm0tc2NhbGFiaWxpdHkuZ2l0Lwo+Cj4KPiBjb21waWxlcjogZ2NjLTEyCj4g
dGVzdCBtYWNoaW5lOiAxMjggdGhyZWFkcyAyIHNvY2tldHMgSW50ZWwoUikgWGVvbihSKSBQbGF0
aW51bSA4MzU4IENQVSBAIDIuNjBHSHogKEljZSBMYWtlKSB3aXRoIDEyOEcgbWVtb3J5Cj4KPiAo
cGxlYXNlIHJlZmVyIHRvIGF0dGFjaGVkIGRtZXNnL2ttc2cgZm9yIGVudGlyZSBsb2cvYmFja3Ry
YWNlKQo+Cj4KPgo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29t
bWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiB0aGUgc2FtZSBwYXRjaC9jb21t
aXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRl
c3Qgcm9ib3QgPG9saXZlci5zYW5nQGludGVsLmNvbT4KPiB8IENsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb2UtbGtwLzIwMjMwNzE3MTU0OC43YWIyMDE0Ni1vbGl2ZXIuc2FuZ0BpbnRl
bC5jb20KPgoKVGhpcyBoYXMgYWxyZWFkeSBiZWVuIGZpeGVkIHdpdGgKaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYWtwbS9tbS5naXQvY29tbWl0Lz9oPW1t
LWV2ZXJ5dGhpbmcmaWQ9YWYxODU3MzQ3MWRiNWM1YzliOTZlYzk1MjA4YzM0MGFlN2MwMGU2NAoK
Cj4KPiBbICAgNDUuODk4NzIwXVsgVDE0NTNdCj4gWyAgIDQ1LjkwNzQ4MF1bIFQxNDUzXSAyMDIz
LTA3LTE2IDAwOjM2OjA3ICAuL2Nhc2Utc3dhcC13LXJhbmQKPiBbICAgNDUuOTA3NDgxXVsgVDE0
NTNdCj4gWyAgIDQ1LjkxNzg3M11bIFQxNDUzXSAyMDIzLTA3LTE2IDAwOjM2OjA3ICAuL3VzZW1l
bSAtLXJ1bnRpbWUgMzAwIC1uIDMyIC0tcmFuZG9tIDgwNDgxNDI0MzIKPiBbICAgNDUuOTE3ODc2
XVsgVDE0NTNdCj4gWyAgIDQ3LjM0ODYzMl1bICBUOTczXSBnZW5lcmFsIHByb3RlY3Rpb24gZmF1
bHQsIHByb2JhYmx5IGZvciBub24tY2Fub25pY2FsIGFkZHJlc3MgMHhmOGZmMTEwMDIwNzc3OGU2
OiAwMDAwIFsjMV0gU01QIE5PUFRJCj4gWyAgIDQ3LjM1OTc4N11bICBUOTczXSBDUFU6IDEyMyBQ
SUQ6IDk3MyBDb21tOiBrc3dhcGQxIFRhaW50ZWQ6IEcgUyAgICAgICAgICAgICAgICAgNi40LjAt
cmM0LTAwNTMzLWc4MzA1MDM0NDA0NDkgIzMKPiBbICAgNDcuMzcwMzAxXVsgIFQ5NzNdIEhhcmR3
YXJlIG5hbWU6IEludGVsIENvcnBvcmF0aW9uIE01MENZUDJTQjFVL001MENZUDJTQjFVLCBCSU9T
IFNFNUM2MjAuODZCLjAxLjAxLjAwMDMuMjEwNDI2MDEyNCAwNC8yNi8yMDIxCj4gWyA0Ny4zODIy
MDFdWyBUOTczXSBSSVA6IDAwMTA6ZmlsZW1hcF9yZWxlYXNlX2ZvbGlvIChrYnVpbGQvc3JjL3g4
Nl82NC9tbS9maWxlbWFwLmM6NDA2MyAoZGlzY3JpbWluYXRvciAxKSkKPiBbIDQ3LjM4ODE3Ml1b
IFQ5NzNdIENvZGU6IDAwIDQ4IDhiIDA3IDQ4IDhiIDU3IDE4IDgzIGUwIDAxIDc0IDRmIDQ4IGY3
IDA3IDAwIDYwIDAwIDAwIDc0IDIyIDQ4IDhiIDA3IGY2IGM0IDgwIDc1IDMyIDQ4IDg1IGQyIDc0
IDM0IDQ4IDhiIDgyIDkwIDAwIDAwIDAwIDw0OD4gOGIgNDAgNDggNDggODUgYzAgNzQgMjQgZmYg
ZTAgY2MgNjYgOTAgNDggODUgZDIgNzQgMTUgNDggOGIgOGEKPiBBbGwgY29kZQo+ID09PT09PT09
Cj4gICAgMDogICAwMCA0OCA4YiAgICAgICAgICAgICAgICBhZGQgICAgJWNsLC0weDc1KCVyYXgp
Cj4gICAgMzogICAwNyAgICAgICAgICAgICAgICAgICAgICAoYmFkKQo+ICAgIDQ6ICAgNDggOGIg
NTcgMTggICAgICAgICAgICAgbW92ICAgIDB4MTgoJXJkaSksJXJkeAo+ICAgIDg6ICAgODMgZTAg
MDEgICAgICAgICAgICAgICAgYW5kICAgICQweDEsJWVheAo+ICAgIGI6ICAgNzQgNGYgICAgICAg
ICAgICAgICAgICAgamUgICAgIDB4NWMKPiAgICBkOiAgIDQ4IGY3IDA3IDAwIDYwIDAwIDAwICAg
IHRlc3RxICAkMHg2MDAwLCglcmRpKQo+ICAgMTQ6ICAgNzQgMjIgICAgICAgICAgICAgICAgICAg
amUgICAgIDB4MzgKPiAgIDE2OiAgIDQ4IDhiIDA3ICAgICAgICAgICAgICAgIG1vdiAgICAoJXJk
aSksJXJheAo+ICAgMTk6ICAgZjYgYzQgODAgICAgICAgICAgICAgICAgdGVzdCAgICQweDgwLCVh
aAo+ICAgMWM6ICAgNzUgMzIgICAgICAgICAgICAgICAgICAgam5lICAgIDB4NTAKPiAgIDFlOiAg
IDQ4IDg1IGQyICAgICAgICAgICAgICAgIHRlc3QgICAlcmR4LCVyZHgKPiAgIDIxOiAgIDc0IDM0
ICAgICAgICAgICAgICAgICAgIGplICAgICAweDU3Cj4gICAyMzogICA0OCA4YiA4MiA5MCAwMCAw
MCAwMCAgICBtb3YgICAgMHg5MCglcmR4KSwlcmF4Cj4gICAyYToqICA0OCA4YiA0MCA0OCAgICAg
ICAgICAgICBtb3YgICAgMHg0OCglcmF4KSwlcmF4ICAgICAgICAgIDwtLSB0cmFwcGluZyBpbnN0
cnVjdGlvbgo+ICAgMmU6ICAgNDggODUgYzAgICAgICAgICAgICAgICAgdGVzdCAgICVyYXgsJXJh
eAo+ICAgMzE6ICAgNzQgMjQgICAgICAgICAgICAgICAgICAgamUgICAgIDB4NTcKPiAgIDMzOiAg
IGZmIGUwICAgICAgICAgICAgICAgICAgIGptcHEgICAqJXJheAo+ICAgMzU6ICAgY2MgICAgICAg
ICAgICAgICAgICAgICAgaW50Mwo+ICAgMzY6ICAgNjYgOTAgICAgICAgICAgICAgICAgICAgeGNo
ZyAgICVheCwlYXgKPiAgIDM4OiAgIDQ4IDg1IGQyICAgICAgICAgICAgICAgIHRlc3QgICAlcmR4
LCVyZHgKPiAgIDNiOiAgIDc0IDE1ICAgICAgICAgICAgICAgICAgIGplICAgICAweDUyCj4gICAz
ZDogICA0OCAgICAgICAgICAgICAgICAgICAgICByZXguVwo+ICAgM2U6ICAgOGIgICAgICAgICAg
ICAgICAgICAgICAgLmJ5dGUgMHg4Ygo+ICAgM2Y6ICAgOGEgICAgICAgICAgICAgICAgICAgICAg
LmJ5dGUgMHg4YQo+Cj4gQ29kZSBzdGFydGluZyB3aXRoIHRoZSBmYXVsdGluZyBpbnN0cnVjdGlv
bgo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgICAwOiAg
IDQ4IDhiIDQwIDQ4ICAgICAgICAgICAgIG1vdiAgICAweDQ4KCVyYXgpLCVyYXgKPiAgICA0OiAg
IDQ4IDg1IGMwICAgICAgICAgICAgICAgIHRlc3QgICAlcmF4LCVyYXgKPiAgICA3OiAgIDc0IDI0
ICAgICAgICAgICAgICAgICAgIGplICAgICAweDJkCj4gICAgOTogICBmZiBlMCAgICAgICAgICAg
ICAgICAgICBqbXBxICAgKiVyYXgKPiAgICBiOiAgIGNjICAgICAgICAgICAgICAgICAgICAgIGlu
dDMKPiAgICBjOiAgIDY2IDkwICAgICAgICAgICAgICAgICAgIHhjaGcgICAlYXgsJWF4Cj4gICAg
ZTogICA0OCA4NSBkMiAgICAgICAgICAgICAgICB0ZXN0ICAgJXJkeCwlcmR4Cj4gICAxMTogICA3
NCAxNSAgICAgICAgICAgICAgICAgICBqZSAgICAgMHgyOAo+ICAgMTM6ICAgNDggICAgICAgICAg
ICAgICAgICAgICAgcmV4LlcKPiAgIDE0OiAgIDhiICAgICAgICAgICAgICAgICAgICAgIC5ieXRl
IDB4OGIKPiAgIDE1OiAgIDhhICAgICAgICAgICAgICAgICAgICAgIC5ieXRlIDB4OGEKPiBbICAg
NDcuNDA4MTAzXVsgIFQ5NzNdIFJTUDogMDAxODpmZmEwMDAwMDA5NGY3YjI4IEVGTEFHUzogMDAw
MTAyNDYKPiBbICAgNDcuNDE0MjY2XVsgIFQ5NzNdIFJBWDogZjhmZjExMDAyMDc3Nzg5ZSBSQlg6
IGZmYTAwMDAwMDk0ZjdjMDggUkNYOiA5OGZmMTEwMDIwNzc3ODk4Cj4gWyAgIDQ3LjQyMjMzN11b
ICBUOTczXSBSRFg6IGZmMTEwMDIwNzc3ODhmNzEgUlNJOiAwMDAwMDAwMDAwMDAwY2MwIFJESTog
ZmZkNDAwMDA0Mjg3MGQwMAo+IFsgICA0Ny40MzA0MTddWyAgVDk3M10gUkJQOiBmZmEwMDAwMDA5
NGY3Yjk4IFIwODogZmYxMTAwMDFiYTEwNjMwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMjgKPiBbICAg
NDcuNDM4NDk3XVsgIFQ5NzNdIFIxMDogZmYxMTAwMTA4NDZiZDA4MCBSMTE6IGZmMTEwMDIwN2Zm
ZDQwMDAgUjEyOiBmZmQ0MDAwMDQyODcwZDAwCj4gWyAgIDQ3LjQ0NjU3NV1bICBUOTczXSBSMTM6
IGZmYTAwMDAwMDk0ZjdlMTAgUjE0OiBmZmEwMDAwMDA5NGY3YzFjIFIxNTogZmZkNDAwMDA0Mjg3
MGQwOAo+IFsgICA0Ny40NTQ2NThdWyAgVDk3M10gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDAp
IEdTOmZmMTEwMDIwMDQ2YzAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+IFsgICA0
Ny40NjM3MDNdWyAgVDk3M10gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAw
MDA4MDA1MDAzMwo+IFsgICA0Ny40NzA0MDZdWyAgVDk3M10gQ1IyOiAwMDAwN2ZkZGNhZjMwOGY4
IENSMzogMDAwMDAwMDFlMWE4MjAwMyBDUjQ6IDAwMDAwMDAwMDA3NzFlZTAKPiBbICAgNDcuNDc4
NDk2XVsgIFQ5NzNdIERSMDogMDAwMDAwMDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAg
RFIyOiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgIDQ3LjQ4NjU5NF1bICBUOTczXSBEUjM6IDAwMDAw
MDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZmZmUwZmYwIERSNzogMDAwMDAwMDAwMDAwMDQwMAo+
IFsgICA0Ny40OTQ2OTZdWyAgVDk3M10gUEtSVTogNTU1NTU1NTQKPiBbICAgNDcuNDk4MzcyXVsg
IFQ5NzNdIENhbGwgVHJhY2U6Cj4gWyAgIDQ3LjUwMTc5NV1bICBUOTczXSAgPFRBU0s+Cj4gWyA0
Ny41MDQ4NzBdWyBUOTczXSA/IGRpZV9hZGRyIChrYnVpbGQvc3JjL3g4Nl82NC9hcmNoL3g4Ni9r
ZXJuZWwvZHVtcHN0YWNrLmM6NDIxIGtidWlsZC9zcmMveDg2XzY0L2FyY2gveDg2L2tlcm5lbC9k
dW1wc3RhY2suYzo0NjApCj4gWyA0Ny41MDkxNTNdWyBUOTczXSA/IGV4Y19nZW5lcmFsX3Byb3Rl
Y3Rpb24gKGtidWlsZC9zcmMveDg2XzY0L2FyY2gveDg2L2tlcm5lbC90cmFwcy5jOjc4MyBrYnVp
bGQvc3JjL3g4Nl82NC9hcmNoL3g4Ni9rZXJuZWwvdHJhcHMuYzo3MjgpCj4gWyA0Ny41MTQ4MjZd
WyBUOTczXSA/IGFzbV9leGNfZ2VuZXJhbF9wcm90ZWN0aW9uIChrYnVpbGQvc3JjL3g4Nl82NC9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9pZHRlbnRyeS5oOjU2NCkKPiBbIDQ3LjUyMDY3OV1bIFQ5NzNd
ID8gZmlsZW1hcF9yZWxlYXNlX2ZvbGlvIChrYnVpbGQvc3JjL3g4Nl82NC9tbS9maWxlbWFwLmM6
NDA2MyAoZGlzY3JpbWluYXRvciAxKSkKPgo+Cj4gVG8gcmVwcm9kdWNlOgo+Cj4gICAgICAgICBn
aXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5naXQKPiAgICAgICAg
IGNkIGxrcC10ZXN0cwo+ICAgICAgICAgc3VkbyBiaW4vbGtwIGluc3RhbGwgam9iLnlhbWwgICAg
ICAgICAgICMgam9iIGZpbGUgaXMgYXR0YWNoZWQgaW4gdGhpcyBlbWFpbAo+ICAgICAgICAgYmlu
L2xrcCBzcGxpdC1qb2IgLS1jb21wYXRpYmxlIGpvYi55YW1sICMgZ2VuZXJhdGUgdGhlIHlhbWwg
ZmlsZSBmb3IgbGtwIHJ1bgo+ICAgICAgICAgc3VkbyBiaW4vbGtwIHJ1biBnZW5lcmF0ZWQteWFt
bC1maWxlCj4KPiAgICAgICAgICMgaWYgY29tZSBhY3Jvc3MgYW55IGZhaWx1cmUgdGhhdCBibG9j
a3MgdGhlIHRlc3QsCj4gICAgICAgICAjIHBsZWFzZSByZW1vdmUgfi8ubGtwIGFuZCAvbGtwIGRp
ciB0byBydW4gZnJvbSBhIGNsZWFuIHN0YXRlLgo+Cj4KPgo+IC0tCj4gMC1EQVkgQ0kgS2VybmVs
IFRlc3QgU2VydmljZQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQo+
Cj4KCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNv
bQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hl
ZnMK

