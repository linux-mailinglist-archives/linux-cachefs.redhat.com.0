Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 851E47640E1
	for <lists+linux-cachefs@lfdr.de>; Wed, 26 Jul 2023 23:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690405634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RfKu0Tr0PVxb2j7bA2/RxhVMzHMwaZGlfznGlAxB5Mg=;
	b=A7i1DO+rMauWLNLFg0lXoddjGGpEnNTgXRetpepxAE9cCldY2j20FKurfMj12K5jZ39NJn
	q9IQvDYKt0HnK7we9gA2cLW++tL34nOWOdkYRrMT8tiuFXDMnYoaOHtTgQ/wDdDYEtHO4e
	UD50Wy8oi/5FpkhWW2h2ZdWK26uxOAI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-IeWZfwe0PpCbO_Guidr3Qw-1; Wed, 26 Jul 2023 17:07:11 -0400
X-MC-Unique: IeWZfwe0PpCbO_Guidr3Qw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDB3E3810D29;
	Wed, 26 Jul 2023 21:07:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 753AE40C2063;
	Wed, 26 Jul 2023 21:07:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F3CD61946A72;
	Wed, 26 Jul 2023 21:07:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D51D1946A6C for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 20:37:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D484200B41D; Wed, 26 Jul 2023 20:37:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75275201EC58
 for <linux-cachefs@redhat.com>; Wed, 26 Jul 2023 20:37:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 561A62800C34
 for <linux-cachefs@redhat.com>; Wed, 26 Jul 2023 20:37:30 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-wKV0LxQ2OsWvTQRoK6odfA-1; Wed, 26 Jul 2023 16:37:26 -0400
X-MC-Unique: wKV0LxQ2OsWvTQRoK6odfA-1
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so2574681fa.2; 
 Wed, 26 Jul 2023 13:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690403844; x=1691008644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lwD0XW5XNFFxl46sPGBkyRuR0c2+TXyAF+CGil8NRI=;
 b=h9SHq5b1rVbMNK4eoRXxUWJB7AQG7U/09OfQcw8Ysfv4UJrVAjvZRwY4M8K8Gl6IXr
 HYIjjCL9VzgwDl8cNAR7lCX0/f31DM/eojqYcDnWhrEzTxlP04oEgY14mm8xnmRpWDw6
 0pIBx7NyayMLxX2DOyldAnPNHPeBeDKtsz/V9dijwgv/yR5GILg/LoPHKXOt37AK/bel
 eDOGJkFRp5jW82BEXjHtgDQk6UeNk6Vp1Rx79Hw58DEnHlKfTjTp7BN5nOk4EijDFlo+
 OyvFQGrDUk5pyklvTOcmBh71owjaNUuIbA8aGGjDjcdxk7wKG8ynV85bKQZlcG8xYGL9
 dxGA==
X-Gm-Message-State: ABy/qLbwt0epGt0Q8E+eGTku7dMYSgAO3U3t1bESLi98CcdmRfNQvlA2
 E9ZkBf5FW33XFQLWlm14+J6nauUWT0ZMeXjrGipHo26z/u0=
X-Google-Smtp-Source: APBJJlEBZjUVEWmH37ptqLNcNX8TxOf/NsFag9dWp+iIhP+gTcIv5RvFOUu1qEFSS9+AlBqg9RVIEdg2dS0OjOpUZFE=
X-Received: by 2002:a2e:8490:0:b0:2b6:9afe:191c with SMTP id
 b16-20020a2e8490000000b002b69afe191cmr129103ljh.7.1690403843955; Wed, 26 Jul
 2023 13:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20571.1690369076@warthog.procyon.org.uk>
 <416eca24-6baf-69d9-21a2-c434a9744596@redhat.com>
In-Reply-To: <416eca24-6baf-69d9-21a2-c434a9744596@redhat.com>
From: Steve French <smfrench@gmail.com>
Date: Wed, 26 Jul 2023 15:37:12 -0500
Message-ID: <CAH2r5mtMLQ91znvYP71s_K7uS_HibC_yOpkZea-f=+NteFJyPg@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH] crypto,
 cifs: Fix error handling in extract_iter_to_sg()
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, netdev@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-cachefs@redhat.com,
 Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, akpm@linux-foundation.org,
 Paolo Abeni <pabeni@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWNrZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+CgpPbiBX
ZWQsIEp1bCAyNiwgMjAyMyBhdCA4OjU24oCvQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gMjYuMDcuMjMgMTI6NTcsIERhdmlkIEhvd2VsbHMgd3Jv
dGU6Cj4gPgo+ID4gRml4IGVycm9yIGhhbmRsaW5nIGluIGV4dHJhY3RfaXRlcl90b19zZygpLiAg
UGFnZXMgbmVlZCB0byBiZSB1bnBpbm5lZCwgbm90Cj4gPiBwdXQgaW4gZXh0cmFjdF91c2VyX3Rv
X3NnKCkgd2hlbiBoYW5kbGluZyBJT1ZFQy9VQlVGIHNvdXJjZXMuCj4gPgo+ID4gVGhlIGJ1ZyBt
YXkgcmVzdWx0IGluIGEgd2FybmluZyBsaWtlIHRoZSBmb2xsb3dpbmc6Cj4gPgo+ID4gICAgV0FS
TklORzogQ1BVOiAxIFBJRDogMjAzODQgYXQgbW0vZ3VwLmM6MjI5IF9fbHNlX2F0b21pY19hZGQg
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hdG9taWNfbHNlLmg6MjcgW2lubGluZV0KPiA+ICAgIFdB
Uk5JTkc6IENQVTogMSBQSUQ6IDIwMzg0IGF0IG1tL2d1cC5jOjIyOSBhcmNoX2F0b21pY19hZGQg
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hdG9taWMuaDoyOCBbaW5saW5lXQo+ID4gICAgV0FSTklO
RzogQ1BVOiAxIFBJRDogMjAzODQgYXQgbW0vZ3VwLmM6MjI5IHJhd19hdG9taWNfYWRkIGluY2x1
ZGUvbGludXgvYXRvbWljL2F0b21pYy1hcmNoLWZhbGxiYWNrLmg6NTM3IFtpbmxpbmVdCj4gPiAg
ICBXQVJOSU5HOiBDUFU6IDEgUElEOiAyMDM4NCBhdCBtbS9ndXAuYzoyMjkgYXRvbWljX2FkZCBp
bmNsdWRlL2xpbnV4L2F0b21pYy9hdG9taWMtaW5zdHJ1bWVudGVkLmg6MTA1IFtpbmxpbmVdCj4g
PiAgICBXQVJOSU5HOiBDUFU6IDEgUElEOiAyMDM4NCBhdCBtbS9ndXAuYzoyMjkgdHJ5X2dyYWJf
cGFnZSsweDEwOC8weDE2MCBtbS9ndXAuYzoyNTIKPiA+ICAgIC4uLgo+ID4gICAgcGMgOiB0cnlf
Z3JhYl9wYWdlKzB4MTA4LzB4MTYwIG1tL2d1cC5jOjIyOQo+ID4gICAgbHIgOiBmb2xsb3dfcGFn
ZV9wdGUrMHgxNzQvMHgzZTQgbW0vZ3VwLmM6NjUxCj4gPiAgICAuLi4KPiA+ICAgIENhbGwgdHJh
Y2U6Cj4gPiAgICAgX19sc2VfYXRvbWljX2FkZCBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2F0b21p
Y19sc2UuaDoyNyBbaW5saW5lXQo+ID4gICAgIGFyY2hfYXRvbWljX2FkZCBhcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL2F0b21pYy5oOjI4IFtpbmxpbmVdCj4gPiAgICAgcmF3X2F0b21pY19hZGQgaW5j
bHVkZS9saW51eC9hdG9taWMvYXRvbWljLWFyY2gtZmFsbGJhY2suaDo1MzcgW2lubGluZV0KPiA+
ICAgICBhdG9taWNfYWRkIGluY2x1ZGUvbGludXgvYXRvbWljL2F0b21pYy1pbnN0cnVtZW50ZWQu
aDoxMDUgW2lubGluZV0KPiA+ICAgICB0cnlfZ3JhYl9wYWdlKzB4MTA4LzB4MTYwIG1tL2d1cC5j
OjI1Mgo+ID4gICAgIGZvbGxvd19wbWRfbWFzayBtbS9ndXAuYzo3MzQgW2lubGluZV0KPiA+ICAg
ICBmb2xsb3dfcHVkX21hc2sgbW0vZ3VwLmM6NzY1IFtpbmxpbmVdCj4gPiAgICAgZm9sbG93X3A0
ZF9tYXNrIG1tL2d1cC5jOjc4MiBbaW5saW5lXQo+ID4gICAgIGZvbGxvd19wYWdlX21hc2srMHgx
MmMvMHgyZTQgbW0vZ3VwLmM6ODM5Cj4gPiAgICAgX19nZXRfdXNlcl9wYWdlcysweDE3NC8weDMw
YyBtbS9ndXAuYzoxMjE3Cj4gPiAgICAgX19nZXRfdXNlcl9wYWdlc19sb2NrZWQgbW0vZ3VwLmM6
MTQ0OCBbaW5saW5lXQo+ID4gICAgIF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCsweDk0LzB4OGY0IG1t
L2d1cC5jOjIxNDIKPiA+ICAgICBpbnRlcm5hbF9nZXRfdXNlcl9wYWdlc19mYXN0KzB4OTcwLzB4
YjYwIG1tL2d1cC5jOjMxNDAKPiA+ICAgICBwaW5fdXNlcl9wYWdlc19mYXN0KzB4NGMvMHg2MCBt
bS9ndXAuYzozMjQ2Cj4gPiAgICAgaW92X2l0ZXJfZXh0cmFjdF91c2VyX3BhZ2VzIGxpYi9pb3Zf
aXRlci5jOjE3NjggW2lubGluZV0KPiA+ICAgICBpb3ZfaXRlcl9leHRyYWN0X3BhZ2VzKzB4Yzgv
MHg1NGMgbGliL2lvdl9pdGVyLmM6MTgzMQo+ID4gICAgIGV4dHJhY3RfdXNlcl90b19zZyBsaWIv
c2NhdHRlcmxpc3QuYzoxMTIzIFtpbmxpbmVdCj4gPiAgICAgZXh0cmFjdF9pdGVyX3RvX3NnIGxp
Yi9zY2F0dGVybGlzdC5jOjEzNDkgW2lubGluZV0KPiA+ICAgICBleHRyYWN0X2l0ZXJfdG9fc2cr
MHgyNmMvMHg2ZmMgbGliL3NjYXR0ZXJsaXN0LmM6MTMzOQo+ID4gICAgIGhhc2hfc2VuZG1zZysw
eGMwLzB4NDNjIGNyeXB0by9hbGdpZl9oYXNoLmM6MTE3Cj4gPiAgICAgc29ja19zZW5kbXNnX25v
c2VjIG5ldC9zb2NrZXQuYzo3MjUgW2lubGluZV0KPiA+ICAgICBzb2NrX3NlbmRtc2crMHg1NC8w
eDYwIG5ldC9zb2NrZXQuYzo3NDgKPiA+ICAgICBfX19fc3lzX3NlbmRtc2crMHgyNzAvMHgyYWMg
bmV0L3NvY2tldC5jOjI0OTQKPiA+ICAgICBfX19zeXNfc2VuZG1zZysweDgwLzB4ZGMgbmV0L3Nv
Y2tldC5jOjI1NDgKPiA+ICAgICBfX3N5c19zZW5kbXNnKzB4NjgvMHhjNCBuZXQvc29ja2V0LmM6
MjU3Nwo+ID4gICAgIF9fZG9fc3lzX3NlbmRtc2cgbmV0L3NvY2tldC5jOjI1ODYgW2lubGluZV0K
PiA+ICAgICBfX3NlX3N5c19zZW5kbXNnIG5ldC9zb2NrZXQuYzoyNTg0IFtpbmxpbmVdCj4gPiAg
ICAgX19hcm02NF9zeXNfc2VuZG1zZysweDI0LzB4MzAgbmV0L3NvY2tldC5jOjI1ODQKPiA+ICAg
ICBfX2ludm9rZV9zeXNjYWxsIGFyY2gvYXJtNjQva2VybmVsL3N5c2NhbGwuYzozOCBbaW5saW5l
XQo+ID4gICAgIGludm9rZV9zeXNjYWxsKzB4NDgvMHgxMTQgYXJjaC9hcm02NC9rZXJuZWwvc3lz
Y2FsbC5jOjUyCj4gPiAgICAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjArMHg0NC8weGU0IGFy
Y2gvYXJtNjQva2VybmVsL3N5c2NhbGwuYzoxNDIKPiA+ICAgICBkb19lbDBfc3ZjKzB4MzgvMHhh
NCBhcmNoL2FybTY0L2tlcm5lbC9zeXNjYWxsLmM6MTkxCj4gPiAgICAgZWwwX3N2YysweDJjLzB4
YjAgYXJjaC9hcm02NC9rZXJuZWwvZW50cnktY29tbW9uLmM6NjQ3Cj4gPiAgICAgZWwwdF82NF9z
eW5jX2hhbmRsZXIrMHhjMC8weGM0IGFyY2gvYXJtNjQva2VybmVsL2VudHJ5LWNvbW1vbi5jOjY2
NQo+ID4gICAgIGVsMHRfNjRfc3luYysweDE5Yy8weDFhMCBhcmNoL2FybTY0L2tlcm5lbC9lbnRy
eS5TOjU5MQo+ID4KPiA+IEZpeGVzOiAwMTg1ODQ2OTc1MzMgKCJuZXRmczogQWRkIGEgZnVuY3Rp
b24gdG8gZXh0cmFjdCBhbiBpdGVyYXRvciBpbnRvIGEgc2NhdHRlcmxpc3QiKQo+ID4gUmVwb3J0
ZWQtYnk6IHN5emJvdCs5YjgyODU5NTY3ZjJlNTBjMTIzZUBzeXprYWxsZXIuYXBwc3BvdG1haWwu
Y29tCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8wMDAwMDAwMDAw
MDAyNzNkMDEwNWZmOTdiZjU2QGdvb2dsZS5jb20vCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBI
b3dlbGxzIDxkaG93ZWxsc0ByZWRoYXQuY29tPgo+ID4gY2M6IFN2ZW4gU2NobmVsbGUgPHN2ZW5z
QGxpbnV4LmlibS5jb20+Cj4gPiBjYzogYWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZwo+ID4gY2M6
IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiA+IGNjOiAiRGF2aWQg
Uy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiA+IGNjOiBKZWZmIExheXRvbiA8amxh
eXRvbkBrZXJuZWwub3JnPgo+ID4gY2M6IFN0ZXZlIEZyZW5jaCA8c2ZyZW5jaEBzYW1iYS5vcmc+
Cj4gPiBjYzogU2h5YW0gUHJhc2FkIE4gPG5zcG1hbmdhbG9yZUBnbWFpbC5jb20+Cj4gPiBjYzog
Um9oaXRoIFN1cmFiYXR0dWxhIDxyb2hpdGhzLm1zZnRAZ21haWwuY29tPgo+ID4gY2M6IEplbnMg
QXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KPiA+IGNjOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRv
ci5hcGFuYS5vcmcuYXU+Cj4gPiBjYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9m
dC5uZXQ+Cj4gPiBjYzogRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPgo+ID4gY2M6
IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+Cj4gPiBjYzogUGFvbG8gQWJlbmkgPHBh
YmVuaUByZWRoYXQuY29tPgo+ID4gY2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQu
b3JnPgo+ID4gY2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+ID4gY2M6IGxpbnV4LWNyeXB0b0B2Z2Vy
Lmtlcm5lbC5vcmcKPiA+IGNjOiBsaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KPiA+IGNjOiBsaW51
eC1jaWZzQHZnZXIua2VybmVsLm9yZwo+ID4gY2M6IGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwu
b3JnCj4gPiBjYzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAgIGxpYi9zY2F0
dGVybGlzdC5jIHwgICAgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NjYXR0ZXJsaXN0LmMgYi9s
aWIvc2NhdHRlcmxpc3QuYwo+ID4gaW5kZXggZTg2MjMxYTQ0YzNkLi5jNjU1NjZiNGRjNjYgMTAw
NjQ0Cj4gPiAtLS0gYS9saWIvc2NhdHRlcmxpc3QuYwo+ID4gKysrIGIvbGliL3NjYXR0ZXJsaXN0
LmMKPiA+IEBAIC0xMTQ4LDcgKzExNDgsNyBAQCBzdGF0aWMgc3NpemVfdCBleHRyYWN0X3VzZXJf
dG9fc2coc3RydWN0IGlvdl9pdGVyICppdGVyLAo+ID4KPiA+ICAgZmFpbGVkOgo+ID4gICAgICAg
d2hpbGUgKHNndGFibGUtPm5lbnRzID4gc2d0YWJsZS0+b3JpZ19uZW50cykKPiA+IC0gICAgICAg
ICAgICAgcHV0X3BhZ2Uoc2dfcGFnZSgmc2d0YWJsZS0+c2dsWy0tc2d0YWJsZS0+bmVudHNdKSk7
Cj4gPiArICAgICAgICAgICAgIHVucGluX3VzZXJfcGFnZShzZ19wYWdlKCZzZ3RhYmxlLT5zZ2xb
LS1zZ3RhYmxlLT5uZW50c10pKTsKPiA+ICAgICAgIHJldHVybiByZXM7Cj4gPiAgIH0KPiA+Cj4g
Pgo+Cj4gUmV2aWV3ZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+
Cj4gLS0KPiBDaGVlcnMsCj4KPiBEYXZpZCAvIGRoaWxkZW5iCj4KCgotLSAKVGhhbmtzLAoKU3Rl
dmUKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNv
bQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hl
ZnMK

